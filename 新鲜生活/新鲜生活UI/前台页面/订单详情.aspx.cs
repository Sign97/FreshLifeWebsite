﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 新鲜生活BLL;
namespace 新鲜生活UI.前台页面
{
    public partial class 订单详情 : System.Web.UI.Page
    {
        Order_B Order_B = new Order_B();
        public void loading()
        {
            DataTable dt = Order_B.SelectUserID(Convert.ToInt32(Session["userID"]));
                shopping.DataSource = dt;
                shopping.DataBind();        
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loading();
                if (Request.QueryString["upID"] != "")
                {
                    FaHuo();
                    loading();
                }

            }
        }

        public void FaHuo()
        {
            if (Order_B.UpdateIsReceive(Convert.ToInt32(Request.QueryString["upID"])))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('收货成功！');</script>");
            }
        }
    }
}