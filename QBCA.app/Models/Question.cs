using QBCA.Dataccess.Entities;

namespace QBCA.app.Models;

public class Question
{
    public int QestionId {get; set;}
    
    public int SubjectId {get; set;}
    
    public string QuestionText {get; set;} = string.Empty();
    
    public string Difficulty {get; set;} = string.Empty();
    
    public bool IsDuplicated {get; set;} 
    
    public string Createdby {get; set;} = string.Empty();
    
    
    public Subject  Subject {get; set;}
}
