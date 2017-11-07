using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.后台页面
{
    public partial class 管理员新增 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        AdminUser_B AdminUser_B = new AdminUser_B();
        protected void button_Click(object sender, EventArgs e)
        {
            if (AdminUser_B.Add(txtName.Text, txtPrice.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('添加成功！');</script>");
                txtName.Text = "";
                txtPrice.Text = "";
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('添加失败！');</script>");
            }
        }
    }
}