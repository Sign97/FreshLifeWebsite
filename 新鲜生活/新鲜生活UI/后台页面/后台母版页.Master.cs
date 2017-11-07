using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 新鲜生活UI.后台页面
{
    public partial class 后台母版页 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["txtUserName"] == null)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('请先登录！');location.href='后台登录.aspx';</script>");
                }
            }
        }
    }
}