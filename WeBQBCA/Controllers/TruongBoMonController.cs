using Microsoft.AspNetCore.Mvc;
using WeBQBCA.Attributes;
using WeBQBCA.Data;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Identity.Client;
namespace WeBQBCA.Controllers
{
    [RoleUser("TruongBoMon")]
    public class TruongBoMonController : Controller
    {
        private readonly QbcaDbContext _context;

        public TruongBoMonController(QbcaDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
