using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRUDwithADO.Models
{
    public class DBConnection
    {
        public SqlConnection Connection;
        public DBConnection()
        { 
           Connection=new SqlConnection
            (DbConfig.ConnectionStr);
        }
    }
}
