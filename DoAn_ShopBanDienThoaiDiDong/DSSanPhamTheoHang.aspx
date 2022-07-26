<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DSSanPhamTheoHang.aspx.cs" Inherits="DSSanPhamTheoHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    <link href="css/Style_DSSanPhamTheoHang.css" rel="stylesheet" />
    <asp:Label ID="Label3" runat="server" Text="Danh sách sản phẩm theo hãng" Font-Size="Larger" Font-Bold="true" ForeColor="red"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" CellSpacing="6">
        <ItemTemplate>
            <a href="ChiTietSanPham.aspx?ID=<%# Eval("MAHANG") %>">
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HINH") %>' Width="225px" Height="225px"/><br />
            <div class="info">
                    
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TENHANG") %>' CssClass="tenSP"></asp:Label>
                    <br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("GIASP") %>' CssClass="giaSP"></asp:Label><br />
            </div>
            </a>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

