<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Thanks.aspx.cs" Inherits="bramhacorp.Thanks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Booking</title>
    <meta charset="utf-8" />
    <!-- Favicon -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
        name='viewport' />
    <link href="booking.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
                        <asp:Panel ID="pnlpay" Visible="true" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color: #ffffff;">
                                    <div class="righttimer">
                                        <asp:Label ID="lblpay" runat="server"></asp:Label>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">
                                        <asp:Label Text="Payment Successful" ID="lblheader" runat="server" /></span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101" style="width: 500px;">
                                            <asp:Label ID="lblpaymentmsg" Text="Thank You for Booking With Us" runat="server" />
                                        </div>
                                    </div>
                                    <asp:Panel ID="pnlsuccess" Visible="true" runat="server">
                                        <img src="images/paid1.png" class="imgsuccess" />

                                    </asp:Panel>
                                   
                                    <asp:Panel ID="pnlthanks" Visible="true" runat="server">

                                        <div style="display: block; text-align: center;">
                                            <asp:LinkButton runat="server" ID="LinkButton38" Style="width: 200px; margin-right: 0px !important; margin-top: 40px;"
                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                >
                                                Thank you
                                         
                                            </asp:LinkButton>
                                            
                                        </div>
                                    </asp:Panel>
                                     <div style="margin-top:20px"><a href="https://bhumiworldvr.cognilements.com/">Back To Booking Engine</a>  </div>
                                </div>
                            </asp:Panel>
    </form>
</body>
</html>
