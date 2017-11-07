using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.前台页面
{
    public partial class WUCdatalist : System.Web.UI.UserControl
    {
        ProductClass_B ProductClass_B = new ProductClass_B();
        public string ClassID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dlProduct.DataSource = ProductClass_B.SelectProductClassID(Convert.ToInt32(ClassID));
                dlProduct.DataBind();
            
            }
        }
    }
}