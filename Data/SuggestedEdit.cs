using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class SuggestedEdit
{
    public int SuggestionId { get; set; }

    public int QuestionId { get; set; }

    public string? SuggestedText { get; set; }

    public double? Confidence { get; set; }

    public DateTime? CreatedDate { get; set; }

    public bool? GeneratedByAi { get; set; }

    public virtual Question Question { get; set; } = null!;
}
