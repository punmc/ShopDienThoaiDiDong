<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DonHang.aspx.cs" Inherits="DonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    <link href="css/Style_DonHang.css" rel="stylesheet" />
    
    <asp:DataList ID="DataList1" runat="server" CssClass="list" OnItemDataBound="DataList1_ItemDataBound" CellPadding="3" BackColor="White" BorderColor="#779ed9" BorderStyle="None" BorderWidth="3px" GridLines="Both" CellSpacing="2">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#779ed9" Font-Bold="False" ForeColor="White" />
        <ItemStyle BackColor="#779ed9" ForeColor="black" />
        <ItemTemplate>
            <asp:Label ID="label4" runat="server" Text="Mã hàng: " CssClass="tieude"></asp:Label>
            <asp:Label ID="label1" runat="server" Text='<%# Eval("MAHD") %>' CssClass="info_hd"></asp:Label>
            <asp:Label ID="label5" runat="server" Text="Ngày xuất hóa đơn: " CssClass="tieude"></asp:Label>
            <asp:Label ID="label2" runat ="server" Text='<%# Eval("NGAYXUATHD") %>' CssClass="info_hd"></asp:Label>
            <asp:Label ID="label6" runat="server" Text="Tổng thành tiền: " CssClass="tieude_cuoi"></asp:Label>
            <asp:Label ID="label3" runat="server" Text='<%# Eval("TONGTIEN") %>' CssClass="info_hd_cuoi"></asp:Label>
            <asp:Label ID="label7" runat="server" Text='đ' CssClass="vnd"></asp:Label>
            <br />
            <asp:Label runat="server" ID="a" Height="10px" Width="1093px" BackColor="White"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" CssClass="grid" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">

                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ImageField DataImageUrlField="HINH" ControlStyle-CssClass="hinh" HeaderText="Hình">
                        <ControlStyle CssClass="hinh" />
                    </asp:ImageField>
                    <asp:BoundField DataField="TENHANG" ControlStyle-CssClass="info_ct" HeaderText="Tên sản phẩm">
                    <ControlStyle CssClass="info_ct" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GIASP"  ControlStyle-CssClass="info_ct" HeaderText="Giá gốc">
                    <ControlStyle CssClass="info_ct" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SOLUONG"  ControlStyle-CssClass="info_ct" HeaderText="Số lượng">
                    <ControlStyle CssClass="info_ct" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MUCGIAMGIA"  ControlStyle-CssClass="info_ct" HeaderText="Mức giảm giá">
                    <ControlStyle CssClass="info_ct" />
                    </asp:BoundField>
                    <asp:BoundField DataField="THANHTIEN"  ControlStyle-CssClass="info_ct" HeaderText="Thành tiền">
                    <ControlStyle CssClass="info_ct" />
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5bbdc8" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />

            </asp:GridView>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
</asp:Content>

