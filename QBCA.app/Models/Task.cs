namespace QBCA.app.Models;

public class Task
{
    public int TaskId { get; set; }
    
    public int AssignedToId { get; set; }
    
    public int SubjectId { get; set; }
    
    public string TaskDescription { get; set; }
    
    public string Status { get; set; }
    
    
    public User AssignedTo { get; set; }
    public User Subject { get; set; }
}