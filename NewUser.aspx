<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="NewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style.css" rel="stylesheet" />
    <style>
                h4{
            font-size:25px;
            font-weight: 300;
            color: #8d8d8d;
            display:flow;
            font-family: 'Source Sans Pro', sans-serif;
        }
    </style>
    <style>
        #myProgress {
            width: 100%;
            background-color: #ddd;

        }
        .box{
                        overflow: hidden;
            background-color: white;
            padding: 40px 30px 30px 30px;
            border-radius: 10px;
            width: 400px;
            margin: auto;

            top: 50%;
            left:50%;
        }
        
        #myBar {
            width: 100%;
            height: 30px;
            background-color: #04AA6D;
            animation-name: progress;
            animation-duration: 5s;
            animation-delay: 0s;
        }
        @keyframes progress {
            0% {
                width: 0%;
            }

            100% {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box" >
            <center>
                <h4> <b> <%=message %></b></h4>
                </center>
           <!-- <div id="myProgress" style="border-radius: 10px;">
                <div style="border-radius: 10px;" id="myBar"></div>
            </div>-->
            

        </div>
    </form>j
    
</body>
</html>
