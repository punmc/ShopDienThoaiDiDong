using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Code;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    String menu = "";
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["mnu"] != null)
        {
            menu = Request.QueryString["mnu"];
        }

        switch(menu){
            case "cart":
                Response.Redirect("GioHang.aspx?cart=" + Session["Cart"]);
                break;
            case "sign":
                Response.Redirect("DangNhap.aspx");
                break;
            case "sale":
                Response.Redirect("KhuyenMai.aspx");
                break;
            case "bills":
                Response.Redirect("DonHang.aspx");
                break;
        }

        String tim = txtSearch.Text;
        
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        con.Open();
        String sql = "SELECT * FROM SANPHAM WHERE TENHANG LIKE N'%" + txtSearch.Text + "%'";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable tb = new DataTable("SPTIMKIEM");
        da.Fill(tb);

        Construction_SanPham dssp = new Construction_SanPham();
        dssp.CreateItem();
        dssp.SanPham = tb;
        Session["SANPHAM_TIMKIEM"] = dssp;
        Response.Redirect("DSSanPhamTheoHang.aspx");

    }
}
