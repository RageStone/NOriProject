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
            string sql = "select * from [tbl_users] where uname='" + user + "'";
          
            if (MyAdoHelperAccess.IsExist("Database.mdb", sql) == true)
            {
                string sqlDelete = "delete from [tbl_users] where uname='" + user + "'";
                MyAdoHelperAccess.DoQuery(db, sqlDelete);
                errorMessage = "Deleted <b>" + user + "</b> from <b>" + db + "</b>";
            }
            else
            {
                errorMessage = "<b>" + user + "</b> does not exist.";
            }
        }
    }
}