<%@ Page Title="" Language="C#" MasterPageFile="~/后台页面/后台母版页.Master" AutoEventWireup="true" CodeBehind="订单列表.aspx.cs" Inherits="新鲜生活UI.后台页面.订单列表" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="../scipts/jquery-1.11.0.min.js"></script>
    <script src="../bootstrap/js/tools.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        #menuNav li {
            list-style: none;
        }

        #menuNav > li > ul > li {
            padding: 5px 0px 5px 10px;
        }

        #menuNav .glyphicon {
            margin-right: 5px;
        }

        #header {
            height: 70px;
            color: white;
            background-image: url(images/bg.jpg);
        }

            #header #face {
                height: 50px;
                width: 50px;
                border-radius: 25px;
                display: inline;
            }

        #content_left {
            float: left;
            min-width: 150px;
            width: 2%;
        }

        #content_right {
            float: right;
            width: 88%;
            min-height: 500px;
        }

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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content_right">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">订单信息</a></li>
            <li class="active">订单信息查看</li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                订单信息查看
            </div>
            <div class="panel-body ">

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

                        <asp:Repeater runat="server" ID="shopping" >
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
                                        <%#Eval("IsPay").ToString()=="0"?"未支付":"已支付" %>
                                    </td>
                                    <td><div <%#Eval("IsPay").ToString()=="0"?"class='dis'":"" %>>
                                        <a href='订单列表.aspx?upID=<%#Eval("OrderID") %>' <%#Eval("IsDeliver").ToString()=="0"? "class='btn btn-success glyphicon glyphicon-pencil'":" " %>>
                                         <%#Eval("IsDeliver").ToString()=="0"? "发货":"已发货" %>   </a>
                                    </div>

                                    </td>
                                    <td>
                                       <%-- <a <%#Eval("IsDeliver").ToString()=="0"?"class='dis'":"" %>>
                                            <div <%#Eval("IsReceive").ToString()=="0"? "class=''":"已收货" %>>未收货</div>
                                        </a>--%>
                                         <div <%#Eval("IsDeliver").ToString()=="0"?"class='dis'":"" %>>
                                    <a ><%#Eval("IsReceive").ToString()=="0"? "未收货":"已收货" %>   </a>
                                </div></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</asp:Content>
