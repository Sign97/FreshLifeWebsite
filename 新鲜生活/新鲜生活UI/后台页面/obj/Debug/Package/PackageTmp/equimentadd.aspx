<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="equimentadd.aspx.cs" Inherits="WebApplication1.equimentadd" %>

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
        function checktxtName() {
            var txtname = document.getElementById("txtName").value;
            var span = document.getElementById("span_name");
            span.innerHTML = "";
            if (!txtname) {
                span.innerHTML = "设备名称不能为空！";
                return false;
            }
            return true;
        }

        function checktxtPrice() {
            var pricename = document.getElementById("txtPrice").value;
            var span = document.getElementById("span_Price");
            span.innerHTML = "";
            if (!pricename) {
                span.innerHTML = "设备价格不能为空！";
                return false;
            }
            return true;
        }
        function checktxtfactory() {
            var factoryname = document.getElementById("txtfactory").value;
            var span = document.getElementById("span_factory");
            span.innerHTML = "";
            if (!factoryname) {
                span.innerHTML = "设备厂商不能为空！";
                return false;
            }
            return true;
        }

        function check() {
            if (checktxtName() && checktxtPrice() && checktxtfactory()) {
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
            <li><a href="#">设备信息</a></li>
            <li class="active">设备登记</li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                设备登记
            </div>
            <div class="panel-body ">
                <div class="form-group">
                    <label for="">设备名称</label>
                    <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" class="form-control" placeholder="设备名称" onblur="checktxtName()"></asp:TextBox>
                    <span id="span_name"></span>
                </div>

                <div class="form-group">
                    <label for="">设备价格</label>
                    <asp:TextBox ID="txtPrice" runat="server" ClientIDMode="Static" class="form-control" placeholder="设备价格" onblur="checktxtPrice()"></asp:TextBox>
                    <span id="span_Price"></span>
                </div>
                <div class="form-group">
                    <label for="">设备类型</label>
                    <asp:DropDownList ID="DropLei" runat="server" class="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="">设备厂商</label>
                    <asp:TextBox ID="txtfactory" runat="server" ClientIDMode="Static" class="form-control" placeholder="设备厂商" onblur="checktxtfactory()"></asp:TextBox>
                    <span id="span_factory"></span>

                </div>
                <div class="form-group">
                    <label for="">设备状态</label>
                    <asp:DropDownList ID="DropZhuangTai" runat="server" class="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="">购买时间</label>
                    <asp:TextBox ID="txtTime" runat="server" type="date" class="form-control" placeholder="设备价格"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="">设备图片</label>
                    <asp:HiddenField ID="hideFile" runat="server" />
                    <asp:Image ID="photo" runat="server" Height="164px" Width="407px" />
                    <asp:Label ID="iagepic" runat="server" Text=""></asp:Label>
                    <asp:FileUpload ID="FilePhoto" runat="server" class="form-control" placeholder="设备图片" />
                </div>
                <div class="form-group ">
                    <asp:Button ID="BtnSumit" runat="server" Text="上传图片" class="btn btn-danger " OnClick="BtnSumit_Click" />
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="button" runat="server" Text="提交" class="btn btn-primary center-block" OnClick="button_Click" OnClientClick="return check()" />
               

            </div>
        </div>
    </div>




</asp:Content>
