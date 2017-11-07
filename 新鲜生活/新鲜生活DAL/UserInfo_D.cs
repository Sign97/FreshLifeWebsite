using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace 新鲜生活DAL
{
    public class UserInfo_D
    {
        public bool Add(string UserName,string UserPwd,string Phone)
        {
            string sql = "INSERT INTO [dbo].[UserInfo]([UserName],[UserPwd],[Phone])VALUES('"+ UserName + "','"+ UserPwd + "','"+ Phone + "')";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }

        public DataTable SelectNamePwd(string UserName,string UserPwd)
        {
            string sql = "select * from UserInfo where UserName=@UserName and UserPwd=@UserPwd";
            SqlParameter sqlarams = new SqlParameter();
            sqlarams.ParameterName = "@UserName";
            sqlarams.DbType = DbType.String;
            sqlarams.Value = UserName;

            SqlParameter sqlarames = new SqlParameter();
            sqlarames.ParameterName = "@UserPwd";
            sqlarames.DbType = DbType.String;
            sqlarames.Value = UserPwd;
            return  SqlDBHelper.GetDataTable(sql, sqlarams, sqlarames);

        }

        public DataTable SelectID(int UserID)
        {
            string sql = "select * from UserInfo where UserID=" + UserID + "";
            return SqlDBHelper.GetDataTable(sql);
        }
        public bool Update(string UserName,string Phone,string Address,  int UserID)
        {
            string sql = "UPDATE [dbo].[UserInfo]SET [UserName] = '" + UserName + "',[Phone] = '" + Phone + "',[Address] = '" + UserID + "' WHERE UserID=" + UserID + "";
            return SqlDBHelper.ExecuteNonQuery(sql);
        }
    }
}
