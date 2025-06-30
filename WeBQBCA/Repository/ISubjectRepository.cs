using WeBQBCA.Data;

namespace WeBQBCA.Repository
{
    public interface ISubjectRepository
    {
        Task<IEnumerable<Subject>> GetAllSubjectsAsync();
    }
}
