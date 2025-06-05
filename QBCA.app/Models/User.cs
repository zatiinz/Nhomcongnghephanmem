using QBCA.Dataccess.Entities;

namespace QBCA.app.Models;
//Quảng lý người dùng 
public class User
{
    public string FullName {get; set;}
    
    public string Email {get; set;}
    
    public string Id {get; set;} 
    
    public string Role {get; set;}
    
    
    public ICollection<Notification> Notifications {get; set;}
    public ICollection<Task> tasks  {get; set;}
    
}