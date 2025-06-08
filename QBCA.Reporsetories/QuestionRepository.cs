using Microsoft.EntityFrameworkCore;
using QBCA.Dataccess.Context;
using QBCA.Dataccess.Entities;

namespace QBCA.Reporsetories;
//# Truy cập DB
public class QuestionRepository : IQuestionReposity
{
    private readonly QbcaDbContext  _context;
    public QuestionRepository(QbcaDbcontext context)
    {
        _context = context;
    }
    public async Task<IEnumerable<Question>> GetAllAsync();
    }
       return await _context.Question.Include( q => q.subject).ToLisAsync(id);
    }
    public async Task<Question> GetByIdAsync(int id){
        return await _context.Question.Include( q => q.Subject).FirstOrDefaultAsync(q =>.id ==id);
    }
    public async Task AddAsync(Question question){
        await _context.Question.AddAsync(qestion);
        await _context.Qestion.SaveChangeAsync();
    }
    public async Task UpdateAsync(Question question){
        _context.Question.Remove(Question);
        await _context.SaveChangesAsync();
    }
    public async Task<bool> DeleteAsync(int id){
        var question = await _context.Question.FindAsync(id);
        if(qestion != null){
            _context.Question.Remove(question);
            await _context.SaveChangesAsync();
        }
        return false;
    }
}
