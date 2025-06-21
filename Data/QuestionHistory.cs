using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class QuestionHistory
{
    public int HistoryId { get; set; }

    public int QuestionId { get; set; }

    public int ModifiedBy { get; set; }

    public string? NewText { get; set; }

    public string? OldText { get; set; }

    public DateTime? ModifiedData { get; set; }

    public virtual User ModifiedBy1 { get; set; } = null!;

    public virtual Question ModifiedByNavigation { get; set; } = null!;
}
