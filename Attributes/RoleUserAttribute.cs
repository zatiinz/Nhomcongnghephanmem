using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.CodeAnalysis.Host.Mef;

namespace WeBQBCA.Attributes
{
    public class UserRoleAttribute : ActionFilterAttribute
    {
        private readonly string _role;

        public UserRoleAttribute(string role)
        {
            _role = role;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            //check Session 
            var role = context.HttpContext.Session.GetString("Role");
            //điều hướng về trang đăng nhập
            
            if (string.IsNullOrEmpty(role)) 
            {
                //Nếu chưa đăng nhập điều hướng về trang đăng nhập
                context.Result = new RedirectToActionResult("Dangnhap", "Home", null);
            } else if (role != _role)
            {
                //sai quyền -> về trang báo lổi quyền truy cập
                context.Result = new RedirectToActionResult("Dangnhap", "Home", null);
            }
        }
    }
}
