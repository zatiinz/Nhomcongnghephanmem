using Microsoft.AspNetCore.Mvc;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Identity.Client;

namespace WeBQBCA.Controllers
{ 
    //chỉ admind mói có thể truy cập
    [RoleUser("Admin")] 
    public class AdminController : Controller
    {
        private readonly QbcaDbContext _context;
        public AdminController(QbcaDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        //Read - danh sách người dùng 
        public IActionResult QuanglyNguoiDung()
        {
            //danh sách người dùng
            var user = _context.Users.ToList();
            return View(user);//truyền lại danh sách sang view
        }
        //Creat - Get
        [HttpGet]
        public IActionResult Create()
        {
            return View(new User());
        }
        //Post - Creat
        [HttpPost]
        public IActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                _context.Users.Add(user);
                _context.SaveChanges();
                return RedirectToAction("QuanglyNguoiDung");
            }
            return View(user);//dữ lại dữ liệu 
        }
        //Updata - get
        public IActionResult Edit(int UserId)
        {
            var user = _context.Users.FirstOrDefault(u => u.UserId == UserId);
            if (user == null)
                return NotFound();

            return View(user);
        }
        //Updata - Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(User user)
        {
            if (ModelState.IsValid)
            {
                _context.Users.Update(user);
                _context.SaveChanges();
                return RedirectToAction("QuanglyNguoiDung");
            }
            return View(user);
        }
        //Delete - get
        public IActionResult Delete(int UserId)
        {
            var user = _context.Users.FirstOrDefault(u => u.UserId == UserId);
            if (user == null)
                return NotFound();
            return View(user);
        }
        //Delete - Post
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int UserId)
        {
            try 
            { 
                var user = _context.Users.FirstOrDefault(u => u.UserId == UserId);
                if (user != null)
                {
                    _context.Users.Remove(user);
                    _context.SaveChanges();
                }
                TempData["Success"] = "Xoá người dùng thành công!";
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Không thể xoá người dùng vì đang được sử dụng trong hệ thống.";
            }

            return RedirectToAction("QuanglyNguoiDung");
        }
        //Detail
        public IActionResult Details(int UserId)
        {
            var user = _context.Users.FirstOrDefault(u => u.UserId == UserId);
            if (user == null)
                return NotFound();
            return View(user);
        }
        public IActionResult CauHinhHeThong()
        {
            //Xem cấu hình hệ thống
            return View();
        }
        public IActionResult ThongKeHeThong()
        {
            //Xem Thống kê hệ thống
            return View();
        }
        
    }
}