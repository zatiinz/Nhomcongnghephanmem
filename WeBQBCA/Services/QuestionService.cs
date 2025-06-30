using WeBQBCA.Data;
using WeBQBCA.Repository;
using WeBQBCA.Services;

public class QuestionService : IQuestionService
{
    private readonly IQuestionRepository _questionRepository;
    private readonly QbcaDbContext _context;
    private async Task<bool> CreateQuestionWithReviewAsync(Question question, int creatorId)
    {
        return await _questionRepository.AddQuestionAsync(question, creatorId);
    }
    public async Task<bool> AddQuestionWithReviewTasksAsync(Question question, int creatorId)
    {
        // ✅ Thêm dòng này trước khi gọi repository
        question.CreatedBy = creatorId;
        question.CreatedDate = DateTime.Now;
        question.Status = "chờ duyệt";  // nếu cần

        var success = await CreateQuestionWithReviewAsync(question, creatorId);
        if (!success) return false;

        var reviewers = await _questionRepository.GetReviewersAsync(new[] { "NhanVienR_D", "TruongBoMon" });

        foreach (var reviewer in reviewers)
        {
            var reviewTask = new ReviewTask
            {
                QuestionId = question.QuestionId,
                UserId = creatorId,
                ReviewerId = reviewer.UserId,
                CreatedAt = DateTime.Now,
                Status = "chờ duyệt",
                Description = "Câu hỏi cần duyệt",
                Tile = "Duyệt câu hỏi mới"
            };

            _context.ReviewTasks.Add(reviewTask);
        }

        await _context.SaveChangesAsync();
        return true;
    }

}
