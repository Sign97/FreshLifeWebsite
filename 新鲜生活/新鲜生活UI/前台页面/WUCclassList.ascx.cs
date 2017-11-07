using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;

namespace 新鲜生活UI.前台页面
{
    public partial class WUCclassList : System.Web.UI.UserControl
    {
        ProductClass_B ProductClass_B = new ProductClass_B();
        public string GongID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptZii.DataSource = ProductClass_B.SelectZiClass(Convert.ToInt32(GongID));
                rptZii.DataBind();
            }
        }
    }
}