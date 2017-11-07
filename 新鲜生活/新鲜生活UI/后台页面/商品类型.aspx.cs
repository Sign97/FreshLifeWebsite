using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.后台页面
{
    public partial class 商品类型 : System.Web.UI.Page
    {
        /// <summary>
        /// 每页数据条数
        /// </summary>
        public int pageSize = 5;
        /// <summary>
        /// 当前页码
        /// </summary>
        public int currentPage = 1;
        /// <summary>
        /// 总共多少页
        /// </summary>
        public int pageCount;
        /// <summary>
        /// 总数据
        /// </summary>
        public int recordCount;

        public void LoadProDuct()
        {
            //if (!string.IsNullOrEmpty(Request.QueryString["Page"]))
            //{
            //    currentPage = Convert.ToInt32(Request.QueryString["Page"]);
            //}
            //pageCount = (ProductClass_B.ProductClassRowsCount()) / pageSize;
            //if ((ProductClass_B.ProductClassRowsCount()) % pageSize != 0)
            //{
            //    pageCount += 1;
            //}
            //rptDepartenment.DataSource = ProductClass_B.SelProductClass(pageSize, currentPage);
            //rptDepartenment.DataBind();
            rptDepartenment.DataSource = ProductClass_B.Select();
            rptDepartenment.DataBind();

            DataTable dt = ProductClass_B.SelectClass();
            ddlFclass.DataTextField = "className";
            ddlFclass.DataValueField = "classid";
            ddlFclass.DataSource = dt;
            ddlFclass.DataBind();

            ListItem lt = new ListItem();
            lt.Text = "无";
            lt.Value = "0";
            lt.Selected = true;
            ddlFclass.Items.Insert(0,lt);
        }

        ProductClass_B ProductClass_B = new ProductClass_B();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["IdClass"] != null)
            {
                if (ProductClass_B.DeleteProductClass(Convert.ToInt32(Request.QueryString["IdClass"])))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('删除成功！');</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('删除失败！');</script>");
                }
            }
            Hiddentxt.Value = Request.QueryString["Update"];
            if (Hiddentxt.Value != "")
            {
                

                txtClasst.Text = ProductClass_B.SelectIDProductClass(Convert.ToInt32(Hiddentxt.Value)).Rows[0]["className"].ToString();
            }
            if (!IsPostBack)
            {
                LoadProDuct();
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (Hiddentxt.Value == "")
            {

                if (ProductClass_B.ProductClassAdd(txtClasst.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('添加成功！');</script>");
                    LoadProDuct();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('添加失败！');</script>");
                }
            }
            else
            {
                if (ProductClass_B.ProductClassUpdate(txtClasst.Text,Convert.ToInt32(Hiddentxt.Value)))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('修改成功！');</script>");
                    LoadProDuct();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('修改失败！');</script>");
                }
            }
        }

        protected void btnTele_Click(object sender, EventArgs e)
        {
            Hiddentxt.Value = "";
            txtClasst.Text = "";
        }
    }
}