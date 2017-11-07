<%@ Page Title="" Language="C#" MasterPageFile="~/前台页面/前台母版页.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="新鲜生活UI.account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../bootstrap/js/tools.js"></script>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../Scripts/tools.js"></script>
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
    <div class="panel panel-default" style="width: 1180px; margin: 0 auto;">

        <div class="panel-heading">
            订单确认
        </div>
        <div class="panel-body ">
            <div class="form-group">
                <label for="">收货人</label>
                <asp:TextBox ID="name" runat="server" placeholder="收货人" ClientIDMode="Static" class="form-control" onblur=""></asp:TextBox>
                <span id="nameSpan"></span>
            </div>
            <div class="form-group">
                <label for="">收货地址</label>
                <asp:TextBox ID="area" runat="server" placeholder="收货地址" ClientIDMode="Static" class="form-control" onblur=""></asp:TextBox>
                <span id="typeSpan"></span>
            </div>
            <div class="form-group">
                <label for="">联系电话</label>
                <asp:TextBox ID="phone" runat="server" placeholder="联系电话" ClientIDMode="Static" class="form-control" onblur=""></asp:TextBox>
                <span id="priceSpan"></span>
            </div>

        </div>
    </div>

    <div class="shelf">
        <table id="tab">
            <tbody>
                <tr style="background-color: #0be1e1">
                    <th>编号</th>
                    <th>名称</th>
                    <th>图片</th>
                    <th>价格</th>
                    <th>小计</th>
                    <th>数量</th>
                    <th>操作</th>
                </tr>

                <asp:Repeater runat="server" ID="shopping" OnItemCommand="shopping_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="productID" Text='<%#Eval("ProductID") %>'></asp:Label>
                            </td>
                            <td><a href="ProductDetail.aspx?id=16"><%#Eval("ProductName") %></a></td>
                            <td>
                                <img width="80" height="80" src="/UploadPic/<%#Eval("ProductPic") %>" /></td>
                            <td>￥<%#Eval("ProductPrice") %></td>
                            <td>￥<%#Eval("proPrice") %></td>
                            <td>
                                <asp:Button runat="server" ID="btnReduce" Text="   -   " CommandName="Reduce" />
                                <asp:Label runat="server" ID="num" Text='<%#Eval("proNumber") %>'></asp:Label>
                                <asp:Button runat="server" ID="btnAdd" Text="   +   " CommandName="Add" />
                            </td>
                            <td><a href="account.aspx?action=remvoe&productid=<%#Eval("ProductID") %>">移除</a></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div style="text-align: right">
            总计：￥<span style='color:red;'><asp:Label runat="server" ID="sumMoney"></asp:Label></span>元
            
        </div>
        <div>
            <asp:ImageButton runat="server" ID="btnGoOrder" class="pull-right" src="../Images/cart_button2.jpg" OnClick="btnGoOrder_Click" />
        </div>
    </div>

</asp:Content>
