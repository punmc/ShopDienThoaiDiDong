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
public partial class QL_DATHANG : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
        con.Open();
        try
        {
            if(Session["DangNhap"].Equals("1")||  Session["DangNhap"]!=null)
            {
                LabelTenTK.Text = "Admin";
            }
        }
        catch
        {
            Response.Redirect("DangNhap.aspx");
        }
        Load_Data();
        (GridView1.FooterRow.FindControl("TextBoxNXHD") as TextBox).Text = DateTime.Today.ToString();
       
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
        if (DropDownListLoc.SelectedItem.Text.Equals("All") ||DropDownListLoc.SelectedItem.Value.Equals("All"))
        {
            string sql = "select *from KHACHHANG kh , HOADON hd ,NHANVIEN nv where kh.MAKH= hd.MAKH  and nv.MANV = hd.MANV";
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
        if (DropDownListLoc.SelectedItem.Text.Equals("Not Total Money")||DropDownListLoc.SelectedItem.Value.Equals("Not Total Money"))
        {
            string sql = "select *from KHACHHANG kh , HOADON hd ,NHANVIEN nv where kh.MAKH= hd.MAKH  and nv.MANV = hd.MANV and (TONGTIEN is null or TONGTIEN= 0)";
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
        if (DropDownListLoc.SelectedItem.Text.Equals("Total Money") || DropDownListLoc.SelectedItem.Value.Equals("Total Money"))
        {
            string sql = "select *from KHACHHANG kh , HOADON hd ,NHANVIEN nv where kh.MAKH= hd.MAKH  and nv.MANV = hd.MANV and (TONGTIEN> 0)";
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
       
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        Label lb1 = (Label)GridView1.Rows[e.RowIndex].FindControl("LabelMaHang");
        string s2 = "delete from CHITIETKM  where MAHANG = @mahang and MADOTKM = @makm";
        SqlCommand cm2 = new SqlCommand(s2, con);
        cm2.Parameters.AddWithValue("@makm", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cm2.Parameters.AddWithValue("@mahang", int.Parse(lb1.Text));
        cm2.ExecuteNonQuery();

        string s = "delete from  DOTKM where MADOTKM = @makm";
        SqlCommand cm = new SqlCommand(s, con);

        cm.Parameters.AddWithValue("@makm", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cm.ExecuteNonQuery();

        PopularGridView();
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      if(e.CommandName.Equals("AddNew"))
      {
          string strmakh = "select MAKH from KHACHHANG where TENKH=N'" + (GridView1.FooterRow.FindControl("DropDownListTENKH") as DropDownList).SelectedItem.Text + "'";
          DataSet ds = new DataSet (); 
          SqlDataAdapter damahd = new SqlDataAdapter(strmakh,con);
          damahd.Fill(ds);

          string strmanv = "select MANV from NHANVIEN where HOTEN=N'" + (GridView1.FooterRow.FindControl("DropDownListTNV") as DropDownList).SelectedItem.Text + "'";
          DataSet ds1 = new DataSet();
          SqlDataAdapter damanv = new SqlDataAdapter(strmanv, con);
          damanv.Fill(ds1);

          SqlCommand s = new SqlCommand("insert into HOADON values(@makh,@manv,@noigiao,0,getdate())", con);
          s.Parameters.AddWithValue("@makh", ds.Tables[0].Rows[0][0]);
          s.Parameters.AddWithValue("@manv", ds1.Tables[0].Rows[0][0]);
          s.Parameters.AddWithValue("@noigiao", (GridView1.FooterRow.FindControl("TextBoxNG")as TextBox).Text);
          s.ExecuteNonQuery();
          PopularGridView();

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
        string strmakh = "select MAKH from KHACHHANG where TENKH=N'" + (GridView1.Rows[e.RowIndex].FindControl("DropDownListTENKHEdit") as DropDownList).SelectedItem.Text + "'";
        DataSet ds = new DataSet();
        SqlDataAdapter damahd = new SqlDataAdapter(strmakh, con);
        damahd.Fill(ds);

        string strmanv = "select MANV from NHANVIEN where HOTEN=N'" + (GridView1.Rows[e.RowIndex].FindControl("DropDownListTNVEdit") as DropDownList).SelectedItem.Text + "'";
        DataSet ds1 = new DataSet();
        SqlDataAdapter damanv = new SqlDataAdapter(strmanv, con);
        damanv.Fill(ds1);

        string s = "update HOADON set NGAYXUATHD = @ngayxhd ,MAKH = @makh, MANV  =@manv, NOIGIAO = @noigiao where MAHD = @mahd";
        SqlCommand cm = new SqlCommand(s, con);
        cm.Parameters.AddWithValue("@ngayxhd", (GridView1.Rows[e.RowIndex].FindControl("TextBoxNXHDEdit") as TextBox).Text.Trim());
        cm.Parameters.AddWithValue("@makh", ds.Tables[0].Rows[0][0]);
        cm.Parameters.AddWithValue("@manv", ds1.Tables[0].Rows[0][0]);
        cm.Parameters.AddWithValue("@noigiao", (GridView1.Rows[e.RowIndex].FindControl("TextBoxNGEdit") as TextBox).Text.Trim());
        cm.Parameters.AddWithValue("@mahd", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cm.ExecuteNonQuery();
        GridView1.EditIndex = -1;
        PopularGridView();
    }



    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        PopularGridView();
        (GridView1.FooterRow.FindControl("TextBoxNXHD") as TextBox).Text = DateTime.Today.ToString();
    }

 
    protected void DropDownListLoc_SelectedIndexChanged(object sender, EventArgs e)
    {

        PopularGridView();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        PopularGridView();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("DangNhap.aspx");
        
    }
}