using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Encryption;

public partial class Form_DCAccount_Admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

       
    }

    private bool KTraForm()
    {
        if (TextBox1.Text.Length > 0 && TextBox2.Text.Length > 0)
            return true;
        else
        return false;

      
    }
    

   
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cm = new SqlCommand("insert into KHACHHANG values(@tenkh,@ngaysinh,@phai,@diachi,@sdt,getdate(),@matkhau,@email)", con);
        cm.Parameters.AddWithValue("@tenkh", Request.QueryString["tenkh"]);
        cm.Parameters.AddWithValue("@ngaysinh", Request.QueryString["ngaysinh"]);
        cm.Parameters.AddWithValue("@phai", Request.QueryString["phai"]);
        cm.Parameters.AddWithValue("@diachi", Request.QueryString["diachi"]);
        cm.Parameters.AddWithValue("@sdt", Request.QueryString["sdt"]);
      
        cm.Parameters.AddWithValue("@email", TextBox1.Text);
        cm.Parameters.AddWithValue("@matkhau", Encryption.Encryption.MD5Hash( TextBox2.Text));
        cm.ExecuteNonQuery();
        Response.Redirect("QL_KHACHHANG_ADMIN.aspx");
    }
}