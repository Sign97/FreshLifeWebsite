using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
using 新鲜生活Model;
namespace 新鲜生活UI.前台页面
{
    public partial class 购物车 : System.Web.UI.Page
    {
        public static float Xiaoji;
        public static int Shuliang;

        Product_B Product_B = new Product_B();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Product product = new Product_B().setIDGoods(Request.QueryString["proID"]);
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

                if (Request.QueryString["proID"] != null)
                {
                    if (Session["productSE"] != null)
                        prolist = Session["productSE"] as List<Product>;

                    //查询是否有此商品
                    Product ExistsProduct = prolist.Where(m => m.ProductID == product.ProductID).SingleOrDefault();
                    if (ExistsProduct != null)
                    {
                        ExistsProduct.proNumber++;
                        ExistsProduct.proPrice += product.ProductPrice;
                    }
                    else
                    {
                        product.proNumber = 1;
                        product.proPrice = product.ProductPrice;
                        prolist.Add(product);
                    }
                }
                sumMoney.Text = "总计：￥<span style='color:red;'>" + prolist.Sum(s => s.proPrice).ToString() + "</span>元";
                Session["productSE"] = prolist;
                shopping.DataSource = prolist;
                shopping.DataBind();
            }
        }




        protected void shopping_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            List<Product> prolist = new List<Product>();
            prolist = Session["productSE"] as List<Product>;
            int id = Convert.ToInt32(((Label)e.Item.FindControl("productID")).Text);
            Product ExistsProduct = prolist.Where(m => m.ProductID == id).SingleOrDefault();
            if (e.CommandName == "Reduce")
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