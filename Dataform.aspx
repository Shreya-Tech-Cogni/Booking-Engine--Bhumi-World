<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dataform.aspx.cs" Inherits="bramhacorp.Dataform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
<script>
    window.onload = function () {
        var d = new Date().getTime();
        document.getElementById("tid").value = d;
    };
   
   
</script>
</head>
<body>
    <form method="post" name="customerData" action="requesthandler.aspx">
        <table width="40%" height="100" border='1' align="center"><caption><font size="4" color="blue"><b>Payment Data </b></font></caption></table>
    <table width="40%" height="100" border='1' align="center">
        
         <tr> 
            <td colspan="2"> Compulsory information</td>
         </tr>
	<tr>
		<td>TID	:</td><td><input type="text" name="tid" id="tid" readonly /></td>
	</tr>
         <tr style="display:none">
            <td>Merchant Id</td>
            <td><input type="hidden" name="merchant_id" id="merchant_id" value="268320"/></td>
         </tr>
        <tr>
            <td>Order Id</td>
            <td><input type="text" name="order_id" runat="server" id="order_id" readonly value=""/></td>
         </tr>
         <tr>
            <td>Amount</td>
            <td><input type="text" name="amount" value="1.00"/></td>
         </tr>
         <tr>
            <td>Currency</td>
            <td><input type="text" name="currency" value="INR"/></td>
         </tr>
         <tr>
            <td>Redirect URL</td>
            <td><input type="hidden" id="urlRediret" runat="server" name="redirect_url" value="ccavResponseHandler.aspx"/></td>
         </tr>
	     <tr>
            <td>Cancel URL</td>
            <td><input type="hidden" name="cancel_url" readonly value="ccavResponseHandler.php"/></td>
         </tr>
         <tr>
            <td colspan="2">Billing information:</td>
         </tr>
         <tr>
            <td>Billing Name</td>
            <td> <asp:Label ID="lblBillingName" runat="server" Text=""></asp:Label></td>
           
         </tr>
         <tr>
            <td>Billing Address:</td>
            <td><asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></td>
         </tr>
         <tr>
            <td>Billing City:</td>
            <td><asp:Label ID="lblcity" runat="server" Text=""></asp:Label></td>
         </tr>
         <tr>
            <td>Billing State:</td>
            <td><asp:Label ID="lblstate" runat="server" Text=""></asp:Label></td>
         </tr>
         <tr>
            <td>Billing Zip:</td>
            <td><asp:Label ID="lblzip" runat="server" Text=""></asp:Label></td>
         </tr>
         
         <tr>
            <td>Billing Tel:</td>
            <td><asp:Label ID="lblphone" runat="server" Text=""></asp:Label></td>
         </tr>
         <tr>
            <td>Billing Email:</td>
            <td><asp:Label ID="lblemail" runat="server" Text=""></asp:Label></td>
         </tr>        
         <tr>
          	<td></td>
			<td><input type="submit" value="Checkout" /></td>
         </tr>
    </table>
    
        
        <asp:Label ID="lblorderid" runat="server" Text="" visible="false"></asp:Label>
    </form>


</body>
</html>
