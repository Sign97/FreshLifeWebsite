using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.前台页面
{
    public partial class 确认支付 : System.Web.UI.Page
    {
        Order_B Order_B = new Order_B();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMoney_Click(object sender, ImageClickEventArgs e)
        {
                if(Order_B.UpdatePay(Convert.ToInt32(Request.QueryString["idT"])))
                {
                    Response.Write("<script>location.href='订单详情.aspx';</script>");
                }

        }
    }
}