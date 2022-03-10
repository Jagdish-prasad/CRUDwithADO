using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Microsoft.Data;
using System.Data;

namespace CRUDwithADO.Models
{
    public class EmployeeDataAccess
    {
        DBConnection DbConnection;
        public EmployeeDataAccess()
        {
            DbConnection = new DBConnection();
           }
        public List<Employee> GetEmployees()
        {
            string Sp = "SP_EMPLOYEE";
            SqlCommand sql = new SqlCommand(Sp, DbConnection.Connection);
            sql.CommandType = CommandType.StoredProcedure;
            sql.Parameters.AddWithValue("@action","SELECT_JION");
            if (DbConnection.Connection.State == ConnectionState.Closed)
            {
                DbConnection.Connection.Open();
            }
            SqlDataReader dr = sql.ExecuteReader();
            List<Employee> employees = new List<Employee>();
            while (dr.Read())
            {
                Employee Emp = new Employee();
                Emp.Id = (int)dr["id"];
                Emp.Name = dr["Name"].ToString();
                Emp.Email =dr["Email"].ToString();
                Emp.Mobile =dr["Mobile"].ToString();
                Emp.Gender =dr["gender"].ToString();
                Emp.DName = dr["Department"].ToString();
                employees.Add(Emp);
            }
            DbConnection.Connection.Close();
            return employees;
        }
    }
}
