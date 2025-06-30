using AspNetCoreGeneratedDocument;
using ClosedXML.Excel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using WeBQBCA.Repository;
using WeBQBCA.Services;

namespace WeBQBCA.Controllers
{
    [RoleUser("GiangVien")]
    public class GiangVienController : Controller
    {
        private readonly IQuestionService _questionService;
        private readonly ISubjectRepository _subjectRepository;
        private readonly QbcaDbContext _context;
        public GiangVienController(IQuestionService questionService, ISubjectRepository subjectRepository, QbcaDbContext context)
        {
            _questionService = questionService;
            _subjectRepository = subjectRepository;
            _context = context;
        }
        //Get -> danh sách câu hỏi
        public IActionResult Index()
        {
            return View();
        }
        //Get: thêm câu hỏi vào view
        public IActionResult Create()
        {
            return View();
        }
        //Post: sử lý thêm câu hỏi và gửi thông tin câu hỏi
        [HttpPost]
        public async Task<IActionResult> Create(Question model)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Subjects = new SelectList(_context.Subjects, "SubjectId", "SubjectName");
                return View(model);
            }

            // Gán SubjectId từ session nếu bạn không cho chọn trên view
            if (string.IsNullOrEmpty(model.SubjectId))
            {
                model.SubjectId = HttpContext.Session.GetString("SubjectId");
            }

            model.Status = "chờ duyệt";
            model.IsDuplicate = false;
            model.IsDeleted = false;

            _context.Questions.Add(model);

            try
            {
                await _context.SaveChangesAsync();
                TempData["Success"] = "Gửi câu hỏi thành công, đang chờ duyệt.";
                return RedirectToAction("DanhSachCauHoi");
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Lỗi khi lưu dữ liệu: " + ex.Message;
                ViewBag.Subjects = new SelectList(_context.Subjects, "SubjectId", "SubjectName");
                return View(model);
            }
        }

        //Get: chỉnh sữa câu hỏi
        //Gọi id ánh sạ id với Questionid trong bản data Question:
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
                return NotFound();


            var question = _context.Questions.FirstOrDefault(q => q.QuestionId == id);
            if (question == null)
                return NotFound();
            ViewBag.SubjectId = new SelectList(_context.Subjects, "SubjectId", "SubjectName", question.SubjectId);
            return View(question);
        }
        //Post - Hành Động Chỉnh sữa câu hỏi
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Question model)
        {
            if (ModelState.IsValid)
            {
                var existing = _context.Questions.FirstOrDefault(q => q.QuestionId == model.QuestionId);
                if (existing == null)
                {
                    return NotFound();
                }

                existing.QuestionText = model.QuestionText;
                existing.DifficultyLevel = model.DifficultyLevel;
                existing.SubjectId = model.SubjectId;

                _context.SaveChanges();
                return RedirectToAction("Index"); // hoặc DanhSachCauHoi
            }

            ViewBag.SubjectId = new SelectList(_context.Subjects, "SubjectId", "SubjectName", model.SubjectId);
            return View(model);
        }
        //Details: xem chi tiết câu hỏi
        public IActionResult Details(int id)
        {
            var question = _context.Questions.Find(id);
            if (question == null)
                return NotFound();

             return View(question);
        }
        //Hiển thị form Delete (Xoá)
        //Delete: Xoá câu hỏi
        //Gọi id ánh sạ id với Questionid trong bản data Question:
        public IActionResult Delete(int id)
        {
            var question = _context.Questions.Find(id);
            if (question == null)
                return NotFound();
            return View(question);
        }
        //Post - Xoá câu hỏi
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var question = _context.Questions.Find(id);
            if (question != null)
            {
                _context.Questions.Remove(question);
                _context.SaveChanges();
            }
            return RedirectToAction(nameof(Index));
        }
        public IActionResult TaiCauHoi()
        {
            return View();
        }
        public IActionResult DanhSachCauHoi()
        {
            
            var userIdStr = HttpContext.Session.GetString("UserId");
            
            if (string.IsNullOrEmpty(userIdStr))
            {
               TempData["Loi"] = "Chưa đăng nhập hoặc mất session UserId";
               return RedirectToAction("DangNhap", "Auth");
            }
            /*
           if (!int.TryParse(userIdStr, out int userId))
            {
                TempData["Loi"] = "UserId không hợp lệ trong Session.";
                return RedirectToAction("DangNhap", "Auth");
            }
            */
            var questions = _context.Questions
                .Include(q => q.Subject)
                //.Where(q => q.CreatedBy == userId)
                .ToList();

            return View(questions);
        }
        // GET: Form kiểm tra trùng lặp
        public IActionResult KiemTraTrungLap()
        {
            return View();
        }

        // POST: Xử lý kiểm tra trùng lặp
        [HttpPost]
        public IActionResult KiemTraTrungLap(string cauHoiMoi)
        {
            if (string.IsNullOrWhiteSpace(cauHoiMoi))
            {
                ViewBag.Message = "Vui lòng nhập nội dung câu hỏi.";
                return View();
            }

            var trung = _context.Questions
                .FirstOrDefault(q => q.QuestionText.Trim().ToLower() == cauHoiMoi.Trim().ToLower());

            if (trung != null)
            {
                ViewBag.Message = "Câu hỏi đã tồn tại trong hệ thống.";
            }
            else
            {
                ViewBag.Message = "Câu hỏi chưa tồn tại. Bạn có thể sử dụng.";
            }
            return View();
        }
        public IActionResult LichSuCauHoi()
        {
            var username = HttpContext.Session.GetString("Username");

            // Tìm lịch sử các câu hỏi do người dùng tạo
            var histories = _context.QuestionHistories
                .Include(q => q.ModifiedBy1)
                .Include(q => q.ModifiedByNavigation)
                .Where(q => q.ModifiedBy1.Username == username)
                .OrderByDescending(q => q.ModifiedData)
                .ToList();

            return View(histories);
        }
        //Get: hiển thị form Đánh giá đề thi
        public IActionResult DanhGiaGV()
        {
            return View();
        }
        //các định dạng hổ trợ Tải Câu hỏi
        // Tải file Excel (.xlsx)
        [HttpPost]
        public IActionResult TaiExcel(List<int> selectedIds)
        {
            if (selectedIds == null || !selectedIds.Any())
            {
                TempData["Error"] = "Bạn chưa chọn câu hỏi nào để tải.";
                return RedirectToAction("Index");
            }

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("DanhSachCauHoi");

                worksheet.Cell(1, 1).Value = "ID";
                worksheet.Cell(1, 2).Value = "Câu hỏi";

                var questions = _context.Questions
                    .Where(q => selectedIds.Contains(q.QuestionId))
                    .ToList();

                int row = 2;
                foreach (var q in questions)
                {
                    worksheet.Cell(row, 1).Value = q.QuestionId;
                    worksheet.Cell(row, 2).Value = q.QuestionText;
                    row++;
                }

                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    stream.Position = 0;
                    return File(stream.ToArray(),
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        "CauHoiDuocChon.xlsx");
                }
            }
        } 

        // Tải file văn bản (.txt)
        public IActionResult TaiTxt()
        {
            var questions = _context.Questions.Take(10).ToList();
            var lines = new List<string>();

            foreach (var q in questions)
            {
                lines.Add($"ID: {q.QuestionId} - Text: {q.QuestionText}");
            }

            var content = string.Join(Environment.NewLine, lines);
            var bytes = Encoding.UTF8.GetBytes(content);

            return File(bytes, "text/plain", "CauHoi.txt");
        }

        // Tải file CSV (.csv)
        public IActionResult TaiCsv()
        {
            var questions = _context.Questions.Take(10).ToList();
            var lines = new List<string> { "QuestionId,QuestionText" };

            foreach (var q in questions)
            {
                var questionText = q.QuestionText.Replace("\"", "\"\"");
                lines.Add($"{q.QuestionId},\"{questionText}\"");
            }

            var content = string.Join(Environment.NewLine, lines);
            var bytes = Encoding.UTF8.GetBytes(content);

            return File(bytes, "text/csv", "CauHoi.csv");
        }

        // Tải file JSON (.json)
        public IActionResult TaiJson()
        {
            var questions = _context.Questions.Take(10).ToList();
            var json = JsonSerializer.Serialize(questions);
            var bytes = Encoding.UTF8.GetBytes(json);

            return File(bytes, "application/json", "CauHoi.json");
        }

    }
        
}
