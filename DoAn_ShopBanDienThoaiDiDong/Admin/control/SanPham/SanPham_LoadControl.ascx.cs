using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_control_SanPham_SanPham_LoadControl : System.Web.UI.UserControl
{
    String product = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["product"] != null)
            product = Request.QueryString["product"];
        switch (product)
        {
            case "danhsachsp":
                plSanPham.Controls.Add(LoadControl("DanhSachSP/DanhSachSP_LoadControl.ascx"));
                break;
            case "hangsanxuat":
                plSanPham.Controls.Add(LoadControl("QuanLyHangSanXuat/HangSanXuat_LoadControl.ascx"));
                break;
            case "giasanpham":
                plSanPham.Controls.Add(LoadControl("QuanLyTheoGiaSP/GiaSanPham_LoadControl.ascx"));
                break;
        }
    }
}