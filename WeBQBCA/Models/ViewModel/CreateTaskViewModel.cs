using System;
using System.ComponentModel.DataAnnotations;

namespace WeBQBCA.Models
{
    public class CreateTaskViewModel
    {
        [Required]
        public string? Title { get; set; }

        [Required]
        public string? Description { get; set; }

        [Required]
        public string? SubjectId { get; set; }

        [Required]
        public int? AssignedTo { get; set; }

        public string? Status { get; set; }

        [DataType(DataType.Date)]
        public DateTime? DueDate { get; set; }
    }
}

