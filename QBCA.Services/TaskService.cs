namespace QBCA.Services;
// # Xử lý nghiệp vụ logic
public class TaskService
{
    private readonly IQuestionService _questionService;

    public TaskService(IQuestionService questionService)
    {
        _questionService = questionService;
    }

    public async Task RunDupLicateCheckTask()
    {
        var duplicates = await _questionService.FindDuplicatesAsync();
    }
    
}