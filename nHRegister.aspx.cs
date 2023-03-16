using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class nHRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) //For the first page load info
        {
            string db = "Database.mdb";
            MyAdoHelperAccess.ConnectToDb(db);
            string uname = Request.Form["uname"];
            string fname = Request.Form["fname"];
            string lname = Request.Form["lname"];
            string pass = Request.Form["pass1"];
            
            string email = Request.Form["email"];

            string phone = Request.Form["phone"];
            string cellNum = phone.Substring(0, 3);
            string phoneNum = phone.Substring(3, 7);
            //Response.Write(cellNum + "-" + phoneNum);
            //string bday = Request.Form["bday"];
            string gender = " ";
            if (Request.Form["Gender"] != null)
            {
                 gender = Request.Form["Gender"];
            }
            //Response.Write(gender);

            
            string yn = " ";

                string search = "select * from [tbl_users] where uname='" + uname + "';";
                string creation = "INSERT INTO tbl_users ( uname, fname, lname, upass, email, gender, cellNum, phoneNum ) VALUES('" + uname + "', '" + fname + "', '" + lname + "', '" + pass + "','" + email + "','"+ gender + "','" + cellNum +"','"+ phoneNum +"');";

                if (MyAdoHelperAccess.IsExist("Database.mdb", search) == true)
                {
                    Response.Write("user already exists " + uname);
                    Response.AddHeader("REFRESH", "5;URL=nHRegister.aspx");
                }
                else
                {
                    MyAdoHelperAccess.DoQuery("Database.mdb", creation);
                    Response.Write("User created successfully");
                    Response.AddHeader("REFRESH", "5;URL=nHMain.html");

                }
                yn = "error";

                /*
                string sql = "select * from [tbl_users] where uname='" + user + "' and upass='" + pass + "'";
                if (MyAdoHelperAccess.IsExist("Database.mdb", sql) == true) //במידה והמשתמש קיים
                {
                    Response.Redirect("nHMain.html");
                }
                else //במידה והמשתמש לא קיים
                {
                    Response.Write("username or password are incorrect");
                    Response.AddHeader("REFRESH", "10;URL=nHLogin.aspx"); //המתנה שתי שניות ומעבר לדף ההתחברות שוב
                }*/
            

        }
    }
}