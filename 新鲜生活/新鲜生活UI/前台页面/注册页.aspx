<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="注册页.aspx.cs" Inherits="新鲜生活UI.前台页面.注册页" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新鲜生活</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script src="../Scripts/util.js"></script>
    <link href="../Content/common.css" rel="stylesheet" />
    <link href="../Content/switch_js.css" rel="stylesheet" />
    <link href="../Content/Cart.css" rel="stylesheet" />

    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="../scipts/jquery-1.11.0.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../bootstrap/js/tools.js"></script>
    <script>
        function checkUserName() {
            var UserName = document.getElementById("txtUserName").value;
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


        function check() {
            if (checkUserName() && checkPwd() && checktxtyzm()) {
                return true;
            }
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div>

            <div class="login_body">
                <div class="login_tit">
                    <div class="login_logo" style="float: left;">
                        <a href="/default.aspx">
                            <img src="../Images/logo.jpg" /></a>
                    </div>
                    <div id="loginstr"></div>
                </div>

                <div class="slider-box">
                    <div class="login_cont_tit">
                        <div class="login_tit_cont">
                            <span>会员注册</span>
                        </div>
                    </div>
                    <div class="login_cont_c">
                        <div class="login_c_l">


                            <table width="635" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="150" height="60" align="right" valign="middle">用户名 ：</td>
                                    <td width="360" valign="middle">
                                        <asp:TextBox ID="UserName" runat="server" class="login_input_css01 black_xl"></asp:TextBox>

                                    </td>
                                    <td width="125">&nbsp;</td>
                                </tr>

                                <tr id="err_logemail" style="display: none;">
                                    <td align="right">&nbsp;</td>
                                    <td class="font_red1" id="err_logemail_txt"></td>
                                </tr>
                                <tr>
                                    <td height="60" align="right" valign="middle">密             码：</td>
                                    <td valign="middle">

                                        <asp:TextBox ID="Pwd" runat="server" class="login_input_css01 black_xl" TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td valign="middle">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="middle" style="height: 60px">确认密码：</td>
                                    <td valign="middle" style="height: 60px">

                                        <asp:TextBox ID="PwdRe" runat="server" class="login_input_css01 black_xl" TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td valign="middle" style="height: 60px">
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="60" align="right" valign="middle">手机号：</td>
                                    <td valign="middle">

                                        <asp:TextBox ID="Phone" runat="server" class="login_input_css01 black_xl"></asp:TextBox>
                                    </td>
                                    <td valign="middle">
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="74">&nbsp;</td>
                                    <td valign="middle">

                                        <asp:ImageButton ID="bodyContent_btnLogin" runat="server" onmouseover="(this.src=&#39;../Images/botton_06.jpg&#39;)" onmouseout="(this.src=&#39;../Images/botton_05.jpg&#39;)" src="../Images/botton_05.jpg" OnClick="bodyContent_btnLogin_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="50">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="2" height="100"></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

                        </div>
                        <div class="login_c_r">
                            <p>您已成为“新鲜生活”会员，请登录</p>
                            <p class="link_login"><a id="show_login_box" href="用户登录.aspx">登陆</a></p>



                        </div>
                    </div>
                </div>


                <div class="login_bottom">
                    <div class="login_bottom_l">
                        <img src="../Images/login_bottom_l.jpg" />
                    </div>
                    <div class="login_bottom_r">
                        <img src="../Images/login_bottom_r.jpg" />
                    </div>
                </div>
                <div class="too_floor">
                    <div class="too-floor_tel"></div>
                    <div class="too-floor_about">
                        <a target="_blank" href="#">关于我们</a>&#12288;|&#12288;
            <a target="_blank" href="#">服务条款</a>&#12288;|&#12288;
            <a target="_blank" href="#">友情链接</a>&#12288;|&#12288;
            <a target="_blank" href="#">帮助中心</a>&#12288;|&#12288;
           
            <a target="_blank" href="/default.aspx">新鲜生活网</a>&#12288;|&#12288;
                    </div>
                    <div class="too-floor_copy">Copyright &copy; 2009-2012 新鲜生活 版权所有 鄂ICP证110405号 鄂ICP备19153411号</div>
                </div>
            </div>
            <div id="ThirdAuth"></div>
        </div>
    </form>
</body>


</html>
