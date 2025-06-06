using QBCA.Dataccess.Entities;

namespace QBCA.app.Models;
//Quảng lý người dùng 
public class User
{
    public string FullName {get; set;} = string.Empty();
    
    public string Email {get; set;} = string.Empty();
    
    public int Id {get; set;} 
    
    public string Role {get; set;} = string.Empty();
    
    
    public ICollection<Notification> Notifications {get; set;}
    public ICollection<Task> tasks  {get; set;}
    
}
