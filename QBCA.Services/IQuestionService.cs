using QBCA.Dataccess.Entities;

namespace QBCA.Services;
// # Xử lý nghiệp vụ logic
public class IQuestionService
{
    //dịch vụ  cho câu hỏi
    //hiển thị câu hỏi & kiểm tra trùng lặp
    Task<IEnumerable<Question>> GetAllQuestionsAsync()
    {
        throw new NotImplementedException();
    }
    //xem hoạc chỉnh cau hỏi
    Task<Question> GetQuestionByIdAsync(int id)
    {
        throw new NotImplementedException();
    }
    //cập nhập  câu hỏi (độ khó..vv)
    Task<bool> UpdateQuestionAsync(Question question)
    {
        throw new NotImplementedException();
    }  
    //thêm mới câu hỏi 
    Task<bool> CreateQuestionAsync(Question question)
    {
        throw new NotImplementedException();
    }
    //xoá on NH user
    Task<bool> DeleteQuestionAsync(int id)
    {
        throw new NotImplementedException();
    }

    //sử  lý logic phát hiện câu hỏi
     Task<List<Question>> FindDuplicatesAsynic()
     {
         throw new NotImplementedException();
     }
     //kiểm tra nôội dung câu hỏi có bị trùng lặp không
     public async Task<object> FindDuplicatesAsync()
     {
         throw new NotImplementedException();
     }
     Task<List<Question>> FilterQuestionsAsync(string level, string type)//no
     {
         throw new NotImplementedException();
     }

     Task<List<Question>> SearchByKeywordAsync(string keyword)//no
     {
         throw new NotImplementedException(); 
     }
}