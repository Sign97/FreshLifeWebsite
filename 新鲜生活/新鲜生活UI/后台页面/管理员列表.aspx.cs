using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.后台页面
{
    public partial class 管理员列表 : System.Web.UI.Page
    {
        AdminUser_B AdminUser_B = new AdminUser_B();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptDepartenment.DataSource = AdminUser_B.Select();
                rptDepartenment.DataBind();
            }
        }
    }
}