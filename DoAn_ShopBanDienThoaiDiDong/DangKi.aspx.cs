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

public partial class DangKi : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        con.Open();
        //if (con.State == ConnectionState.Open) Response.Write("Dang Nhap Thanh Cong");
        LoadTime();
        Session["IDTrang"] = "dangki";
    }

    public void LoadTime()
    {

        for (int i = 1900; i < 2022; i++)
        {
            DropDownList2.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }
        for (int i = 1; i <= 12; i++)
        {
            DropDownList3.Items.Add(new ListItem(i.ToString(), i.ToString()));
        }

        LoadDate();

    }
    public void LoadDate()
    {

        switch (int.Parse(DropDownList3.SelectedItem.Text))
        {

            case 1:
                for (int i = 1; i < 32; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 3:
                for (int i = 1; i < 32; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 5:
                for (int i = 1; i < 32; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 7:
                for (int i = 1; i < 32; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 8:
                for (int i = 1; i < 32; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 10:
                for (int i = 1; i < 32; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 12:
                for (int i = 1; i < 32; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 11:
                for (int i = 1; i < 31; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 9:
                for (int i = 1; i < 31; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 6:
                for (int i = 1; i < 31; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 4:
                for (int i = 1; i < 31; i++)
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
            case 2:
                if (int.Parse(DropDownList2.SelectedItem.Text) % 4 == 0 && int.Parse(DropDownList2.SelectedItem.Text) % 100 != 0)
                    for (int i = 1; i < 30; i++)
                        DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));

                else
                    for (int i = 1; i < 29; i++)
                        DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));
                break;
        }
    }

    protected void BtnDK_Clicked(object sender, EventArgs e)
    {
        //kiểm tra nếu tồn tại email thì không cho đăng kí 
        if (DaTonTaiEmail(TextBoxEmail.Text))
        {
            Response.Write("Email đã tồn tại");
        }
        else
        {
            string name = TextBoxHoTen.Text;
            string sdt = TextBoxSDT.Text;
            string email = TextBoxEmail.Text;
            string diachi = TextBoxDiachi.Text;
            string ngaysinh = DropDownList2.SelectedItem.Text + "-" + DropDownList3.SelectedItem.Text + "-" + DropDownList1.SelectedItem.Text;
            string gioitinh = DropDownList4.SelectedItem.Text;
            string matkhau = Encryption.Encryption.Encryption1(TextBoxPass.Text);

            SqlCommand sql = new SqlCommand();
            sql.Connection = con;
            sql.CommandType = CommandType.Text;
            //INSERT INTO KHACHHANG VALUES (N'Nguyễn Văn Anh','22/10/1960',N'Nam',N'731 Trần Hưng Đạo, Q5,TpHCM','08823451','22/07/2020',0,0)
            sql.CommandText = "INSERT INTO KHACHHANG VALUES (N'" + name + "','" + ngaysinh + "',N'" + gioitinh + "',N'" + diachi + "','" + sdt + "',getdate(),'" + matkhau + "','" + email + "')";

            int i = sql.ExecuteNonQuery();
            if (i >= 1)
                Response.Redirect("DangNhap.aspx");

            con.Close();
        }
    }

    private bool DaTonTaiEmail(String email)
    {
        SqlDataAdapter sql = new SqlDataAdapter("select * from KhachHang where Email='" + email.ToString() + "'", con);
        DataSet ds = new DataSet();
        sql.Fill(ds, "Email");
        DataTable t = new DataTable();
        t = ds.Tables[0];
        if (t.Rows.Count > 0)
            return true;
        return false;
    }


    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        LoadDate();
    }
    protected void ButtonDK_Click(object sender, EventArgs e)
    {
        //kiểm tra nếu tồn tại email thì không cho đăng kí 
        if (DaTonTaiEmail(TextBoxEmail.Text))
        {
            Response.Write("Email đã tồn tại");
        }
        else
        {
            string name = TextBoxHoTen.Text;
            string sdt = TextBoxSDT.Text;
            string email = TextBoxEmail.Text;
            string diachi = TextBoxDiachi.Text;
            string ngaysinh = DropDownList2.SelectedItem.Text + "-" + DropDownList3.SelectedItem.Text + "-" + DropDownList1.SelectedItem.Text;
            string gioitinh = DropDownList4.SelectedItem.Text;
            string matkhau = Encryption.Encryption.Encryption1(TextBoxPass.Text);

            SqlCommand sql = new SqlCommand();
            sql.Connection = con;
            sql.CommandType = CommandType.Text;
            //INSERT INTO KHACHHANG VALUES (N'Nguyễn Văn Anh','22/10/1960',N'Nam',N'731 Trần Hưng Đạo, Q5,TpHCM','08823451','22/07/2020',0,0)
            sql.CommandText = "INSERT INTO KHACHHANG VALUES (N'" + name + "','" + ngaysinh + "',N'" + gioitinh + "',N'" + diachi + "','" + sdt + "',getdate(),'" + matkhau + "','" + email + "')";

            int i = sql.ExecuteNonQuery();
            if (i >= 1)
                Response.Redirect("DangNhap.aspx");

            con.Close();
        }
    }
}