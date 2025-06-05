namespace QBCA.app.Models;

public class Exam
{
    public int ExamId { get; set; } 
    
    public int SubjectId { get; set; }
    
    public string ExamClos { get; set; }
    
    public string TotalQuestions { get; set; } 
    
    public Subject[] Subjects { get; set; }
}