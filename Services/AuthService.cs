using WeBQBCA.Repository;
using WeBQBCA.Models;


namespace WeBQBCA.Services
{
    public class Authservice : IAuthService
    {
        private readonly IUserRepository _UserRepository;
        public Authservice(IUserRepository UserReposirory)
        {
            _UserRepository = UserReposirory;
        }
        public bool ValidateUser(string Username, string password)
        {
            var user = _UserRepository.GetByUsername(Username);
            return user != null && user.Password == password;
        } 
    }

}
