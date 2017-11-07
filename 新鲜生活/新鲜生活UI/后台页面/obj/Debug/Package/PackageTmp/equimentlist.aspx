<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="equimentlist.aspx.cs" Inherits="WebApplication1.equimentlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="scipts/jquery-1.11.0.min.js"></script>
    <script src="bootstrap/js/tools.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
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
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content_right">
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">设备信息</a></li>
            <li class="active">设备信息查看</li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                设备信息查看
            </div>
            <div class="panel-body ">
                <div>
                    <a href="equimentadd.aspx" class="btn btn-default">添加设备</a>
                   
                    <asp:TextBox ID="txttype" runat="server" class="input-sm"></asp:TextBox>
                    <asp:Button ID="ButSelect" runat="server" Text="搜索" class="btn btn-default glyphicon glyphicon-zoom-out" />

                </div>
                <table class="table">
                    <tr>
                        <th>设备编号</th>
                        <th>设备名称</th>
                        <th>设备类型</th>
                        <th>厂家</th>
                        <th>购买时间</th>
                        <th>设备状态</th>
                        <th>图片</th>
                        <th>操作</th>
                    </tr>
                    <asp:Repeater ID="rptequmenList" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("id") %></td>
                                <td><%# Eval("equipmentName") %></td>
                                <td><%# Eval("typeName") %></td>
                                <td><%# Eval("factory") %></td>
                                <td><%# Eval("buyDate") %></td>
                                <td><%# Eval("stateName") %></td>
                                <td><img src=" /UploadPic/<%# Eval("pictureUrl") %>" style="width:30px;height:30px;" /></td>

                                <td>
                                    <a href="equimentadd.aspx?equipmentId=<%# Eval("id") %>" class="btn btn-success glyphicon glyphicon-pencil">修改</a>
                                    <a href="equimentlist.aspx?id=<%# Eval("id") %>"" class="btn btn-danger glyphicon glyphicon-trash">删除</a>
                                    <a href="EquipmentLend.aspx?ChanPinid=<%# Eval("id") %>" class="btn btn-info glyphicon glyphicon-cloud-download" <%# Eval("stateName").ToString() == "借出" ? "style='display:none'":""%> >借出</a>
                                    <a href="EquipmentLend.aspx" class="btn btn-warning glyphicon glyphicon-cloud-upload">还入</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>


                </table>
            </div>
        </div>
    </div>


</asp:Content>
