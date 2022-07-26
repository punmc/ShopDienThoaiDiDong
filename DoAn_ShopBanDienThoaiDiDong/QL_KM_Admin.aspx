<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page.master" AutoEventWireup="true" CodeFile="QL_KM_Admin.aspx.cs" Inherits="QL_KM_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            font-weight: 700;
            color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Quangcao" style="height:100px;width:175px; float:left;"></div>
    <div style="float:left" class="auto-style2"> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Chọn khuyến mãi" CssClass="auto-style3"></asp:Label>
        <asp:DropDownList ID="DropDownListLoc" runat="server">
            <asp:ListItem>Còn Hạn</asp:ListItem>
            <asp:ListItem>Hết Hạn</asp:ListItem>
            <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
        <asp:ImageButton ID="ImageButton6" runat="server" Height="25px" ImageUrl="~/image_icon/xmag_search_find_export_locate_5984.png" OnClick="ImageButton6_Click" Width="25px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelTenTK" runat="server"></asp:Label> 
        &nbsp;| 
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Đăng xuất</asp:LinkButton>
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowDeleting="GridView1_RowDeleting" ShowFooter="true" ShowHeaderWhenEmpty="true" CssClass="auto-style1" Width="800px" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating ="GridView1_RowUpdating" DataKeyNames="MADOTKM" >
            <Columns>
                <asp:TemplateField HeaderText="Tên Hàng">
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownListTENHANG" runat="server" DataSourceID="SqlDataSourceTHFt" DataTextField="TENHANG" DataValueField="TENHANG">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceTHFt" runat="server" ConnectionString="<%$ ConnectionStrings:QL_DTDDConnectionString %>" SelectCommand="SELECT [TENHANG] FROM [SANPHAM]"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelMaHang" runat="server" Text='<%# Eval("TENHANG") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListTENHANGEdit" runat="server" DataSourceID="SqlDataSourceTH" DataTextField="TENHANG" DataValueField="TENHANG">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceTH" runat="server" ConnectionString="<%$ ConnectionStrings:QL_DTDDConnectionString %>" SelectCommand="SELECT [TENHANG] FROM [SANPHAM]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày bắt đầu ">
                    <ItemTemplate>
                        <asp:Label ID="LabelNBD" runat="server" Text='<%# Eval("NGAYBD") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxNBDEdit" runat="server" Text='<%# Eval("NGAYBD") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxNBD" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày kết thúc">
                    <ItemTemplate>
                        <asp:Label ID="LabelNKT" runat="server" Text='<%# Eval("NGAYKT") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxNKTEdit" runat="server" Text='<%# Eval("NGAYKT") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxNKT" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tỷ lệ giảm giá (%)">
                    <ItemTemplate>
                        <asp:Label ID="LabelTLGG" runat="server" Text='<%# Eval("TILEGIAMGIA") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxTLGGEdit" runat="server" Text='<%# Eval("TILEGIAMGIA") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxTLGG" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xử lý">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image_icon/pencil.png" Height="20" Width="20"  CommandName="Edit" ToolTip ="Edit"/>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image_icon/recycle-bin.png" Width="20" Height="20" CommandName ="Delete" ToolTip="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton4" runat="server"  ImageUrl="~/image_icon/savedisk_floppydisk_guardar_1543.png" Height="20px" Width="20px" CommandName="Update" ToolTip ="Update"/>
                        <asp:ImageButton ID="ImageButton5" runat="server"  ImageUrl="~/image_icon/file_10_icon-icons.com_68948.png" Height="20px" Width="20px" CommandName="Cancel" ToolTip ="Cancel"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl ="~/image_icon/plus.png" Width="20px" Height =" 20px" CommandName ="AddNew"/>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </div>
   
</asp:Content>

