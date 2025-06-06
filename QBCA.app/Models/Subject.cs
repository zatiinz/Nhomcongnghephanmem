using QBCA.Dataccess.Entities;

namespace QBCA.app.Models;
//Quảng lý người dùng 
public class Subject
{
    public int SubhectId {get; set;}
    
    public string SubjectName {get; set;} = string.Empty();
    
    public string Clos {get; set;} = string.Empty();
    
    public string Description {get; set;} = string.Empty();
    
    
    public ICollection<Question>  Questions{get; set;}
    public ICollection<Exam> Exas {get; set;}
    public ICollection<Task> tasks  {get; set;}
    
}
