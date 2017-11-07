<%@ Page Title="" Language="C#" MasterPageFile="~/后台页面/后台母版页.Master" AutoEventWireup="true" CodeBehind="管理员新增.aspx.cs" Inherits="新鲜生活UI.后台页面.管理员新增" %>

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
    </style>
    <script>
        function checktxtName() {
            var txtname = document.getElementById("txtName").value;
            var span = document.getElementById("span_name");
            span.innerHTML = "";
            if (!txtname) {
                span.innerHTML = "管理员名称不能为空！";
                return false;
            }
            return true;
        }

        function checktxtPrice() {
            var pricename = document.getElementById("txtPrice").value;
            var span = document.getElementById("span_Price");
            span.innerHTML = "";
            if (!pricename) {
                span.innerHTML = "管理员密码不能为空！";
                return false;
            }
            return true;
        }


        function check() {
            if (checktxtName() && checktxtPrice()) {
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
            <li><a href="#">首页</a></li>
            <li><a href="#">管理员管理</a></li>
            <li class="active">管理员新增</li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                管理员新增
            </div>
            <div class="panel-body ">
                <div class="form-group">
                    <label for="">管理员名称</label>
                    <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" class="form-control" placeholder="设备名称" onblur="checktxtName()"></asp:TextBox>
                    <span id="span_name"></span>
                </div>

                <div class="form-group">
                    <label for="">管理员密码</label>
                    <asp:TextBox ID="txtPrice" runat="server" ClientIDMode="Static" class="form-control" placeholder="设备价格" onblur="checktxtPrice()"></asp:TextBox>
                    <span id="span_Price"></span>
                </div>

                <div class="form-group">
                    <asp:Button ID="button" runat="server" Text="提交" class="btn btn-primary center-block"  OnClientClick="return check()" OnClick="button_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
