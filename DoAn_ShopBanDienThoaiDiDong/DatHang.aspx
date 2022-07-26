<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DatHang.aspx.cs" Inherits="DatHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    
    <link href="css/Style_DatHang.css" rel="stylesheet" type="text/css"/>

    <div id="main">
        <div id="top">
            <a href="#">Giỏ hàng</a>
        </div>
        <div id="top-1">
            <h3>Địa chỉ nhận hàng</h3>
            <br />
            
            <asp:Label CssClass="text" ID="lbTenKH" runat="server" Text="Đặng Kim Ngân "></asp:Label>
            -
            <asp:Label CssClass="text" ID="lbSDT" runat="server" Text="0372994420"></asp:Label>
            <br />
            <asp:Label CssClass="text" ID="lbDiaChi" runat="server" Text="140 Lê Trọng Tấn , Sơn Kỳ, Tân Phú,TPHCM"></asp:Label>

            <asp:Button ID="Button1" runat="server" Text="Thay Đổi" CssClass="button" OnClick="Button1_Click" />
        </div>
        <div id="top-2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:ImageField DataImageUrlField="HINH" HeaderText="Hình" ControlStyle-CssClass="anh">
                    
                    </asp:ImageField>
                    <asp:BoundField DataField="TENHANG" HeaderText="Tên sản phẩm" />
                    <asp:BoundField DataField="GIASP" HeaderText="Giá sản phẩm" />
                    <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" />
                    <asp:BoundField DataField="MUCGIAMGIA" HeaderText="Mức giảm giá" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        
        <div id="top-5">
            <h3>Thanh toán</h3>
            <div id="can">
                
                <asp:Label ID="Label8" CssClass="title spe" runat="server" Text="Label">Thành tiền:</asp:Label>
                <asp:Label ID="lbThanhTien" CssClass="money" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="label" CssClass="p" runat="server" >đ</asp:Label>
            </div>
        </div>
        <div id="top-4">
            <asp:Button ID="btnDat" runat="server" Text="Đặt hàng" OnClick="btnDat_Click" CssClass="a"/>
        </div>
    </div>

</asp:Content>

