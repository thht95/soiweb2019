﻿<%@ Page Title="Bài viết" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="Articles_List.aspx.cs" Inherits="BTL_WebNC.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Danh sách bài viết</h3>
    <div class="table text-center">
        <asp:GridView ID="gv_Baiviet" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Vertical"
            DataKeyNames="PK_iBaivietID" OnRowCommand="gv_Baiviet_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="PK_iBaivietID" HeaderText="Mã Bài viết" SortExpression="PK_iBaivietID" />
                <asp:BoundField DataField="sTieude" HeaderText="Tiêu đề" SortExpression="sTieude" />
                <asp:TemplateField HeaderText="Mô tả">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("sMota") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nội dung">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("sNoidung") %>' CssClass="content" runat="server" />
                    </ItemTemplate>
                    <ControlStyle Width="400px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Duyệt">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# (bool) Eval("bDuyet")==false?"chưa duyệt":"đã duyệt" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="iLanxem" HeaderText="Số lần xem" SortExpression="iLanxem" />
                <asp:BoundField DataField="dNgaydang" HeaderText="Ngày đăng" SortExpression="dNgaydang" />
                <asp:BoundField DataField="sTenTheloai" HeaderText="Thể loại" SortExpression="sTenTheloai" />
                <asp:TemplateField HeaderText="Ảnh đại diện" ControlStyle-CssClass="width-200">
                    <ItemTemplate>
                        <img src='<%# Eval("urlAnh") %>' alt="Alternate Text" class="content" />
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="Add_Edit_Articles.aspx?kind=2&tt=<%# Eval("PK_iBaivietID") %>">Sửa</a>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Duyệt bài">
                    <ItemTemplate>
                        <a href="Add_Edit_Articles.aspx?kind=3&tt=<%# Eval("PK_iBaivietID") %>">Duyệt bài</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkbtn2" runat="server" CommandArgument='<%# Eval("PK_iBaivietID") %>'
                            CommandName="Delete" OnClientClick="return confirm(&quot;Có chắc chắn muốn xoá không?&quot;);" ToolTip="Delete">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>
</asp:Content>
