<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUCparentClass.ascx.cs" Inherits="新鲜生活UI.前台页面.WUCparentClass" %>

<asp:Repeater ID="rptZiclass" runat="server">
    <ItemTemplate>
        <a href="#"><%# Eval("className") %></a>
    </ItemTemplate>
</asp:Repeater>
