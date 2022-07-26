<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page.master" AutoEventWireup="true" CodeFile="QL_KHACHHANG_ADMIN.aspx.cs" Inherits="QL_KHACHHANG_ADMIN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="QuangCao" style="width:170px;height:100px;float:left"></div>
    <div><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowFooter="True" DataKeyNames="MAKH" OnRowCommand="GridView1_RowCommand" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Tên khách hàng ">
                <ItemTemplate>
                    <asp:Label ID="LabelTenKH" runat="server" Text='<%# Eval("TENKH") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTenKHEdit" runat="server" Text='<%# Eval("TENKH") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxTenKH" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngày sinh">
                <ItemTemplate>
                    <asp:Label ID="LabelNS" runat="server" Text='<%# Eval("NGAYSINH") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListNgayEdit" runat="server" DataSourceID="SqlDataSourceNgay1" DataTextField="Ngay" DataValueField="Ngay">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNgay1" runat="server" ConnectionString="<%$ ConnectionStrings:DMYConnectionString %>" SelectCommand="SELECT * FROM [Ngay]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownListThangEdit" runat="server" DataSourceID="SqlDataSourceThang1" DataTextField="Thang" DataValueField="Thang">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceThang1" runat="server" ConnectionString="<%$ ConnectionStrings:DMYConnectionString %>" SelectCommand="SELECT * FROM [Thang]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownListNamEdit" runat="server" DataSourceID="SqlDataSourceNam1" DataTextField="Nam" DataValueField="Nam">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNam1" runat="server" ConnectionString="<%$ ConnectionStrings:DMYConnectionString %>" SelectCommand="SELECT * FROM [Nam]"></asp:SqlDataSource>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownListNgay" runat="server" DataSourceID="SqlDataSourceNgay" DataTextField="Ngay" DataValueField="Ngay">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNgay" runat="server" ConnectionString="<%$ ConnectionStrings:DMYConnectionString %>" SelectCommand="SELECT * FROM [Ngay]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownListThang" runat="server" DataSourceID="SqlDataSourceThang" DataTextField="Thang" DataValueField="Thang">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceThang" runat="server" ConnectionString="<%$ ConnectionStrings:DMYConnectionString %>" SelectCommand="SELECT * FROM [Thang]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownListNam" runat="server" DataSourceID="SqlDataSourceNam" DataTextField="Nam" DataValueField="Nam">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNam" runat="server" ConnectionString="<%$ ConnectionStrings:DMYConnectionString %>" SelectCommand="SELECT * FROM [Nam]"></asp:SqlDataSource>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phái">
                <ItemTemplate>
                    <asp:Label ID="LabelPHAI" runat="server" Text='<%# Eval("PHAI") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListPhaiEdit" runat="server">

                        <asp:ListItem>Nam</asp:ListItem>
                        <asp:ListItem>Nữ</asp:ListItem>

                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                     <asp:DropDownList ID="DropDownListPhai" runat="server">

                        <asp:ListItem>Nam</asp:ListItem>
                        <asp:ListItem>Nữ</asp:ListItem>

                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ">
                <ItemTemplate>
                    <asp:Label ID="LabelDC" runat="server" Text='<%# Eval("DIACHI") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxDCEdit" runat="server" Text='<%# Eval("DIACHI") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxDC" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số điện thoại">
                <ItemTemplate>
                    <asp:Label ID="LabelSDT" runat="server" Text='<%# Eval("SDT") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSDTEdit" runat="server" Text='<%# Eval("SDT") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxSDT" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Xử lý">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButtonEdit" runat="server" ImageUrl="~/image_icon/pencil.png" CommandName="Edit" ToolTip ="Edit" Height="20px" Width ="20px"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="ImageButtonUpdate" runat="server" ImageUrl="~/image_icon/savedisk_floppydisk_guardar_1543.png" CommandName="Update" ToolTip ="Update" Height="20px" Width ="20px"/>
                    <asp:ImageButton ID="ImageButtonCancel" runat="server" ImageUrl="~/image_icon/file_10_icon-icons.com_68948.png" CommandName="Cancel" ToolTip ="Cancel" Height="20px" Width ="20px"/>
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:ImageButton ID="ImageButtonInsert" runat="server" ImageUrl="~/image_icon/plus.png" CommandName="AddNew" ToolTip ="AddNew" Height="20px" Width ="20px"/>
                </FooterTemplate>
                
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView></div>
    
</asp:Content>

