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
    public partial class 商品详情 : System.Web.UI.Page
    {
        public  string uerID;
        Product_B Product_B = new Product_B();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = Product_B.SelectID(Convert.ToInt32(Request.QueryString["ProductID"]));
                GoodsName.Text = dt.Rows[0]["ProductName"].ToString();
                price.Text = dt.Rows[0]["ProductPrice"].ToString();
                Jianjie.Text = dt.Rows[0]["ProductDesc"].ToString();
            }


        }

        protected void btnAddToShoppingCart_Click(object sender, ImageClickEventArgs e)
        {
                Response.Write("<script>location.href='购物车.aspx?proID=" + Request.QueryString["ProductID"] + "';</script>");
        }
    }
}