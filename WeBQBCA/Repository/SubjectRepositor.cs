using WeBQBCA.Data;
using Microsoft.EntityFrameworkCore;


namespace WeBQBCA.Repository
{
    public class SubjectRepository : ISubjectRepository
    {
        private readonly QbcaDbContext _context;

        public SubjectRepository(QbcaDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Subject>> GetAllSubjectsAsync()
        {
            return await _context.Subjects.ToListAsync();
        }
       

    }

}
