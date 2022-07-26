<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KhuyenMai.aspx.cs" Inherits="KhuyenMai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="plHolder_mainContent" Runat="Server">
    <link href="css/Style_KhuyenMai.css" rel="stylesheet" />

    <%-- adv động --%>
    <div class="slider">
      <div class="slides">
        
        <input type="radio" name="radio-btn" id="radio1"/>
        <input type="radio" name="radio-btn" id="radio2"/>
        <input type="radio" name="radio-btn" id="radio3"/>
        <input type="radio" name="radio-btn" id="radio4"/>
        
        <div class="slide first">
          <img src="/image_icon/image_adv/sanRelmi.png" alt=""/>
        </div>
        <div class="slide">
          <img src="/image_icon/image_adv/XiaomiNote10Series.png" alt=""/>
        </div>
        <div class="slide">
          <img src="/image_icon/image_adv/samsungGalaxyS21Series5G.jpg" alt=""/>
        </div>
        <div class="slide">
          <img src="/image_icon/image_adv/samsungGalaxyA32.jpg" alt=""/>
        </div>
        
        <div class="navigation-auto">
          <div class="auto-btn1"></div>
          <div class="auto-btn2"></div>
          <div class="auto-btn3"></div>
          <div class="auto-btn4"></div>
        </div>
       
      </div>
      
      <div class="navigation-manual">
        <label for="radio1" class="manual-btn"></label>
        <label for="radio2" class="manual-btn"></label>
        <label for="radio3" class="manual-btn"></label>
        <label for="radio4" class="manual-btn"></label>
      </div>
      
    </div>
    

    <script type="text/javascript">
    var counter = 1;
    setInterval(function(){
      document.getElementById('radio' + counter).checked = true;
      counter++;
      if(counter > 4){
        counter = 1;
      }
    }, 5000);
    </script>

    <%-- adv tĩnh --%>

    <div id="advLeft">
        <img src="/image_icon/image_adv/xiaomiRemiNote9.jpg" />
    </div>
    <div id="advRight">
        <img src="image_icon/image_adv/img_adv_samsung-note20-ultra.png" />
    </div>

    <%-- Danh sach san pham giam gia --%>
    <div id="dssanpham">
        
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" CellSpacing="6">
        <ItemTemplate>
            <a href="ChiTietSanPham.aspx?ID=<%# Eval("MAHANG") %>">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HINH") %>' Width="225px" Height="225px"/><br />
                <div class="info">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TENHANG") %>' CssClass="tenSP"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("GIASP") %>' CssClass="giaSP"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Giá chỉ còn: " Width="100px" ForeColor="Purple"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("GIASAUGIAM") %>'></asp:Label>
                    </div>
            </a>
        </ItemTemplate>
    </asp:DataList>
    </div>


</asp:Content>

