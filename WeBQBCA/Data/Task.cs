using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class Task
{
    public int TaskId { get; set; }

    public int? AssignedTo { get; set; }

    public string? SubjectId { get; set; }

    public string? TaskDescription { get; set; }

    public string? Status { get; set; }

    public DateTime? DueDate { get; set; }

    public virtual User? AssignedToNavigation { get; set; }

    public virtual ICollection<ReviewTask> ReviewTasks { get; set; } = new List<ReviewTask>();

    public virtual Subject? Subject { get; set; }
}
