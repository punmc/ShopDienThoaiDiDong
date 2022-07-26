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
public partial class QL_SANPHAM_Admin : System.Web.UI.Page
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
        string sql = "select *from SANPHAM sp ";
        SqlDataAdapter cmd = new SqlDataAdapter(sql, con);
        DataTable ds = new DataTable();
        if (DropDownList1.SelectedItem.Value.Equals("All") )
            {
            sql = "select *from SANPHAM sp ";
            cmd = new SqlDataAdapter(sql, con);
            cmd.Fill(ds);
             }
        if (DropDownList1.SelectedItem.Value.Equals("Huawei"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text+"%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            }
        if (DropDownList1.SelectedItem.Value.Equals("Iphone"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text + "%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            }
        if (DropDownList1.SelectedItem.Value.Equals("SamSung"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text + "%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            }
        if (DropDownList1.SelectedItem.Value.Equals("Xiaomi"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text + "%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            }
        if (DropDownList1.SelectedItem.Value.Equals("Vsmart"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text + "%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            }
        if (DropDownList1.SelectedItem.Value.Equals("Vivo"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text + "%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            }
        if (DropDownList1.SelectedItem.Value.Equals("Oppo"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text + "%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            }
        if (DropDownList1.SelectedItem.Value.Equals("Nokia"))
            {
                sql = "select *from SANPHAM sp where TENHANG like'" + DropDownList1.SelectedItem.Text + "%'";
                cmd = new SqlDataAdapter(sql, con);
                cmd.Fill(ds);
            } 
        if (DropDownList1.SelectedItem.Value.Equals("Khác"))
        {
            sql = "select *from SANPHAM sp where TENHANG not in (select tenhang from sanpham where tenhang like 'SamSung%' or tenhang like 'Nokia%' or tenhang like 'Vivo%'  or tenhang like 'Oppo%' or tenhang like 'Vsmart%' or tenhang like 'Iphone%' or tenhang like 'Xiaomi%' or tenhang like 'Huawei%')";
            cmd = new SqlDataAdapter(sql, con);
            cmd.Fill(ds);
        }
        
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

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        PopularGridView();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName.Equals("AddNew"))
        {
            try
            {
                string s = "insert into SANPHAM values (@tensp,@hangsx,@soluong,'Cái',@nuocsx,@giasp,null,@hinh)";
                SqlCommand cm = new SqlCommand(s, con);
                cm.Parameters.AddWithValue("@tensp", (GridView1.FooterRow.FindControl("TextBoxTenSP") as TextBox).Text.Trim());
                cm.Parameters.AddWithValue("@hangsx", (GridView1.FooterRow.FindControl("TextBoxHANGSX") as TextBox).Text.Trim());
                cm.Parameters.AddWithValue("@soluong", int.Parse((GridView1.FooterRow.FindControl("TextBoxSLT") as TextBox).Text.Trim()));
                cm.Parameters.AddWithValue("@nuocsx", (GridView1.FooterRow.FindControl("TextBoxNSX") as TextBox).Text.Trim());
                cm.Parameters.AddWithValue("@giasp", (GridView1.FooterRow.FindControl("TextBoxGIASP") as TextBox).Text.Trim());
                cm.Parameters.AddWithValue("@hinh", "/image_icon/DIENTHOAI/" + (GridView1.FooterRow.FindControl("FileUpload2") as FileUpload).FileName.Trim());

                cm.ExecuteNonQuery();
                PopularGridView();
            }
            catch
            {
                throw new Exception("Vui lòng điền đủ thông tin ");
            }
            

        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        PopularGridView();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        PopularGridView();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string s = "update SANPHAM set TENHANG = @tensp,HANGSX= @hangsx,SOLUONGSPTON= @soluong,NUOCSX= @nuocsx,GIASP = @giasp ,HINH= @hinh where MAHANG= @mahang";
        SqlCommand cm = new SqlCommand(s, con);
        cm.Parameters.AddWithValue("@tensp", (GridView1.Rows[e.RowIndex].FindControl("TextBoxTenSPEdit") as TextBox).Text.Trim());
        cm.Parameters.AddWithValue("@hangsx", (GridView1.Rows[e.RowIndex].FindControl("TextBoxHANGSXEdit") as TextBox).Text.Trim());
        cm.Parameters.AddWithValue("@soluong", int.Parse((GridView1.Rows[e.RowIndex].FindControl("TextBoxSLTEdit") as TextBox).Text.Trim()));
        cm.Parameters.AddWithValue("@nuocsx", (GridView1.Rows[e.RowIndex].FindControl("TextBoxNSXEdit") as TextBox).Text.Trim());
        cm.Parameters.AddWithValue("@giasp", (GridView1.Rows[e.RowIndex].FindControl("TextBoxGIASPEdit") as TextBox).Text.Trim());
        cm.Parameters.AddWithValue("@mahang", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cm.Parameters.AddWithValue("@hinh", "/image_icon/DIENTHOAI/" + (GridView1.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload).FileName.Trim());
        cm.ExecuteNonQuery();
        GridView1.EditIndex = 1;
        PopularGridView();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        PopularGridView();
    }
}