using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class ReviewTask
{
    public int ReviewTaskId { get; set; }

    public int QuestionId { get; set; }
   
    public int UserId { get; set; }

    public int ReviewerId { get; set; }

    public string? Description { get; set; } = null!;

    public string? Tile { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? Status { get; set; }

    public virtual Question Question { get; set; } = null!;

    public virtual User Creator { get; set; } = null!;   // Navigation tới người tạo

    public virtual User Reviewer { get; set; } = null!;
}
