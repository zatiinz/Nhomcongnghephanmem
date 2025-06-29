using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Linq; // Add this for LINQ methods
using System.Threading.Tasks; // Add this for async/await
using WeBQBCA.Attributes;
using WeBQBCA.Data;

namespace WeBQBCA.Controllers
{
    [UserRole("TruongBoMon")]
    public class TruongBoMonController : Controller
    {
        private readonly QbcaDbContext _context;

        public TruongBoMonController(QbcaDbContext context)
        {
            _context = context;
        }

        // Mặc định: Trang chủ Trưởng môn
        public IActionResult Index()
        {
            return View(); // View Index.cshtml trong Views/TruongMon
        }

        // 2.3.1 - Nhận thông báo về nhiệm vụ được phân công
        public async Task<IActionResult> ThongBaoNhiemVu()
        {
            // You'll need a way to get the current user's ID.
            // This often comes from authentication (e.g., User.FindFirstValue(ClaimTypes.NameIdentifier)).
            // For now, let's assume a placeholder for currentUserId.
            int currentUserId = GetCurrentUserId(); // Implement this method to get the logged-in user's ID

            var assignedTasks = await _context.Tasks
                .Where(t => t.AssignedTo == currentUserId)
                .Include(t => t.Subject) // Include related Subject information
                .OrderByDescending(t => t.DueDate)
                .ToListAsync();

            return View("ThongBaoNhiemVu", assignedTasks); // Create an "AssignedTasks.cshtml" view
        }

        // Placeholder method to get the current user ID.
        // In a real application, you'd get this from the authenticated user's claims.
        private static int GetCurrentUserId()
        {
            // Example: Replace with actual logic to get the logged-in user's ID
            // For demonstration, let's return a dummy ID.
            return 1; // Replace with the actual user ID from authentication
        }
    


        // 2.3.2 - Phân công nhiệm vụ cụ thể cho giảng viên
       


            // GET: Hiển thị form phân công nhiệm vụ
            [HttpGet]
            public async Task<IActionResult> PhanCongNhiemVu()
            {
                // Lấy danh sách giảng viên
                ViewBag.Users = await _context.Users
                    .Where(u => u.Role == "GiangVien")
                    .Select(u => new SelectListItem
                    {
                        Value = u.UserId.ToString(),
                        Text = u.Username
                    }).ToListAsync();

                // Lấy danh sách môn học
                ViewBag.Subjects = await _context.Subjects
                    .Select(s => new SelectListItem
                    {
                        Value = s.SubjectId,
                        Text = s.SubjectName
                    }).ToListAsync();

                return View();
            }

            // POST: Xử lý lưu nhiệm vụ
            [HttpPost]
            [ValidateAntiForgeryToken]
            public async Task<IActionResult> PhanCongNhiemVu(int AssignedTo, string SubjectId, string TaskDescription, DateTime DueDate)
            {
                var task = new WeBQBCA.Data.Task
                {
                    AssignedTo = AssignedTo,
                    SubjectId = SubjectId,
                    TaskDescription = TaskDescription,
                    DueDate = DueDate,
                    Status = "Chưa hoàn thành"
                };

                
            _context.Tasks.Add(task);
            await _context.SaveChangesAsync();

            // Gửi thông báo cho giảng viên được phân công
            var notification = new Notification
            {
                UserId = AssignedTo,
                Message = $"Bạn vừa được phân công nhiệm vụ: {TaskDescription}",
                IsRead = false,
                CreatedDate = DateTime.Now
            };
            _context.Notifications.Add(notification);
            await _context.SaveChangesAsync();
            TempData["Success"] = "Phân công nhiệm vụ thành công!";
                return RedirectToAction("ThongBaoNhiemVu");
            }



        
        // 2.3.3 - Nhận thông báo về câu hỏi đã tải lên
        public async Task<IActionResult> ThongBaoCauHoi()
        {
            // Lấy các câu hỏi mới được tải lên (ví dụ: trạng thái "Chờ duyệt")
            var uploadedQuestions = await _context.Questions
                .Include(q => q.CreatedByNavigation)
                .Include(q => q.Subject)
                .Where(q => q.Status == "Chờ duyệt") // hoặc trạng thái phù hợp với hệ thống của bạn
                .OrderByDescending(q => q.CreatedDate)
                .ToListAsync();

            return View("ThongBaoCauHoi", uploadedQuestions);
        }

        // 2.3.4 - Nộp bài thi vào hệ thống để kiểm tra


        // 2.3.5 - Nhận thông báo về câu hỏi trùng lặp


        // 2.3.6 - Kiểm tra và phê duyệt danh sách câu hỏi cuối cùng

    }
}
