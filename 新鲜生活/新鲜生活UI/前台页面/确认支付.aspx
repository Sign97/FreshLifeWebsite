<%@ Page Title="" Language="C#" MasterPageFile="~/前台页面/前台母版页.Master" AutoEventWireup="true" CodeBehind="确认支付.aspx.cs" Inherits="新鲜生活UI.前台页面.确认支付" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
            $(function () {
                $(".catenav_cont").hide();
                //鼠标移动到全部商品分类上：显示分类菜单
                $(".catenav_tit").mouseover(function () {
                    $(this).next(".catenav_cont").toggle();
                });
                //鼠标离开分类菜单：隐藏分类菜单
                $(".catenav_cont").mouseleave(function () {
                    $(this).hide();
                });
                $(".thd").hide();

            })
    </script>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="shelf">
        <h1>确认支付。。。。</h1>
        
        <asp:ImageButton ID="btnMoney" runat="server"  value="支付" OnClick="btnMoney_Click" class="btn btn-info glyphicon glyphicon-cloud-download" />
    </div>


</asp:Content>
