using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EventEntity
    {
        public int Id { get; set; }
        public string EventName { get; set; }
        public string EventStartDate { get; set; }
        public string EventEndDate { get; set; }
        public string isActive { get; set; }
        public string image { get; set; }
        public string AddDate { get; set; } 

    }
}
