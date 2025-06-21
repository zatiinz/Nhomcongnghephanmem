using System.ComponentModel.DataAnnotations;
namespace WeBQBCA.Models.ViewModel
{
    public class LoginViewModel
    {
        [Required]
        public string Username {  get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        
    }
}
