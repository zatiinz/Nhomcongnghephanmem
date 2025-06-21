using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using WeBQBCA.Models;
using WeBQBCA.Models.ViewModels;
using System.Linq;

namespace WeBQBCA.Controllers
{
    public class TaskController : Controller
    {
        private readonly AppDbContext _db;

        public TaskController(AppDbContext db)
        {
            _db = db;
        }

        public IActionResult Assign()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("Username")))
            {
                return RedirectToAction("Dangnhap", "Home");
            }

            var model = new TaskAssignmentViewModel
            {
                Lecturers = _db.Users.Where(u => u.Role == "Lecturer").ToList(),
                Tasks = _db.Tasks.ToList()
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult CreateTask(Task task)
        {
            if (ModelState.IsValid)
            {
                _db.Tasks.Add(task);
                _db.SaveChanges();
                return RedirectToAction("Assign");
            }
            var model = new TaskAssignmentViewModel
            {
                Lecturers = _db.Users.Where(u => u.Role == "Lecturer").ToList(),
                Tasks = _db.Tasks.ToList()
            };
            return View("Assign", model);
        }

        public IActionResult Details(int id)
        {
            var task = _db.Tasks.Find(id);
            return PartialView("_TaskDetails", task);
        }

        [HttpPost]
        public IActionResult UpdateStatus(int taskId, string newStatus)
        {
            var task = _db.Tasks.Find(taskId);
            if (task != null)
            {
                task.Status = newStatus;
                _db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var task = _db.Tasks.Find(id);
            if (task != null)
            {
                _db.Tasks.Remove(task);
                _db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }
    }
}