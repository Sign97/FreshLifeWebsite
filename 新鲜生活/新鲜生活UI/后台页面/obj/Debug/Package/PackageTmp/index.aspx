<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <link href="/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="/bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="/scipts/jquery-1.11.0.min.js"></script>
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content_right">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
            </ol>
            <div class="panel panel-default">

                <div class="panel-heading">
                    首页
                </div>
                <div class="panel-body" style="background-image:url(images/wel.jpeg);color:white;height:650px;background-size:100%;">
                    <h1>欢迎进入设备管理系统！</h1>
                </div>
            </div>
        </div>

</asp:Content>
