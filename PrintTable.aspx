﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintTable.aspx.cs" Inherits="PrintTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<%
    if (Application["VisitCount"] == null)
        Application["VisitCount"] = 0;
    else
        Application["VisitCount"] = (int)Application["VisitCount"] + 1;
    Response.Write("מספר המבקרים עד כה:" + Application["VisitCount"]);
%>
    </div>
       
    </form>
     <button onclick="history.go(-1)">Go Back</button>
</body>
</html>