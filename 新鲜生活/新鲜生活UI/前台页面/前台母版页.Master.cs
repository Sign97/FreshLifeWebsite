﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.前台页面
{
    public partial class 前台母版页 : System.Web.UI.MasterPage
    {
        ProductClass_B ProductClass_B = new ProductClass_B();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userID"] == null)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('请先登录！');location.href='用户登录.aspx';</script>");
                }
                else
                {
                    repFclass.DataSource = ProductClass_B.SelectFClass();
                    repFclass.DataBind();
                }
            }
        }
    }
}