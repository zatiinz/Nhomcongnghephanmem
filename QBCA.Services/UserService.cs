using QBCA.Dataccess.Entities;
using QBCA.Reporsetories;
using QBCA.Services;

public class UserServices : IUserServices
{
    private readonly IUserService _repository;
    public UserServices(IUserService userService)
    {
        _repository = userService;
    }
    public Task<List<User>> GetAllUsersWithFilterAsync(string keyword)
    {
        throw new NotImplementedException();
    }

    public async Task<User> LoginAsync(string email, string password)
    {
        var user = await _repository.GetUserByEmailAsync(email);
        if (user != null && user.Password == password)
        {
            return user;
        }
        return null;
    }
    public Task<bool> RegisterUserAsync(User newUser)
    {
        throw new NotImplementedException();
    }
    public Task<bool> UpdateProfileAsync(User user)
    {
        return _repository.UpdateUserAsync(user);
    }
    public Task<User> GetUserDetailAsync(Guid id)
    {
        return _repository.GetUserByIdAsync(id);
    }
}
