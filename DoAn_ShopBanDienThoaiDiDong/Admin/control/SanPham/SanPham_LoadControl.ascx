<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SanPham_LoadControl.ascx.cs" Inherits="Admin_control_SanPham_SanPham_LoadControl" %>

<div id="cotTrai">
    <div class="head">Quản lý:</div>
    <ul>
        <li><a href="/Admin/Admin.aspx?modul=sanpham&product=danhsachsp">Danh sách sản phẩm</a></li>
        <li><a href="/Admin/Admin.aspx?modul=sanpham&product=hangsanxuat">Quản lý hãng sản xuất</a></li>
        <li><a href="/Admin/Admin.aspx?modul=sanpham&product=giasanpham">Quản lý theo mức giá</a></li>
    </ul>
    <div class="head">Thêm mới:</div>
    <ul>
        <li><a href="/Admin/Admin.aspx?modul=sanpham&product=danhsachsp&active=themmoi">Danh sách sản phẩm</a></li>
        <li><a href="/Admin/Admin.aspx?modul=sanpham&product=hangsanxuat&active=themmoi">Quản lý hãng sản xuất</a></li>
        <li><a href="/Admin/Admin.aspx?modul=sanpham&product=giasanpham&ative=themmoi">Quản lý theo mức giá</a></li>
    </ul>
</div>
<div id="cotPhai">
    <asp:PlaceHolder ID="plSanPham" runat="server"></asp:PlaceHolder>
</div>