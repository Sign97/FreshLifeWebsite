<%@ Page Title="" Language="C#" MasterPageFile="~/前台页面/前台母版页.Master" AutoEventWireup="true" CodeBehind="订单详情.aspx.cs" Inherits="新鲜生活UI.前台页面.订单详情" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
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
            $(".thd").hide();
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

        .dis {
            display: none;
        }

        .redl {
            color: red;
        }

        .auto-style1 {
            height: 22px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="shelf">
        <table id="tab">
            <tbody>
                <tr style="background-color: #0be1e1">
                    <td>编号</td>
                    <td>创建时间</td>
                    <td>金额</td>
                    <td>收货地址</td>
                    <td>是否支付</td>
                    <td>是否已发货</td>
                    <td>是否已收货</td>
                </tr>

                <asp:Repeater runat="server" ID="shopping">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="productID" Text='<%#Eval("OrderID") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="Label1" Text='<%#Eval("OrderTime") %>'></asp:Label>
                            </td>
                            <td>￥<asp:Label runat="server" ID="Label2" Text='<%#Eval("OrderMoney") %>'></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="Label3" Text='<%#Eval("DeliverAddress") %>'></asp:Label>
                            </td>
                            <td>
                                <%#Eval("IsPay").ToString()=="0"?"":"已支付" %>
                                <a <%#Eval("IsPay").ToString()=="0"?"class='btn btn-success glyphicon glyphicon-pencil'  ":"class='dis'" %> href="确认支付.aspx?idT=<%#Eval("OrderID") %>">去支付</a>
                            </td>
                            <td>
                                <div <%#Eval("IsPay").ToString()=="0"?"class='dis'":"" %>>
                                    <a>
                                        <%#Eval("IsDeliver").ToString()=="0"? "未发货":"已发货" %>   </a>
                                </div>
                            </td>
                            <td>
                                <div <%#Eval("IsDeliver").ToString()=="0"?"class='dis'":"" %>>
                                    <a href='订单详情.aspx?upID=<%#Eval("OrderID") %>' <%#Eval("IsReceive").ToString()=="0"? "class='btn btn-info glyphicon glyphicon-cloud-download'":" " %>>
                                        <%#Eval("IsReceive").ToString()=="0"? "确认收货":"已收货" %>   </a>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div style="text-align: right">
            <asp:Label runat="server" ID="sumMoney"></asp:Label>
        </div>
    </div>
</asp:Content>
