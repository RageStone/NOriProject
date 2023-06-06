<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link rel="icon" type="image/png" href="Photos/familyGuyLogo.png" />
    <style>
        body {
            background-image: url(Photos/bBackrground-blurred.jpg);
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

       .but{
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
                text-decoration: none;
                font-family:  sans-serif;
                display: inline-block;
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
</head>
<body>
    <form id="form1" runat="server" action="admin.aspx">   
        <div style="text-align:center" class="login">     
                <h2><b>Manager</b></h2>
            <h4>Please insert a User to delete</h4>
                <input type="text" id="uname" name="uname" placeholder="Username"/>    
                <button type="submit" >Delete</button>
            <br />
            <br />
            <center>

                <div class="but">
                 <a style='text-align:left; inline-block;text-decoration:none; color:white' href="nHMain.html">Main</a>                 
                
            </div>
                <div class="but">
                    <a style=' text-decoration:none; color:white' href="nHLogin.aspx">Login</a>
                </div>
            </center>     
        <h4> <%=errorMessage%></h4>
           
        </div>
    </form>
</body>
</html>
