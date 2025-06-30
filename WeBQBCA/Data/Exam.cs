using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class Exam
{
    public int ExamId { get; set; }

    public string? SubjectId { get; set; }

    public DateTime? ExamDate { get; set; }

    public int? TotalQuestions { get; set; }

    public string? DifficultyPercentage { get; set; }

    public virtual Subject? Subject { get; set; }
}
