<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="css/Style_DangKi.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .auto-style2 {
            text-align: left;
            width: 108px;
        }
        .auto-style3 {
            width: 79px;
        }
        .auto-style4 {
            height: 40px;
        }
        .auto-style5 {
            height: 40px;
            width: 79px;
        }
    </style>
</head>
<body id ="body1">
       <div id ="DangNhap">
         <form id="form1" runat="server">
 
        <table id="tblDN"> 
            <tr><td colspan="2" class="auto-style2">
                <img alt="" src="image_icon/femaleuser_user_female_4515.png" style="height:20px;width20px;"/><asp:Label ID="Label3" runat="server" Text="Đăng nhập"></asp:Label></td></tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
                </td>
              
                  <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="187px" Height="30px" placehorder="Tên tài khoản"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                 <td colspan="1" style="text-align:center" class="auto-style4">
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email không hợp lệ" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                
              </tr>   
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPass" runat="server" MaxLength="20" TextMode="Password"  Width="188px" Height="30px" placehorder="Mật khẩu" ></asp:TextBox></td>
            </tr>
              
        </table>
                                 <asp:Button ID="ButtonDangNhap" runat="server" OnClick="Button2_Click" Text="Đăng nhập" />
                                         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Đăng ký" />
                 
                 
            </form>
    </div>


   
</body>
</html>
