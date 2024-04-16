using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ActivityEntity
    {
        [Range(0, int.MaxValue)]
        public int Id { get; set; }
        [Range(0, int.MaxValue)]
        public int EventId { get; set; }
        public string ActivityName { get; set; }
        public string ActivityStartDate { get; set; }
        public string ActivityEndDate { get; set; }
        [Range(0, int.MaxValue, ErrorMessage = "Price must be positive number")]
        public int Price { get; set; }

    }
}
