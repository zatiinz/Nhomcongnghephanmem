using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Configuration;
using System.Linq;
using System.Diagnostics;
using WeBQBCA.Attributes;
using WeBQBCA.Models;
using WeBQBCA.Data;
using System.Runtime.Intrinsics.X86;
using AspNetCoreGeneratedDocument;


namespace WeBQBCA.Controllers
{
    public class HomeController : Controller
    {
        private readonly QbcaDbContext _context;

        public HomeController(QbcaDbContext context)
        {
            _context = context;
        }
        //trả về trực tiếp dữ liệu (hiển thị form trang chủ)
        public IActionResult Index()
        {
            return View();
        }
        //  HTTP GET/HOME/Dangky (hiển thị form đăng ký)
        public IActionResult Dangky()
        {
            return View();
        }
        //  HTTP Post/HOME/Dangky
        [HttpPost]
        public IActionResult Dangky(WeBQBCA.Data.User user)//CHỈNH
        {
            if (ModelState.IsValid)
            {
                _context.Users.Add(user);
                _context.SaveChanges();
                return RedirectToAction("Dangnhap");
            }
            return View(user);
        }
        
        //  HTTP GET/HOME/DanNhap (hiển thị form đăng nhập)
        public IActionResult Dangnhap()
        {
            return View();
        }
        //  HTTP Post/HOME/DangNhap
        [HttpPost] 
        public IActionResult Dangnhap(WeBQBCA.Data.User user) //CHỈNH
        {
            var taikhoanForm = user.Username;
            var matkhauForm = user.Password;
            var userCheck = _context.Users.FirstOrDefault(x => x.Username == taikhoanForm && x.Password == matkhauForm);
            if (userCheck != null)
            {
                //lưu thông tin vào Session
                HttpContext.Session.SetString("Username", userCheck.Username);
                HttpContext.Session.SetString("Role", userCheck.Role);

                //điều hướng theo Role
                if (userCheck.Role == "Admin")
                {
                    return RedirectToAction("Index", "Admin");
                }
                else if (userCheck.Role == "GiangVien")
                {
                    return RedirectToAction("Index", "GiangVien");
                }
                else if (userCheck.Role == "Truongkhoa")
                {
                    return RedirectToAction("Index", "Truongkhoa");
                }
                else if (userCheck.Role == "TruongBoMon")
                {
                    return RedirectToAction("Index", "TruongBoMon");
                }
                else if (userCheck.Role == "NhanVienR&D")
                {
                    return RedirectToAction("Index", "NhanVienR&D");
                }
                else
                {
                    return RedirectToAction("Index", "Home"); //fallback
                }
            }
            else
            {
                ViewBag.LoginFail = "Đăng nhập thất bại, vui lòng nhập lại!";
                return View("Dangnhap");
            }
        }
        //  HTTP Post/HOME/Dangxuat
        [HttpPost]
        public IActionResult Dangxuat()
        {
            if (ModelState.IsValid)
            {
                HttpContext.Session.Clear();
                return RedirectToAction("Index");
            }
            return View(User);
        }
        [UserRole("User")]
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
