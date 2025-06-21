using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class Subject
{
    public string SubjectId { get; set; } = null!;

    public string SubjectName { get; set; } = null!;

    public string? Clos { get; set; }

    public string? DifficultyLevel { get; set; }

    public virtual ICollection<Exam> Exams { get; set; } = new List<Exam>();

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Task> Tasks { get; set; } = new List<Task>();
}
