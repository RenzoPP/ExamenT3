using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace appT3.Models
{
    public class Note
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
