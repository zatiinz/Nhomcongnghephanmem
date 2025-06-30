using System.Collections.Generic;
using System.Threading.Tasks;
using WeBQBCA.Data;

namespace WeBQBCA.Repository
    {
        public interface IQuestionRepository
        {
            /// <summary>
            /// Thêm một question và trả về thực thể Question kèm ID
            /// </summary>
            Task<Question> AddQuestionAsync(Question question);

            /// <summary>
            /// Thêm một question (và lưu luôn CreatorId bên trong question.CreatedBy)
            /// </summary>
            Task<bool> AddQuestionAsync(Question question, int creatorId);

            /// <summary>
            /// Lấy danh sách users có role nằm trong mảng roles
            /// </summary>
            Task<IEnumerable<User>> GetReviewersAsync(string[] roles);
        }
    }

