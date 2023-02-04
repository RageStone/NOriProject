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
        h4{
            font-size:25px;
            font-weight: 300;
            color: #8d8d8d;
            display:flow;
            font-family: 'Source Sans Pro', sans-serif;
        }

    </style>
    
    <script>
        function IsVaild() {


            let uname = document.getElementById('uname');
            let pass1 = document.getElementById('pass1');

            //the text
            let text = "";

            //checking uname

            //checking if fname is long enough or too short
            if ((uname.value.length < 2) || (uname.value.length > 8)) {
                text = text + "<br/> Username must be atleast then 2 letters and no more then 8";
                uname.focus();
                uname.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }


            if ((pass1.value.length < 4) || (pass1.value.length > 8)) {
                text = text + "<br/> Password must be atleast then 4 letters and no more then 8";
                pass1.focus();
                pass1.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }

            //password with letters and numbers

            var charCount = 0; // מונה אותיות
            var numCount = 0; // מונה ספרות

            for (i = 0; i < pass1.value.length; i++) {
                if (isNaN(pass1.value.charAt(i)) == true)
                    charCount++; // אות

                else
                    numCount++; // ספרה
            }

            if ((charCount == 0) || (numCount == 0)) {
                text = text + "<br/> A password must contain letters AND numbers";
                pass1.focus();
                pass1.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }

            if (text != "") {
                return false;
            }
        }
    </script>
    
</head>
<body>
    
    <br /><br /><br />
    <form id="form1" runat="server" action="nHLogin.aspx" onsubmit="return IsVaild();">       
        <div style="text-align:center" class="login">     
                <h2>Sign in</h2>
                <input type="text" id="uname" placeholder="Username"/>
                <input type="password" id="pass1" placeholder="Password"/>
                <h4>Dont Have An Account? <a href="nHRegister.html">Sign Up</a></h4>
                
                <button type="submit" onclick="return IsVaild();">Login</button>
                <p id="demo"></p>
        </div>
    </form>
    
</body>
</html>
