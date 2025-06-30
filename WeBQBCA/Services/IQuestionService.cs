using System.Threading.Tasks;
using WeBQBCA.Data;

using WeBQBCA.Data;

public interface IQuestionService
{
    Task<bool> AddQuestionWithReviewTasksAsync(Question question, int creatorId);
}
