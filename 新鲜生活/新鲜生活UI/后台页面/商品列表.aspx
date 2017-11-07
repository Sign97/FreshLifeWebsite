<%@ Page Title="" Language="C#" MasterPageFile="~/后台页面/后台母版页.Master" AutoEventWireup="true" CodeBehind="商品列表.aspx.cs" Inherits="新鲜生活UI.后台页面.商品列表" %>
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
            list-style:none;
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
            width: 60px;
            float: left;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div id="content_right">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">商品信息</a></li>
            <li class="active">商品信息查看</li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                商品信息查看
            </div>
            <div class="panel-body ">
                <div>
                    <a href="商品添加.aspx" class="btn btn-default">添加商品</a>
                   
                    <asp:TextBox ID="txttype" runat="server" class="input-sm"></asp:TextBox>
                    <asp:Button ID="ButSelect" runat="server" Text="搜索" class="btn btn-default glyphicon glyphicon-zoom-out" />

                </div>
                <table class="table">
                    <tr>
                        <th>编号</th>
                        <th>名称</th>
                        <th>价格</th>
                        <th>类型</th>
                        <th>上架时间</th>
                        <th>状态</th>
                        <th>图片</th>
                        <th>操作</th>
                    </tr>
                    <asp:Repeater ID="rptequmenList" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("productID") %></td>
                                <td><%# Eval("productName") %></td>
                                <td><%# Eval("productPrice") %></td>
                                <td><%# Eval("className") %></td>
                                <td><%# Eval("addTime") %></td>
                                <td><%# Eval("isStop").ToString()=="0"? "已下架":"未下架" %></td>
                                <td><img src="/UploadPic/<%# Eval("productPic") %>" style="width:30px;height:30px;" /></td>
                                <td>
                                    <a href="商品添加.aspx?equipmentId=<%# Eval("productID") %>" class="btn btn-success glyphicon glyphicon-pencil">修改</a>
                                    <a href="商品列表.aspx?id=<%# Eval("productID") %>"" class="btn btn-danger glyphicon glyphicon-trash">删除</a>
                                    <a href="商品列表.aspx?ChanPinid=<%# Eval("productID") %>" class="btn btn-info glyphicon glyphicon-cloud-download" <%# Eval("isStop").ToString() == "0" ? "style='display:none'":""%> >下架</a>
                                    <a href="商品列表.aspx?Shangjia=<%# Eval("productID") %>"" class="btn btn-warning glyphicon glyphicon-cloud-upload" <%# Eval("isStop").ToString() == "1" ? "style='display:none'":""%> >上架</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <ul id="ullop">
                <li><a href="商品列表.aspx?Page=<%=(currentPage<2 ? 1:currentPage-1 )%>">上一页</a></li>
                <% for (int i = 1; i <= pageCount; i++)
                    {%>

                <li><a href="商品列表.aspx?Page=<%=i%>"><%=i %></a></li>

                <%}%>
                <li><a href="商品列表.aspx?Page=<%=(currentPage>=pageCount ? pageCount:currentPage+1 )%>">下一页</a></li>
            </ul>
            </div>
        </div>
    </div>
</asp:Content>
