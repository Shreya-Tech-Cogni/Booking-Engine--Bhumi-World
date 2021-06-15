<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="bramhacorp.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus�">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>Modal Payments</title>

<style type="text/css">
	.button_cont { width:100%; }
	#submitBtn {
		font-family:Arial;
		color: #494949;
		background:#f1f1f1;
		text-transform: uppercase;
		text-decoration: none;
		padding: 20px;
		border: 4px solid #494949;
		display: inline-block;
		transition: all 0.4s ease 0s;
		cursor:pointer;
	}
	#submitBtn.disabled { 
		background:#ddd;
		border-color:#ddd;
		color:#666 !important;
	}

	#submitBtn:hover {
		color: #ffffff !important;
		background: #fe7865;
		border-color: #fe7865 !important;
		transition: all 0.4s ease 0s;
	}
	.center { position:absolute; top:50%; left:50%; -webkit-transform:translate(-50%,-50%); -moz-transform:translate(-50%,-50%); transform:translate(-50%,-50%); }
</style>
 </head>
     <body onload="SubmitPay();">
       
		<form id="f1" runat="server">
			<asp:HiddenField ID="hdkey" runat="server" />
		</form>
  <%--<div id="" class="center">
		 <input type="button" id="submitBtn" class="disabled"  value="Pay with BillDesk" id="pay" disabled onclick="SubmitPay();"  />	
  </div> --%>     
		      
  <script type="text/javascript" src='https://pgi.billdesk.com/payments-checkout-widget/src/app.bundle.js'></script>
  <script type="text/javascript">

	var x, t, y = "";
	 function SubmitPay() {
		 bdPayment.initialize({
             msg: document.getElementById("hdkey").value,
			 //'BDSKUATY|ABC7123|NA|2.0|NA|NA|NA|INR|NA|R|bdskuaty|NA|NA|F|NA|NA|NA|NA|NA|NA|NA|NA|AAD51A132324FA2559428D254D4233AB3E11BFC1E7C07D8A29B5EE00476F990F',
             callbackUrl: 'https://engage.bramhacorp.in/thecollection/confirmation.aspx',
			 options : {
				enableChildWindowPosting : true,
				enablePaymentRetry : true,
				retry_attempt_count: 3
			 }
		 }); 
	 }

 document.addEventListener('readystatechange', function(event) {

    if (event.target.readyState === "interactive") {
        //alert("All HTML DOM elements are accessible");
    }

    if (event.target.readyState === "complete") {
        //alert("Now external resources are loaded too, like css,src etc... ");
		var button = document.getElementById('submitBtn');
		    button.disabled = false;
			button.classList.remove("disabled")
    }
});

 </script>
</body>
</html>