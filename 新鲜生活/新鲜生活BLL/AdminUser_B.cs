using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using 新鲜生活DAL;
namespace 新鲜生活BLL
{
    public class AdminUser_B
    {
        AdminUser_D AdminUser_D = new AdminUser_D();
        public bool SelectIdPwd(string AdminName, string AdminPwd)
        {
            return AdminUser_D.SelectIdPwd(AdminName, AdminPwd);
        }
        public DataTable Select()
        {
            return AdminUser_D.Select();
        }

        public bool Add(string AdminName, string AdminPwd)
        {
            return AdminUser_D.Add(AdminName, AdminPwd);
        }
    }
}
