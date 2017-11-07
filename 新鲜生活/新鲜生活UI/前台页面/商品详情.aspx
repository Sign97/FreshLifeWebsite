<%@ Page Title="" Language="C#" MasterPageFile="~/前台页面/前台母版页.Master" AutoEventWireup="true" CodeBehind="商品详情.aspx.cs" Inherits="新鲜生活UI.前台页面.商品详情" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <script>
             $(function () {
                 $(".to_cont_r2").hover(function () {
                     $(this).find(".my_orders_cont").show();
                 }, function () {
                     $(this).find(".my_orders_cont").hide();
                 });
             })
    </script>
    
    <style>
        #productImage {
            width:300px;
            height:300px;
            float:left;
        }

        #productImage img{
               width:300px;
            height:300px;
        }

        #productInfo {
            float:left;
            padding:20px;
        }

        #productName {
            height:40px;
            font-size:30px;
            font-weight:bold;
        }

        #productAddShoppingCart {
            margin-top:200px;
            text-align:center;
        }
        #productDesc {
            clear:both;
        }
    </style>
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
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="shelf">
        <div id="productHeader">
            <div id="productImage">
                <img id="ContentPlaceHolderBody_imgProduct" src="/UploadPic/<%=Request.QueryString["ProductPic"] %>"/>
            </div>
            <div id="productInfo">
                <div id="productName">
                  <asp:Label runat="server" ID="GoodsName"></asp:Label>
                </div>
                <div id="productPrice">
                    商品价格：
                    <asp:Label runat="server" ID="price"></asp:Label>
                </div>
                <div id="productAddShoppingCart">
                    <asp:ImageButton  runat="server"  id="btnAddToShoppingCart" src="../images/detail_2012_img10.jpg" OnClick="btnAddToShoppingCart_Click" />
                </div>
            </div>


        </div>
            
        <div id="productDesc">
            <asp:Label runat="server" ID="detail"></asp:Label>
        </div>
        <div>
            简介：<br/><asp:Label ID="Jianjie" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
