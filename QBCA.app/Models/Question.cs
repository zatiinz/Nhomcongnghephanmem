using QBCA.Dataccess.Entities;

namespace QBCA.app.Models;

public class Question
{
    public int QestionId {get; set;}
    
    public int SubjectId {get; set;}
    
    public string QuestionText {get; set;}
    
    public string Difficulty {get; set;}
    
    public bool IsDuplicated {get; set;}
    
    public string Createdby {get; set;}
    
    
    public Subject  Subject {get; set;}
}