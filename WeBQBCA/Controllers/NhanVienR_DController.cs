using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using WeBQBCA.Models;
using DBTask = WeBQBCA.Data.Task;

namespace WeBQBCA.Controllers
{
    [RoleUser("NhanVienR_D")]
    public class NhanVienR_DController : Controller
    {
        private readonly QbcaDbContext _context;

        public NhanVienR_DController(QbcaDbContext context)
        {
            _context = context;
        } 
        public IActionResult Index()
        {
            return View();
        }
        //Get : NhanVienR&D/ CreateSubject
        public IActionResult CreateSubject()
        {
            return View();
        }
        //Post: NhanVienR&D/ CreateSubject
        //chức năng tạo mon học
        [HttpPost]
        public IActionResult CreateSubject(Subject subject)
        {
            if (ModelState.IsValid) {
                _context.Subjects.Add(subject);//thêm môn học
                _context.SaveChanges();//lưu môn học 
                TempData["Success"] = "Tạo môn học thành công";
                return RedirectToAction("ListSubjects");
            }
            return RedirectToAction("ListSubjects");
        }

        //Get: láy danh sách môn học
        //retunr truyền danh sách sang view để hiể thị
        public IActionResult ListSubject()
        {
            //truy cập bảng databasse
            var Subject = _context.Subjects.ToList();//Thông qua dbcontext
            return View(Subject);

        }
        public IActionResult CreateQuestionPlan()
        {
            //gửi dữ liệu dropdown
            ViewBag.Subjects = new SelectList(_context.Subjects.ToList(), "SubjectId", "SubjectName");
            ViewBag.Users = new SelectList(_context.Users.ToList(), "UserId", "Username");
            return View();
        }
        [HttpPost]
        public IActionResult CreateQuestionPlan(CreateTaskViewModel model) 
        {
            if (ModelState.IsValid) {
                var task = new DBTask
                {
                    SubjectId = model.SubjectId,
                    AssignedTo = model.AssignedTo,
                    TaskDescription = $"{model.Title} - {model.Description}", // ghép 2 phần nếu chưa tách thuộc tính thật
                    Status = model.Status,
                    DueDate = model.DueDate
                };
                _context.Tasks.Add(task);
                _context.SaveChanges();
                TempData["Success"] = "Đã tạo kế hoạch câu hỏi";
                return RedirectToAction("listTack");
            }
            // Nếu model không hợp lệ => nạp lại SelectList
            ViewBag.Subjects = new SelectList(_context.Subjects.ToList(), "SubjectId", "SubjectName");
            ViewBag.Users = new SelectList(_context.Users.ToList(), "UserId", "Username");
            return View(model);
        }
        //chỉ asR&D hoạc Trưởng Bộ môn
        // GET: Hiển thị danh sách câu hỏi chờ duyệt
        public IActionResult PheDuyetCH()
        {
            int? reviewerId = HttpContext.Session.GetInt32("UserId");
            if (reviewerId == null) return RedirectToAction("Dangnhap", "Auth");

            var reviewTasks = _context.ReviewTasks
                .Include(rt => rt.Question).ThenInclude(q => q.Subject)
                .Include(rt => rt.Creator)
                .Where(rt => rt.ReviewerId == reviewerId && rt.Status == "chờ duyệt")
                .ToList();

            return View(reviewTasks);
        }

        // GET: Form kiểm tra trùng lặp
        public IActionResult KiemTraTrungLap()
        {
            ViewBag.Subjects = new SelectList(_context.Subjects, "SubjectId", "SubjectName");
            return View();
        }

        // POST: Xử lý kiểm tra trùng lặp
        [HttpPost]
        public IActionResult KiemTraTrungLap(string cauHoiMoi, string subjectId)
        {
            ViewBag.Subjects = new SelectList(_context.Subjects, "SubjectId", "SubjectName");

            if (string.IsNullOrWhiteSpace(cauHoiMoi))
            {
                ViewBag.Message = "Vui lòng nhập nội dung câu hỏi.";
                return View();
            }

            var cauHoiText = cauHoiMoi.Trim().ToLower();

            // Kiểm tra trùng toàn hệ thống
            var trungToanBo = _context.Questions
                .Any(q => q.QuestionText.Trim().ToLower() == cauHoiText);

            // Kiểm tra trùng trong môn học cụ thể
            var trungTrongMonHoc = _context.Questions
                .Any(q => q.QuestionText.Trim().ToLower() == cauHoiText && q.SubjectId == subjectId);

            if (trungTrongMonHoc)
            {
                ViewBag.Message = "Câu hỏi đã tồn tại trong môn học này.";
            }
            else if (trungToanBo)
            {
                ViewBag.Message = "Câu hỏi đã tồn tại trong hệ thống nhưng chưa thuộc môn học này.";
            }
            else
            {
                ViewBag.Message = "Câu hỏi chưa tồn tại. Bạn có thể sử dụng.";
            }

            return View();
        }
        // POST: Phê duyệt câu hỏi (AJAX)
        [HttpPost]
        public IActionResult PheDuyetQuestion(int id)
        {
            int? reviewerId = HttpContext.Session.GetInt32("UserId");
            string role = HttpContext.Session.GetString("Role");

            if (reviewerId == null)
            {
                return Json(new { success = false, message = "Phiên đăng nhập đã hết hạn." });
            }

            // ✅ Chỉ cho phép các role có quyền duyệt
            if (role != "NhanVienR_D" && role != "TruongBoMon")
            {
                return Json(new { success = false, message = "Bạn không có quyền duyệt câu hỏi." });
            }

            var reviewTask = _context.ReviewTasks
                .Include(rt => rt.Question)
                .FirstOrDefault(rt => rt.QuestionId == id
                                   && rt.ReviewerId == reviewerId.Value
                                   && rt.Status == "chờ duyệt");

            if (reviewTask == null)
            {
                return Json(new { success = false, message = "Không tìm thấy nhiệm vụ hoặc đã được xử lý." });
            }

            //Cập nhật trạng thái của nhiệm vụ và câu hỏi
            reviewTask.Status = "đã duyệt";

            if (reviewTask.Question != null)
            {
                reviewTask.Question.Status = "đã duyệt";
            }

            _context.SaveChanges();

            return Json(new { success = true, message = "✅ Câu hỏi đã được duyệt thành công." });
        }

        // POST: Từ chối câu hỏi
        [HttpPost]
        public IActionResult TuChoi(int taskId)
        {
            var task = _context.ReviewTasks
                .Include(r => r.Question)
                .FirstOrDefault(t => t.ReviewTaskId == taskId); //sửa đúng tên khóa chính

            if (task != null)
            {
                task.Status = "từ chối";
                if (task.Question != null)
                {
                    task.Question.Status = "từ chối";
                }
                _context.SaveChanges();
            }

            return RedirectToAction("PheDuyetCH");
        }
        
       
    }

}
