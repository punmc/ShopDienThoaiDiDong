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

     public class Construction_Cart
    {
        public DataTable GioHang = new DataTable();
	    public void CreateItem()
	    {
            GioHang.Columns.Add("MAHANG");
            GioHang.Columns.Add("TENHANG");
            GioHang.Columns.Add("HINH");
            GioHang.Columns.Add("GIASP");
            GioHang.Columns.Add("SOLUONG");
            GioHang.Columns.Add("MUCGIAMGIA");
        }
        public Boolean InsertProduct(int mahang, string tenhang, string hinh, float giasp, int soluong, Double mucgiamgia)
        {
            Boolean flag = false;
            foreach(DataRow d in GioHang.Rows)
            {
                if (int.Parse(d[0].ToString()) == mahang)
                { 
                    d[4]=int.Parse(d[4].ToString())+soluong;
                    flag=true;
                }
            }
            if (flag == false)
            {
                DataRow dong = GioHang.NewRow();
                dong[0] = mahang;
                dong[1] = tenhang;
                dong[2] = hinh;
                dong[3] = (decimal)giasp;
                dong[4] = soluong;
                dong[5] = mucgiamgia;
                GioHang.Rows.Add(dong);
                return true;
            }
            return false;
	    }
        public Double TongTien()
        {
            Double a = 0;
            foreach (DataRow d in GioHang.Rows)
            {
                a = Double.Parse(d["GIASP"].ToString()) - (Double.Parse(d["GIASP"].ToString()) * Double.Parse(d["MUCGIAMGIA"].ToString()));
            }
            return Math.Round(a,0);
        }
    }
}