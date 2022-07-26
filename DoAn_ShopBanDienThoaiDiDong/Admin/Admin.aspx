<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<%@ Register Src="~/Admin/control/Admin_LoadControl.ascx" TagPrefix="uc1" TagName="Admin_LoadControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang quản trị website</title>
    <link href="css/Style_Admin.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="header">
            <div class="logo">
                <img src="/image_icon/logo.png"/>
            </div>
            <div class="account">
                <p>Xin chào: Admin</p>
            </div>
        </div>

        <div id="menuChinh">
            <ul>
                <li><a href="/Admin/Admin.aspx" title="Trang chủ">Trang chủ</a></li>
                <li><a href="/Admin/Admin.aspx?modul=sanpham" title="Sản phẩm">Sản phẩm</a></li>
                <li><a href="/Admin/Admin.aspx?modul=banhang" title="Bán hàng">Bán hàng</a></li>
                <li><a href="/Admin/Admin.aspx?modul=quangcao" title="Quảng cáo">Quảng cáo</a></li>
                <li><a href="/Admin/Admin.aspx?modul=taikhoan" title="Tài khoản">Tài khoản</a></li>
                <li><a href="/Admin/Admin.aspx?modul=lienhe" title="Liên hệ">Liên hệ</a></li>
            </ul>
        </div>

        <%-- Phần nội dung chính --%>

        <uc1:Admin_LoadControl runat="server" ID="Admin_LoadControl" />

    </div>
    </form>
</body>
</html>
