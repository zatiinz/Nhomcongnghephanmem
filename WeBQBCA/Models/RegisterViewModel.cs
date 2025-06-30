using System.ComponentModel.DataAnnotations;

namespace WeBQBCA.Models
{
    public class RegisterViewModel
    {
        [Required(ErrorMessage = "Tên đăng nhập là bắt buộc")]
        [StringLength(50)]
        public string Username { get; set; }

        [Required(ErrorMessage = "Mật khẩu là bắt buộc")]
        [DataType(DataType.Password)]
        [StringLength(50, MinimumLength = 6)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Vai trò là bắt buộc")]
        public string Role { get; set; }


    }
}
