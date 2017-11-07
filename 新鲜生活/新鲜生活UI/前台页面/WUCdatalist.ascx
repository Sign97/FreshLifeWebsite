<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUCdatalist.ascx.cs" Inherits="新鲜生活UI.前台页面.WUCdatalist" %>
<asp:DataList ID="dlProduct" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" >
    <ItemTemplate>
        <table>
            <tr>
                <td>
                  <a href="商品详情.aspx?ProductID=<%# Eval("ProductID") %>&ProductPic=<%# Eval("productPic") %>"> <img id="bodyContent_ProductList1_dlProductList_imagePic_0" src="/UploadPic/<%# Eval("productPic") %>" style="width:170px;height:170px;"/></a> </td>
            </tr>
            <tr>
                <td style="text-align: center"><%# Eval("productName") %></td>
            </tr>
            <tr>
                <td style="text-align: center">￥<%# Eval("productPrice") %></td>
            </tr>
        </table>

    </ItemTemplate>

</asp:DataList>