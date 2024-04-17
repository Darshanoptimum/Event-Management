using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LIBRARY
{
    public static class Connection
    {
        public static string constrSMC()
        {
            //string conn = "data source=DESKTOP-R5CTQN3\\SQLEXPRESS; database=Event_Management; integrated security=SSPI";
            string conn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            return conn;
        }
    }
}
