<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrangChu.aspx.cs" Inherits="TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    <link href="css/Style_TrangChu.css" rel="stylesheet" type="text/css"/>
    <div style="float:right">
        <asp:ImageButton ID="ImageButton3" runat="server" Height="25px" ImageUrl="~/image_icon/loginmanager_10029.png" OnClick="ImageButton3_Click" Width="25px" />
    <asp:Label ID="LabelTenKH" runat="server" Text="Đăng nhập" CssClass="auto-style1"></asp:Label><asp:ImageButton ID="ImageButton2" runat="server" Height="25px" ImageUrl="~/image_icon/exit_icon-icons.com_70975.png" Width="25px" OnClick="ImageButton1_Click" ToolTip="Login" Visible="False" />
    </div>

    <%-- Quảng cáo động bên phải --%>
    <div id="adv_active"> 
        <div class="slider">
            <div class="slides">
                <!--radio buttons start-->
                <input type="radio" name="radio-btn" id="radio1">
                <input type="radio" name="radio-btn" id="radio2">
                <input type="radio" name="radio-btn" id="radio3">
                <input type="radio" name="radio-btn" id="radio4">
                <!--radio buttons end-->
                <!--slide images start-->
                <div class="slide first">
                    <a href="/TrangChu.aspx?product=iphon12series"><img src="/image_icon/image_adv/img_adv_iphone12-series.png" /></a>
                </div>
                <div class="slide">
                    <a href="/TrangChu.aspx?product=xiaomimi11lite5g"><img src="/image_icon/image_adv/img_adv_mi-11-lite-5g.png" /></a>
                </div>
                <div class="slide">
                    <a href="/TrangChu.aspx?product=samsunggalaxya52"><img src="/image_icon/image_adv/img_adv_samsung-galaxy-a52.png" /></a>
                </div>
                <div class="slide">
                    <img src="/image_icon/image_adv/img_adv_samsung-a72-a52.png" />
                </div>
                <!--slide images end-->
                <!--automatic navigation start-->
                <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                    <div class="auto-btn3"></div>
                    <div class="auto-btn4"></div>
                </div>
                <!--automatic navigation end-->
            </div>
            <!--manual navigation start-->
            <div class="navigation-manual">
                <label for="radio1" class="manual-btn"></label>
                <label for="radio2" class="manual-btn"></label>
                <label for="radio3" class="manual-btn"></label>
                <label for="radio4" class="manual-btn"></label>
            </div>
            <!--manual navigation end-->
        </div>
        <!--image slider end-->
        </div>
    <script type="text/javascript">
        var counter = 1;
        setInterval(function () {
            document.getElementById('radio' + counter).checked = true;
            counter++;
            if (counter > 4) {
                counter = 1;
            }
        }, 5000);
    </script>    
    
    <%-- Quảng cáo tĩnh bên phải --%>
    <div id="adv_right">
        <ul>
            <li><a href="/TrangChu.aspx?product=ssa72a52"><img src="/image_icon/image_adv/img_adv_samsung-a72-a52.png" title="Bộ đôi Samsung Galaxy A72, Samsung Galaxy A52"/></a></li>
            <li><a href="/TrangChu.aspx?product=ssnote20ultra5g"><img src="/image_icon/image_adv/img_adv_samsung-note20-ultra.png" title="Samsung Galaxy Note 20 Ultra 5G"/></a></li>
        </ul>
    </div>

    <%-- menu hãng điện thoại --%>

    <div id="brands">
        <ul>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=Iphone" title="Sản phẩm Iphone">Iphone</a></li>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=SamSung" title="Sản phẩm Samsung">Samsung</a></li>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=Oppo" title="Sản phẩm Oppo">Oppo</a></li>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=xiaomi" title="Sản phẩm Xiaomi">Xiaomi</a></li>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=Vivo" title="Sản phẩm Vivo">Vivo</a></li>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=Vsmart" title="Sản phẩm Vsmart">Vsmart</a></li>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=Nokia" title="Sản phẩm Nokia">Nokia</a></li>
            <li><a href="DSSanPhamTheoHang.aspx?HANGSX=Huawei" title="Sản phẩm Huawei">Huawei</a></li>

        </ul>
    </div>


    <%-- Danh sách sản phẩm khuyến mãi --%>

    <div id="saleoff">
        <h3>Sản phẩm khuyến mãi:</h3>
        <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" CellSpacing="6">
            <ItemTemplate>
                <a href="ChiTietSanPham.aspx?ID=<%# Eval("MAHANG") %>">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HINH") %>' Width="225px" Height="225px"/><br />
                    <div class="info">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TENHANG") %>' CssClass="tenSP"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("GIASP") %>' CssClass="giaSP_km"></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Giá chỉ còn: " Width="100px" ForeColor="Purple"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("GIASAUGIAM") %>' CssClass="giadagiam"></asp:Label>
                        </div>
                </a>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <%-- Danh sach san pham --%>
    
   
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" CellSpacing="6">
        <ItemTemplate>
            <a href="ChiTietSanPham.aspx?ID=<%# Eval("MAHANG") %>">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HINH") %>' Width="225px" Height="225px"/><br />
                <div class="info">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TENHANG") %>' CssClass="tenSP"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("GIASP") %>' CssClass="giaSP"></asp:Label><br />
                    </div>
            </a>
        </ItemTemplate>
    </asp:DataList>


</asp:Content>

