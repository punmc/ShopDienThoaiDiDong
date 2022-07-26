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
public partial class QL_KM_Admin : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        con.Open();
     
        try
        {
            if (Session["DangNhap"].Equals("1") &&Session["DangNhap"] != null)
            {
                LabelTenTK.Text = "Admin";
            }
            if (Session["DangNhap"].Equals("0") && Session["DangNhap"] != null)
            {
                Response.Redirect("DangNhap.aspx");
            }
        }
        catch
        {
            Response.Redirect("DangNhap.aspx");
        }
        Load_Data();
    }

    private void Load_Data()
    {

        if (!IsPostBack) {
            PopularGridView();
           
        }
        
    
    }

    private void PopularGridView()
    {
        if (DropDownListLoc.SelectedItem.Value.Equals("All") || DropDownListLoc.SelectedItem.Value.Equals("ALL")) 
        {
            string sql = "select *from SANPHAM sp , CHITIETKM ct , DOTKM d where sp.MAHANG = ct.MAHANG and ct.MADOTKM = d.MADOTKM";
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
        if (DropDownListLoc.SelectedItem.Value.Equals("Còn Hạn") || DropDownListLoc.SelectedItem.Value.Equals("Còn Hạn"))
        {
            string sql = "select *from SANPHAM sp , CHITIETKM ct , DOTKM d where sp.MAHANG = ct.MAHANG and ct.MADOTKM = d.MADOTKM and getdate() between NGAYBD and NGAYKT";
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
        if (DropDownListLoc.SelectedItem.Value.Equals("Hết Hạn") || DropDownListLoc.SelectedItem.Value.Equals("Hết Hạn"))
        {
            string sql = "select *from SANPHAM sp , CHITIETKM ct , DOTKM d where sp.MAHANG = ct.MAHANG and ct.MADOTKM = d.MADOTKM and ( getdate()<NGAYBD or getdate()>NGAYKT)";
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

        string s1 = "select MAHANG from SANPHAM where TENHANG=N'" +lb1.Text+ "'";
        SqlDataAdapter cm1 = new SqlDataAdapter(s1, con);
        DataTable ds1 = new DataTable();
        cm1.Fill(ds1);
        int mahang = int.Parse(ds1.Rows[0][0].ToString());

        string s2 = "delete from CHITIETKM  where MAHANG = @mahang and MADOTKM = @makm";
        SqlCommand cm2 = new SqlCommand(s2, con);
        cm2.Parameters.AddWithValue("@makm", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cm2.Parameters.AddWithValue("@mahang", mahang);
        cm2.ExecuteNonQuery();

        string s = "delete from  DOTKM where MADOTKM = @makm";
        SqlCommand cm = new SqlCommand(s, con);
      
        cm.Parameters.AddWithValue("@makm", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cm.ExecuteNonQuery();


        
   
        PopularGridView();
            
       
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try {
            if (e.CommandName.Equals("AddNew"))
            {

                string s = "insert into DOTKM values (@ngaybd,@ngaykt)";
                SqlCommand cm = new SqlCommand(s, con);
                cm.Parameters.AddWithValue("@ngaybd", (GridView1.FooterRow.FindControl("TextBoxNBD") as TextBox).Text.Trim());
                cm.Parameters.AddWithValue("@ngaykt", (GridView1.FooterRow.FindControl("TextBoxNKT") as TextBox).Text.Trim());
                cm.ExecuteNonQuery();

                string s1 = "select MADOTKM from DOTKM where NGAYBD ='" + (GridView1.FooterRow.FindControl("TextBoxNBD") as TextBox).Text.Trim() + "' and NGAYKT='" + (GridView1.FooterRow.FindControl("TextBoxNKT") as TextBox).Text.Trim() + "'";
                SqlDataAdapter cm1 = new SqlDataAdapter(s1, con);
                DataTable ds = new DataTable();
                cm1.Fill(ds);
                int ma = int.Parse(ds.Rows[0][0].ToString());

                string s2 = "select MAHANG from SANPHAM where TENHANG=N'"+(GridView1.FooterRow.FindControl("DropDownListTENHANG")as DropDownList).SelectedItem.Text+"'";
                SqlDataAdapter cm2 = new SqlDataAdapter(s2, con);
                DataTable ds2 = new DataTable();
                cm2.Fill(ds2);
                int mahang = int.Parse(ds2.Rows[0][0].ToString());

                string s3 = "insert into CHITIETKM values (@makm,@mahang,@tyle)";
                SqlCommand cm3 = new SqlCommand(s3, con);
                cm3.Parameters.AddWithValue("@makm", ma);
                cm3.Parameters.AddWithValue("@mahang",mahang);
                cm3.Parameters.AddWithValue("@tyle", (GridView1.FooterRow.FindControl("TextBoxTLGG") as TextBox).Text.Trim());
                cm3.ExecuteNonQuery();
                PopularGridView();

            }
        }
        catch
        {
            
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

        //string s1 = "select MADOTKM from DOTKM where NGAYBD ='" + (GridView1.Rows[.FindControl("TextBoxNBD") as TextBox).Text.Trim() + "' and NGAYKT='" + (GridView1.Rows[e.RowIndex].FindControl("TextBoxNKT") as TextBox).Text.Trim() + "'";
        //SqlDataAdapter cm1 = new SqlDataAdapter(s1, con);
        //DataTable ds = new DataTable();
        //cm1.Fill(ds);
        //int ma = int.Parse(ds.Rows[0][0].ToString()); 
        string s1 = "select MAHANG from SANPHAM where TENHANG=N'" + (GridView1.Rows[e.RowIndex].FindControl("DropDownListTENHANGEdit") as DropDownList).SelectedItem.Text + "'";
        SqlDataAdapter cm1 = new SqlDataAdapter(s1, con);
        DataTable ds1 = new DataTable();
        cm1.Fill(ds1);
        int mahang = int.Parse(ds1.Rows[0][0].ToString());

            string s = "update DOTKM set NGAYBD = @ngaybd , NGAYKT= @ngaykt where MADOTKM = @makm";
            SqlCommand cm = new SqlCommand(s, con);
            cm.Parameters.AddWithValue("@ngaybd", (GridView1.Rows[e.RowIndex].FindControl("TextBoxNBDEdit") as TextBox).Text.Trim());
            cm.Parameters.AddWithValue("@ngaykt", (GridView1.Rows[e.RowIndex].FindControl("TextBoxNKTEdit") as TextBox).Text.Trim());
            cm.Parameters.AddWithValue("@makm",Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));   
            cm.ExecuteNonQuery();

          

            string s2 = "update CHITIETKM set MAHANG= @mahang, TILEGIAMGIA= @tyle where MADOTKM = @makm";
            SqlCommand cm2 = new SqlCommand(s2, con);
            cm2.Parameters.AddWithValue("@makm", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
            cm2.Parameters.AddWithValue("@mahang",mahang);
            cm2.Parameters.AddWithValue("@tyle", (GridView1.Rows[e.RowIndex].FindControl("TextBoxTLGGEdit") as TextBox).Text.Trim());
            cm2.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            PopularGridView();

        
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        PopularGridView();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["DangNhap"] = "0";
        Response.Redirect("DangNhap.aspx");
    }
}