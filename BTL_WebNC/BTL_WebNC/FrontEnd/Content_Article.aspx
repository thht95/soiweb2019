<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Content_Article.aspx.cs" Inherits="BTL_WebNC.FrontEnd.Content_Article" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageBody" runat="server">
    <asp:Repeater runat="server" ID="rptContent">
        <ItemTemplate>
            <h4><%# Eval("sTenTheloai") %></h4>
            <h2><%# Eval("sTieude") %></h2>
            <p>Cập nhật:<%# Eval("dNgaydang","{0:MMMM d, yyyy}") %><br />
               Số lần xem: <%# Eval("iLanxem") %>
            </p>
            <div class="modal-content"><%# Eval("sNoidung") %></div>
            <p><%# Eval("sHoten") %></p>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
