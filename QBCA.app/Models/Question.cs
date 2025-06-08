using QBCA.Dataccess.Entities;

namespace QBCA.app.Models;

public class Question
{
    public int Id {get; set;}
    
    public string Content {get; set;}
    
    public string CLO {get; set;} = string.Empty();
    
    public string DifficultyLevel {get; set;} = string.Empty();
    
    public Subject Subject { get; set; }
    
    public ICollection<QuestionReview> QuestionReviews { get; set; }
    
}
public class QuestionReview
{
    
}
