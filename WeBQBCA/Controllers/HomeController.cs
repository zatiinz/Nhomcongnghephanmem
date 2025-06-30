using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Linq;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using WeBQBCA.Models;


namespace WeBQBCA.Controllers
{
    public class HomeController : Controller
    {
        private readonly QbcaDbContext _context;

        public HomeController(QbcaDbContext context)
        {
            _context = context;
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
