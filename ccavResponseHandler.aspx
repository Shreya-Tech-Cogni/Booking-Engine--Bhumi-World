<%@ Page Language="C#" AutoEventWireup="true" Inherits="ResponseHandler" Codebehind="ccavResponseHandler.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Thank You</h1>
    </div>
    </form>




   <script>
       

        const queryString = window.location.search;
        console.log(queryString);
        const urlParams = new URLSearchParams(queryString);
        const orderid = urlParams.get('orderid')
        console.log(orderid);
        const finalurl = "?orderid=" + orderid    
        console.log(finalurl);
        
   </script>
</body>
</html>
