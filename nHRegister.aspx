<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="nHRegister.aspx.cs" Inherits="nHRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
        <script>
        function validateForm() {
            /*
            let x = document.forms["myForm"]["fname"].value;
            let lname = document.forms["myForm"]["lname"].value;
            let bdate = document.forms["myForm"]["bdate"].value;
            let phone = document.forms["myForm"]["phone"].value;
            let email = document.forms["myForm"]["email"].value;
            let uname = document.forms["myForm"]["uname"].value;
            let pass1 = document.forms["myForm"]["pass1"].value;
            let pass2 = document.forms["myForm"]["pass2"].value;
            */
            let fname = document.getElementById('fname');
            let lname = document.getElementById('lname');
            let bdate = document.getElementById('bdate');
            let phone = document.getElementById('phone');
            let email = document.getElementById('email');
            let uname = document.getElementById('uname');
            let pass1 = document.getElementById('pass1');
            let pass2 = document.getElementById('pass2');
            let male = document.getElementById('male');
            let female = document.getElementById('female');
            let gender = document.getElementById('gender');


            //the text
            let text = "";

            //checking fname

            //checking if fname is long enough or too short
            if ((fname.value.length < 2) || (fname.value.length > 8)) {
                text = text + "<br/> First name must be atleast then 2 letters and no more then 8";
                fname.focus();
                fname.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }
            //checking lname

            //checking if lname is long enough or too short
            if ((lname.value.length < 2) || (lname.value.length > 10)) {
                text = text + "<br/> Last name must be atleast then 2 letters and no more then 10";
                lname.focus();
                lname.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }
            //checking date
            if (bdate.value == "") {
                text = text + "<br /> No bdate";
                bdate.focus();
                bdate.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }
            //checking gender
            if ((male.checked == false) && (female.checked == false)) {
                text = text + "<br /> Please select a gender";
                gender.focus();
                gender.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }
            //checking phone

            //checking phone length
            if (phone.value.length != 10) {
                text = text + "<br/> Phone number must be 10 numbers";
                phone.focus();
                phone.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }
            //checking the email
            if (email.value == "") {
                text = text + "<br /> No email";
                email.focus();
                email.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }
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

            // confirm password

            if (pass1.value != pass2.value) {
                text = text + "<br/> Please enter the same passwords";
                pass2.focus();
                pass2.style.backgroundColor = "red";
                document.getElementById("demo").innerHTML = text;
            }




            if (text != "") {
                return false;
            }
        }
        </script>
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
            left: 50%;
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




        h2 {
            font-size: 3em;
            font-weight: 300;
            color: #a7a7a7;
            display: inline-block;
            padding-bottom: 5px;
            text-shadow: 1px 1px 3px #23203b;
            font-family: 'Source Sans Pro', sans-serif;
        }


        h4 {
            font-size: 25px;
            font-weight: 300;
            color: #8d8d8d;
            display: flow;
            font-family: 'Source Sans Pro', sans-serif;
        }
    </style>
    <style>
         @import url(https://fonts.googleapis.com/css?family=Lato);
        .container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            font-family: 'Source Sans Pro', sans-serif;
        }

        label {
            user-select: none;
        }

        input[type="radio"] {
            display: none;
        }

            input[type="radio"] + label {
                z-index: 10;
                margin: 0 10px 10px 0;
                position: relative;
                color: #ced4da;
                text-shadow: 0 1px 0 rgba(255, 255, 255, 0.1);
                font-weight: bold;
                background-color: #ffffff;
                border: 2px solid #ced4da;
                cursor: pointer;
                transition: all 200ms ease;
            }

            input[type="radio"]:checked + label {
                color: #495057;
                background-color: #ced4da;
            }

            input[type="radio"] + label {
                padding: 5px 20px;
                border-radius: 10px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server" action="nHRegister.aspx" onsubmit="return validateForm()" method="post">
        <div class="login" style="text-align:center">
                <h2>Register</h2>
                <input type="text" name="fname" id="fname" placeholder="Firstname"/>

                <input type="text" name="lname" id="lname" placeholder="Lastname"/>

                <input type="date" name="bdate" id="bdate" placeholder="Birth Date"/>

                    <div class="container" id="gender">
                        <input type='radio' id='male'  name='gender'/>
                        <label for='male'>Male</label>
                        <input type='radio' id='female' name='gender'/>
                        <label for='female'>Female</label>
                    </div>

                <input type="number" name="phone" id="phone" placeholder="Phone Number"/>

                <input type="email" name="email" id="email" placeholder="Email"/>

                <input type="text" name="uname" id="uname" placeholder="Username"/>

                <input type="password" name="pass1" id="pass1" placeholder="Password"/>

                <input type="password" name="pass2" id="pass2" placeholder="Confirm Password"/>

                <h4>Already Have An Account? <a href="nHLogin.aspx">Sign in</a></h4>
                <button type="submit">Submit</button>
                
              
                <p id="demo"></p>
            </div>
    </form>
</body>
</html>
