<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTietSanPham.aspx.cs" Inherits="ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    <link type="text/css" href="css/Style_ChiTietSanPham.css" rel="stylesheet" />
    <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="tenSP" runat="server" Text='<%# Eval("TENHANG") %>' CssClass="ten"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="10">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HINH") %>' CssClass="hinh"/>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Giá gốc:" CssClass="lb"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("GIASP") %>' CssClass="gia"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="Label5" runat="server" Text="Giảm giá:" CssClass="lb"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Saleoff" runat="server" Text='<%# Eval("MUCGIAMGIA") %>' CssClass="tile"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Giá bán:" CssClass="lb"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("THANHTIEN") %>' CssClass="thanhtien"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='đ' CssClass="vnd"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>
                            <div id="btn"><a href="GioHang.aspx?ID=<%# Eval("MAHANG") %>">Thêm vào giỏ hàng</a></div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    <br /><br /><br />
    <asp:Label ID="moTa" runat="server" Text="Thông số kỹ thuật" CssClass="lb"></asp:Label><br />
    <br />
    <asp:DataList ID="DataList2" runat="server">
        <ItemTemplate>
            <table border="1" id="table2">
                <tr>
                    <th></th>
                    <th>Thông số</th>
                </tr>
                <tr>
                    <td>Màn hình</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("MAN_HINH") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Camera sau</td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("CAMERA_SAU") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Camera selfie</td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("CAMERA_SELFIE") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>RAM</td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("RAM") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Bộ nhớ trong</td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("BO_NHO_TRONG") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>CPU</td>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("CPU") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>GPU</td>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("GPU") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Dung lượng pin</td>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("DUNG_LUONG_PIN") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Thẻ sim</td>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("THE_SIM") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Hệ điều hành</td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("HE_DIEU_HANH") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Xuất xứ</td>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("XUATXU") %>'>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian ra mắt</td>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("THOI_GIAN_RA_MAT") %>'>'></asp:Label>
                    </td>
                </tr>
                
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

