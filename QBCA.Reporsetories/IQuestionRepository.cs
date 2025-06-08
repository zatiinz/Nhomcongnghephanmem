using QBCA.Dataccess.Entities;

namespace QBCA.Reporsetories;
//# Truy cập DB
public partial IQuestionRepository
{
    Task<IEnumerable<Question>> GetAllsync();

    Task<Question?> GetByIdAsync(int id);

    Task AddAsync(Question  question);

    Task UpdateAsync(Question question);

    Task <boll> Delete(int);
}
