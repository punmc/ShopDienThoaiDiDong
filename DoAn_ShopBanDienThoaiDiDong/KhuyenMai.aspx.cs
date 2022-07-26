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

public partial class KhuyenMai : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        DataSet dskm = new DataSet();

        String sqlSelect_KM = "SELECT SANPHAM.MAHANG, TENHANG, HINH, GIASP, TILEGIAMGIA FROM SANPHAM, CHITIETKM, DOTKM WHERE GETDATE() >= DOTKM.NGAYBD AND GETDATE() <= DOTKM.NGAYKT AND DOTKM.MADOTKM = CHITIETKM.MADOTKM AND SANPHAM.MAHANG = CHITIETKM.MAHANG";
        SqlDataAdapter da2 = new SqlDataAdapter(sqlSelect_KM, con);
        da2.Fill(dskm, "SANPHAMKM");

        if (dskm.Tables["SANPHAMKM"].Rows.Count > 0)
        {
            dskm.Tables["SANPHAMKM"].Columns.Add("GIASAUGIAM", System.Type.GetType("System.Double"));
            for (int i = 0; i < dskm.Tables["SANPHAMKM"].Rows.Count; i++)
            {
                dskm.Tables["SANPHAMKM"].Rows[i]["GIASAUGIAM"] = Double.Parse(dskm.Tables["SANPHAMKM"].Rows[i]["GIASP"].ToString()) * (1 - Double.Parse(dskm.Tables["SANPHAMKM"].Rows[i]["TILEGIAMGIA"].ToString()));
            }

            DataList1.DataSource = dskm.Tables["SANPHAMKM"];
            DataList1.DataBind();
        }

        Session["IDTrang"] = "khuyenmai";
    }


}