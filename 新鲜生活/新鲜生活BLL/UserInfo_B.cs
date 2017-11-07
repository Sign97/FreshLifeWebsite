using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using 新鲜生活DAL;
namespace 新鲜生活BLL
{
    public class UserInfo_B
    {
        UserInfo_D UserInfo_D = new UserInfo_D();
        public bool Add(string UserName, string UserPwd, string Phone)
        {
            return UserInfo_D.Add(UserName, UserPwd, Phone);
        }
        public DataTable SelectNamePwd(string UserName, string UserPwd)
        {
            return UserInfo_D.SelectNamePwd(UserName, UserPwd);
        }
        public DataTable SelectID(int UserID)
        {
            return UserInfo_D.SelectID(UserID);
        }
        public bool Update(string UserName, string Phone, string Address, int UserID)
        {
            return UserInfo_D.Update(UserName, Phone, Address, UserID);
        }
    }
}
