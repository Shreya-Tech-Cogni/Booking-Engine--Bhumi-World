<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmation.aspx.cs" Inherits="bramhacorp.confirmation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <link href="plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
    
    <style type="text/css">
              .mybutton:focus {outline:0;}
                       .preloader
         {
        position: fixed;
    left: 0;
    top: 0;
    z-index: 9999;
    width: 100%;
    height: 100%;
    overflow: visible;
    background:#ffffff;
         }
         
              #preloader
         {
        position: fixed;
    left: 0;
    top: 0;
    z-index: 9999;
    width: 100%;
    height: 100%;
    overflow: visible;
    background:#ffffff;
         }
         
           @keyframes blink {
      0% {
             opacity:1;
      }
      50% {
              opacity:0.2;
      }
      100% {
             opacity:1;
      }
  }
  @-webkit-keyframes blink {
      0% {
            opacity:1;
      }
      50% {
            opacity:0.2;
      }
      100% {
             opacity:1;
      }
  }

   .preloadercss {

     text-align:center;   
      -moz-transition:all 0.5s ease-in-out;
      -webkit-transition:all 0.5s ease-in-out;
      -o-transition:all 0.5s ease-in-out;
      -ms-transition:all 0.5s ease-in-out;
      transition:all 0.5s ease-in-out;
      -moz-animation:blink normal 1.5s infinite ease-in-out;
      /* Firefox */
      -webkit-animation:blink normal 1.5s infinite ease-in-out;
      /* Webkit */
      -ms-animation:blink normal 1.5s infinite ease-in-out;
      /* IE */
      animation:blink normal 1.5s infinite ease-in-out;
      /* Opera */
  }
        /* Style applied to the spin button once a power has been selected */ .clickable {
            cursor: pointer;
        }
        /* Other misc styles */ .margin_bottom {
            margin-bottom: 5px;
        }

        #cntdwn {
            position: absolute;
            display: block;
            top: 80px;
            right: 30px;
        }
    </style>
        <style type="text/css">
        .CalendarCSS {
            background-color: #424b57;
            color: Snow;
        }

        .ajax__calendar_header {
            background-color: #393a3c;
        }

        .ajax__calendar_today {
            color: AliceBlue;
            font-weight: bold;
            text-decoration: underline;
            font-family: MS Sans Serif;
        }

        .divimgheight {
            height: calc(100vh - 150px);
        }

        .imgclass {
            height: 100%;
            width: auto
        }

        @media (max-width: 980px) {
            .imgclass {
                height: auto;
                width: 100%;
            }
          
        }
    </style>
    <style>
        #wheel {
            display: inline-block;
            position: relative;
            overflow: hidden;
        }

            #wheel:after {
                content: "";
                background: red;
                border: 2px solid white;
                position: absolute;
                top: -7px;
                left: 50%;
                width: 10px;
                height: 10px;
                margin-left: -7px;
                transform: rotate(45deg);
            }
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" >

        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

      
        <%--    <img src="loginscript/bramhacorp.png" style="width: 180px;
    height: auto;
    margin: 5px 0px 10px 5px;"/> 
        --%>

        <asp:UpdatePanel ID="upfull" runat="server">
            <ContentTemplate>
                  <asp:UpdateProgress ID="UpdateProgress12" runat="server">
            <ProgressTemplate>
              <div class="preloader">
                    <img src="images/avnirlogo.png"  class="preloadercss" style="width: 250px; position: fixed; top: 40%; left: 50%; transform: translate(-50%, -50%); z-index: 11111; overflow: visible;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
                <div id="timerdiv" runat="server" class="righttimer">
                    <b>
                        <div id="countdown"></div>
                    </b>
                </div>
                <asp:Panel ID="pnlnewk" Visible="false" runat="server">  
                <div id="divbody" runat="server">

                    <div class="topdiv">
                        <div class="displayinline">
                            <img src="images/favicon.png" class="iconclassmargin" style="width: 60px; height: 64px; object-fit: cover; margin-bottom: 20px;" />
                        </div>
                        <div class="displayinline menudisplay">
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep1" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
               
                    <i class="material-icons-outlined stepicon101 headingsubcolor">king_bed</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                        <%= Session["unitdetails"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                             <%= Session["step1"].ToString() %></div>
                    </div> 
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep2" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
                     <i class="material-icons-outlined stepicon101 headingsubcolor">fact_check</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                         <%= Session["costsheet"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                              <%= Session["step2"].ToString() %></div>
                    </div> 
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep3" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
            
                    <i class="material-icons-outlined stepicon101 headingsubcolor">date_range</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                          <%= Session["paymentschedule"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                             <%= Session["step3"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep4" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
           
                    <i class="material-icons-outlined stepicon101 headingsubcolor">assignment</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                          <%= Session["bookingform"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                             <%=   Session["step4"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep5" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
           
                     <i class="material-icons-outlined stepicon101 headingsubcolor">payment</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                          <%= Session["payment"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                             <%= Session["step5"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="displayinline menudisplayhideicon">
                            <asp:Panel ID="Panel1" class="displayinline marginleft5" runat="server">
                                <div>
                                    <asp:LinkButton ID="divstep1b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">king_bed</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                 STEP 1</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" class="displayinline marginleft5" runat="server">

                                <div>
                                    <asp:LinkButton ID="divstep2b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">fact_check</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                 STEP 2</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" class="displayinline marginleft5" runat="server">
                                <div>
                                    <asp:LinkButton ID="divstep3b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">date_range</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                STEP 3</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" class="displayinline marginleft5" runat="server">
                                <div>
                                    <asp:LinkButton ID="divstep4b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">assignment</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                STEP 4</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel5" class="displayinline marginleft5" runat="server">
                                <div>
                                    <asp:LinkButton ID="divstep5b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">payment</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                STEP 5</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                        </div>

                        <div class="displayinline menudisplayhide">
                            <asp:Panel ID="pnlstep1" runat="server">
                                <div class="displayinline marginleft5">
                                    <asp:LinkButton ID="divstep1a" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none;" >
           
                        <i class="material-icons-outlined stepicon101 headingsubcolor">king_bed</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                             <%= Session["unitdetails"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                 <%= Session["step1"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep2" Visible="false" runat="server">
                                <div class="displayinline marginleft5">
                                    <asp:LinkButton ID="divstep2a" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none;" >
           
                       <i class="material-icons-outlined stepicon101 headingsubcolor">fact_check</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                            <%= Session["costsheet"].ToString()%> <div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                 <%= Session["step2"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep3" Visible="false" runat="server">
                                <div class="displayinline marginleft5">
                                    <asp:LinkButton ID="divstep3a" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none;" >
           
                        <i class="material-icons-outlined stepicon101 headingsubcolor">date_range</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                              <%= Session["paymentschedule"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                  <%= Session["step3"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep4" Visible="false" runat="server">
                                <div class="displayinline marginleft5">
                                    <asp:LinkButton ID="divstep4a" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none;" >
          
                         <i class="material-icons-outlined stepicon101 headingsubcolor">assignment</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                           <%= Session["bookingform"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                 <%= Session["step4"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep5" Visible="false" runat="server">
                                <div class="displayinline marginleft5">
                                    <asp:LinkButton ID="divstep5a" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none;" >
          
                        <i class="material-icons-outlined stepicon101 headingsubcolor">payment</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                              <%= Session["payment"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                  <%= Session["step5"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="displayinline marginleft5 floatright">
                            <div class="borderleft lineheight20 displayinline step101 darkback">
                                <span class="stepicon101 headingsubcolor helveticafont fontsize25 verticalsuper darktextstroke" style="font-size: 22px !important;
    /* margin-top: -10px !important; */
    vertical-align: top;
    display: inline-block;
    ">₹</span>
                                <div class="fontweight600 fontsize20 displayinline letterspacing0 headingcolor colorwhite">
                                    <%= Session["regfees"].ToString()%><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                        EOI Amount
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="display: block; height: 100vh; width: 100%;">

                      

                            <asp:Panel ID="pnlpay"  runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80">
                                    <div class="righttimer">
                                        <asp:Label ID="lblpay" runat="server"></asp:Label>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">
                                        <asp:Label Text="Payment" ID="lblheader" runat="server" /></span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            <asp:Label ID="lblpaymentmsg" Text="Booked successfully. Thank you." runat="server" />   
                                        </div>
                                    </div>
                                    <asp:Panel ID="pnlsuccess" Visible="false" runat="server">  
                                    <img src="images/paid1.png" class="imgsuccess" />
                                    
                                    </asp:Panel>
                                      <asp:Panel ID="pnlfailed" Visible="true" runat="server">  
                                    <img src="images/failed.png" style="margin-top:20px;" class="imgsuccess" />
                                    
                                    </asp:Panel>

                                                <div style="display: block; text-align: center;"> 
                                                        <asp:LinkButton runat="server" ID="lnkpayment" Style="width: 200px; margin-right: 0px !important; margin-top: 40px;"
                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                            OnClientClick="javascript:window.close();">
                                             Thank you
                                                        </asp:LinkButton>
                                                    </div>

                                </div>
                            </asp:Panel> 
                        </div>
                    </div>
               
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel> 
    </form>
    <script src="css/jquery-3.2.1.min.js" type="text/javascript"></script>
     <script src="css/bootstrap.min.js" type="text/javascript"></script> 
</body>
</html>
