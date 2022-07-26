using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Contruction
/// </summary>
 namespace App_Code
 {

     public class Construction_SanPham
    {
        public DataTable SanPham = new DataTable();
	    public void CreateItem()
	    {
            SanPham.Columns.Add("MAHANG");
            SanPham.Columns.Add("TENHANG");
            SanPham.Columns.Add("HINH");
            SanPham.Columns.Add("GIASP");
        }
        public void InsertProduct(int mahang, string tenhang, string hinh, float giasp)
        {
            DataRow dong = SanPham.NewRow();
            dong[0] = mahang;
            dong[1] = tenhang;
            dong[2] = hinh;
            dong[3] = (decimal)giasp;
                
            SanPham.Rows.Add(dong);
	    }
        
    }
}