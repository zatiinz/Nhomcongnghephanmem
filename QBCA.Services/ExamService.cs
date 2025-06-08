public class ExamService : IExamService
{
    private readonly IExamRepository _examRepository;

    public ExamService(IExamRepository examRepository)
    {
        _examRepository = examRepository;
    }

    public async Task<IEnumerable<Exam>> GetAllExamsAsync() => await _examRepository.GetAllAsync();

    public async Task<Exam> GetExamByIdAsync(int id) => await _examRepository.GetByIdAsync(id);

    public async Task<bool> CreateExamAsync(Exam exam) => await _examRepository.CreateAsync(exam);

    public async Task<bool> UpdateExamAsync(Exam exam) => await _examRepository.UpdateAsync(exam);

    public async Task<bool> DeleteExamAsync(int id) => await _examRepository.DeleteAsync(id);
}
