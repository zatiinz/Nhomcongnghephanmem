using QBCA.Dataccess.Entities;

namespace QBCA.app.Models;
//Quảng lý người dùng 
public class Subject
{
    public int SubhectId {get; set;}
    
    public string SubjectName {get; set;}
    
    public string Clos {get; set;} 
    
    public string Description {get; set;}
    
    
    public ICollection<Question>  Questions{get; set;}
    public ICollection<Exam> Exas {get; set;}
    public ICollection<Task> tasks  {get; set;}
    
}