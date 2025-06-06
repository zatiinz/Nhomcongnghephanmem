using QBCA.Dataccess.Entities;
namespace QBCA.Services;

public class IUserService
{
    //dịch vụ nguời dùng
    //Điều chỉnh người dùng 
    public Task<bool> UpdateUserAsync(User user)
    {
        throw new NotImplementedException();
    }

    public Task<User> GetUserByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public async Task<bool> CreateUserAsync(User newUser)
    {
        throw new NotImplementedException();
    }

    public async Task<User> GetUserByEmailAsync(object email)
    {
        throw new NotImplementedException();
    }

    public async Task<object> GetAllUsersAsync()
    {
        throw new NotImplementedException();
    }
}
public interface IUserServices
{
    //cập nhập login logout
    
    Task<List<User>> GetAllUsersWithFilterAsync(string keyword); //Gọi `IUserService.GetAllUsersAsync()→
    Task<User> LoginAsync(string email, string password);//dao diện đăng nhập -> vai trò kiểm tra
    //dao điện đăng ký -> kiểm tra
    Task<bool> RegisterUserAsync(User newUser);
    //dao diện cập nhập -> kểm tra cập nhập
    Task<bool> UpdateProfileAsync(User user);
    //
    Task<User> GetUserDetailAsync(Guid id);
}
