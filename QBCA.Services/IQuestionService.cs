using QBCA.Dataccess.Entities;

namespace QBCA.Services;
// # Xử lý nghiệp vụ logic
public class IQuestionService
{
    Task<IEnumerable<Question>> GetAllQuestionsAsync();

    Task<Question> GetQuestionByIdAsync(int id);

    Task CreateQuestionAsync(Question question);

    Task UpdaateQuestionAsync(Question question);

    Task DeleteQuestionAsync( int id);

    Task<object> FindDuplicatesAsync();
}
