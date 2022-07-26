<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    <link href="css/Style_GioHang.css" rel="stylesheet" type="text/css"/>    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#C7F1FE" BorderStyle="Double" BorderWidth="3px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField HeaderText="Mã Hàng" DataField="MAHANG" />
            <asp:BoundField DataField="TENHANG" HeaderText="Tên sản phẩm" />
            <asp:ImageField DataImageUrlField="HINH" HeaderText="Hình" ControlStyle-CssClass="hinh">
<ControlStyle CssClass="hinh"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="GIASP" HeaderText="Giá sản phẩm" />
            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
            <asp:BoundField DataField="MUCGIAMGIA" HeaderText="Mức giảm giá" />
            <asp:ButtonField ButtonType="Button" CommandName="Cancel" ShowHeader="True" Text="xóa" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="#333333"/>
        <HeaderStyle BackColor="Orange" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" ForeColor="#333333"/>
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <br />
    <asp:Label ID="label" runat="server" Text="Tổng tiền:" CssClass="tongtien"></asp:Label>
    <asp:Label ID="label1" runat="server" ></asp:Label>
    <asp:Button ID="datHang" runat="server" Text="Đặt hàng" OnClick="datHang_Click" CssClass="btnDatHang"/>
    
</asp:Content>

