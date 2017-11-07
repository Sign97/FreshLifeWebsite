<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUCclassList.ascx.cs" Inherits="新鲜生活UI.前台页面.WUCclassList" %>
<asp:Repeater ID="rptZii" runat="server">
    <ItemTemplate>
        <li class="curr_category_nav"><a href="javascript:void(0)"><%# Eval("className") %></a></li>
    </ItemTemplate>
</asp:Repeater>