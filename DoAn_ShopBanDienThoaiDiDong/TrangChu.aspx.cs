using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using App_Code;

public partial class TrangChu : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        con.Open();
        if (Session["User"] == null)
        {
            ImageButton3.Visible = true;
        }
        else
        {
            Construction_User user = (Construction_User)Session["User"];
            LabelTenKH.Text = user.tk.Rows[0]["TENKH"].ToString();
            ImageButton2.Visible = true;
            ImageButton3.Visible = false;
        }
        
        // Hiển thị danh sách sản phẩm
        String strcmd = "select * from SANPHAM";
        SqlDataAdapter da = new SqlDataAdapter(strcmd, con);
        DataSet ds=new DataSet ();
        da.Fill(ds,"SANPHAM");
        DataList1.DataSource = ds.Tables["SANPHAM"];
        DataList1.DataBind();

        //Hiển thị các điện thoại đang giảm giá
        DataSet dskm = new DataSet();
        
        String sqlSelect_KM = "SELECT SANPHAM.MAHANG, TENHANG, HINH, GIASP, TILEGIAMGIA FROM SANPHAM, CHITIETKM, DOTKM WHERE GETDATE() >= DOTKM.NGAYBD AND GETDATE() <= DOTKM.NGAYKT AND DOTKM.MADOTKM = CHITIETKM.MADOTKM AND SANPHAM.MAHANG = CHITIETKM.MAHANG";
        SqlDataAdapter da2 = new SqlDataAdapter(sqlSelect_KM, con);
        da2.Fill(dskm,"SANPHAMKM");

        if (dskm.Tables["SANPHAMKM"].Rows.Count > 0)
        {
            dskm.Tables["SANPHAMKM"].Columns.Add("GIASAUGIAM", System.Type.GetType("System.Double"));
            for (int i = 0; i < dskm.Tables["SANPHAMKM"].Rows.Count; i++)
            {
                dskm.Tables["SANPHAMKM"].Rows[i]["GIASAUGIAM"] = Double.Parse(dskm.Tables["SANPHAMKM"].Rows[i]["GIASP"].ToString()) * (1 - Double.Parse(dskm.Tables["SANPHAMKM"].Rows[i]["TILEGIAMGIA"].ToString()));
            }

            DataList2.DataSource = dskm.Tables["SANPHAMKM"];
            DataList2.DataBind();
        }


       
        //Tạo biến có kiểu lớp xây dựng
        if (Session["Cart"] == null)
        {
            Construction_Cart cart = new Construction_Cart();
            cart.CreateItem();
            Session["Cart"] = cart;
        }
        Session["IDTrang"] = "trangchu";
        con.Close();
    }

    protected Boolean ktra_giamGia(String mahang, ref String maDotKM)
    {
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        con2.Open();

        DataTable DOTKM = new DataTable();
        DataColumn col_MaDKM = new DataColumn("MADOTKM", System.Type.GetType("System.String"));
        DOTKM.Columns.Add(col_MaDKM);

        String sqlSelect_MaDKM = "SELECT MADOTKM FROM DOTKM WHERE GETDATE() >= DOTKM.NGAYBD AND GETDATE() <= DOTKM.NGAYKT";
        SqlDataAdapter da = new SqlDataAdapter(sqlSelect_MaDKM, con2);
        DataSet ds = new DataSet();
        ds.Tables.Add(DOTKM);

        da.Fill(ds, "DOTKM");

        if (DOTKM != null)
        {
            maDotKM = ds.Tables["DOTKM"].Rows[0]["MADOTKM"].ToString();
            return true;
        }
        else
        {
            return false;
        }

        con2.Close();
        return false;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["DangNhap"] = "0";
        Response.Redirect("DangNhap.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Session["DangNhap"] = "0";
        Response.Redirect("DangNhap.aspx");
    }
}