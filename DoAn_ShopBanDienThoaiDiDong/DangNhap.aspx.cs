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
using App_Code;
public partial class DangNhap : System.Web.UI.Page
{
 

    
         SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        con.Open();
        Load_Data();
        
    }

    public void Load_Data()
    {
       
       string sql = "select *from SANPHAM sp , CHITIETKM ct , DOTKM d where sp.MAHANG = ct.MAHANG and ct.MADOTKM = d.MADOTKM";
        SqlDataAdapter cmd = new SqlDataAdapter(sql,con);
        DataSet ds = new DataSet();
        cmd.Fill(ds, "KHUYENMAI");
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
          
            if (TextBoxEmail.Text.Equals("admin@gmail.com") && TextBoxPass.Text.Equals("admin123"))
            {
                Session["DangNhap"] = "1";
                Response.Redirect("QL_KM_Admin.aspx");
            }
            else
            {
                string email = TextBoxEmail.Text;
                string matkhau = Encryption.Encryption.Encryption1(TextBoxPass.Text);
                string strcmd = "select count(*) from KhachHang where Email='" + email + "'";
                SqlCommand sql = new SqlCommand(strcmd, con);


                int i = Convert.ToInt32(sql.ExecuteScalar());

                if (i == 1)
                {
                    string strcmd1 = "select count(*) from KhachHang where Email='" + email + "'and MatKhau='" + matkhau + "'";


                    SqlCommand sql1 = new SqlCommand(strcmd1, con);



                    int i1 = Convert.ToInt32(sql1.ExecuteScalar());
                    if (i1 == 1)
                    {
                        Response.Write("Successfully!");
                        string strcmd2 = "select * from KhachHang where Email='" + email + "'and MatKhau='" + matkhau + "'";
                        SqlDataAdapter da = new SqlDataAdapter(strcmd2, con);
                        DataSet ds = new DataSet();
                        da.Fill(ds, "KHACHHANG");
                        string s = ds.Tables["KHACHHANG"].Rows[0]["TENKH"].ToString();
                        Construction_User user1 = new Construction_User();
                        user1.createTK();
                        user1.InsertInfo(int.Parse(ds.Tables["KHACHHANG"].Rows[0]["MAKH"].ToString()), ds.Tables["KHACHHANG"].Rows[0]["TENKH"].ToString());
                        Session["User"] = user1;
                        Response.Redirect("TrangChu.aspx");
                       
                    }

                    else
                        Response.Write("Fail!");

                }
                else Response.Write("Email not exist"); 
            
            }
            
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("DangKi.aspx");
    }
    }
