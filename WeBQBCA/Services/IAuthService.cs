using WeBQBCA.Data;

namespace WeBQBCA.Services
{
    public interface IAuthService
    {
        bool ValidateUser(string username, string password);
        User? GetUserByUsernameAndPassword(string username, string password);
        User GetUserByUsername(string username);
    }
}