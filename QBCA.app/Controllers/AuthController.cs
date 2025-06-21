using System;
using Microsoft.AspNetCore.Mvc;
using WeBQBCA.Models;
using WeBQBCA.Models.ViewModel;
using WeBQBCA.Services;
namespace WeBQBCA.Controllers
{
    public class AuthController : Controller
    {

        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }
        [HttpPost]
        public IActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (_authService.ValidateUser(model.Username, model.Password))
                {
                    //Login thành công
                    return RedirectToAction("Dangnhap","Home");

                }
                ModelState.AddModelError("","sai tài khoản hoạc mạt khẩu");
                 
            }
            return View(model);
        }
    }
}
