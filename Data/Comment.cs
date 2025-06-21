using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class Comment
{
    public int CommentsId { get; set; }

    public int QuestionId { get; set; }

    public int UserId { get; set; }

    public string? Content { get; set; }

    public DateTime? CreatedAt { get; set; }

    public bool? IsReviewer { get; set; }

    public virtual User User { get; set; } = null!;
}
