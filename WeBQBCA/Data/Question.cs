using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace WeBQBCA.Data;
public partial class Question
{
    public int QuestionId { get; set; }

    [Required(ErrorMessage = "Phải chọn môn học")]
    public string SubjectId { get; set; } = null!;

    [Required(ErrorMessage = "Nội dung câu hỏi không được để trống")]
    public string QuestionText { get; set; } = null!;

    [Required(ErrorMessage = "Chọn mức độ")]
    public string? DifficultyLevel { get; set; }

    public bool? IsDuplicate { get; set; }

    public int? CreatedBy { get; set; }

    public DateTime? CreatedDate { get; set; }

    public string? Status { get; set; }

    public bool? IsDeleted { get; set; }

    public int? ReviewerId { get; set; }

    public virtual User? CreatedByNavigation { get; set; }

    public virtual ICollection<QuestionHistory> QuestionHistories { get; set; } = new List<QuestionHistory>();

    public virtual ICollection<QuestionPair> QuestionPairs { get; set; } = new List<QuestionPair>();

    public virtual ICollection<ReviewTask> ReviewTasks { get; set; } = new List<ReviewTask>();

    public virtual User? Reviewer { get; set; }


    public virtual Subject? Subject { get; set; }

    public virtual ICollection<SuggestedEdit> SuggestedEdits { get; set; } = new List<SuggestedEdit>();
}