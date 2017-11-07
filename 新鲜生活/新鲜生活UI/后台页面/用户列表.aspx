<%@ Page Title="" Language="C#" MasterPageFile="~/后台页面/后台母版页.Master" AutoEventWireup="true" CodeBehind="用户列表.aspx.cs" Inherits="新鲜生活UI.后台页面.用户列表" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="/bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="/scipts/jquery-1.11.0.min.js"></script>
    <script src="/bootstrap/js/tools.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
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

        #ullop li {
            list-style: none;
            width: 60px;
            float: left;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content_right">
        <ol class="breadcrumb">

            <li><a href="#">用户管理</a></li>
            <li class="active"><a href="#">用户列表</a></li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                用户列表
            </div>
            <div class="panel-body">
                <table class="table">
                    <tr>
                        <th>类型编号</th>
                        <th>类型名称</th>
                        <th>操作</th>
                    </tr>
                    <asp:Repeater ID="rptDepartenment" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("classID") %></td>
                                <td><%# Eval("className") %></td>
                                <td>
                                    <a href="商品类型.aspx?Update=<%#Eval("classID")%>" class="btn btn-success glyphicon glyphicon-pencil">修改</a>
                                    <a href="商品类型.aspx?IdClass=<%# Eval("classID") %>" class="btn btn-danger glyphicon glyphicon-trash">删除</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>

            </div>
        </div>

    </div>


</asp:Content>
