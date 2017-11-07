using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.后台页面
{
    public partial class 商品列表 : System.Web.UI.Page
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
        
                if (!string.IsNullOrEmpty(Request.QueryString["Page"]))
                {
                    currentPage = Convert.ToInt32(Request.QueryString["Page"]);
                }

                pageCount = (ProductClass_B.SelectRowsCount()) / pageSize;
                if ((ProductClass_B.SelectRowsCount()) % pageSize != 0)
                {
                    pageCount += 1;
                }

                rptequmenList.DataSource = ProductClass_B.SelProduct(pageSize, currentPage);
                rptequmenList.DataBind();
        
        }

        ProductClass_B ProductClass_B = new ProductClass_B();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ChanPinid"] != null)
            {
                if (ProductClass_B.UpdateStop(Convert.ToInt32(Request.QueryString["ChanPinid"])))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('下架成功！');</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('下架失败！');</script>");
                }
            }

            if (Request.QueryString["Shangjia"] != null)
            {
                if (ProductClass_B.UpdateIS(Convert.ToInt32(Request.QueryString["ChanPinid"])))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('上架成功！');</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('上架失败！');</script>");
                }
            }

            if (Request.QueryString["id"] != null)
            {
                if (ProductClass_B.DeleteID(Convert.ToInt32(Request.QueryString["id"])))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('删除成功！');</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('删除失败！');</script>");
                }
            }




            if (!IsPostBack)
            {
                LoadProDuct();
            }
        }
    }
}