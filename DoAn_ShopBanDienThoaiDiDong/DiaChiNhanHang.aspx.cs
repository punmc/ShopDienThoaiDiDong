using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using App_Code;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

public partial class DiaChiNhanHang : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        load_DiaChiGiaoHang();
        Session["IDTrang"] = "diachi";
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

        Label1.Text = tb.Rows[0]["TENKH"].ToString();
        Label2.Text = tb.Rows[0]["SDT"].ToString();
        Label3.Text = tb.Rows[0]["DIACHI"].ToString();
        con.Close();
    }


    protected void btnDCGiao_Click(object sender, EventArgs e)
    {
        if (Button2.Enabled == true)
        {
            Response.Redirect("DatHang.aspx?tenkh=" + txtTenNgNhan.Text + "&sdt=" + txtSDT.Text + "&diachi=" + txtDiaChi.Text);
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtTenNgNhan.Enabled = true;
        txtSDT.Enabled = true;
        txtDiaChi.Enabled = true;
        btnDCGiao.Enabled = true;
    }
    protected void btnGiu_Click(object sender, EventArgs e)
    {
        Response.Redirect("DatHang.aspx");
    }
}