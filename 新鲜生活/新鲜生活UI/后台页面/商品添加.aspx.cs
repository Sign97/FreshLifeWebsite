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
    public partial class 商品添加 : System.Web.UI.Page
    {
        ProductClass_B ProductClass_B = new ProductClass_B();

        public void LoadRepter()
        {
            DataTable dt = ProductClass_B.SelectClass();
            DropLei.DataTextField = "className";
            DropLei.DataValueField = "orderId";
            DropLei.DataSource = dt;
            DropLei.DataBind();

            ListItem lt = new ListItem();
            lt.Text = "无";
            lt.Value = "0";
            lt.Selected = true;
            DropLei.Items.Insert(0, lt);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["equipmentId"] == null)
                {
                    LoadRepter();
                }
                else
                {
                    DataTable dt = ProductClass_B.SelectProductID(Convert.ToInt32((Request.QueryString["equipmentId"])));
                    txtPrice.Text = dt.Rows[0]["productName"].ToString();
                    txtfactory.Text = dt.Rows[0]["productPrice"].ToString();
                    DropLei.SelectedIndex =Convert.ToInt32( dt.Rows[0]["classid"].ToString());
                    LoadRepter();
                    DropFro.SelectedIndex = Convert.ToInt32(dt.Rows[0]["isStop"].ToString());
                    txtDesc.Text = dt.Rows[0]["productDesc"].ToString();
                    txtClick.Text = Convert.ToDateTime(dt.Rows[0]["addTime"].ToString()).ToString("yyyy-MM-dd");
                    photo.ImageUrl = "~/UploadPic/" + dt.Rows[0]["productPic"].ToString();
                    hideFile.Value = dt.Rows[0]["productPic"].ToString();
                }

            }


        }

        protected void BtnSumit_Click(object sender, EventArgs e)
        {
            if (FilePhoto.HasFile)
            {
                string fileName = FilePhoto.FileName;
                string fileFix = fileName.Substring(fileName.LastIndexOf('.') + 1).ToLower();
                if (fileFix != "png" && fileFix != "jpg" && fileFix != "jpeg" && fileFix != "gif")
                {
                    iagepic.Text = "上传的文件不是图片类型格式！";
                }
                else
                {
                    FilePhoto.SaveAs(Server.MapPath("~/UploadPic/") + fileName);
                    hideFile.Value = fileName;
                    this.photo.ImageUrl = "~/UploadPic/" + fileName;
                    iagepic.Text = "图片上传成功！！";
                }
            }
        }

        protected void button_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["equipmentId"] == null)
            {
                if (ProductClass_B.Add(txtPrice.Text, hideFile.Value, Convert.ToSingle(txtfactory.Text), txtDesc.Text, Convert.ToInt32(DropLei.SelectedValue), Convert.ToDateTime(txtClick.Text), Convert.ToInt32(DropFro.SelectedValue)))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('添加成功！');</script>");
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('添加失败！');</script>");
                }
            }
            else
            {
                if (ProductClass_B.Update(txtPrice.Text,hideFile.Value, Convert.ToSingle(txtfactory.Text), txtDesc.Text, Convert.ToInt32(DropLei.SelectedValue), Convert.ToDateTime(txtClick.Text), Convert.ToInt32(DropFro.SelectedValue), Convert.ToInt32(Request.QueryString["equipmentId"])))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('修改成功！');</script>");
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>showMsg('修改失败！');</script>");
                }


            }


        }
    }
}