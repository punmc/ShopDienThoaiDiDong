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


public partial class DonHang : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    static DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["IDTrang"] = "donhang";
        if (Session["User"] == null)
        {
            Response.Write("<script>alert('Bạn phải đăng nhập tài khoản');</script>");
        }
        else
        {
            con.Open();
            Construction_User user1 = (Construction_User)Session["User"];
            DataTable tb = user1.tk;
            String select_HoaDon = "SELECT * FROM HOADON WHERE MAKH = " + tb.Rows[0]["MAKH"].ToString();
            SqlDataAdapter da1 = new SqlDataAdapter(select_HoaDon, con);
            
            da1.Fill(ds, "HOADON");

            DataList1.DataSource = ds.Tables["HOADON"];
            DataList1.DataBind();

        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        GridView gdv = (GridView)e.Item.FindControl("GridView1");
        int index = e.Item.ItemIndex;
        BindGridView(gdv, index);
    }

    private static void BindGridView(GridView gdv, int index)
    {
        int maHD = int.Parse(ds.Tables["HOADON"].Rows[index]["MAHD"].ToString());
        String select_ChiTietHD = "SELECT HINH, TENHANG, GIASP, SOLUONG, MUCGIAMGIA, THANHTIEN FROM CHITIETHD, SANPHAM WHERE MAHD = " + maHD + "AND CHITIETHD.MAHANG = SANPHAM.MAHANG" ;
        SqlDataAdapter da2 = new SqlDataAdapter(select_ChiTietHD, con);
        da2.Fill(ds, "CHITIETHD");

        gdv.DataSource = ds.Tables["CHITIETHD"];
        gdv.DataBind();

        con.Close();
    } 
}