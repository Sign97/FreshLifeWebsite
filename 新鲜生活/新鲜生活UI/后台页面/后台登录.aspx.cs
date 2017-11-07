using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.后台页面
{
    public partial class 后台登录 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        AdminUser_B AdminUser_B = new AdminUser_B();
        protected void Btn_Click(object sender, EventArgs e)
        {
            if (this.UserName.Text.Trim() != string.Empty)
            {

                if (AdminUser_B.SelectIdPwd(UserName.Text, Pwd.Text))
                {

                    Session["txtUserName"] = this.UserName.Text;
                    
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('登录成功！正在跳转。。。');location.href='后台主页.aspx';</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('登录失败！');</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('验证码错误！');</script>");
            }
        }
    }
}