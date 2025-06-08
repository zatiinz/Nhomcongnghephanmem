using QBCA.Dataccess.Entities;
using QBCA.Reporsetories;
using QBCA.Services;

namespace QBCA.Services
{
//# Xử lý nghiệp vụ logic
    namespace QBCA.Services
    {
        public class QuestionService : IQuestionService
        {
            private readonly IQuestionRepository _repository;

            public QuestionService(IQuestionRepository repository)
            {
                _repository = repository;
            }

            public async Task<IEnumerable<Question>> GetAllQuestionsAsync()
            {
                return await _repository.GetAllAsync();
            }

            public async Task<Question> GetQuestionByIdAsync(int id)
            {
                return await _repository.GetByIdAsync(id);
            }

            public async Task CreateQuestionAsync(Question question)
            {
                await _repository.AddAsync(question);
            }

            public async Task UpdateQuestionAsync(Question question)
            {
                await _repository.UpdateAsync(question);
            }

            public async Task DeleteQuestionAsync(int id)
            {
                await _repository.DeleteAsync(id);
            }

            public Task<object> FindDuplicatesAsync()
            {
                throw new NotImplementedException();
            }

            public async Task AddQuestion(Question question)
            {
                throw new NotImplementedException();
            }

            public async Task UpdateQuestion(Question question)
            {
                throw new NotImplementedException();
            }

            public async Task DeleteQuestion(int id)
            {
                throw new NotImplementedException();
            }
        }
    }
}