using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class Accoun
{
    public int AccountId { get; set; }

    public int? UserId { get; set; }

    public string? Username { get; set; }

    public string? PasswordHash { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
}
