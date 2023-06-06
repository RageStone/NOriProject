using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class nHLogin : System.Web.UI.Page
{
    public string errorMessage = string.Empty;
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
                if(user == "admin" && pass == "admin1")
                {
                    errorMessage = "Welcome <b>" + user +"</b>";
                    Response.AddHeader("REFRESH", "3;URL=admin.aspx");
                }
                else
                {
                    errorMessage = "Loggin <b>" + user + "</b> in";
                    Response.AddHeader("REFRESH", "3;URL=nHMain.html");
                }
                
                //Response.Redirect("nHMain.html");
            }
            else //במידה והמשתמש לא קיים
            {
                errorMessage = "<b> Username </b> or <b> Password </b> are incorrect";
                //Response.Write("username or password are incorrect");
                Response.AddHeader("REFRESH", "5;URL=nHLogin.aspx"); //המתנה שתי שניות ומעבר לדף ההתחברות שוב
            }
        }
    }
}