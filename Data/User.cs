using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WeBQBCA.Data;

public partial class User
{
    public int UserId { get; set; }
    [Required]
    [Display(Name = "Tên Đăng nhập")]

    public string Username { get; set; } = null!;
    [Required]
    [Display(Name = "Mật khẩu")]

    public string Password { get; set; } = null!;

    [Display(Name = "Vai trò")]
    public string Role { get; set; } = null!;
    

    public string? Subject { get; set; }

    public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Task> Tasks { get; set; } = new List<Task>();
}
