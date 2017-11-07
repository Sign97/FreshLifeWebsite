<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="departmentMng.aspx.cs" Inherits="WebApplication1.departmentMng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="/bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="/scipts/jquery-1.11.0.min.js"></script>
    <script src="bootstrap/js/tools.js"></script>
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
    </style>
    <script>
        $(function () {
            $("#menuNav>li").click(function () {
                $(this).children("ul").removeClass("hide");
                $(this).siblings().children("ul").addClass("hide");
            });
        })
        function checktxtClass() {
            var txtId = document.getElementById("txtClasst").value;
            var span_Class = document.getElementById("span_Class");
            span_Class.innerHTML = "";
            if (!txtId) {
                span_Class.innerHTML = "填写不能为空！";
                return false;
            }
            return true;
        }
        function check() {
            if (checktxtClass()) {
                return true;

            }
            else {

                return false;
            }
        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="content_right">
        <ol class="breadcrumb">

            <li><a href="#">基础数据维护</a></li>
            <li class="active"><a href="#">公司部门维护</a></li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                公司部门列表
            </div>
            <div class="panel-body">
                <table class="table">
                    <tr>
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    <asp:Repeater ID="rptDepartenment" runat="server">
                        <ItemTemplate>
                        <tr>
                            <td><%# Eval("id") %></td>
                            <td><%# Eval("deptName") %></td>
                            <td>
                                <a href="departmentMng.aspx?banduan=update&&name=<%#Eval("deptName")%>" class="btn btn-success glyphicon glyphicon-pencil">修改</a>
                                <a href="departmentMng.aspx?banduan=delete&&IdClass=<%# Eval("id") %>" class="btn btn-danger glyphicon glyphicon-trash">删除</a>
                            </td>
                        </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                公司部门添加
            </div>
            <div class="panel-body ">
                <div class="form-group">
                    <label for="" class="control-label col-sm-2">公司部门名称</label>
                    <div class="col-sm-10">
                        <asp:HiddenField ID="Hiddentxt" runat="server" />
                        
                        <asp:TextBox ID="txtClasst" runat="server" ClientIDMode="Static" class="form-control" placeholder="公司部门名称" onblur="checktxtClass()"></asp:TextBox>
                        <span id="span_Class"></span>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Button ID="btn" runat="server" Text="提交" class="btn btn-primary " OnClick="btn_Click" OnClientClick="return check()" />
                    <asp:Button ID="btnTele" runat="server" Text="重置" class="btn btn-primary "  OnClick="btnTele_Click"/>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
