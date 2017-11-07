using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.前台页面
{
    public partial class 用户登录 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        UserInfo_B UserInfo_B = new UserInfo_B();
        protected void btnDenglu_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = UserInfo_B.SelectNamePwd(txtUserName.Text, Pwd.Text);
            if (dt.Rows.Count>0)
            {
                Session["username"] = dt.Rows[0]["UserName"];
                Session["userID"] = dt.Rows[0]["UserID"];
 
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('登录成功！正在跳转。。。');location.href='主页.aspx';</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('登录失败！');</script>");
            }

        }
    }
}