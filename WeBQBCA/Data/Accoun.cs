using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WeBQBCA.Data;

public partial class Accoun
{
    public int AccountId { get; set; }

    public int? UserId { get; set; }
    //Sử dụng planin text Dăng Nhập.
    public string? Username { get; set; }
    //Mã hoá mật khẩu: SHA256 
    public string? PasswordHash { get; set; }//chưa sử dụng Dăng nhập.

    public bool? IsActive { get; set; }

    public virtual ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();

    public virtual User? User { get; set; } // được thêm bằng tay
}
