using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using WeBQBCA.Data;

namespace WeBQBCA.Repository
{
    public class QuestionRepository : IQuestionRepository
    {
        private readonly QbcaDbContext _context;

        public QuestionRepository(QbcaDbContext context)
        {
            _context = context;
        }
        //lưu câu hỏi mới vào trong bảng Question -> databasse
        public async Task<Question> AddQuestionAsync(Question question)
        {
            _context.Questions.Add(question);
            await _context.SaveChangesAsync();
            //trả về đối tượng câu hỏi
            return question;
        }
        //Gọi lại hàm trên để lưu vào databasse
        public async Task<bool> AddQuestionAsync(Question question, int creatorId)
        {
            // Gán creator -> xác nhận người tạo
            question.CreatedBy = creatorId;
            await AddQuestionAsync(question);
            return true; //thành công trả về 
        }
        //Lấy danh sách người dùng -> đã phân quyền 
        public async Task<IEnumerable<User>> GetReviewersAsync(string[] roles)
        {
            return await _context.Users
                                 .Where(u => roles.Contains(u.Role))
                                 .ToListAsync();
        }
    }
}
