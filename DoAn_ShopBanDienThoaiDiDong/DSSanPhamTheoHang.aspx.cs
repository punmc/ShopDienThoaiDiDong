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

public partial class DSSanPhamTheoHang : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        if (Session["SANPHAM_TIMKIEM"] != null)
        {
            Construction_SanPham sp = (Construction_SanPham)Session["SANPHAM_TIMKIEM"];
            DataTable tb = new DataTable();
            tb = sp.SanPham;
            DataList1.DataSource = tb;
            DataList1.DataBind();
        }
        else
        {
            String hang = Request.QueryString["HANGSX"].ToString();
            String strcmd = "select * from SANPHAM WHERE HANGSX = '" + hang + "'";
            SqlDataAdapter da = new SqlDataAdapter(strcmd, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "SANPHAM");
            DataList1.DataSource = ds.Tables["SANPHAM"];
            DataList1.DataBind();
        }
        
        Session["IDTrang"] = "dshang";
    }
}