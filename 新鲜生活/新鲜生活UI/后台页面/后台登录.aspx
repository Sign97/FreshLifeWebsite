<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="后台登录.aspx.cs" Inherits="新鲜生活UI.后台页面.后台登录" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="../scipts/jquery-1.11.0.min.js"></script>
    <script src="../bootstrap/js/tools.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <style>
        body {
            background-image: url(/后台页面/images/bg.jpg);
        }

        #panelLogin {
            width: 500px;
            margin-top: 100px;
        }
    </style>
    <script>
        function checkUserName() {
            var UserName = document.getElementById("UserName").value;
            var span_UserName = document.getElementById("span_UserName");
            span_UserName.innerHTML = "";
            if (!UserName) {
                span_UserName.innerHTML = "输入不能为空！";
                return false;
            }
            return true;
        }
        function checkPwd() {
            var Pwd = document.getElementById("Pwd").value;
            var span_Pwd = document.getElementById("span_Pwd");
            span_Pwd.innerHTML = "";
            if (!Pwd) {
                span_Pwd.innerHTML = "密码不能为空！";
                return false;
            }
            return true;
        }

        function checktxtyzm() {
            var Pwd = document.getElementById("txtyzm").value;
            var span_Pwd = document.getElementById("span_txtyzm");
            span_Pwd.innerHTML = "";
            if (!Pwd) {
                span_Pwd.innerHTML = "验证码不能为空！";
                return false;
            }
            return true;
        }

        function check()
        {
            if (checkUserName() && checkPwd() && checktxtyzm())
            {
                return true;
            }
            return false;
        }
    </script>
</head>
<body>
   
    <form id="form1" runat="server" >
        <div>
            <div id="panelLogin" class="panel panel-default center-block">
                <div class="panel-heading">
                    <h3 class="panel-title ">后台管理中心</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:TextBox ID="UserName" runat="server" ClientIDMode="Static" placeholder="账号" class="form-control" onblur="checkUserName()"></asp:TextBox>
                        <span id="span_UserName"></span>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="Pwd" runat="server" ClientIDMode="Static" placeholder="密码" class="form-control" onblur="checkPwd()" TextMode="Password"></asp:TextBox>
                        <span id="span_Pwd"></span>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtyzm" runat="server" ClientIDMode="Static" placeholder="验证码" class="form-control" onblur="checktxtyzm()"></asp:TextBox>
                         <span id="span_txtyzm"></span>
                        <img src="/VlidationCode.aspx"/>
                    </div>
                    <div>
                        <asp:Button ID="Btn" runat="server" Text="登录" class="btn btn-primary center-block" OnClientClick="return check()" OnClick="Btn_Click"/>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
