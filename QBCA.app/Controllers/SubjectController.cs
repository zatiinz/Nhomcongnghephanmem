using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WeBQBCA.Data;

namespace WeBQBCA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubjectController : ControllerBase
    {
        {
            private readonly AppDbContext _db;

            public SubjectController(AppDbContext db)
            {
                _db = db;
            }

            public IActionResult Create()
            {
                if (string.IsNullOrEmpty(HttpContext.Session.GetString("Username")))
                {
                    return RedirectToAction("Dangnhap", "Home");
                }
                return View();
            }

            [HttpPost]
            public IActionResult Create(Subject subject)
            {
                if (ModelState.IsValid)
                {
                    _db.Subjects.Add(subject);
                    _db.SaveChanges();
                    return RedirectToAction("Index", "Dashboard");
                }
                return View(subject);
            }

        private IActionResult View(Subject subject)
        {
            throw new NotImplementedException();
        }
    }
    }

