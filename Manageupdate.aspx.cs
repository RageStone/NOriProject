using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    public string errorMessage = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string db = "Database.mdb";
            MyAdoHelperAccess.ConnectToDb(db);
            string user = Request.Form["uname"];
            string fname = Request.Form["fname"];
            string sql = "select * from [tbl_users] where uname='" + user + "'";
          
            if (MyAdoHelperAccess.IsExist("Database.mdb", sql) == true)
            {
                string sqlUpdate = "UPDATE tbl_users SET Fname ='" + fname + "'WHERE uname ='" + user + "';";
                MyAdoHelperAccess.DoQuery(db, sqlUpdate);
                errorMessage = "Updated <b>" + user + "</b>'s first name to  <b>" + fname + "</b>";
            }
            else
            {
                errorMessage = "<b>" + user + "</b> does not exist.";
            }
        }
    }
}