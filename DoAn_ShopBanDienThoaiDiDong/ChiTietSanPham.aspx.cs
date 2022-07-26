using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using App_Code;


public partial class ChiTietSanPham : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["IDTrang"] = "chitiet";
        con.Open();
        int mahang = int.Parse(Request.QueryString["ID"].ToString());
        String sqlSelect_Hang = "SELECT MAHANG, TENHANG, HINH, GIASP FROM SANPHAM WHERE SANPHAM.MAHANG = " + mahang;
        
        SqlDataAdapter da = new SqlDataAdapter(sqlSelect_Hang, con);
        da.Fill(ds, "SANPHAM");
        DataTable tbl = new DataTable();
        tbl = ds.Tables["SANPHAM"];
        

        //Lấy tỉ lệ giảm giá ở bảng CHITITETKM
        Double TILEGIAMGIA = ktra_giamGia(mahang);
        DataColumn col_tiLe = new DataColumn("MUCGIAMGIA", System.Type.GetType("System.Double"));
        tbl.Columns.Add(col_tiLe);
        ds.Tables["SANPHAM"].Rows[0]["MUCGIAMGIA"] = TILEGIAMGIA;

        //Tính giá bán
        DataColumn col_ThanhTien = new DataColumn("THANHTIEN", System.Type.GetType("System.Double"));
        tbl.Columns.Add(col_ThanhTien);
        ds.Tables["SANPHAM"].Rows[0]["THANHTIEN"] = Double.Parse(ds.Tables["SANPHAM"].Rows[0]["GIASP"].ToString()) * (1 - TILEGIAMGIA);

        DataList1.DataSource = ds.Tables["SANPHAM"];
        DataList1.DataBind();

        //Thông số kỹ thuật
        String sqlSelect_TSKT = "SELECT * FROM TSKYTHUAT WHERE MAHANG = " + mahang;
        SqlDataAdapter d = new SqlDataAdapter(sqlSelect_TSKT, con);
        d.Fill(ds, "TSKT");

        DataList2.DataSource = ds.Tables["TSKT"];
        DataList2.DataBind();

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
        
        da.Fill(ds,"DOTKM");
        //DataTable tbl = ds.Tables["DOTKM"].GetChanges();
        
        if (DOTKM != null)
        {
            String sqlSelect_MaHang = "SELECT MAHANG, TILEGIAMGIA FROM CHITIETKM WHERE MADOTKM = " + ds.Tables["DOTKM"].Rows[0]["MADOTKM"].ToString();
            SqlDataAdapter da2 = new SqlDataAdapter(sqlSelect_MaHang, con2);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2,"SPGIAMGIA");

            DataTable tb = new DataTable();
            tb = ds2.Tables["SPGIAMGIA"];

            for (int i = 0; i < tb.Rows.Count; i++ )
            {
                if (int.Parse(tb.Rows[i][0].ToString()) == mahang)
                    return Math.Round(float.Parse(tb.Rows[i][1].ToString()),2);
            }
        }
        else
        {
            return 0;
        }
        
        con.Close();
        return 0;
    }

   
}