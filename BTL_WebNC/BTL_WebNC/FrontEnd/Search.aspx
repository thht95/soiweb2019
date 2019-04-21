<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BTL_WebNC.FrontEnd.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageBody" runat="server">
    <div class="bg-danger menubar content">
            <div id="top5News">
            <asp:Repeater ID="rptNews" runat="server">
               <ItemTemplate>
                   <a href="Content_Article.aspx?tl=<%# Eval("FK_iTheloaiID") %>&tt=<%# Eval("PK_iBaivietID") %>">
                      <h2> <%#Eval("sTieude") %></h2>
                      <p> <%#Eval("sMota") %></p> 
                     <img src="../<%#Eval("urlAnh") %>" /> 
                   </a>
               </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>
</asp:Content>
