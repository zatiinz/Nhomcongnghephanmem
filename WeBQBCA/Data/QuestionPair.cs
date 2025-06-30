using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class QuestionPair
{
    public int PairId { get; set; }

    public int Question1 { get; set; }

    public int Question2 { get; set; }

    public bool? Label { get; set; }

    public string? CreatedDate { get; set; }

    public DateTime? ModifiedDate { get; set; }

    public virtual Question Pair { get; set; } = null!;
}
