using WeBQBCA.Data;

namespace WeBQBCA.Repository
{
    public interface IUserRepository
    {
        User? GetByUsername(string username); // Interface chỉ khai báo
    }
}