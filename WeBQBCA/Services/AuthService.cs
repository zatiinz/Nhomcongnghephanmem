using WeBQBCA.Data;


namespace WeBQBCA.Services
{
    public class AuthService : IAuthService
    {
        private readonly QbcaDbContext _context;
        public AuthService(QbcaDbContext context)
        {
            _context = context;
        }
        public bool ValidateUser(string Username, string password)
        {
            var user = _context.Users.FirstOrDefault(u => u.Username == Username);
            return user != null && user.Password == password;
        }

        public User? GetUserByUsernameAndPassword(string username, string password)
        {
            var user = _context.Users.FirstOrDefault(u => u.Username == username && u.Password == password);
            return user;
        }
        public User GetUserByUsername(string username)
        {
            return _context.Users.FirstOrDefault(u => u.Username == username);
        }

    }
}
