<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page.master" AutoEventWireup="true" CodeFile="Form_DCAccount_Admin.aspx.cs" Inherits="Form_DCAccount_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:300px;height:100px;float:left"></div>
    <div style="width:400px;height:130px;float:left;border:2px solid #ff6a00;border-radius:5px 5px;" >
        <table style="margin-left:30px">
            <tr>
                <td colspan="2">  <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="18pt" ForeColor="#FF3300" Text="FORM ĐIỀU CHỈNH ACCOUT"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label> </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" Width="168px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email không hợp lệ" ControlToValidate="TextBox1" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label> </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style1" Width="168px" TextMode ="Password" MaxLength="16"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Điều chỉnh" Font-Bold="True" ForeColor="#1E1E1E" OnClick="Button1_Click" /></td>
            </tr>
        </table>
       
        
    </div>
</asp:Content>

