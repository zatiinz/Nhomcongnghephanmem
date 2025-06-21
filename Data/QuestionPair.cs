using System;
using System.Collections.Generic;

namespace WeBQBCA.Data;

public partial class QuestionPair
{
    public int PairId { get; set; }

    public string Question1 { get; set; } = null!;

    public string Question2 { get; set; } = null!;

    public bool Label { get; set; }

    public DateTime? CreatedDate { get; set; }
}
