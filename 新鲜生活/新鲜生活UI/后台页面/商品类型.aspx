<%@ Page Title="" Language="C#" MasterPageFile="~/后台页面/后台母版页.Master" AutoEventWireup="true" CodeBehind="商品类型.aspx.cs" Inherits="新鲜生活UI.后台页面.商品类型" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


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

        #ullop li {
            list-style: none;
            width: 60px;
            float: left;
        }

        .childClass {
            display: none;
            color:red;
            font-size:12px;
        }
    </style>
    <script>
        $(function () {
            $(".swichParent").click(
                function () {
                    var orderid = $(this).parents("tr.parentClass").data("orederid");
                    $(this).parents("tr.parentClass").siblings("tr.childClass[data-orederid=" + orderid + "]").toggle();
                    if ($(this).hasClass("glyphicon-chevron-down")) {
                        $(this).removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
                    }
                    else {
                        $(this).removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
                    }
                });

            $("#ddlFclass option:not(:contains(>>))")
            .attr("disabled", "disabled").css("color","red");

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content_right">
        <ol class="breadcrumb">

            <li><a href="#">基础数据维护</a></li>
            <li class="active"><a href="#">商品类型维护</a></li>
        </ol>
        <div class="panel panel-default">

            <div class="panel-heading">
                商品类型列表
            </div>
            <div class="panel-body">
                <table class="table">
                    <tr>
                        <th>类型编号</th>
                        <th>类型名称</th>
                        <th>操作</th>
                    </tr>
                    <asp:Repeater ID="rptDepartenment" runat="server">
                        <ItemTemplate>
                            <tr data-orederid="<%#Eval("orderID")%>" class="<%# (Eval("parentClassID").ToString()=="0"? "parentClass":"childClass") %>">
                                <td>
                                    <%# Eval("classID") %></td>
                                <td>
                                    <span class="<%#Eval("parentClassID").ToString()=="0"?"swichParent glyphicon glyphicon-chevron-down":"" %>"></span>
                                    <%# Eval("className") %></td>
                                <td>
                                    <a href="商品类型.aspx?Update=<%#Eval("classID")%>" class="btn btn-success glyphicon glyphicon-pencil">修改</a>
                                    <a href="商品类型.aspx?IdClass=<%# Eval("classID") %>" class="btn btn-danger glyphicon glyphicon-trash">删除</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                商品类型添加
            </div>
            <div class="panel-body ">
                <div class="form-group">
                    <label for="" class="control-label col-sm-2">商品类型父类</label>
                    <div class="col-sm-10">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:DropDownList ID="ddlFclass" runat="server" ClientIDMode="Static" class="form-control">
                        </asp:DropDownList>
                        <span id="span1"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="control-label col-sm-2">商品类型名称</label>
                    <div class="col-sm-10">
                        <asp:HiddenField ID="Hiddentxt" runat="server" />
                        <asp:TextBox ID="txtClasst" runat="server" ClientIDMode="Static" class="form-control" placeholder="商品类型名称" onblur="checktxtClass()"></asp:TextBox>
                        <span id="span_Class"></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-10">
                        <asp:Button ID="btn" runat="server" Text="提交" class="btn btn-primary " OnClick="btn_Click" />
                        <asp:Button ID="btnTele" runat="server" Text="重置" class="btn btn-primary " OnClick="btnTele_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
