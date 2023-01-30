<%@ Page Language="C#" AutoEventWireup="true" CodeFile="nHLogin.aspx.cs" Inherits="nHLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-image: url(Photos/bBackrground.jpg);
        }

        .login {
            overflow: hidden;
            background-color: white;
            padding: 40px 30px 30px 30px;
            border-radius: 10px;
            width: 400px;
            margin: auto;

            top: 50%;
            left:50%;
            
        }

            .login > input {
                font-family: "Asap", sans-serif;
                display: block;
                border-radius: 5px;
                font-size: 16px;
                background: white;
                width: 100%;
                border: 0;
                padding: 10px 10px;
                margin: 15px -10px;
            }

            .login > button {
                cursor: pointer;
                color: #fff;
                font-size: 16px;
                text-transform: uppercase;
                width: 80px;
                border: 0;
                padding: 10px 0;
                margin-top: 10px;
                margin-left: -5px;
                border-radius: 5px;
                background-color: #f45b69;
            }

                .login > button:hover {
                    background-color: #f24353;
                }

       


        h2{
            font-size: 3em;
                    font-weight: 300;
                    color: #a7a7a7;
                    display: inline-block;
                    padding-bottom: 5px;
                    text-shadow: 1px 1px 3px #23203b;
                    font-family: 'Source Sans Pro', sans-serif;
        }


        a {
            text-decoration: none;
            color: rgba(255, 255, 255, 0.6);
            position: absolute;
            right: 10px;
            bottom: 10px;
            font-size: 12px;
        }
    </style>
    <script src="Scripts.js"></script>
<script>
    function IsValid() {

        var Username = document.getElementById('username');
        Username.style.backgroundColor = "white";

        var password1 = document.getElementById('password');
        password1.style.backgroundColor = "white";

        var Msg = ""; // נתחיל מהודעה ריקה

        if (Username.value == '') {
            Msg = "נא למלא שם משתמש <br/>";
            Username.focus();
            Username.style.backgroundColor = "red";
        }

        // בדיקת קלט סיסמה

        if (password1.value == '') {
            Msg = Msg + "נא למלא סיסמה <br/>";
            password1.focus();
            password1.style.backgroundColor = "red";
        }

        // בדיקת אורך סיסמה

        if ((password1.value.length < 4) || (password1.value.length > 8)) {
            Msg = Msg + "נא להזין סיסמה בין 4 ל-8 תווים <br/>";
            password1.focus();
            password1.style.backgroundColor = "red";
        }

        // סיסמה עם ספרות ואותיות

        var charCount = 0; // מונה אותיות
        var numCount = 0; // מונה ספרות

        for (i = 0; i < password1.value.length; i++) {
            if (isNaN(password1.value.charAt(i)) == true)
                charCount++; // אות

            else
                numCount++; // ספרה
        }

        if ((charCount == 0) || (numCount == 0)) {
            Msg = Msg + "סיסמה חייבת להכיל גם ספרות וגם אותיות <br/>";
            password1.focus();
            password1.style.backgroundColor = "red";
        }

        document.getElementById('ErrorSummary').innerHTML = Msg;
        if (Msg == "") {
            return true; // אם הודעת שגיאה ריקה = אמת
        }
        else
            return false;
    }
    </script>
    
</head>
<body>
    
    <br /><br /><br />
    <form id="form1" runat="server" action="nHLogin.aspx" onsubmit="alert('on form'); return IsVaild();">       
        <div style="text-align:center" class="login">     
            <form >
                <h2>Sign in</h2>
                <input type="text" id="username" placeholder="Username"/>
                <input type="password" id="password" placeholder="Password"/>
                <button type="submit" onclick="return IsVaild();">Login</button>
                <div id="ErrorSummary">
`               </div>
            </form>           

        </div>
    </form>
</body>
</html>
