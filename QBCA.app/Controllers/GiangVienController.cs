using AspNetCoreGeneratedDocument;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Identity.Client;
using System.Text;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using ClosedXML.Excel;
using System.Text;
using System.Text.Json;

namespace WeBQBCA.Controllers
{
    [UserRole("GiangVien")]
    public class GiangVienController : Controller
    {
        private readonly QbcaDbContext _context;
        public GiangVienController(QbcaDbContext context)
        {
            _context = context;
        }
        //Get -> danh sách câu hỏi
        public IActionResult Index()
        {
            var questions = _context.Questions.ToList();
            return View(questions);
        }
        //Get: -> Hiển thị thêm câu hỏi
        public IActionResult Create()
        {
            return View();
        }
        //Post: ->Thêm câu hỏi vào
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Question question)
        {
            if (ModelState.IsValid)
            {
                question.CreatedDate = DateTime.Now;
                //mặc định chưa kiểm tra:
                question.IsDuplicate = false;
                _context.Questions.Add(question);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));

            }
            return View(question);
        }
        //Get: chỉnh sữa câu hỏi
        //Gọi id ánh sạ id với Questionid trong bản data Question:
        public IActionResult Edit(int id)
        {
            var question = _context.Questions.Find(id);
            if (question == null)
                return NotFound();
            return View(question);
        }
        //Post - Chỉnh sữa câu hỏi
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Question question)
        {
            if (ModelState.IsValid)
            {
                _context.Questions.Update(question);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(question);
        }
        //Details: xem chi tiết câu hỏi
        public IActionResult Details(int id)
        {
            var question = _context.Questions.Find(id);
            if (question == null)
                return NotFound();

             return View(question);
        }
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
                return RedirectToAction(nameof(Index));
            }
            return RedirectToAction(nameof(Index));
        }
        public IActionResult TaiCauHoi()
        {
            return View();
        }
        //các định dạng hổ trợ Tải Câu hỏi
        // Tải file Excel (.xlsx)
        public IActionResult TaiExcel()
        {
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("DanhSachCauHoi");
                worksheet.Cell(1, 1).Value = "QuestionId";
                worksheet.Cell(1, 2).Value = "QuestionText";

                var questions = _context.Questions.Take(10).ToList();
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
                        "CauHoi.xlsx");
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
