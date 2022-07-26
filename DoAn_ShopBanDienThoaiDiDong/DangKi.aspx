<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangKi.aspx.cs" Inherits="DangKi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        
    <link href="css/Style_DangKi.css" rel="stylesheet" type="text/css"/>
</head>
<body id="body1">
    <div id="DangKi">
    <form id="form1" runat="server">
    
    
        <table>
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label7" runat="server" Text="ĐĂNG KÝ" CssClass="tieude"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Họ tên" CssClass="label"></asp:Label>
                </td>
               <td colspan="2">
                   <asp:TextBox ID="TextBoxHoTen" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Giới tính"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="droplst">
                        <asp:ListItem>Nam</asp:ListItem>
                        <asp:ListItem>Nữ</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Ngày sinh"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="droplst"></asp:DropDownList>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="droplst"></asp:DropDownList>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="droplst"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Số điện thoại"  CssClass="label"></asp:Label>
                </td>
                <td colspan="2">
                   <asp:TextBox ID="TextBoxSDT" runat="server"  CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Địa chỉ"  CssClass="label"></asp:Label>
                </td>
               <td colspan="2">
                   <asp:TextBox ID="TextBoxDiachi" runat="server"  CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Email"  CssClass="label"></asp:Label>
                </td>
               <td>
                   <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td >
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email Invalid" ControlToValidate="TextBoxEmail" Display="Dynamic" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Mật khẩu"  CssClass="label"></asp:Label>
                </td>
               <td colspan="2">
                   <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" MaxLength="20" CssClass="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Nhập lại mật khẩu"  CssClass="label"></asp:Label>
                </td>
               <td>
                   <asp:TextBox ID="TextBoxRepass" runat="server" TextMode="Password" MaxLength="20" CssClass="textbox"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không trùng khớp" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRepass" SetFocusOnError="True" Display="Dynamic"></asp:CompareValidator></td>
            </tr>
           
        </table>
                            <asp:Button ID="ButtonDK" runat="server" OnClick="ButtonDK_Click" Text="Đăng kí" />
                
        <br />
        <br />
         </form>  
    </div>
   
 
</body>
</html>
