<%@ Page Title="" Language="C#" MasterPageFile="~/前台页面/前台母版页.Master" AutoEventWireup="true" CodeBehind="购物车.aspx.cs" Inherits="新鲜生活UI.前台页面.购物车" %>

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
    <style>
        #tab {
            width: 1180px;
            text-align: center;
            border-collapse: collapse;
        }

            #tab tr td, th {
                border: 1px solid #f7f6c7;
            }

                #tab tr td span {
                    display: inline-block;
                    width: 50px;
                    text-align: center;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="shelf">
        <table id="tab">
            <tbody><tr style="background-color:#0be1e1">
                <th>编号</th>
                <th>名称</th>
                <th>图片</th>
                <th>价格</th>
                <th>小计</th>
                <th>数量</th>
                <th>操作</th>
            </tr>
            
                <asp:Repeater runat="server" ID="shopping"  OnItemCommand="shopping_ItemCommand">
                    <ItemTemplate>
                    <tr>
                        <td><asp:Label runat="server" ID="productID" Text='<%#Eval("ProductID") %>'></asp:Label> </td>
                        <td><a href="ProductDetail.aspx?id=16"><%#Eval("ProductName") %></a></td>
                        <td><img width="80" height="80" src="/UploadPic/<%#Eval("ProductPic") %>"/>
                           
                        </td>
                        <td>￥<%#Eval("ProductPrice") %></td>
                        <td>￥<%#Eval("proPrice") %></td>    
                        <td>
                            <asp:Button runat="server" ID="btnReduce" Text="   -   " CommandName="Reduce" />
                                <asp:Label runat="server" ID="num"  Text='<%#Eval("proNumber") %>' ></asp:Label>
                               <asp:Button runat="server" ID="btnAdd" Text="   +   " CommandName="Add" />
                        </td>
                        <td><a href="购物车.aspx?action=remvoe&productid=<%#Eval("ProductID") %>">移除</a></td>
                    </tr> 
                    </ItemTemplate>
                </asp:Repeater>   
        </tbody></table>

        <div style="text-align:right">
            <asp:Label runat="server" id="sumMoney"></asp:Label>
        </div>
        <div>
            <a href="account.aspx" style="display:inline-block; height:35px;width:190px; background-image:url(../Images/cart_button2.jpg);"></a>
        </div>
    </div>
 

</asp:Content>
