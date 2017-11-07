using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace 新鲜生活DAL
{
   public  class AdminUser_D
    {
        public bool SelectIdPwd(string AdminName,string AdminPwd)
        {
            string sql = "select * from [AdminUser] where [AdminName]=@adminName and AdminPwd=@pwd";
            SqlParameter sqlarams = new SqlParameter();
            sqlarams.ParameterName = "@adminName";
            sqlarams.DbType = DbType.String;
            sqlarams.Value = AdminName;

            SqlParameter sqlarames = new SqlParameter();
            sqlarames.ParameterName = "@pwd";
            sqlarames.DbType = DbType.String;
            sqlarames.Value = AdminPwd;
            DataTable dt = SqlDBHelper.GetDataTable(sql, sqlarams, sqlarames);
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataTable Select()
        {
            string sql = "select * from AdminUser";
            return SqlDBHelper.GetDataTable(sql);
        }

        public bool Add(string AdminName,string AdminPwd)
        {
            string sql = "INSERT INTO [dbo].[AdminUser]([AdminName],[AdminPwd])VALUES('"+ AdminName + "','"+ AdminPwd + "')";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

    }
}
