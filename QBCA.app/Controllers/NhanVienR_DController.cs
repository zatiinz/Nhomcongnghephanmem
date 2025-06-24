using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Identity.Client;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using WeBQBCA.Models;
using DBTask = WeBQBCA.Data.Task;

namespace WeBQBCA.Controllers
{
    [UserRole("NhanVienR&D")]
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
            //nếu sai nhập câu lệnh gửi lại dữ liệu
            // Nếu model không hợp lệ => nạp lại SelectList
            ViewBag.Subjects = new SelectList(_context.Subjects.ToList(), "SubjectId", "SubjectName");
            ViewBag.Users = new SelectList(_context.Users.ToList(), "UserId", "Username");
            return View(model);
        }


            
    }

}
