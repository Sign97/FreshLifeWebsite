using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.前台页面
{
    public partial class 注册页 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        UserInfo_B UserInfo_B = new UserInfo_B();
        protected void bodyContent_btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            if (UserInfo_B.Add(UserName.Text,PwdRe.Text, Phone.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('用户添加成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('添用户加失败！');</script>");
            }


        }
    }
}