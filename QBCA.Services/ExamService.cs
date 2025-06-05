using QBCA.Dataccess.Entities;
using QBCA.Reporsetories;

namespace QBCA.Services;
// # Xử lý nghiệp vụ logic
public class ExamService
{
    private readonly IExamRepository _repository;

    public ExamService(IExamRepository repository)
    {
        _repository = repository;
    }

    public async Task<bool> CreateEXamAsync(Exam exam)
    {
        //kiểm tra trùng lặp buộc nghiệp vụ
        return await _repository.AddAsync(exam);
    }
}