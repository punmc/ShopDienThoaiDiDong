<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DiaChiNhanHang.aspx.cs" Inherits="DiaChiNhanHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    <link href="css/Style_DiaChiNhan.css" rel="stylesheet" type="text/css"/>


    <div id="main">
        <span><strong>Chọn địa chỉ giao hàng</strong></span>

        <div id="top">
            <h3>Địa chỉ giao hàng hiện tại</h3>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Đặng Kim Ngân "></asp:Label>
            -<asp:Label ID="Label2" runat="server" Text="0372884420"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="140 Lê Trọng Tấn Phường Tây Thạnh Quận Tân Phú TPHCM"></asp:Label>
            
            <asp:Button ID="btnGiu" runat="server" Text="Giữ" CssClass="btnXoa btn" OnClick="btnGiu_Click"/>
            <asp:Button ID="Button2" runat="server" Text="Sửa" CssClass="btnSua btn" OnClick="Button2_Click"/>
            
        </div>
        <div id="top-1"> 
            </div>
        <div id="cont">
            <strong>Nhập địa chỉ nhận hàng khác<br />
            <br />
            </strong>
            <span>Tên người nhận</span>
            <br />
            <br />
            <asp:TextBox ID="txtTenNgNhan" runat="server" CssClass="textbox" Enabled="false"></asp:TextBox>
            <span>
            <br />
            <br />
            Số điện thoại<br />
            </span>&nbsp;<br />
            <asp:TextBox ID="txtSDT" runat="server" CssClass="textbox"  Enabled="false"></asp:TextBox>
          
            <span>
            <br />
            <br />
            Địa chỉ nhận hàng 
            <br />
            </span>
            <br />
            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="textbox"  Enabled="false"></asp:TextBox>
            <br />
            
            <asp:Button ID="btnDCGiao" runat="server" Enabled="false" CssClass="btnDCGiao btn" Text="Giao đến địa chỉ này" OnClick="btnDCGiao_Click"/>
             </div>
    </div>
</asp:Content>

