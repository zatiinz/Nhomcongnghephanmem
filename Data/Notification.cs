﻿using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class Notification
{
    public int NotificationId { get; set; }

    public int? UserId { get; set; }

    public string? Message { get; set; }

    public bool? IsRead { get; set; }

    public DateTime? CreatedDate { get; set; }

    public virtual User? User { get; set; }
}
