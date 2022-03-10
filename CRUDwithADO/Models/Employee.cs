using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRUDwithADO.Models
{
    public class Employee 
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public  string  Mobile{ get; set; }
        public string Gender { get; set; }
        public string DeptID { get; set; }
        public string DName { get; set; }
    }
}
