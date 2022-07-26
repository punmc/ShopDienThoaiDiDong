using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_control_Admin_LoadControl : System.Web.UI.UserControl
{
    String modul = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];

        switch (modul)
        {
            case "sanpham":
                plAdminLoadControl.Controls.Add(LoadControl("SanPham/SanPham_LoadControl.ascx"));
                break;
            case "taikhoan":
                plAdminLoadControl.Controls.Add(LoadControl("TaiKhoan/TaiKhoan_LoadControl.ascx"));
                break;
            case "banhang":
                plAdminLoadControl.Controls.Add(LoadControl("BanHang/BanHang_LoadControl.ascx"));
                break;
            case "lienhe":
                plAdminLoadControl.Controls.Add(LoadControl("LienHe/LienHe_LoadControl.ascx"));
                break;
            case "quangcao":
                plAdminLoadControl.Controls.Add(LoadControl("QuangCao/QuangCao_LoadControl.ascx"));
                break;
            
            
            
                

        }

        
    }
}