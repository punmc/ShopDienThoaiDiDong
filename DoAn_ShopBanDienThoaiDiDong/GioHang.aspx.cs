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
public partial class GioHang : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["IDTrang"] == "chitiet")
            {
                int mahang = int.Parse(Request.QueryString["ID"].ToString());
                String strcmd = "select * from SANPHAM where MAHANG= " + mahang;
                SqlDataAdapter da1 = new SqlDataAdapter(strcmd, con);
                DataSet d = new DataSet();
                da1.Fill(d);

                if (d.Tables[0].Rows.Count > 0)
                {
                    string tenhang = d.Tables[0].Rows[0][1].ToString();
                    string hinh = d.Tables[0].Rows[0][8].ToString();
                    float giasp = (float)Math.Round(float.Parse(d.Tables[0].Rows[0][6].ToString()), 0);
                    int sl = 1;
                    Double mucgiamgia = ktra_giamGia(mahang);
                    Construction_Cart cart = (Construction_Cart)Session["Cart"];
                    cart.InsertProduct(mahang, tenhang, hinh, giasp, sl,mucgiamgia);
                    Session["Cart"] = cart;
                }
            }

            
        }
        // Hiển thị giỏ hàng lên gridview

        loadGriview();
        

        Session["IDTrang"] = "giohang";
    }

    private void loadGriview()
    {
        Construction_Cart cart1 = (Construction_Cart)Session["Cart"];
        DataTable t = cart1.GioHang;
        GridView1.DataSource = t;
        GridView1.DataBind();
        label1.Text = cart1.TongTien().ToString();
        // Lưu lại hiện tại của giỏ hàng
        Session["Cart"] = cart1;
    }
    protected void datHang_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Response.Redirect("DatHang.aspx");
        }
        else
        {
            Response.Write("<script>alert('Bạn phải đăng nhập tài khoản');</script>");
            Response.Redirect("DangNhap.aspx");
        }
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

        con.Close();
        return 0;
    }
    
    
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewCommandEventArgs s;
        Construction_Cart cart1 = (Construction_Cart)Session["Cart"];
        DataTable tb = cart1.GioHang;
       
        
        tb.Rows.Remove(tb.Rows[e.RowIndex]);

        Construction_Cart cart2 = new Construction_Cart();
        cart2.CreateItem();
        cart2.GioHang = tb;
        Session["Cart"] = cart2;

        loadGriview();
    }
}