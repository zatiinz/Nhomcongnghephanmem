using WeBQBCA.Data;

namespace WeBQBCA.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly QbcaDbContext _context;

        public UserRepository(QbcaDbContext context)
        {
            _context = context;
        }

        public User GetByUsername(string username)
        {
            return _context.Users.FirstOrDefault(u => u.Username == username);
        }
    }
}
