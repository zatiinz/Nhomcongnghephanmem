using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class Question
{
    public int QuestionId { get; set; }

    public string SubjectId { get; set; } = null!;

    public string QuestionText { get; set; } = null!;

    public string? DifficultyLevel { get; set; }

    public bool? IsDuplicate { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedDate { get; set; }

    public virtual User? CreatedByNavigation { get; set; }

    public virtual Subject Subject { get; set; } = null!;
}
