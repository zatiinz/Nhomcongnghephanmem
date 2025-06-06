namespace QBCA.app.Models;

public class Exam
{
    public int ExamId { get; set; } 
    
    public int SubjectId { get; set; }
    
    public string ExamClos { get; set; } = string.Empty();
    
    public string TotalQuestions { get; set; } = string.Empty();
    
    public Subject[] Subjects { get; set; }
}
