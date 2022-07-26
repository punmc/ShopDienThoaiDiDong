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

public partial class DatHang : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Cart"] == null)
        {
            Response.Write("Giỏ hàng cử bạn không có sản phẩm nào!");
        }
        else
        {
            Construction_Cart cart = (Construction_Cart)Session["Cart"];
            DataTable tb = new DataTable();
            tb = cart.GioHang;
            GridView1.DataSource = tb;
            GridView1.DataBind();

            lbThanhTien.Text = cart.TongTien().ToString();
        }

        if (Request.QueryString["tenkh"] != null)
        {
            lbTenKH.Text = Request.QueryString["tenkh"].ToString();
            lbSDT.Text = Request.QueryString["sdt"].ToString();
            lbDiaChi.Text = Request.QueryString["diachi"].ToString();
        }
        else
            load_DiaChiGiaoHang();

        Session["IDTrang"] = "dathang";
    }

    private void load_DiaChiGiaoHang()
    {
        con.Open();
        Construction_User user = (Construction_User)Session["User"];
        String makh = user.tk.Rows[0]["MAKH"].ToString();
        String sql = "SELECT * FROM KHACHHANG WHERE MAKH = " + makh;
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable tb = new DataTable();
        da.Fill(tb);

        lbTenKH.Text = tb.Rows[0]["TENKH"].ToString();
        lbSDT.Text = tb.Rows[0]["SDT"].ToString();
        lbDiaChi.Text = tb.Rows[0]["DIACHI"].ToString();
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/DiaChiNhanHang.aspx");
    }

    protected void btnDat_Click(object sender, EventArgs e)
    {
        con.Open();
        
        Construction_Cart cart = (Construction_Cart)Session["Cart"];
        DataTable tb = cart.GioHang;

        //Tạo hóa đơn mới
        SqlCommand s = new SqlCommand("insert into HOADON values(@makh,@manv,@noigiao,0,getdate())", con);
        Construction_User user = (Construction_User)Session["User"];

        s.Parameters.AddWithValue("@makh", user.tk.Rows[0]["MAKH"].ToString());
        s.Parameters.AddWithValue("@manv", 1);
        s.Parameters.AddWithValue("@noigiao", lbDiaChi.Text);
        s.ExecuteNonQuery();
        String laymahd = "select MAX(MAHD) from HOADON";
        SqlDataAdapter d = new SqlDataAdapter(laymahd, con);
        DataTable dt = new DataTable();
        d.Fill(dt);//dt.Rows[0][0]
        
        foreach (DataRow r in tb.Rows)
        {
            Random rd = new Random();
            int seri = Math.Abs(rd.Next(10001, 99999));
            SqlCommand s2 = new SqlCommand("insert into CHITIETHD values(@mahd,@mahang,@seri,@soluong,@giagoc,0,getdate(),getdate()+2,0)",con);
            s2.Parameters.AddWithValue("@mahd", dt.Rows[0][0]) ;
            s2.Parameters.AddWithValue("@mahang", int.Parse(r["MAHANG"].ToString()));
            s2.Parameters.AddWithValue("@seri", (String)(dt.Rows[0][0].ToString() + seri.ToString() + r["MAHANG"].ToString()));
            s2.Parameters.AddWithValue("@soluong", int.Parse(r["SOLUONG"].ToString()));
            s2.Parameters.AddWithValue("@giagoc", float.Parse(r["GIASP"].ToString()));
            s2.ExecuteNonQuery();
        }
        con.Close();

        Session["Cart"] = null;

        Response.Redirect("DonHang.aspx");
    }

    protected Double ktra_giamGia(int mahang)
    {
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        con2.Open();

        DataTable DOTKM = new DataTable();
        DataColumn col_MaDKM = new DataColumn("MADOTKM", System.Type.GetType("System.String"));
        DOTKM.Columns.Add(col_MaDKM);

        String sqlSelect_MaDKM = "SELECT MADOTKM FROM DOTKM WHERE GETDATE() >= DOTKM.NGAYBD AND GETDATE() <= DOTKM.NGAYKT";
        SqlDataAdapter da = new SqlDataAdapter(sqlSelect_MaDKM, con2);
        DataSet ds = new DataSet();

        da.Fill(ds, "DOTKM");
        //DataTable tbl = ds.Tables["DOTKM"].GetChanges();

        if (DOTKM != null)
        {
            String sqlSelect_MaHang = "SELECT MAHANG, TILEGIAMGIA FROM CHITIETKM WHERE MADOTKM = " + ds.Tables["DOTKM"].Rows[0]["MADOTKM"].ToString();
            SqlDataAdapter da2 = new SqlDataAdapter(sqlSelect_MaHang, con2);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "SPGIAMGIA");

            DataTable tb = new DataTable();
            tb = ds2.Tables["SPGIAMGIA"];

            for (int i = 0; i < tb.Rows.Count; i++)
            {
                if (int.Parse(tb.Rows[i][0].ToString()) == mahang)
                    return Math.Round(float.Parse(tb.Rows[i][1].ToString()), 2);
            }
        }
        else
        {
            return 0;
        }

        con2.Close();
        return 0;
    }
}