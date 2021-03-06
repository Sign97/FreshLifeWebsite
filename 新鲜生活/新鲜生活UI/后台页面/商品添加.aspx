﻿<%@ Page Title="" Language="C#" MasterPageFile="~/后台页面/后台母版页.Master" AutoEventWireup="true" CodeBehind="商品添加.aspx.cs" Inherits="新鲜生活UI.后台页面.商品添加" %>

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
    </style>
    <script>
        $(function () {
            $("#DropLei option:not(:contains(>>))")
        .attr("disabled", "disabled").css("color", "red");
        });
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
                    <label for="">商品名</label>
                    <asp:TextBox ID="txtPrice" runat="server" ClientIDMode="Static" class="form-control" placeholder="商品名" onblur="checktxtPrice()"></asp:TextBox>
                    <span id="span_Price"></span>
                </div>

                <div class="form-group">
                    <label for="">商品价格</label>
                    <asp:TextBox ID="txtfactory"  runat="server" ClientIDMode="Static" class="form-control" placeholder="商品价格" onblur="checktxtfactory()"></asp:TextBox>
                    <span id="span_factory"></span>

                </div>
                <div class="form-group">
                    <label for="">商品类型</label>
                    <asp:DropDownList ID="DropLei" ClientIDMode="Static" runat="server" class="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="">是否下架</label>
                    <asp:DropDownList ID="DropFro" runat="server" class="form-control">
                        <asp:ListItem Value="0">已下架</asp:ListItem>
                        <asp:ListItem Value="1">未下架</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="">商品备注</label>
                    <asp:TextBox ID="txtDesc" runat="server" ClientIDMode="Static" class="form-control" placeholder="商品备注" onblur="checktxtfactory()" TextMode="MultiLine"></asp:TextBox>
                    <span id="span1"></span>

                </div>
            </div>
            <div class="form-group">
                <label for="">上架时间</label>
                <asp:TextBox ID="txtClick" runat="server" Type="date" ClientIDMode="Static" class="form-control" placeholder="上架时间" onblur="checktxtfactory()"></asp:TextBox>
                <span id="span2"></span>

            </div>
            <div class="form-group">
                <label for="">商品图片</label>
                <asp:HiddenField ID="hideFile" runat="server" />
                <asp:Image ID="photo" runat="server" Height="145px" Width="145px" />
                <asp:Label ID="iagepic" runat="server" Text=""></asp:Label>
                <asp:FileUpload ID="FilePhoto" runat="server" class="form-control" placeholder="商品图片" />
            </div>
            <div class="form-group ">
                <asp:Button ID="BtnSumit" runat="server" Text="上传图片" class="btn btn-danger " OnClick="BtnSumit_Click" />
            </div>
        </div>
        <div class="form-group">
            <asp:Button ID="button" runat="server" Text="提交" class="btn btn-primary center-block" OnClick="button_Click" />


        </div>
    </div>



</asp:Content>
