using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EventActivityEntity
    {
        public int Id { get; set; }
        public string EventName { get; set; }
        public string EventStartDate { get; set; }
        public string EventEndDate { get; set; }
        public string EventImage { get; set; }
        public string EventActivityName { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int Price { get; set; }
    }
}
