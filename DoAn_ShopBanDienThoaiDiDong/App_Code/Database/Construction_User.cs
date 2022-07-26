using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for User
/// </summary>
namespace App_Code
{
	public class Construction_User
	{
        public DataTable tk = new DataTable();
        public Construction_User()
        {
        }
        public void createTK()
        {
            tk.Columns.Add("MAKH");
            tk.Columns.Add("TENKH");
        }

        public void InsertInfo(int makh, String tenkh)
        {
            DataRow info = tk.NewRow();
            info[0] = makh;
            info[1] = tenkh;
            tk.Rows.Add(info);
        }
	}
}