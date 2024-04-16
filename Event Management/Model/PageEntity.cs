using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class PageEntity
    {
        [Required]
        public int Page {  get; set; }
        [Required]
        public int EventPerPage {  get; set; }
    }
}
