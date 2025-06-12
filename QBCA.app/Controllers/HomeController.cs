using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using QBCA.app.Models;

namespace QBCA.app.Controllers;

public class HomeController : Controller
{
    LoginModel db = new LoginModel();
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    //Trả về trực tiếp dử liệu
    //Http Get/Home/Index
    public IActionResult Index()
    {
        return View();
    }
    //Http Get/Home/Pricavy
    public IActionResult Privacy()
    {
        return View();
    }
    //Http Get/Home/Dangky
    public IActionResult Dangky()
    {
        return View();
    }
    //Http Post/Home/Dangky
    [HttpPost]
     public IActionResult Dangky(User user)
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
