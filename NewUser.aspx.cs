using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserRow"] == null) //הוספת משתמש חדש
        {
            if (Request.Form["submit"] != null)
            {
                string db = "Database.mdb";
                MyAdoHelperAccess.ConnectToDb(db);
                string uname = Request.Form["uname"];
                string fname = Request.Form["fname"];
                string lname = Request.Form["lname"];
                string pass = Request.Form["pass1"];
                string email = Request.Form["email"];
                string phone = Request.Form["phone"];
                string bday = Request.Form["bday"];
                string cellNum = phone.Substring(0, 3);
                string phoneNum = phone.Substring(3, 7);
                if(uname == null || fname == null || lname == null || pass == null || email == null || phone == null)
                {
                    Response.Write("NOOOOOOOO");
                    Response.AddHeader("REFRESH", "5;URL=nHRegister.html");
                }
                if(bday == "")
                {
                    Response.Write("no bitchessssssssssssssssssss");
                    Response.AddHeader("REFRESH", "5;URL=nHRegister.html");
                    
                }
               // string uname = Request.Form["uname"]; //הגדרת משתמש לחיפוש
                string sql = "select * from tbl_users where uname= '" + uname + "'";
               
                if (MyAdoHelperAccess.IsExist(db, sql)) //אם שם המשתמש קיים
                {
                    Response.Write("שם המשתמש קיים, בחר אחד אחר");
                    Response.AddHeader("REFRESH", "2;URL=nHRegister.html"); //המתנה שתי שניות ומעבר לדף ההרשמה שוב
                }

                else //הגדרת שאילתת הוספה
                {
                    string bbday = "no bitches";
                    //string message = "message ur mom";
                   /* sql = "INSERT INTO tbl_users (uname, Fname, Lname, upass, bday, email, gender, cellNum, phoneNum)";
                    sql += " VALUES ('" + Request.Form["uname"] + "' , '" + Request.Form["fname"] + "' , '" + Request.Form["lname"] + "' , '" + Request.Form["pass1"];
                    sql += "' , '" + bbday + "' , '" + Request.Form["email"] + "' , '" + Request.Form["gender"] + "' , '" + cellNum + "' , '" + phoneNum;
                    sql += "');";*/

                   
                    string creation = "INSERT INTO tbl_users ( uname, fname, lname, upass, email, gender, cellNum, phoneNum ) VALUES('" + uname + "', '" + fname + "', '" + lname + "', '" + pass+ "','" + email + "','" + Request.Form["Gender"] + "','" + cellNum + "','" + phoneNum + "');";


                    MyAdoHelperAccess.DoQuery("Database.mdb", creation); //בצע את השאילתא
                    Response.Write("תודה לך על ההרשמה, מיד תועבר/י לדף ההתחברות");
                    Response.AddHeader("REFRESH", "2;URL=nHMain.html");
                }
            }
        }

        else //משתמש קיים עורך פרטים
        {
            if (Request.Form["submit"] != null)
            {
                string db = "Database.mdb";
                MyAdoHelperAccess.ConnectToDb(db);

                string uname = Session["uname"].ToString(); //הגדרת משתמש לחיפוש
                string sql;

                sql = "UPDATE  tbl_users SET Fname = '" + Request.Form["firstname"] + "', Lname = '" + Request.Form["lastname"] + "' , upass = '" + Request.Form["password"] +
                    "' , bday = " + "#" + Request.Form["day"] + "/" + Request.Form["month"] + "/" + Request.Form["year"] + "# , email = '" + Request.Form["email"] + "' , gender = '" + Request.Form["gender"] +
                    "' , cellNum = '" + Request.Form["cell"] + "' , phoneNum = '" + Request.Form["phonenumber"] +
                    "' WHERE uname = '" + uname + "';";

                MyAdoHelperAccess.DoQuery(db, sql); //בצע את השאילתא
                Response.Write("תודה לך על העדכון, מיד תתנתק");
                Response.AddHeader("REFRESH", "2;URL=logOut.aspx");
            }
        }

    }
}