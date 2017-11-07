using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.前台页面
{
    public partial class 主页 : System.Web.UI.Page
    {
        ProductClass_B ProductClass_B = new ProductClass_B();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repZong.DataSource = ProductClass_B.SelectFClass();
                repZong.DataBind();
            }
        }
    }
}