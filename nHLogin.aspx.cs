using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class nHLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) //For the first page load info
        {
            string db = "Database.mdb";
            MyAdoHelperAccess.ConnectToDb(db);
            string user = Request.Form["uname"];
            string pass = Request.Form["pass1"];

            string sql = "select * from [tbl_users] where uname='" + user + "' and upass='" + pass + "'";
            if (MyAdoHelperAccess.IsExist("Database.mdb", sql) == true) //במידה והמשתמש קיים
            {
                Response.Redirect("nHMain.html");

            }
            else //במידה והמשתמש לא קיים
            {
                Response.Write("username or password are incorrect");
                Response.AddHeader("REFRESH", "10;URL=nHLogin.aspx"); //המתנה שתי שניות ומעבר לדף ההתחברות שוב
            }
        }
    }
}