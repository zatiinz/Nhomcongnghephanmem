using System.ComponentModel.DataAnnotations;

namespace WeBQBCA.Data;

public partial class User
{
    public int UserId { get; set; }

    [Required(ErrorMessage = "Tên đăng nhập là bắt buộc")]
    [StringLength(50, ErrorMessage = "Tên đăng nhập không quá 50 ký tự")]
    public string Username { get; set; } = null!;

    [Required(ErrorMessage = "Mật khẩu là bắt buộc")]
    [StringLength(50, ErrorMessage = "Mật khẩu không quá 50 ký tự")]
    public string Password { get; set; } = null!;

    [Required(ErrorMessage = "Vai trò là bắt buộc")]
    [StringLength(50, ErrorMessage = "Vai trò không quá 50 ký tự")]
    public string Role { get; set; } = null!;

    [StringLength(50, ErrorMessage = "Tên bộ môn không quá 50 ký tự")]

    public string? SubjectId { get; set; }

    public virtual Subject? Subject { get; set; }


    // Danh sách các ReviewTask được gán cho người dùng để duyệt (Người duyệt)
    public virtual ICollection<ReviewTask> AssignedReviews { get; set; } = new List<ReviewTask>();

    // Người tạo task (UserId)
    public virtual ICollection<ReviewTask> CreatedReviewTasks { get; set; } = new List<ReviewTask>();

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();

    public virtual ICollection<QuestionHistory> QuestionHistories { get; set; } = new List<QuestionHistory>();

    // Đổi tên cho rõ ràng
    public virtual ICollection<Question> CreatedQuestions { get; set; } = new List<Question>();
    

    //public virtual ICollection<Task> Tasks { get; set; } = new List<Task>();

    public virtual ICollection<Task> AssignedTasks { get; set; } = new List<Task>();
}
