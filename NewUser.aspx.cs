using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewUser : System.Web.UI.Page
{
    public string message = "no b";
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
                string bday = Request.Form["bdate"];
                
                string sql = "select * from tbl_users where uname= '" + uname + "'";
               
                if (MyAdoHelperAccess.IsExist(db, sql)) //אם שם המשתמש קיים
                {
                    //message = "user already exists";
                    //Response.Write("שם המשתמש קיים, בחר אחד אחר");
                    message = "User already exists.";
                    Response.AddHeader("REFRESH", "2;URL=nHRegister.html"); //המתנה שתי שניות ומעבר לדף ההרשמה שוב
                }

                else //הגדרת שאילתת הוספה
                {
                    string cellNum = "no";
                    string phoneNum = "bitches";
                    if(phone != "")
                    {
                         cellNum = phone.Substring(0, 3);
                         phoneNum = phone.Substring(3, 7);
                    }
                    

                    string creation = "INSERT INTO tbl_users ( uname, fname, lname, upass, bday, email, gender, cellNum, phoneNum ) VALUES('" + uname + "', '" + fname + "', '" + lname + "', '" + pass+ "','" + bday + "','" + email + "','" + Request.Form["Gender"] + "','" + cellNum + "','" + phoneNum + "');";


                    MyAdoHelperAccess.DoQuery("Database.mdb", creation); //בצע את השאילתא
                    //Response.Write("תודה לך על ההרשמה, מיד תועבר/י לדף ההתחברות");
                    message = "Thanks you for registering,  you will be now redirected to the home page.";
                    //Response.Write(" The bday is: " + Request.Form["bday"]);
                    Response.AddHeader("REFRESH", "3;URL=nHMain.html");
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