using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活Model;
using 新鲜生活BLL;
using System.Data;
namespace 新鲜生活UI
{
    public partial class account : System.Web.UI.Page
    {
        Order_B Order_B = new Order_B();
        UserInfo_B UserInfo_B = new UserInfo_B();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = UserInfo_B.SelectID(Convert.ToInt32(Session["UserID"]));
                if (dt.Rows.Count > 0)
                {
                    name.Text = dt.Rows[0]["UserName"].ToString();
                    area.Text = dt.Rows[0]["Address"].ToString();
                    phone.Text = dt.Rows[0]["Phone"].ToString();
                }



                List<Product> prolist = new List<Product>();

                if (Request.QueryString["productid"] != null)
                {
                    if (Session["productSE"] != null)
                    {
                        prolist = Session["productSE"] as List<Product>;
                        int RemovePdoductID = Convert.ToInt32(Request.QueryString["productid"]); //删除ID
                        //查询出集合对应商品ID，并删除该类
                        prolist.Remove(prolist.Where(m => m.ProductID == RemovePdoductID).SingleOrDefault());
                    }
                }
                if (Session["productSE"] != null)
                {
                    prolist = Session["productSE"] as List<Product>;
                }
                sumMoney.Text =  prolist.Sum(s => s.proPrice).ToString() ;
                
                Session["productSE"] = prolist;
                shopping.DataSource = prolist;
                shopping.DataBind();



            }
        }

        protected void btnGoOrder_Click(object sender, ImageClickEventArgs e)
        {
            if (UserInfo_B.Update(name.Text, phone.Text, area.Text, Convert.ToInt32(Session["UserID"])))
            {
                if (Order_B.Add(Convert.ToInt32(Session["UserID"]), Convert.ToDateTime(DateTime.Now.Date.ToString()), Convert.ToSingle(sumMoney.Text), area.Text))
                {
                    Response.Redirect("订单详情.aspx");


                }

            }

        }

        protected void shopping_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            List<Product> prolist = new List<Product>();
            prolist = Session["productSE"] as List<Product>;
            int id = Convert.ToInt32(((Label)e.Item.FindControl("productID")).Text);
            Product ExistsProduct = prolist.Where(m => m.ProductID == id).SingleOrDefault();
            if (e.CommandName == "Reduce")  //是否单击此按钮
            {
                if (ExistsProduct.proNumber == 0)
                    return;
                ExistsProduct.proNumber--;

                ExistsProduct.proPrice -= ExistsProduct.ProductPrice;
            }
            else if (e.CommandName == "Add")
            {
                ExistsProduct.proNumber++;
                ExistsProduct.proPrice += ExistsProduct.ProductPrice;
            }
            sumMoney.Text = "总计：￥<span style='color:red;'>" + prolist.Sum(s => s.proPrice).ToString() + "</span>元";
            Session["productSE"] = prolist;
            shopping.DataSource = prolist;
            shopping.DataBind();
        }
    }
}