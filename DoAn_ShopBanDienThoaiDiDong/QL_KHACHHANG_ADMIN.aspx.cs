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

public partial class QL_KHACHHANG_ADMIN : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        
        Load_Data();
        
    }

   

    private void Load_Data()
    {
        if (!IsPostBack)
        {
            PopularGridView();

        }
    }
    private void PopularGridView()
    {
        string sql = "select *from KHACHHANG ";
        SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
        DataTable ds = new DataTable();
        cmd.Fill(ds);

        if (ds.Rows.Count > 0)
        {

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            ds.Rows.Add(ds.NewRow());
            GridView1.DataSource = ds;
            GridView1.DataBind();
            GridView1.Rows[0].Cells.Clear();
            GridView1.Rows[0].Cells.Add(new TableCell());
            GridView1.Rows[0].Cells[0].ColumnSpan = ds.Columns.Count;
            GridView1.Rows[0].Cells[0].Text = "No Data Found!";
            GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
           
            //string s = "insert into SANPHAM values (@tensp,@hangsx,@soluong,'Cái',@nuocsx,@giasp,null,@hinh)";
            //SqlCommand cm = new SqlCommand(s, con);
            //cm.Parameters.AddWithValue("@tensp", (GridView1.FooterRow.FindControl("TextBoxTenSP") as TextBox).Text.Trim());
            //cm.Parameters.AddWithValue("@hangsx", (GridView1.FooterRow.FindControl("TextBoxHANGSX") as TextBox).Text.Trim());
            //cm.Parameters.AddWithValue("@soluong", int.Parse((GridView1.FooterRow.FindControl("TextBoxSLT") as TextBox).Text.Trim()));
            //cm.Parameters.AddWithValue("@nuocsx", (GridView1.FooterRow.FindControl("TextBoxNSX") as TextBox).Text.Trim());
            //cm.Parameters.AddWithValue("@giasp", (GridView1.FooterRow.FindControl("TextBoxGIASP") as TextBox).Text.Trim());
            //cm.Parameters.AddWithValue("@hinh", "/image_icon/DIENTHOAI/" + (GridView1.FooterRow.FindControl("FileUpload2") as FileUpload).FileName.Trim());

            //cm.ExecuteNonQuery();
            //PopularGridView();
            string tenkh =(GridView1.FooterRow.FindControl("TextBoxTenKH") as TextBox).Text.ToString();
            string ngaysinh = 
                ((GridView1.FooterRow.FindControl("DropDownListNam") as DropDownList).SelectedItem.Text+"-"+
                (GridView1.FooterRow.FindControl("DropDownListThang") as DropDownList).SelectedItem.Text+"-"+
                (GridView1.FooterRow.FindControl("DropDownListNgay") as DropDownList).SelectedItem.Text).Trim();
            string phai = ((GridView1.FooterRow.FindControl("DropDownListPhai") as DropDownList).SelectedItem.Text).Trim();
            string diachi = (GridView1.FooterRow.FindControl("TextBoxDC") as TextBox).Text.ToString();
            string sdt = (GridView1.FooterRow.FindControl("TextBoxSDT") as TextBox).Text.ToString();
             Response.Redirect("Form_DCAccount_Admin.aspx?tenkh="+tenkh.ToString()+"&ngaysinh="+ngaysinh.ToString()+"&phai=" +phai.ToString()+"&diachi="+diachi.ToString()+"&sdt="+sdt.ToString());
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        PopularGridView();
    }
    
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        PopularGridView();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string tenkh = (GridView1.Rows[e.RowIndex].FindControl("TextBoxTenKHEdit") as TextBox).Text.ToString();
        string ngaysinh =
            ((GridView1.Rows[e.RowIndex].FindControl("DropDownListNamEdit") as DropDownList).SelectedItem.Text + "-" +
            (GridView1.Rows[e.RowIndex].FindControl("DropDownListThangEdit") as DropDownList).SelectedItem.Text + "-" +
            (GridView1.Rows[e.RowIndex].FindControl("DropDownListNgayEdit") as DropDownList).SelectedItem.Text).Trim();
        string phai = ((GridView1.Rows[e.RowIndex].FindControl("DropDownListPhaiEdit") as DropDownList).SelectedItem.Text).Trim();
        string diachi = (GridView1.Rows[e.RowIndex].FindControl("TextBoxDCEdit") as TextBox).Text.ToString();
        string sdt = (GridView1.Rows[e.RowIndex].FindControl("TextBoxSDTEdit") as TextBox).Text.ToString();
        SqlCommand cm = new SqlCommand("update KHACHHANG set TENKH= @tenkh,NGAYSINH = @ngaysinh, PHAI = @phai,DIACHI = @diachi,SDT = @sdt where MAKH = @id",con);
        cm.Parameters.AddWithValue("@tenkh", tenkh);
        cm.Parameters.AddWithValue("@ngaysinh", ngaysinh);
        cm.Parameters.AddWithValue("@phai", phai);
        cm.Parameters.AddWithValue("@diachi", diachi);
        cm.Parameters.AddWithValue("@sdt", sdt); 
        cm.Parameters.AddWithValue("@id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cm.ExecuteNonQuery();
        GridView1.EditIndex = 1;
        PopularGridView();
    }
}