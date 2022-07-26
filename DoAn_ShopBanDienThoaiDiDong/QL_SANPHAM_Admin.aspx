<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Page.master" AutoEventWireup="true" CodeFile="QL_SANPHAM_Admin.aspx.cs" Inherits="QL_SANPHAM_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {
            font-weight: 700;
            color: #CC0000;
        }
        .auto-style3 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style ="margin:0px auto;" class="auto-style3">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" Width="800px" ShowFooter="True" DataKeyNames="MAHANG" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" PageSize="8" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Tên">
                <ItemTemplate>
                    <asp:Label ID="LabelTenSP" runat="server" Text='<%# Eval("TENHANG") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTenSPEdit" runat="server" Text='<%# Eval("TENHANG") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxTenSP" runat="server"></asp:TextBox>
                </FooterTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hãng sản xuất ">
                <ItemTemplate>
                    <asp:Label ID="LabelHANGSX" runat="server" Text='<%# Eval("HANGSX") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxHANGSXEdit" runat="server" Text='<%# Eval("HANGSX") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxHANGSX" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số Lượng Tồn ">
                <ItemTemplate>
                    <asp:Label ID="LabelSLT" runat="server" Text='<%# Eval("SOLUONGSPTON") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSLTEdit" runat="server" Text='<%# Eval("SOLUONGSPTON") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxSLT" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nước sản xuất ">
                <ItemTemplate>
                    <asp:Label ID="LabelNSX" runat="server" Text='<%# Eval("NUOCSX") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNSXEdit" runat="server" Text='<%# Eval("NUOCSX") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxNSX" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giá">
                <ItemTemplate>
                    <asp:Label ID="LabelGIASP" runat="server" Text='<%# Eval("GIASP") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxGIASPEdit" runat="server" Text='<%# Eval("GIASP") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBoxGIASP" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="80px" Width="80px" ImageUrl='<%# Eval("Hinh") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:FileUpload ID="FileUpload2" runat="server" />

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
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Chọn loại điện thoại"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>SamSung</asp:ListItem>
            <asp:ListItem>Iphone</asp:ListItem>
            <asp:ListItem>Oppo</asp:ListItem>
            <asp:ListItem>Xiaomi</asp:ListItem>
            <asp:ListItem>Vivo</asp:ListItem>
            <asp:ListItem>Vsmart </asp:ListItem>
            <asp:ListItem>Nokia</asp:ListItem>
            <asp:ListItem>Huawei</asp:ListItem>
            <asp:ListItem>Khác</asp:ListItem>
            <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/image_icon/xmag_search_find_export_locate_5984.png" OnClick="ImageButton1_Click" Width="25px" />
        </div>
    </asp:Content>

