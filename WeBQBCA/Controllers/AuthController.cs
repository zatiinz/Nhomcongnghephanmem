using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Diagnostics;
using System.Linq;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using WeBQBCA.Models;
using WeBQBCA.Models.ViewModel;
using WeBQBCA.Repository;

namespace WeBQBCA.Controllers
{
    public class AuthController : Controller
    {
        private readonly QbcaDbContext _context;
        private readonly ISubjectRepository _subjectRepository;

        public AuthController(QbcaDbContext context, ISubjectRepository subjectRepository)
        {
            _context = context;
            _subjectRepository = subjectRepository;
        }
        public IActionResult Index()
        {
            return View();
        }

        // Hiển thị form đăng nhập
        [HttpGet]
        public IActionResult Dangnhap()
        {
            var subjects = _context.Subjects.ToList();
            ViewBag.Subjects = new SelectList(subjects, "SubjectId", "SubjectName");
            return View();
        }

        // Xử lý đăng nhập
        [HttpPost]
        public async Task<IActionResult> Dangnhap(LoginViewModel model)
        {
            if (!ModelState.IsValid)
            {
                var subjects = await _subjectRepository.GetAllSubjectsAsync();
                ViewBag.Subjects = new SelectList(subjects, "SubjectId", "SubjectName");
                return View(model);
            }

            var user = _context.Users
                .FirstOrDefault(u => u.Username == model.Username && u.Password == model.Password);

            if (user != null)
            {
                // ✅ Lưu thêm môn học vào session
                HttpContext.Session.SetInt32("UserId", user.UserId);
                HttpContext.Session.SetString("Username", user.Username);
                HttpContext.Session.SetString("Role", user.Role);
                HttpContext.Session.SetString("SubjectId", model.SubjectId ?? "");


                switch (user.Role)
                {
                    case "Admin":
                        return RedirectToAction("Index", "Admin");
                    case "GiangVien":
                        return RedirectToAction("Index", "GiangVien");
                    case "TruongKhoa":
                        return RedirectToAction("Index", "TruongKhoa");
                    case "NhanVienR_D":
                        return RedirectToAction("Index", "NhanVienR_D");
                    case "TruongBoMon":
                        return RedirectToAction("Index", "TruongBoMon");
                    case "TruongPhong":
                        return RedirectToAction("Index", "TruongPhong");
                    default:
                        return RedirectToAction("Index", "Auth");
                }
            }

            ViewBag.LoginFail = "Tài khoản hoặc mật khẩu không đúng.";

            var allSubjects = await _subjectRepository.GetAllSubjectsAsync();
            ViewBag.Subjects = new SelectList(allSubjects, "SubjectId", "SubjectName");
            return View(model);
        }
        // Hiển thị form đăng ký
        [HttpGet]
        public IActionResult Dangky()
        {
            return View(new RegisterViewModel());
        }

        // Xử lý đăng ký
        [HttpPost]
        public IActionResult Dangky(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(model.Username) ||
                    string.IsNullOrWhiteSpace(model.Password) ||
                    string.IsNullOrWhiteSpace(model.Role))
                {
                    ModelState.AddModelError("", "Username, Password và Role là bắt buộc.");
                    return View(model);
                }

                var user = new User
                {
                    Username = model.Username.Trim(),
                    Password = model.Password.Trim(),
                    Role = model.Role.Trim()
                    // ❌ Xóa Subject vì không chọn môn học khi đăng ký

                };

                try
                {
                    _context.Users.Add(user);
                    _context.SaveChanges();
                    return RedirectToAction("Dangnhap", "Auth");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Lỗi khi lưu người dùng: " + ex.Message);
                }
            }

            return View(model);
        }

        // Đăng xuất
        [HttpPost]
        public IActionResult Dangxuat()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Dangnhap");
        }
        [RoleUser("User")]
        public IActionResult TrangUser()
        {
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
