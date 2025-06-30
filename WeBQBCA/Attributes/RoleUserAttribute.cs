using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace WeBQBCA.Attributes
{
    public class RoleUserAttribute : ActionFilterAttribute
    {
        private readonly string _requiredRole;

        public RoleUserAttribute(string requiredRole)
        {
            _requiredRole = requiredRole;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var httpContext = context.HttpContext;
            var session = httpContext.Session;

            var role = session.GetString("Role");
            var username = session.GetString("Username");
            var userId = session.GetInt32("UserId");

            // Mất session => quay lại đăng nhập, kèm thông báo
            if (string.IsNullOrEmpty(role) || string.IsNullOrEmpty(username) || userId == null)
            {
                context.Result = new RedirectToActionResult("Dangnhap", "Auth", new
                {
                    error = "Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại."
                });
                return;
            }

            // Sai quyền => báo lỗi rõ
            if (role != _requiredRole)
            {
                context.Result = new RedirectToActionResult("Dangnhap", "Auth", new
                {
                    error = $"Bạn không có quyền truy cập. Cần quyền: {_requiredRole}, hiện tại: {role}"
                });
            }
        }
    }
}
