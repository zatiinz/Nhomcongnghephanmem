using Microsoft.AspNetCore.Mvc;
using QBCA.Dataccess.Entities;
using QBCA.app.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using QBCA.Reporsetories;
using QBCA.Services;
using QBCA.Services.QBCA.Services;
using Question = QBCA.Dataccess.Entities.Question;

namespace QBCA.app.Controllers
{
    //Quảng lý câu hỏi
    [ApiController]
    [Route("api/questions")]
    public class QuestionsController : ControllerBase
    {
        private readonly QuestionService _service;

        public QuestionsController(QuestionService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll() => Ok(await _service.GetAllQuestionsAsync());

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var q = await _service.GetQuestionByIdAsync(id);
            return q == null ? NotFound() : Ok(q);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Question question)
        {
            await _service.AddQuestion(question);
            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Question question)
        {
            if (id != question.Id) return BadRequest();
            await _service.UpdateQuestion(question);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _service.DeleteQuestion(id);
            return NoContent();
        }
    }

}