<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page.master" AutoEventWireup="true" CodeFile="QL_DATHANG.aspx.cs" Inherits="QL_DATHANG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100px;height:100px;float:left"></div>
    <div style="float:left; text-align: right;" class="auto-style3">

        <asp:Label ID="LabelTenTK" runat="server"></asp:Label>
       
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Đăng xuất</asp:LinkButton>

        <br />

        <asp:Label ID="Label1" runat="server" Text="Chọn dạng hóa đơn " CssClass="auto-style2"></asp:Label>

        <asp:DropDownList ID="DropDownListLoc" runat="server" >
            <asp:ListItem Value="No Total Money">Not Total Money</asp:ListItem>
            <asp:ListItem>Total Money</asp:ListItem>
            <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/image_icon/xmag_search_find_export_locate_5984.png" OnClick="ImageButton1_Click" Width="20px" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowDeleting="GridView1_RowDeleting" ShowHeaderWhenEmpty="True" CssClass="auto-style1" Width="955px" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating ="GridView1_RowUpdating" ShowFooter="true" DataKeyNames="MAHD"  AllowPaging="true" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" >
        <Columns>
            <asp:TemplateField HeaderText="Tên Khách Hàng">
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownListTENKH" runat="server" DataSourceID="TENKHACHHANG" DataTextField="TENKH" DataValueField="TENKH">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="TENKHACHHANG" runat="server" ConnectionString="<%$ ConnectionStrings:QL_DTDDConnectionString %>" SelectCommand="SELECT [TENKH] FROM [KHACHHANG]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceTenKH" runat="server" ConnectionString="<%$ ConnectionStrings:QL_DTDDConnectionString %>" SelectCommand="SELECT [TENKH] FROM [KHACHHANG]"></asp:SqlDataSource>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTENKH" runat="server" Text='<%# Eval("TENKH") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListTENKHEdit" runat="server" DataSourceID="TENKH_Source" DataTextField="TENKH" DataValueField="TENKH"></asp:DropDownList>
                    <asp:SqlDataSource ID="TENKH_Source" runat="server" ConnectionString="<%$ ConnectionStrings:QL_DTDDConnectionString %>" SelectCommand="SELECT [TENKH] FROM [KHACHHANG]"></asp:SqlDataSource>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên Nhân Viên">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListTNVEdit" runat="server" DataSourceID="SqlDataSourceTNVEdit" DataTextField="HOTEN" DataValueField="HOTEN">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceTNVEdit" runat="server" ConnectionString="<%$ ConnectionStrings:QL_DTDDConnectionString %>" SelectCommand="SELECT [HOTEN] FROM [NHANVIEN]"></asp:SqlDataSource>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownListTNV" runat="server" DataSourceID="SqlDataSourceTENNV" DataTextField="HOTEN" DataValueField="HOTEN">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceTENNV" runat="server" ConnectionString="<%$ ConnectionStrings:QL_DTDDConnectionString %>" SelectCommand="SELECT [HOTEN] FROM [NHANVIEN]"></asp:SqlDataSource>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTNV" runat="server" Text='<%# Eval("HOTEN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngày Xuất HD">
                 <FooterTemplate>
                     <asp:TextBox ID="TextBoxNXHD" runat="server" Enabled="False"></asp:TextBox>
                 </FooterTemplate>
                 <ItemTemplate>
                    <asp:Label ID="LabelNXHD" runat="server" Text='<%# Eval("NGAYXUATHD") %>'></asp:Label>
                </ItemTemplate>
                 <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNXHDEdit" runat="server" Text='<%# Eval("NGAYXUATHD") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nơi giao">
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxNG" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelNG" runat="server" Text='<%# Eval("NOIGIAO") %>'></asp:Label>
                </ItemTemplate>
                 <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNGEdit" runat="server" Text='<%# Eval("NOIGIAO") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tổng tiền ">
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxTT" runat="server" Enabled="False">0</asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelTT" runat="server" Text='<%# Eval("TONGTIEN") %>'></asp:Label>
                </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBoxTTEdit" runat="server" Text='<%# Eval("TONGTIEN") %>' Enabled ="false"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Xử lý">
                <FooterTemplate>
                    <asp:ImageButton ID="ImageButton6" runat="server" Height="20px" ImageUrl="~/image_icon/plus.png" ToolTip="Add" Width="20px" CommandName="AddNew" />
                </FooterTemplate>
                <ItemTemplate>
                     <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image_icon/pencil.png" Height="20" Width="20"  CommandName="Edit" ToolTip ="Edit"/>
                 
                   
                     </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server"  ImageUrl="~/image_icon/savedisk_floppydisk_guardar_1543.png" Height="20px" Width="20px" CommandName="Update" ToolTip ="Update"/>
                     <asp:ImageButton ID="ImageButton5" runat="server"  ImageUrl="~/image_icon/file_10_icon-icons.com_68948.png" Height="20px" Width="20px" CommandName="Cancel" ToolTip ="Cancel"/>
                </EditItemTemplate>
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
    </asp:GridView></div>

        
 
    
           
</asp:Content>
