using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class UserRole
{
    public int AccountId { get; set; }

    public int RoleId { get; set; }

    public string? Ghichu { get; set; }

    public virtual Accoun Account { get; set; } = null!;

    public virtual Role Role { get; set; } = null!;
}
