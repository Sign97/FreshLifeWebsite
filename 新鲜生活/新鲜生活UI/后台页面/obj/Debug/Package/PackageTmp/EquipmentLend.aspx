<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EquipmentLend.aspx.cs" Inherits="WebApplication1.EquipmentLend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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

        function checktxtLendTime() {
            var txtname = document.getElementById("txtLendTime").value;
            var span = document.getElementById("span_LendTime");
            span.innerHTML = "";
            if (!txtname) {
                span.innerHTML = "借用时间不能为空！";
                return false;
            }
            return true;
        }

        function checktxttxtday() {
            var txtname = document.getElementById("txtday").value;
            var span = document.getElementById("span_day");
            span.innerHTML = "";
            if (!txtname) {
                span.innerHTML = "天数不能为空！";
                return false;
            }
            return true;
        }
        function checktxtturntime() {
            var txtname = document.getElementById("txtturntime").value;
            var span = document.getElementById("span_TurnTime");
            span.innerHTML = "";
            if (!txtname) {
                span.innerHTML = "归还时间不能为空！";
                return false;
            }
            return true;
        }
        function check()
        {
            if (checktxtturntime() && checktxttxtday() && checktxtLendTime() && checktxtName())
            {
                return true;
            }
            return false;
        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content_right">

        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">设备借还</a></li>
            <li class="active">借备登记</li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                借备登记
            </div>
            <div class="panel-body ">
                <div class="form-group">
                    <label for="ddlEquipmentType" class="control-label col-sm-1">设备类型</label>
                    <div class="col-sm-11">
                        <asp:DropDownList ID="DropLeixing" runat="server" class="form-control" OnSelectedIndexChanged="DropLeixing_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>

                </div>
                <div class="form-group">
                    <label for="ddlEquipmentid" class="control-label col-sm-1">设备名称</label>
                    <div class="col-sm-11">
                        <asp:DropDownList ID="DropName" runat="server" class="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ddlEquipmentid"  class="control-label col-sm-1">借用人</label>
                    <div class="col-sm-11">
                        <asp:TextBox ID="txtName" ClientIDMode="Static" runat="server" class="form-control" onblur="checktxtName()"></asp:TextBox>
                        <span id="span_name"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ddlLenddept" class="control-label col-sm-1">借用部门</label>
                    <div class="col-sm-11">
                        <asp:DropDownList ID="DropClass"  runat="server" class="form-control"></asp:DropDownList>
                        
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtLendtime" class="control-label col-sm-1">借用时间</label>
                    <div class="col-sm-11">
                        <asp:TextBox ID="txtLendTime" ClientIDMode="Static" runat="server" type="date" class="form-control" onblur="checktxtLendTime()"></asp:TextBox>
                        <span id="span_LendTime"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="filePictureUrl" class="control-label col-sm-1">借用天数</label>
                    <div class="col-sm-11">
                        <asp:TextBox ID="txtday" ClientIDMode="Static" runat="server" class="form-control" onblur="checktxttxtday()"  ></asp:TextBox>
                        <span id="span_day"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtReturntime" class="control-label col-sm-1">归还时间</label>
                    <div class="col-sm-11">
                        <asp:TextBox ID="txtturntime" ClientIDMode="Static" runat="server" type="date" class="form-control" onblur="checktxtturntime()"></asp:TextBox>
                        <span id="span_TurnTime"></span>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="提交" class="btn btn-primary center-block" OnClick="Button1_Click" OnClientClick="return check()"/>
                </div>
            </div>
        </div>


    </div>

</asp:Content>
