
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="finalinvo.aspx.cs" Inherits="bramhacorp.finalinvo" %>

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
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/unitegallery/1.7.31/css/unite-gallery.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/unitegallery/1.7.31/themes/default/ug-theme-default.min.css'>
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
                  <%--<asp:UpdateProgress ID="UpdateProgress12" runat="server">
            <ProgressTemplate>
              <div class="preloader">
                    <img src="images/avnirlogo.png"  class="preloadercss" style="width: 250px; position: fixed; top: 40%; left: 50%; transform: translate(-50%, -50%); z-index: 11111; overflow: visible;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>--%>
                <div id="timerdiv" runat="server" class="righttimer">
                    <b>
                        <div id="countdown"></div>
                    </b>
                </div> 
                <div id="divbody" runat="server"> 
                    <div class="topdiv">
                        <div class="displayinline">
                            <img src="images/favicon.png" class="iconclassmargin" style="width: 60px; height: 64px; object-fit: cover; margin-bottom: 20px;" />
                        </div>
                        <div class="displayinline menudisplay">
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep1" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" OnClick="btnstep1_Clicked">
               
                    <i class="material-icons-outlined stepicon101 headingsubcolor">king_bed</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                        <%= Session["unitdetails"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                             <%= Session["step1"].ToString() %></div>
                    </div> 
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep2" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" OnClick="btnstep2_Clicked">
                     <i class="material-icons-outlined stepicon101 headingsubcolor">fact_check</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                         <%= Session["costsheet"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                              <%= Session["step2"].ToString() %></div>
                    </div> 
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep3" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" OnClick="btnstep3_Clicked">
            
                    <i class="material-icons-outlined stepicon101 headingsubcolor">date_range</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                          <%= Session["paymentschedule"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                             <%= Session["step3"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5">
                                <asp:LinkButton ID="divstep4" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" OnClick="btnstep4_Clicked">
           
                    <i class="material-icons-outlined stepicon101 headingsubcolor">assignment</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor">
                          <%= Session["bookingform"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                             <%=   Session["step4"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5" style="display:none;">
                                <asp:LinkButton ID="divstep5" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" OnClick="btnstep5_Clicked">
           
                     <i class="material-icons-outlined stepicon101 headingsubcolor">Booking Status</i>
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
                                        OnClick="btnstep1_Clicked">
           
                        
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
                                        OnClick="btnstep2_Clicked">
           
                        
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
                                        OnClick="btnstep3_Clicked">
           
                        
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
                                        OnClick="btnstep4_Clicked">
           
                        
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
                                        OnClick="btnstep4_Clicked">
           
                        
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
                                        Style="text-decoration: none;" OnClick="btnstep1_Clicked">
           
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
                                        Style="text-decoration: none;" OnClick="btnstep2_Clicked">
           
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
                                        Style="text-decoration: none;" OnClick="btnstep3_Clicked">
           
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
                                        Style="text-decoration: none;" OnClick="btnstep4_Clicked">
          
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
                                        Style="text-decoration: none;" OnClick="btnstep4_Clicked">
          
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
                                        Booking Amount
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="display: block; height: 100vh; width: 100%;">

                        <asp:UpdatePanel ID="upfilterpopup" runat="server">
                            <ContentTemplate>
                                <div id="divapply" class="popright" style="display: none;" runat="server">
                                    <div class="popup101" style="overflow-y: scroll;">
                                        <div class="popup102">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel18" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                 <div class="popup103 borderradius10" style="right: 30px; background: transparent;margin-top:15px !important">
                                                              <asp:LinkButton runat="server" ID="lnkcancelfilter" class="popupbtn103" Style="background: white;"
                                                            OnClick="lnkcancelfilter_Clicked">
                                       <i class="material-icons-outlined stepicon101 headingsubcolor"  style="margin:0px !important;">close</i>
                                                        </asp:LinkButton>
                                                    </div> 
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="lnkcancelfilter" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <div class="popup104  fontweight600 ">
                                                <div class="fontsize25" style="font-size: 18px !important; line-height: 29px;">
                                                    Apply Coupon
                                                </div>
                                                <span style="font-size: 12px;">Get instant discount</span>
                                            </div>
                                            <div class="fontsize11 textaligncenter displayblock margintop20">
                                                <div class="col-md-8 col-sm-8 col-xs-8" style="padding: 10px 5px 10px 10px;">
                                                    <asp:TextBox ID="TextBox1" class="form-control textaligncenter fontweight600" Style="height: 50px; display: inline-block; text-transform: uppercase;"
                                                        placeholder="Enter coupon code"
                                                        runat="server" />
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-4" style="padding: 10px 10px 10px 0px;">
                                                    <div class="floorcss" style="vertical-align: bottom; margin-right: 0px; width: 100%;">
                                                        <asp:LinkButton runat="server" ID="LinkButton13" Style="border-radius: 0px !important; margin-top: 0px; width: 100%;"
                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101"
                                                            OnClick="btnapplycoupon_Clicked">
                                                  Apply
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fontsize11 textaligncenter displayblock margintop30">
                                                <asp:Repeater ID="rptoffer" runat="server">
                                                    <ItemTemplate>
                                                        <div class="floorcss" style="margin-right: 0px; width: 100%; padding: 0px 10px;">
                                                            <asp:LinkButton class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101"
                                                                ID="LinkButton14" CommandArgument='<%# Eval("id") %>' CommandName='<%# Eval("percentage") %>'
                                                                OnClick="btnapplycoupon_Clicked" Style="width: 100%; height: auto; border-radius: 0px !important; padding: 20px 20px; text-align: left;"
                                                                runat="server">
                                        
                                            <span class="displayinline" style="background: #424b57; width: auto; padding: 0px 10px;
                                                color: white; /* height: 30px; */"><%#Eval("coupon") %></span>
                                            <div class="displayblock" style="margin-top: 10px; color: #737373 !important; /* font-size: 13px;
                                                */line-height: 20px;">
                                                <%#Eval("smalldescription") %>
                                            </div>
                                                            </asp:LinkButton>
                                                            <asp:Label Text='<%#Eval("coupon") %>' ID="lblmycoupon" Visible="false" runat="server" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="Updatepanel2" runat="server">
                            <ContentTemplate>
                                <div id="divright" class="popright" style="display: none;" runat="server">
                                    <div class="width800 popup101 " style="overflow-y: scroll; padding: 0px 0px 50px 0px;">

                                        <div class="popup102">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="popup103 borderradius10" style="right: 30px; background: transparent;margin-top:15px !important">
                                                        <asp:LinkButton runat="server" ID="LinkButton21" class="popupbtn103" Style="background: white;"
                                                            OnClick="lnkcancelright_Clicked">
                                       <i class="material-icons-outlined stepicon101 headingsubcolor"  style="margin:0px !important;">close</i>
                                                        </asp:LinkButton>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="lnkcancelfilter" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <div class="popup104  fontweight600 " style="padding: 20px 30px 0px 40px !important;">
                                                <div class="fontsize25" style="font-size: 18px !important; line-height: 29px;">
                                                    <span class="headercolor101 helveticafont fontsize131" style="font-size: 18px !important;">₹</span>
                                                    <asp:Label Text="" ID="lblrightprice" runat="server" />
                                                </div>
                                                <span style="font-size: 12px;">Base Price</span>
                                            </div>
                                            <div class="fontsize11 textaligncenter displayblock" style="margin-top: -5px;">
                                                <div class="margintop30 border101 heightpopup" style="display: flex;">
                                                    <div class="displayblock textaligncenter marginleftauto  padding30 " style="width: 100%; padding: 10px 20px !important;">
                                                        <div>
                                                            <div class="headercolor101 fontsize13 displayblock textalignleft">
                                                                Unit Details
                                                            </div>
                                                            <div class=" fontsize13 displayblock">
                                                                <div class="col-md-4 col-sm-4 col-xs-12 textalignleft margintop10" style="padding: 0px;">
                                                                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor textalignleft lineheight20">
                                                                        <asp:Label Text="" ID="lblrightunit" runat="server" /><div class="letterspacing1 fontsize10 subcolor101 fontweight400">
                                                                            Unit
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12 textalignleft margintop10" style="padding: 0px;">
                                                                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor textalignleft lineheight20">
                                                                        <asp:Label Text="" ID="lblrightconfig" runat="server" /><div class="letterspacing1 fontsize10 subcolor101 fontweight400">
                                                                            Tower
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12 textalignleft margintop10" style="padding: 0px;">
                                                                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor textalignleft lineheight20">
                                                                        <asp:Label Text="" ID="lblrightcarpet" runat="server" />
                                                                        Sq.Ft.<div class="letterspacing1 fontsize10 subcolor101 fontweight400">
                                                                            Carpet Area
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12 textalignleft margintop10" style="padding: 0px;">
                                                                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor textalignleft lineheight20">
                                                                        <asp:Label Text="" ID="lblrightbalcony" runat="server" />
                                                                        Sq.Mt.<div class="letterspacing1 fontsize10 subcolor101 fontweight400">
                                                                            Balcony Carpet Area
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12 textalignleft margintop10" style="padding: 0px;">
                                                                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor textalignleft lineheight20">
                                                                        <asp:Label Text="" ID="lblrightenclosed" runat="server" />
                                                                        Sq.Mt.<div class="letterspacing1 fontsize10 subcolor101 fontweight400">
                                                                            Enclosed Balcony Area
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12 textalignleft margintop10" style="padding: 0px;">
                                                                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor textalignleft lineheight20">
                                                                        <span class="headercolor101 helveticafont fontsize131" style="font-size: 14px !important;">₹</span>
                                                                        <asp:Label Text="" ID="lblrightagreement" runat="server" /><div class="letterspacing1 fontsize10 subcolor101 fontweight400">
                                                                            Agreement Price
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:Repeater ID="rptimg" runat="server">
                                                    <HeaderTemplate>
                                                        <div id="output" style="max-width: 1140px !important;margin:15px 40px 5px 40px !important;">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <img alt="Bramha Corp" src='<%#Eval("userimageurl") %>' data-image='<%#Eval("userimageurl") %>'
                                                            data-description="Bramha Corp">
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <div class="floorcss" style="vertical-align: bottom; margin-right: 0px; margin-bottom: 30px;">
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel15" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:LinkButton runat="server" ID="lnkrightbook" Style="width: 160px; margin-top: 6px; background: #424b57; color: white;"
                                                                class="btnclass bordercolor101 borderradius0 fontsize13 headercolor101 button101"
                                                                OnClick="btnunit_Clicked">
                                                Continue
                                                            </asp:LinkButton>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="lnkrightbook" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="Updatepanel4" class="unitbottom" runat="server">
                            <ContentTemplate>
                                <div id="divbottom" class="zindex1111" style="display: none;" runat="server">
                                    <div class="width800 popup101 popupbottom101">
                                        <div class="popup102">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                 <div class="popup103 borderradius10" style="right: 30px; background: transparent;margin-top:15px !important">
                                                              <asp:LinkButton runat="server" ID="LinkButton22" class="popupbtn103" Style="background: white;"
                                                            OnClick="lnkcancelbottom_Clicked">
                                       <i class="material-icons-outlined headingsubcolor margin0" style="color:white !important;">close</i>
                                                        </asp:LinkButton>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="LinkButton22" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <div class="fontsize11 textaligncenter displayblock margintop0">
                                                <div class="displayblock textaligncenter marginleftauto width100per paddingleft15">
                                                    <span class="displayinline floatleft">
                                                        <div class="unit102">
                                                            <div class="unit103">
                                                                <div class="fontsize13 fontweight600 headercolor101 displayinline floatleft letterspacing0 borderright textalignleft unit104">
                                                                    <asp:Label Text="" ID="lblbottomunit" runat="server" /><div class="subcolor101 fontweight400 fontsize10 letterspacing1">
                                                                        Unit Info
                                                                    </div>
                                                                </div>
                                                                <div class="fontsize141 fontweight600 letterspacing0 headercolor101 unit105">
                                                                    ₹
                                                            <asp:Label Text="" ID="lblbottomprice" runat="server" />
                                                                </div>
                                                                <div class="borderleftdark displayinline floatright fontsize13 fontweight600 letterspacing0 headercolor101 unit106">
                                                                    <asp:Label Text="" ID="lblbottomarea" runat="server" />
                                                                    Sq. Mt.
                                                            <div class="subcolor101 fontweight400 fontsize10 letterspacing1">
                                                                Area
                                                            </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>
                                                    <div  class="displayinline marginleft5 floatleft borderleftdark bordernonepopup poupbottom102">
                                                        <asp:Label Text=" " ID="lblbottomfacing" runat="server" />
                                                    </div>
                                                    <div class="displayinline marginleft5 floatright popupbottom103 textaligncenter" style="text-align: center;">
                                                        <div class="floorcss">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel8" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:LinkButton runat="server" ID="lnkbottombook" class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                        OnClick="btnunitright_Clicked">
                                                 Book Now
                                                                    </asp:LinkButton>

                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="lnkbottombook" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div style="display: block; height: 100%; width: 100%;">
                            <asp:UpdatePanel ID="uprightspin" runat="server">
                                <ContentTemplate>
                                    <div id="divspin" class="popright" style="display: none;" runat="server">
                                        <div class="popup101" style="overflow-y: scroll;">
                                            <div class="popup102">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel25" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                      <div class="popup103 borderradius10" style="right: 30px; background: transparent;margin-top:15px !important">
                                                              <asp:LinkButton runat="server" ID="LinkButton35" class="popupbtn103" OnClick="lnkcancelfilter_Clicked">
                                       <i class="material-icons-outlined stepicon101 headingsubcolor"  style="margin:0px !important;">close</i>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton7" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <div class="popup104  fontweight600 ">
                                                    <div class="fontsize25" style="font-size: 18px !important; line-height: 29px;">
                                                        Win a Prize
                                                    </div>
                                                    <span style="font-size: 12px;">Get exclusive prize</span>
                                                </div>
                                                <div class="fontsize11 textaligncenter displayblock margintop30">
                                                    <div class="displayblock textaligncenter marginleftauto  padding30 border101 costpadding">
                                                        <%--                                      
 <div id="wheel">
    <canvas id="canvas" width="300" height="300"></canvas>
 </div>
                                                        --%>
                                                        <div id="wheel">
                                                            <canvas id="canvas" width="300" height="300"></canvas>
                                                            <asp:Label Text="" ID="lblspinvalue" runat="server" />
                                                        </div>
                                                        <input type="hidden" id="lblcolor" value="#b8282e, #424b57, #b8282e, #424b57, #b8282e, #424b57, #b8282e, #424b57"
                                                            runat="server" />
                                                        <input type="hidden" id="lbllabel" value="10, 200, 50, 100, 5, 500, 0, jPOT" runat="server" />
                                                        <br>
                                                    </div>
                                                    <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                        <asp:LinkButton runat="server" ID="LinkButton36" Style="margin-right: 0px !important;"
                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                            OnClick="btnspin_Clicked">
                                               Let's Spin
                                                        </asp:LinkButton>
                                                        <script type="text/javascript">
                                                            function rand(min, max) {
                                                                return Math.random() * (max - min) + min;
                                                            }
                                                            var color = $("#lblcolor").val().replace(/"/g, "").split(', ');
                                                            var label = $("#lbllabel").val().replace(/"/g, "").split(', ');
                                                            var slices = color.length;
                                                            var sliceDeg = 360 / slices;
                                                            var deg = rand(0, 360);
                                                            var speed = 0;
                                                            var slowDownRand = 0;
                                                            var ctx = canvas.getContext('2d');
                                                            var width = canvas.width; // size
                                                            var center = width / 2;      // center
                                                            var isStopped = false;
                                                            var lock = false;
                                                            function deg2rad(deg) {
                                                                return deg * Math.PI / 180;
                                                            }
                                                            function drawSlice(deg, color) {
                                                                ctx.beginPath();
                                                                ctx.fillStyle = color;
                                                                ctx.moveTo(center, center);
                                                                ctx.arc(center, center, width / 2, deg2rad(deg), deg2rad(deg + sliceDeg));
                                                                ctx.lineTo(center, center);
                                                                ctx.fill();
                                                            }
                                                            function drawText(deg, text) {
                                                                ctx.save();
                                                                ctx.translate(center, center);
                                                                ctx.rotate(deg2rad(deg));
                                                                ctx.textAlign = "right";
                                                                ctx.fillStyle = "#fff";
                                                                ctx.font = 'bold 30px sans-serif';
                                                                ctx.fillText(text, 130, 10);
                                                                ctx.restore();
                                                            }
                                                            function drawImg() {
                                                                ctx.clearRect(0, 0, width, width);
                                                                for (var i = 0; i < slices; i++) {
                                                                    drawSlice(deg, color[i]);
                                                                    drawText(deg + sliceDeg / 2, label[i]);
                                                                    deg += sliceDeg;
                                                                }
                                                            }
                                                            drawImg();
                                                            function myfunction() {
                                                                function rand(min, max) {
                                                                    return Math.random() * (max - min) + min;
                                                                }
                                                                var color = $("#lblcolor").val().replace(/"/g, "").split(', ');
                                                                var label = $("#lbllabel").val().replace(/"/g, "").split(', ');
                                                                var slices = color.length;
                                                                var sliceDeg = 360 / slices;
                                                                var deg = rand(0, 360);
                                                                var speed = 0;
                                                                var slowDownRand = 0;
                                                                var ctx = canvas.getContext('2d');
                                                                var width = canvas.width; // size
                                                                var center = width / 2;      // center
                                                                var isStopped = false;
                                                                var lock = false;
                                                                function deg2rad(deg) {
                                                                    return deg * Math.PI / 180;
                                                                }
                                                                function drawSlice(deg, color) {
                                                                    ctx.beginPath();
                                                                    ctx.fillStyle = color;
                                                                    ctx.moveTo(center, center);
                                                                    ctx.arc(center, center, width / 2, deg2rad(deg), deg2rad(deg + sliceDeg));
                                                                    ctx.lineTo(center, center);
                                                                    ctx.fill();
                                                                }
                                                                function drawText(deg, text) {
                                                                    ctx.save();
                                                                    ctx.translate(center, center);
                                                                    ctx.rotate(deg2rad(deg));
                                                                    ctx.textAlign = "right";
                                                                    ctx.fillStyle = "#fff";
                                                                    ctx.font = 'bold 30px sans-serif';
                                                                    ctx.fillText(text, 130, 10);
                                                                    ctx.restore();
                                                                }
                                                                function drawImg() {
                                                                    ctx.clearRect(0, 0, width, width);
                                                                    for (var i = 0; i < slices; i++) {
                                                                        drawSlice(deg, color[i]);
                                                                        drawText(deg + sliceDeg / 2, label[i]);
                                                                        deg += sliceDeg;
                                                                    }
                                                                }
                                                                (function anim() {
                                                                    deg += speed;
                                                                    deg %= 360;
                                                                    // Increment speed
                                                                    if (!isStopped && speed < 3) {
                                                                        speed = speed + 1 * 0.1;
                                                                    }
                                                                    // Decrement Speed
                                                                    if (isStopped) {
                                                                        if (!lock) {
                                                                            lock = true;
                                                                            slowDownRand = rand(0.994, 0.998);
                                                                        }
                                                                        speed = speed > 0.2 ? speed *= slowDownRand : 0;
                                                                    }
                                                                    // Stopped!
                                                                    if (lock && !speed) {
                                                                        var ai = Math.floor(((360 - deg - 90) % 360) / sliceDeg); // deg 2 Array Index
                                                                        ai = (slices + ai) % slices; // Fix negative index
                                                                        $('#<%= lblspinvalue.ClientID %>').text(label[ai]);
                                                                        return 0; // Get Array Item from end Degree
                                                                    }
                                                                    drawImg();
                                                                    window.requestAnimationFrame(anim);
                                                                }());
                                                                setTimeout(
                                                                    function () {
                                                                        isStopped = true;
                                                                    }, 5000);
                                                            }
                                                        //        document.getElementById("spin").addEventListener("mousedown", function () {
                                                        //            isStopped = true;
                                                        //        }, false);
                                                        </script>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <asp:Panel ID="pnlunit" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color:#ffffff;">

                                    <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                                        <ContentTemplate>
                                             


                                             
                                            <asp:Panel ID="pnlunitdetails"  runat="server">
                                                <hr class="bordercolor width400" />
                                                <span class="displayinline backwhite heading101">Select a Unit</span>
                                                <div>
                                                    <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101 displaysmallhide">
                                                        Please choose a Unit from below and click continue
                                                    </div>
                                                </div>
                                                <div>
                                                     
                                                    <div class="fontsize11">
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel23" class="margintop20" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                             <asp:DropDownList ID="ddtower" class="form-control select2_single border101 width135 marginleftauto "
                                                                runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddtower_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="ddtower" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="margintop20 displayinline">
                                                        <asp:Repeater ID="rptconfig" runat="server">
                                                            <ItemTemplate>
                                                                <div class="displayinline marginright15">
                                                                    <div class="floorcss btnwidthcss">
                                                                        <span class="unitsubbtn bordercolor101 borderradius6 button101 bordernone border50 width1010"
                                                                            style='<%# "background:"+Eval("backcolor") +";"%>'></span>
                                                                    </div>
                                                                    <div class="displayinline margintop0 lineheight20 fontsize13 fontweight400 subcolor101">
                                                                        <%#Eval("configname") %>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                    <span class="unitinfosmall" style="margin-top: 5px; padding: 0px 20px; background: white; font-size: 16px;">Unit Info</span>
                                                    <div class="unitinfosmall" style="margin-top: 15px; width: auto; text-align: center; /* border: 1px solid #e8e7e7; */
                                        /* padding: 15px 20px; */
                                        margin-bottom: 20px;">
                                                        <div style="/* margin-bottom: 15px; */
                                            display: inline-block; width: 90px; height: 63px; padding: 5px; border: 1px solid #f7f7f7;">
                                                            <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; /* margin-top: 10px; */
    display: inline-block;">
                                                                <div class="floorcss">
                                                                    <a id="LinkButton1" class="unitsubbtn bordercolor101 borderradius6 button101" href="javascript:__doPostBack('LinkButton1','')" style="border: 1px solid #ffc4c4; border-color: #ffbdbd !important;"></a>
                                                                </div>
                                                            </div>
                                                            <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                Available
                                                            </div>
                                                        </div>
                                                        <div style="/* margin-bottom: 15px; */
                                            display: inline-block; width: 85px; padding: 5px; border: 1px solid #f7f7f7;">
                                                            <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; /* margin-top: 10px; */
    display: inline-block;">
                                                                <div class="floorcss">
                                                                    <a id="LinkButton127" class="unitsubbtn bordercolor101 borderradius6 button101" href="javascript:__doPostBack('LinkButton127','')" style="background: #424b57;"></a>
                                                                </div>
                                                            </div>
                                                            <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                Hold
                                                            </div>
                                                        </div>
                                                        <div style="/* margin-bottom: 15px; */
                                            display: inline-block; width: 85px; padding: 5px; border: 1px solid #f7f7f7;">
                                                            <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; /* margin-top: 10px; */
    display: inline-block;">
                                                                <div class="floorcss">
                                                                    <a id="LinkButtdon127" class="unitsubbtn bordercolor101 borderradius6 button101" href="#" style="background: #abf1c1;"></a>
                                                                </div>
                                                            </div>
                                                            <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                Sold
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="margintop30  width100 width600" style="margin: 0px auto; padding-bottom: 0px; text-align: -webkit-center; border-left: 1px solid #e8e7e7; border-top: 1px solid #e8e7e7; border-right: 1px solid #e8e7e7;">
                                                        <div class="unitinfo" style="position: absolute; z-index: 2; margin-top: 30px; right: 100px; width: 100px; text-align: center; border: 1px solid #e8e7e7; padding: 20px 0px;">
                                                            <div style="margin-bottom: 15px;">
                                                                <div style="width: 30px; padding: 0px; height: 30px; margin-top: 10px; display: inline-block;">

                                                                    <div class="floorcss">

                                                                        <asp:LinkButton runat="server" ID="LinkButton5" Style="border: 1px solid #ffc4c4; border-color: #ffbdbd !important;" CommandArgument="1" CommandName="1st Floor" class="unitsubbtn bordercolor101 borderradius6 button101"
                                                                            OnClick="btnfloor_Clicked">
                                                    
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                                <div style="display: block; margin-top: 8px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                    Available
                                                                </div>
                                                            </div>

                                                            <div style="margin-bottom: 15px;">

                                                                <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; margin-top: 10px; display: inline-block;">

                                                                    <div class="floorcss">

                                                                        <asp:LinkButton runat="server" Style="background: #424b57;"
                                                                            ID="LinkButton4" CommandArgument="1" CommandName="1st Floor" class="unitsubbtn bordercolor101 borderradius6 button101"
                                                                            OnClick="btnfloor_Clicked">
                                                    
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                                <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                    Hold
                                                                </div>
                                                            </div>
                                                            <div style="margin-bottom: 15px;">

                                                                <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; margin-top: 10px; display: inline-block;">

                                                                    <div class="floorcss">

                                                                        <asp:LinkButton runat="server" Style="background: #abf1c1;"
                                                                            ID="LinkButton2" CommandArgument="1" CommandName="1st Floor" class="unitsubbtn bordercolor101 borderradius6 button101"
                                                                            OnClick="btnfloor_Clicked">
                                                    
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                                <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                    Sold
                                                                </div>
                                                            </div>



                                                        </div>
                                                        <div style="display: inline-block; height: 10px; width: 100%; background: #e8e7e7; text-align: center;">
                                                        </div>
                                                        <div style="width: 100%;">

                                                            <div style="display: inline-block; width: max-content; padding-top: 10px; text-align: right; padding: 10px 20px 0px 0px;">

                                                                <asp:Repeater ID="rptfloor" OnItemDataBound="rptfloor_ItemDataBound" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="margintop10" style="margin-left: 15px; margin-right: 10px;">
                                                                            <asp:Repeater ID="rptunit" runat="server">
                                                                                <ItemTemplate>
                                                                                    <div class="floorcss btnwidthcss">
                                                                                        <div class="unit101" style="display: block;">
                                                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel12" UpdateMode="Conditional">
                                                                                                <ContentTemplate>
                                                                                                    <asp:Panel ID="pnlpopup" Visible="false" runat="server">
                                                                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left darkbackimp popupunit"
                                                                                                            style="display: block; margin-top: -25px; margin-right: 70px;">
                                                                                                            <div class="unit102">
                                                                                                                <div class="unit103">
                                                                                                                    <div class="fontsize13 fontweight600 colorwhite displayblock floatleft letterspacing0 textalignleft unit104"
                                                                                                                        style="padding: 0px; width: 100%; margin-bottom: 10px;">
                                                                                                                        <asp:Label Text="" ID="lblpopunit" runat="server" /><div class="subcolor101 fontweight400 fontsize10 letterspacing1"
                                                                                                                            style="color: #cecece !important;">
                                                                                                                            Unit Info
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div class="fontsize13 fontweight600 colorwhite displayblock floatleft letterspacing0 textalignleft unit104"
                                                                                                                        style="padding: 0px; width: 100%; margin-bottom: 10px;">
                                                                                                                        ₹
                                                                                                    <asp:Label Text="" ID="lblpopbase" runat="server" /><div class="subcolor101 fontweight400 fontsize10 letterspacing1"
                                                                                                        style="color: #cecece !important;">
                                                                                                        Base Price
                                                                                                    </div>
                                                                                                                    </div>
                                                                                                                    <div class=" displayblock fontsize13 fontweight600 letterspacing0 colorwhite unit106"
                                                                                                                        style="padding: 0px; text-align: left; margin-bottom: 10px;">
                                                                                                                        <asp:Label Text="" ID="lblpoparea" runat="server" />
                                                                                                                        Sq. Ft.
                                                                                                    <div class="subcolor101 fontweight400 fontsize10 letterspacing1" style="color: #cecece !important;">
                                                                                                        Area
                                                                                                    </div>
                                                                                                                    </div>
                                                                                                                    <div class=" displayblock fontsize13 fontweight600 letterspacing0 colorwhite unit106"
                                                                                                                        style="padding: 0px; text-align: left; margin-bottom: 10px;">
                                                                                                                        <asp:Label Text="" ID="lblpopfacing" runat="server" />
                                                                                                                        
                                                                                                    <div class="subcolor101 fontweight400 fontsize10 letterspacing1" style="color: #cecece !important;">
                                                                                                        Unit Type
                                                                                                    </div>
                                                                                                                    </div>
                                                                                                                    <div class=" displayblock fontsize13 fontweight600 letterspacing0 colorwhite unit106"
                                                                                                                        style="padding: 0px; text-align: left; margin-bottom: 10px;">
                                                                                                                        <div class="floorcss" style="margin: 0 auto;">
                                                                                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel8d" UpdateMode="Conditional">
                                                                                                                                <ContentTemplate>
                                                                                                                                    <asp:LinkButton runat="server" ID="lnkbottombook1" class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                                                                        Style="margin: 0 auto;" OnClick="btnunitright_Clicked">
                                                Select Unit
                                                                                                                                    </asp:LinkButton>
                                                                                                                                </ContentTemplate>
                                                                                                                                <Triggers>
                                                                                                                                    <asp:PostBackTrigger ControlID="lnkbottombook1" />
                                                                                                                                </Triggers>
                                                                                                                            </asp:UpdatePanel>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </asp:Panel>
                                                                                                    <div class="tooltippopup unit101">
                                                                                                        <asp:LinkButton ID="btnunit" CommandArgument='<%# Eval("unitid")%>' CommandName='<%# Eval("statuscolor")%>'
                                                                                                            class='<%# "unitsubbtn bordercolor101 borderradius6 button101 "+Eval("statusback")%>'
                                                                                                            Style='<%# "border-color:"+Eval("statuscolor") +" !important "%>' OnClick="btnunitbottom_Clicked"
                                                                                                            runat="server">  
                                                                                                        </asp:LinkButton>
                                                                                                    </div>
                                                                                                </ContentTemplate>
                                                                                                <Triggers>
                                                                                                    <asp:AsyncPostBackTrigger ControlID="btnunit" EventName="Click" />
                                                                                                </Triggers>
                                                                                            </asp:UpdatePanel>
                                                                                        </div>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                            <div class="floorcss btnwidthcss floor101">
                                                                                <span class="unitsubbtn bordercolor101 borderradius6 button101 floor102" style="border: none;">
                                                                                    <%#Eval("floorname") %></span>
                                                                            </div>
                                                                            <asp:Label Text='<%#Eval("id") %>' ID="lblid" Visible="false" runat="server" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </div>

                                                        </div>
                                                        <div>
                                                            <div style="display: inline-block; height: 10px; width: 100%; margin-top: 10px; background: #e8e7e7; text-align: center;">
                                                            </div>
                                                            <div style="text-align: center;">
                                                                <div style="display: inline-block; height: 50px; margin-top: 15px; width: 50px; background: #e8e7e7; text-align: center;">
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div style="display: inline-block; height: 10px; width: 100%; background: #e8e7e7; text-align: center;">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="margin-bottom: 50px; display: block;">
                                                    </div>
                                                    <%--        <div class="floorcss">
               
                                             <asp:LinkButton runat="server" ID="lnkfloor1" CommandArgument="1" CommandName="1st Floor" class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101" 
                                                OnClick="btnfloor_Clicked">
                                                   1st Floor
                                            </asp:LinkButton> 
                                            </div>
                                                     <div class="floorcss">
               
                                             <asp:LinkButton runat="server" ID="LinkButton1"  CommandArgument="2"  CommandName="2nd Floor" class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101" 
                                                OnClick="btnfloor_Clicked">
                                                    2nd Floor
                                            </asp:LinkButton> 
                                            </div>
   
            <div class="floorcss">
               
                                             <asp:LinkButton runat="server" ID="LinkButton2"  CommandArgument="3" CommandName="3rd Floor"  class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101" 
                                                OnClick="btnfloor_Clicked">
                                                    3rd Floor
                                            </asp:LinkButton> 
                                            </div>--%>
                                                </div>
                                            </asp:Panel>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>


                                </div>
                            </asp:Panel>

                    

                 <asp:UpdatePanel ID="uptime" runat="server"  >
                        <ContentTemplate>     
                         <asp:Timer ID="timerbooking" runat="server" Interval="5000" OnTick="lnktimertick_Click">
                    </asp:Timer> 
                       </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger EventName="Tick" ControlID="timerbooking" />
                        </Triggers>
                    </asp:UpdatePanel>
                            <asp:Panel ID="pnlcostsheet" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color:#ffffff;">
                                    <div class="righttimer">

                                        <b>
                                            <asp:Label ID="lblunittimer" runat="server"></asp:Label></b>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Cost Sheet</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Please go through the cost sheet
                                        </div>
                                    </div>
                                    
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>
                                            <div>
                                                <asp:Panel ID="pnlcostsheetinside" Visible="false" runat="server">
                                                    <div style="padding: 0px 10px 10px 10px !important;" class="margintop30">
                                                        <div class="displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding">
                                                            <div class="headercolor101 fontsize13 displaynone textalignleft">
                                                                Cost Break Up
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Unit
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text="" ID="lblunit" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                           

                                                            <div class="margintop15 fontsize13 displaynone" style="display: none;">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Floor no
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text="" ID="lblfloorno" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displayblock">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                       RERA Carpet Area + Balcony Area			
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text="10.45 Sq.Ft." ID="lblcarpet" runat="server" />
                                                                    Sq.Ft.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display:none">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Balcony Carpet Area
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text=" 60.6 Sq.Mt." ID="lblbalcony" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                             <div class="margintop15 fontsize13 displayblock">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Basic Cost
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text=" " ID="lblbasiccost" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                  <div class="margintop15 fontsize13 displayblock">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Floor Rise Charges
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text="-" ID="lblfloorrisecharges" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                              <div class="margintop15 fontsize13 displayblock">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Premium Location Charges
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text="-" ID="lblplcharges" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                             <div class="margintop15 fontsize13 displayblock">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Estimated Cost of Power, Water & Sewerage - Connectivity
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text="" ID="lblpowernall" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                             <div class="margintop15 fontsize13 displayblock">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Senior Care Facilities and Amenities
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text=" " ID="lblamenities" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                             <div class="margintop15 fontsize13 displayblock">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Club Membership
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <asp:Label Text=" " ID="lblclub" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                     
                                                            <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                       Unit Cost
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                        <asp:Label Text="68,57,500" ID="lblbasicvalue" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displayblock"  style="display:none !important;">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Common Area Charges
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                        <asp:Label Text="4,25,000" ID="lblcommonarea" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                             <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                             <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                       Parking Charges
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                        <asp:Label Text="4,00,000" ID="lblparking" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <asp:Panel ID="pnlofferbtn" Visible="false" runat="server">
                                                                <div class="margintop15 fontsize13 displayblock costbordertop101">
                                                                    <asp:LinkButton runat="server" ID="LinkButton17" Style="border-radius: 0px !important; width: 100%; border: none; margin: 0px;"
                                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101"
                                                                        OnClick="btnopenoffer_Clicked">
                                                 <i class="material-icons-outlined stepicon101 headingsubcolor fontweight400" style="vertical-align: middle;">local_offer</i>
                                                            Apply Offer
                                                                    </asp:LinkButton>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnluseroffer" Visible="false" runat="server">
                                                                <div class="margintop15 fontsize13 displayblock costbordertop101">
                                                                    <div class="subcolor101 textalignleft fontweight600">
                                                                        <div class="cost101" style="height: 50px; padding: 10px 0px;">
                                                                            <div class="displayinline" style="background: #424b57; width: auto; padding: 4px 10px; color: white; height: 30px;">
                                                                                <asp:Label Text="" ID="lbloffername" runat="server" />
                                                                                <asp:LinkButton runat="server" ID="LinkButton19" Style="border-radius: 0px !important; width: 30px; height: 20px; border: none; background: #424b57 !important; margin: 0px; /* pointer-events: none; */
    padding: 2px; margin-right: -10px;"
                                                                                    class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101" OnClick="btncancelcoupon_Clicked">
                                                 <i class="material-icons-outlined stepicon101 headingsubcolor fontweight400" style="vertical-align: text-bottom;
    font-size: 14px !important;
    margin-right: 0px !important;">close</i>
                                                           
                                                                                </asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15 "
                                                                            style="line-height: 47px; color: #4073e8 !Important;">
                                                                            - <span class="headercolor101 helveticafont fontsize131" style="color: #4073e8">₹</span>
                                                                            <asp:Label ID="lbldis" runat="server" Text="1,53,650" />

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnlexecutiveoffer" Visible="false" runat="server">
                                                                <div class="margintop15 fontsize13 displayblock costbordertop101">
                                                                    <div class="subcolor101 textalignleft fontweight600">
                                                                        <div class="cost101" style="height: 50px; width: 160px; padding: 10px 0px;">
                                                                            <div class="displayinline" style="background: #424b57; width: auto; padding: 4px 10px; color: white; height: 30px;">
                                                                                <asp:Label Text="" ID="lblexecutiveoffer" runat="server" />
                                                                                <asp:LinkButton runat="server" ID="LinkButton20" Style="border-radius: 0px !important; width: 30px; height: 20px; border: none; background: #424b57 !important; margin: 0px;display:none; /* pointer-events: none; */
    padding: 2px; margin-right: -10px;"
                                                                                    class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101" OnClick="btnapplycoupon_Clicked">
                                                 <i class="material-icons-outlined stepicon101 headingsubcolor fontweight400" style="vertical-align: text-bottom;
    font-size: 14px !important;
    margin-right: 0px !important;">close</i>
                                                           
                                                                                </asp:LinkButton>
                                                                            </div>
                                                                            <div style="font-size: 11px; color: #4073e8 !Important;">
                                                                                Valid till 
                                                                                <asp:Label Text="" ID="lblenddate" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15 "
                                                                            style="font-size: 15px; line-height: 47px; color: #4073e8 !Important;">
                                                                            - <span class="headercolor101 helveticafont fontsize131" style="color: #4073e8">₹</span>
                                                                            <asp:Label Text="" ID="lbltotaldiscount" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                           <%-- <asp:Panel ID="pnlspin" runat="server">
                                                                <div class="margintop15 fontsize13 displayblock costbordertop101">
                                                                    <asp:LinkButton runat="server" ID="LinkButton37" Style="border-radius: 0px !important; width: 100%; border: none; margin: 0px;"
                                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101"
                                                                        OnClick="btnopenspin_Clicked">
                                                 <i class="material-icons-outlined stepicon101 headingsubcolor fontweight400" style="vertical-align: middle;">card_giftcard</i>
                                                           Win a Prize
                                                                    </asp:LinkButton>
                                                                </div>
                                                            </asp:Panel>--%>
                                                            <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Net Consideration Value
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="76,82,500" ID="lblnetvalue" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                         <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                   <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Less (-) Land abatement
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="25,60,833" ID="lblless" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                       <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Total Agreement Cost
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="51,21,667" ID="lblAgreement" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                              <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                              <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Taxable Value for the charging GST
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="51,21,667" ID="lbltaxable" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                          <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                 <div class="subcolor101 textalignleft fontweight400">
                                                                    GST (<asp:Label Text="7.5" ID="lblgstper" runat="server" />%)
                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                        <asp:Label Text="3,84,125" ID="lblgst" runat="server" />
                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                               <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Stamp Duty (<asp:Label Text="3" ID="lblstampdutyper" runat="server" />%)
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                        <asp:Label Text="4,60,950" ID="lblstampduty" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                           <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Registration Fees
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                        <asp:Label Text="30,000" ID="lblregfees" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                          <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                 <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Total Taxes
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="8,75,075" ID="lbltax" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displayblock costbordertop101">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Price of the Apartment (Rs.)
                                                                    </div>
                                                                     
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text=" " ID="lblapartment" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <asp:Label Text="" ID="lblfinal" style="display:none;" runat="server" />
                                                            <div class="margintop15 fontsize13 displaynone" style="display:none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Payment Schedule on Agreement Cost Plus applicable GST
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="76,82,500" ID="lblpayment" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                <div class="  fontsize13 displayblock " style="margin-top:30px;">
                                                                    <div class="headercolor101 textalignleft fontweight600">
                                                                        <div class="schedule101">
                                                                            Terms & Conditions
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <asp:Repeater ID="rptterms" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                            <div class="subcolor101 textalignleft fontweight400">
                                                                                <div style="line-height:24px;">
                                                                                    <%#Eval("terms") %>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
 
                                                       </div>
                                                        <div>
                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel10" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton runat="server" ID="lnkpreviouscost" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                            OnClick="btnstep1_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton runat="server" ID="LinkButton46" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                            OnClick="btnoffer_Clicked">
                                                Continue
                                                                        </asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton46" EventName="Click" />
                                                                        <asp:AsyncPostBackTrigger ControlID="lnkpreviouscost" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </asp:Panel>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:Panel>



                            <asp:Panel ID="pnlschedule" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color:#ffffff;">
                                    <div class="righttimer">
                                        <div id="countdown1"></div>

                                        <asp:Label ID="lblschedule" runat="server"></asp:Label>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Payment Schedule</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Please go through the payment schedule
                                        </div>
                                    </div>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div>
                                                <asp:Panel ID="pnlscheduleinside" Visible="false" runat="server">

                                                    <div style="padding: 0px 10px 10px 10px !important;" class="margintop15 lineheight25">
                                                        <div class="width600  textaligncenter marginleftauto border101 costpadding">
                                                            <div class="displayinline  textalignleft marginleftauto  padding30 " style="width: 730px; padding-top: 15px !important;">
                                                                <div class="headercolor101 fontsize13 displayblock textalignleft">
                                                                    Payment Schedule
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock ">
                                                                    <div class="headercolor101 textalignleft fontweight600">
                                                                        <div class="schedule101">
                                                                            Milestone
                                                                        </div>
                                                                        <div class="headercolor101 textaligncenter fontweight600  displayinline width40">
                                                                            
                                                                        </div>
                                                                        <div class="headercolor101 textaligncenter fontweight600  displayinline width150">
                                                                          
                                                                        </div>
                                                                        <div class="headercolor101 textaligncenter fontweight600  displayinline width150">
                                                                           % 
                                                                        </div>
                                                                        <div class="headercolor101 textaligncenter fontweight600  displayinline width180">
                                                                           Amount ( <span class="headercolor101 helveticafont fontsize131">₹</span> )
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                  <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                            <div class="subcolor101 textalignleft fontweight400">
                                                                                <div class="schedule101">
                                                                                    <asp:Label ID="lblpschedule" runat="server" Text="Booking Amount - On Booking and  Issue of Allotment Letter"></asp:Label>
                                                                                </div>
                                                                                 <div class="subcolor101 textaligncenter fontweight600  displayinline width180"  style="padding-left:300px;">
                                                                                    <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                   <asp:Label ID="lblamount" runat="server" Text=""></asp:Label>
                                                                                </div>
                                                                                </div>
                                                                      </div>
                                                                  <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                             <div class="subcolor101 textalignleft fontweight400">
                                                                                 <div class="schedule101">
                                                                                    <asp:Label ID="lbl" runat="server" Text="On execution Of Agreement to Sell"></asp:Label>
                                                                                 </div>
                                                                                 <div class="subcolor101 textaligncenter fontweight600  displayinline width180"  style="padding-left:180px;">
                                                                                    <span class="subcolor101 helveticafont fontsize131">%</span>
                                                                                   <asp:Label ID="Label5" runat="server" Text="10.00"></asp:Label>
                                                                                </div>
                                                                                <div class="subcolor101 textaligncenter fontweight600  displayinline width180"  style="padding-left:65px;">
                                                                                    <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                   <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                      </div>
                                                                <asp:Repeater ID="rptschedule" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                            <div class="subcolor101 textalignleft fontweight400">
                                                                                <div class="schedule101">
                                                                                    <%#Eval("schedule") %>
                                                                                </div>
                                                                               <%-- <div class="subcolor101 textaligncenter fontweight600  displayinline width40">
                                                                                    <%#Eval("") %>%
                                                                                </div>--%>
                                                                                <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                    <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                  <%--  <%#Eval("") %>%--%>
                                                                                </div>
                                                                                <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left:50px;">
                                                                                    <span class="subcolor101 helveticafont fontsize131">%</span>
                                                                                    <%#Eval("per") %>
                                                                                </div>
                                                                                <div class="subcolor101 textaligncenter fontweight600  displayinline width180"  style="padding-left:53px;">
                                                                                    <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                    <%#Eval("amount") %>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>





                                                            </div>
                                                            <div class="displayblock  textaligncenter marginleftauto  padding30 " style="width: 730px; padding-top: 0px !important;display:none;">
                                                                <div class="margintop5 fontsize13 displayblock ">
                                                                    <div class="headercolor101 textalignleft fontweight600">
                                                                        <div class="schedule101">
                                                                            Terms & Conditions
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                           The above mentioned areas are of unfinished walls as per PMC Sanction
                                                                                  </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                            Above mentioned costs are subject to change at the discretion of the developer

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                            The price proposed by the developer is on a lump-sum basis
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                         1 basic car parking will be given to the unit holder if agreed to be purchased separately. 

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                           Any changes in Government charges / duties / levies / taxes / fees / facilitation charges will be charged additionally as & when applicable
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                           Society Formation Legal charges plus GST applicable.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                          Refundable Security deposit of Rs. 50,000/- is payable at the time of Possession for a period of 1 year from the date of Possession
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                      Failure to pay on time as per payment schedule will be liable for Penal interest with applicable GST as per provisions of MahaRERA.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                     The above mentioned cost is for standard version unit only
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                            The cost of the fully furnished premium version will be at additional cost. For details, please contact sales executive
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                               
                                                            </div>
                                                        </div>
                                                        <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel11" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:LinkButton runat="server" ID="LinkButton3" Style="margin-right: 0px !important;"
                                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                        OnClick="btnstep2_Clicked">
                                                Previous
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton runat="server" ID="LinkButton10" Style="margin-right: 0px !important;"
                                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                        OnClick="btnschedule_Clicked">
                                                Continue
                                                                    </asp:LinkButton>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="LinkButton10" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="LinkButton3" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:Panel>
                   <asp:Panel ID="pnlbookingform" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color:#ffffff;">
                                    <div class="righttimer">
                                        <div id="countdown2"></div>

                                        <asp:Label ID="lblbookingform" runat="server"></asp:Label>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Expression of Interest (Booking)</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Please fill your details
                                        </div>
                                    </div>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel13" class="margintop20">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlbookingforminside" Visible="false" runat="server">

                                                <div>
                                                    <div style="padding: 0px 10px 10px 10px !important;">
                                                        <div class="fontsize11 textalignleft displayblock margintop30">

                                                            <div class="displayinline textaligncenter" style="display: block; margin-bottom: 30px;">
                                                                <asp:Panel ID="Panel6" class="displayinline marginleft5" runat="server">
                                                                    <div>
                                                                        <asp:LinkButton ID="lnkbuyer" runat="server" class="bookingbtn101 borderleft lineheight20 displayinline step101"
                                                                            OnClick="btnbuyer_Clicked">
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">people</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                Buyer Info</div>
                        </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </asp:Panel>
                                                                <asp:Panel ID="Panel8" class="displayinline marginleft5" runat="server">
                                                                    <div>
                                                                        <asp:LinkButton ID="lnklocation" runat="server" class="bookingbtn102 borderleft lineheight20 displayinline step101 "
                                                                            OnClick="btnlocation_Clicked">
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">location_on</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                 Communication Info</div>
                        </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </asp:Panel>
                                                                <asp:Panel ID="Panel7" class="displayinline marginleft5" runat="server">
                                                                    <div>
                                                                        <asp:LinkButton ID="lnkother" runat="server" class="bookingbtn101 borderleft lineheight20 displayinline step101 "
                                                                            OnClick="btnother_Clicked">
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">info</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400">
                                 Other Info</div>
                        </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <asp:Panel ID="pnlbuyer" runat="server">
                                                                <div class="fontsize11 textaligncenter marginleftauto displayblock margintop30">
                                                                    <asp:Repeater ID="rptbooking" runat="server">
                                                                        <ItemTemplate>
                                                                            <div class="floorcss" style="vertical-align: bottom; margin-right: 0px; display: block;">
                                                                                <asp:LinkButton runat="server" ID="LinkButton106" CommandArgument='<%# Eval("id")%>'
                                                                                    Style="border-radius: 0px !important; width: 350px; height: 105px; border-style: dashed;"
                                                                                    class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101"
                                                                                    OnClick="btnedit_Clicked">
                                            
                                            <div style="text-align:left;">   
                                        <span style="font-weight:600;font-size:14;display:block;"> <b style="color:#b8282e;">Applicant  <%#Eval("srno") %>.</b> <%#Eval("fname") %></span>  
                                            
                                              <span style="font-size:12px;display:block;"><%#Eval("mobileno") %></span>  
                                             <span style="font-size:12px;display:block;"><%#Eval("emailid") %></span>  
                                              <i class="material-icons-outlined stepicon101 headingsubcolor margin0" style="
  
font-size: 25px !important;
    position: absolute; 
    right: 13px;
    top: 10px;
">edit</i>
                                                
                                            </div>
                                          


                                                                                </asp:LinkButton>
                                                                                <asp:LinkButton runat="server" ID="lnkbookingdele" OnClick="lnkbookingdele_Click" CommandArgument='<%# Eval("id")%>'>
                                                                      <i class="material-icons-outlined stepicon101 headingsubcolor margin0" style="
  
font-size: 25px !important;
    position: absolute; 
    right: 13px;
    top: 40px;
">cancel</i></asp:LinkButton>

                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <asp:Panel ID="pnladdbookingbtn" runat="server">  
                                                                    <div class="floorcss" style="vertical-align: bottom; margin-right: 0px; display: block;">
                                                                        <asp:LinkButton runat="server" ID="LinkButton107" Style="border-radius: 0px !important; width: 350px; height: 105px; padding: 16px; border-style: dashed;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101"
                                                                            OnClick="btnopenbooking_Clicked">
                                                 <i class="material-icons-outlined stepicon101 headingsubcolor margin0" style="
    display: block;
    font-size: 40px !important;
">add</i>
Add New
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                    
                                                                    </asp:Panel>
                                                                </div>
                                                                <asp:Panel ID="pnlbookingformdisplay" runat="server">  
                                                                 <div style="display: block; text-align: center; margin-top: 30px;">
                                                                    <asp:Label Text="Applicant 1" ID="lblapplicant" class="popup106lable" runat="server" />
                                                                </div>
                                                              <div class="row margintop30">
                                                                    <div class="col-md-6 col-md-offset-3">
                                                                        <div class="row popup105 ">
                                                                          
                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                 <label class="popup106lable">
                                                                                    Title</label><br />
                                                                                <asp:DropDownList ID="ddsalutation" class="form-control select2_single fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    Style="width: 200px;" runat="server">
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                             <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                 <label class="popup106lable">
                                                                                    First Name<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtfirstname" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter First Name"></asp:TextBox>
                                                                            </div>
                                                                          <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                   <label class="popup106lable">
                                                                                    Middle Name</label>
                                                                                <asp:TextBox ID="txtmiddlename" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Middle Name"></asp:TextBox>
                                                                            </div>
                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                  <label class="popup106lable">
                                                                                    Last Name<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtlastname" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Last Name"></asp:TextBox>
                                                                            </div>
                                                                             <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                           
                                                                                <label class="popup106lable" style="margin-bottom: 10px;">
                                                                                    Country Code</label>
                                                                                     
                                                                                <asp:DropDownList ID="ddcountrycode" class="form-control select2_single fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    Style="width: 200px;" runat="server">
                                                                                    <asp:ListItem Value="213">Algeria (+213)</asp:ListItem>
                                                                                    <asp:ListItem Value="376">Andorra (+376)</asp:ListItem>
                                                                                    <asp:ListItem Value="244">Angola (+244)</asp:ListItem>
                                                                                    <asp:ListItem Value="1264">Anguilla (+1264)</asp:ListItem>
                                                                                    <asp:ListItem Value="1268">Antigua &amp; Barbuda (+1268)</asp:ListItem>
                                                                                    <asp:ListItem Value="54">Argentina (+54)</asp:ListItem>
                                                                                    <asp:ListItem Value="374">Armenia (+374)</asp:ListItem>
                                                                                    <asp:ListItem Value="297">Aruba (+297)</asp:ListItem>
                                                                                    <asp:ListItem Value="61">Australia (+61)</asp:ListItem>
                                                                                    <asp:ListItem Value="43">Austria (+43)</asp:ListItem>
                                                                                    <asp:ListItem Value="994">Azerbaijan (+994)</asp:ListItem>
                                                                                    <asp:ListItem Value="1242">Bahamas (+1242)</asp:ListItem>
                                                                                    <asp:ListItem Value="973">Bahrain (+973)</asp:ListItem>
                                                                                    <asp:ListItem Value="880">Bangladesh (+880)</asp:ListItem>
                                                                                    <asp:ListItem Value="1246">Barbados (+1246)</asp:ListItem>
                                                                                    <asp:ListItem Value="375">Belarus (+375)</asp:ListItem>
                                                                                    <asp:ListItem Value="32">Belgium (+32)</asp:ListItem>
                                                                                    <asp:ListItem Value="501">Belize (+501)</asp:ListItem>
                                                                                    <asp:ListItem Value="229">Benin (+229)</asp:ListItem>
                                                                                    <asp:ListItem Value="1441">Bermuda (+1441)</asp:ListItem>
                                                                                    <asp:ListItem Value="975">Bhutan (+975)</asp:ListItem>
                                                                                    <asp:ListItem Value="591">Bolivia (+591)</asp:ListItem>
                                                                                    <asp:ListItem Value="387">Bosnia Herzegovina (+387)</asp:ListItem>
                                                                                    <asp:ListItem Value="267">Botswana (+267)</asp:ListItem>
                                                                                    <asp:ListItem Value="55">Brazil (+55)</asp:ListItem>
                                                                                    <asp:ListItem Value="673">Brunei (+673)</asp:ListItem>
                                                                                    <asp:ListItem Value="359">Bulgaria (+359)</asp:ListItem>
                                                                                    <asp:ListItem Value="226">Burkina Faso (+226)</asp:ListItem>
                                                                                    <asp:ListItem Value="257">Burundi (+257)</asp:ListItem>
                                                                                    <asp:ListItem Value="855">Cambodia (+855)</asp:ListItem>
                                                                                    <asp:ListItem Value="237">Cameroon (+237)</asp:ListItem>
                                                                                    <asp:ListItem Value="1">Canada (+1)</asp:ListItem>
                                                                                    <asp:ListItem Value="238">Cape Verde Islands (+238)</asp:ListItem>
                                                                                    <asp:ListItem Value="1345">Cayman Islands (+1345)</asp:ListItem>
                                                                                    <asp:ListItem Value="236">Central African Republic (+236)</asp:ListItem>
                                                                                    <asp:ListItem Value="56">Chile (+56)</asp:ListItem>
                                                                                    <asp:ListItem Value="86">China (+86)</asp:ListItem>
                                                                                    <asp:ListItem Value="57">Colombia (+57)</asp:ListItem>
                                                                                    <asp:ListItem Value="269">Comoros (+269)</asp:ListItem>
                                                                                    <asp:ListItem Value="242">Congo (+242)</asp:ListItem>
                                                                                    <asp:ListItem Value="682">Cook Islands (+682)</asp:ListItem>
                                                                                    <asp:ListItem Value="506">Costa Rica (+506)</asp:ListItem>
                                                                                    <asp:ListItem Value="385">Croatia (+385)</asp:ListItem>
                                                                                    <asp:ListItem Value="53">Cuba (+53)</asp:ListItem>
                                                                                    <asp:ListItem Value="90392">Cyprus North (+90392)</asp:ListItem>
                                                                                    <asp:ListItem Value="357">Cyprus South (+357)</asp:ListItem>
                                                                                    <asp:ListItem Value="42">Czech Republic (+42)</asp:ListItem>
                                                                                    <asp:ListItem Value="45">Denmark (+45)</asp:ListItem>
                                                                                    <asp:ListItem Value="253">Djibouti (+253)</asp:ListItem>
                                                                                    <asp:ListItem Value="1809">Dominica (+1809)</asp:ListItem>
                                                                                    <asp:ListItem Value="1809">Dominican Republic (+1809)</asp:ListItem>
                                                                                    <asp:ListItem Value="593">Ecuador (+593)</asp:ListItem>
                                                                                    <asp:ListItem Value="20">Egypt (+20)</asp:ListItem>
                                                                                    <asp:ListItem Value="503">El Salvador (+503)</asp:ListItem>
                                                                                    <asp:ListItem Value="240">Equatorial Guinea (+240)</asp:ListItem>
                                                                                    <asp:ListItem Value="291">Eritrea (+291)</asp:ListItem>
                                                                                    <asp:ListItem Value="372">Estonia (+372)</asp:ListItem>
                                                                                    <asp:ListItem Value="251">Ethiopia (+251)</asp:ListItem>
                                                                                    <asp:ListItem Value="500">Falkland Islands (+500)</asp:ListItem>
                                                                                    <asp:ListItem Value="298">Faroe Islands (+298)</asp:ListItem>
                                                                                    <asp:ListItem Value="679">Fiji (+679)</asp:ListItem>
                                                                                    <asp:ListItem Value="358">Finland (+358)</asp:ListItem>
                                                                                    <asp:ListItem Value="33">France (+33)</asp:ListItem>
                                                                                    <asp:ListItem Value="594">French Guiana (+594)</asp:ListItem>
                                                                                    <asp:ListItem Value="689">French Polynesia (+689)</asp:ListItem>
                                                                                    <asp:ListItem Value="241">Gabon (+241)</asp:ListItem>
                                                                                    <asp:ListItem Value="220">Gambia (+220)</asp:ListItem>
                                                                                    <asp:ListItem Value="7880">Georgia (+7880)</asp:ListItem>
                                                                                    <asp:ListItem Value="49">Germany (+49)</asp:ListItem>
                                                                                    <asp:ListItem Value="233">Ghana (+233)</asp:ListItem>
                                                                                    <asp:ListItem Value="350">Gibraltar (+350)</asp:ListItem>
                                                                                    <asp:ListItem Value="30">Greece (+30)</asp:ListItem>
                                                                                    <asp:ListItem Value="299">Greenland (+299)</asp:ListItem>
                                                                                    <asp:ListItem Value="1473">Grenada (+1473)</asp:ListItem>
                                                                                    <asp:ListItem Value="590">Guadeloupe (+590)</asp:ListItem>
                                                                                    <asp:ListItem Value="671">Guam (+671)</asp:ListItem>
                                                                                    <asp:ListItem Value="502">Guatemala (+502)</asp:ListItem>
                                                                                    <asp:ListItem Value="224">Guinea (+224)</asp:ListItem>
                                                                                    <asp:ListItem Value="245">Guinea - Bissau (+245)</asp:ListItem>
                                                                                    <asp:ListItem Value="592">Guyana (+592)</asp:ListItem>
                                                                                    <asp:ListItem Value="509">Haiti (+509)</asp:ListItem>
                                                                                    <asp:ListItem Value="504">Honduras (+504)</asp:ListItem>
                                                                                    <asp:ListItem Value="852">Hong Kong (+852)</asp:ListItem>
                                                                                    <asp:ListItem Value="36">Hungary (+36)</asp:ListItem>
                                                                                    <asp:ListItem Value="354">Iceland (+354)</asp:ListItem>
                                                                                    <asp:ListItem Value="91">India (+91)</asp:ListItem>
                                                                                    <asp:ListItem Value="62">Indonesia (+62)</asp:ListItem>
                                                                                    <asp:ListItem Value="98">Iran (+98)</asp:ListItem>
                                                                                    <asp:ListItem Value="964">Iraq (+964)</asp:ListItem>
                                                                                    <asp:ListItem Value="353">Ireland (+353)</asp:ListItem>
                                                                                    <asp:ListItem Value="972">Israel (+972)</asp:ListItem>
                                                                                    <asp:ListItem Value="39">Italy (+39)</asp:ListItem>
                                                                                    <asp:ListItem Value="1876">Jamaica (+1876)</asp:ListItem>
                                                                                    <asp:ListItem Value="81">Japan (+81)</asp:ListItem>
                                                                                    <asp:ListItem Value="962">Jordan (+962)</asp:ListItem>
                                                                                    <asp:ListItem Value="7">Kazakhstan (+7)</asp:ListItem>
                                                                                    <asp:ListItem Value="254">Kenya (+254)</asp:ListItem>
                                                                                    <asp:ListItem Value="686">Kiribati (+686)</asp:ListItem>
                                                                                    <asp:ListItem Value="850">Korea North (+850)</asp:ListItem>
                                                                                    <asp:ListItem Value="82">Korea South (+82)</asp:ListItem>
                                                                                    <asp:ListItem Value="965">Kuwait (+965)</asp:ListItem>
                                                                                    <asp:ListItem Value="996">Kyrgyzstan (+996)</asp:ListItem>
                                                                                    <asp:ListItem Value="856">Laos (+856)</asp:ListItem>
                                                                                    <asp:ListItem Value="371">Latvia (+371)</asp:ListItem>
                                                                                    <asp:ListItem Value="961">Lebanon (+961)</asp:ListItem>
                                                                                    <asp:ListItem Value="266">Lesotho (+266)</asp:ListItem>
                                                                                    <asp:ListItem Value="231">Liberia (+231)</asp:ListItem>
                                                                                    <asp:ListItem Value="218">Libya (+218)</asp:ListItem>
                                                                                    <asp:ListItem Value="417">Liechtenstein (+417)</asp:ListItem>
                                                                                    <asp:ListItem Value="370">Lithuania (+370)</asp:ListItem>
                                                                                    <asp:ListItem Value="352">Luxembourg (+352)</asp:ListItem>
                                                                                    <asp:ListItem Value="853">Macao (+853)</asp:ListItem>
                                                                                    <asp:ListItem Value="389">Macedonia (+389)</asp:ListItem>
                                                                                    <asp:ListItem Value="261">Madagascar (+261)</asp:ListItem>
                                                                                    <asp:ListItem Value="265">Malawi (+265)</asp:ListItem>
                                                                                    <asp:ListItem Value="60">Malaysia (+60)</asp:ListItem>
                                                                                    <asp:ListItem Value="960">Maldives (+960)</asp:ListItem>
                                                                                    <asp:ListItem Value="223">Mali (+223)</asp:ListItem>
                                                                                    <asp:ListItem Value="356">Malta (+356)</asp:ListItem>
                                                                                    <asp:ListItem Value="692">Marshall Islands (+692)</asp:ListItem>
                                                                                    <asp:ListItem Value="596">Martinique (+596)</asp:ListItem>
                                                                                    <asp:ListItem Value="222">Mauritania (+222)</asp:ListItem>
                                                                                    <asp:ListItem Value="269">Mayotte (+269)</asp:ListItem>
                                                                                    <asp:ListItem Value="52">Mexico (+52)</asp:ListItem>
                                                                                    <asp:ListItem Value="691">Micronesia (+691)</asp:ListItem>
                                                                                    <asp:ListItem Value="373">Moldova (+373)</asp:ListItem>
                                                                                    <asp:ListItem Value="377">Monaco (+377)</asp:ListItem>
                                                                                    <asp:ListItem Value="976">Mongolia (+976)</asp:ListItem>
                                                                                    <asp:ListItem Value="1664">Montserrat (+1664)</asp:ListItem>
                                                                                    <asp:ListItem Value="212">Morocco (+212)</asp:ListItem>
                                                                                    <asp:ListItem Value="258">Mozambique (+258)</asp:ListItem>
                                                                                    <asp:ListItem Value="95">Myanmar (+95)</asp:ListItem>
                                                                                    <asp:ListItem Value="264">Namibia (+264)</asp:ListItem>
                                                                                    <asp:ListItem Value="674">Nauru (+674)</asp:ListItem>
                                                                                    <asp:ListItem Value="977">Nepal (+977)</asp:ListItem>
                                                                                    <asp:ListItem Value="31">Netherlands (+31)</asp:ListItem>
                                                                                    <asp:ListItem Value="687">New Caledonia (+687)</asp:ListItem>
                                                                                    <asp:ListItem Value="64">New Zealand (+64)</asp:ListItem>
                                                                                    <asp:ListItem Value="505">Nicaragua (+505)</asp:ListItem>
                                                                                    <asp:ListItem Value="227">Niger (+227)</asp:ListItem>
                                                                                    <asp:ListItem Value="234">Nigeria (+234)</asp:ListItem>
                                                                                    <asp:ListItem Value="683">Niue (+683)</asp:ListItem>
                                                                                    <asp:ListItem Value="672">Norfolk Islands (+672)</asp:ListItem>
                                                                                    <asp:ListItem Value="670">Northern Marianas (+670)</asp:ListItem>
                                                                                    <asp:ListItem Value="47">Norway (+47)</asp:ListItem>
                                                                                    <asp:ListItem Value="968">Oman (+968)</asp:ListItem>
                                                                                    <asp:ListItem Value="680">Palau (+680)</asp:ListItem>
                                                                                    <asp:ListItem Value="507">Panama (+507)</asp:ListItem>
                                                                                    <asp:ListItem Value="675">Papua New Guinea (+675)</asp:ListItem>
                                                                                    <asp:ListItem Value="595">Paraguay (+595)</asp:ListItem>
                                                                                    <asp:ListItem Value="51">Peru (+51)</asp:ListItem>
                                                                                    <asp:ListItem Value="63">Philippines (+63)</asp:ListItem>
                                                                                    <asp:ListItem Value="48">Poland (+48)</asp:ListItem>
                                                                                    <asp:ListItem Value="351">Portugal (+351)</asp:ListItem>
                                                                                    <asp:ListItem Value="1787">Puerto Rico (+1787)</asp:ListItem>
                                                                                    <asp:ListItem Value="974">Qatar (+974)</asp:ListItem>
                                                                                    <asp:ListItem Value="262">Reunion (+262)</asp:ListItem>
                                                                                    <asp:ListItem Value="40">Romania (+40)</asp:ListItem>
                                                                                    <asp:ListItem Value="7">Russia (+7)</asp:ListItem>
                                                                                    <asp:ListItem Value="250">Rwanda (+250)</asp:ListItem>
                                                                                    <asp:ListItem Value="378">San Marino (+378)</asp:ListItem>
                                                                                    <asp:ListItem Value="239">Sao Tome &amp; Principe (+239)</asp:ListItem>
                                                                                    <asp:ListItem Value="966">Saudi Arabia (+966)</asp:ListItem>
                                                                                    <asp:ListItem Value="221">Senegal (+221)</asp:ListItem>
                                                                                    <asp:ListItem Value="381">Serbia (+381)</asp:ListItem>
                                                                                    <asp:ListItem Value="248">Seychelles (+248)</asp:ListItem>
                                                                                    <asp:ListItem Value="232">Sierra Leone (+232)</asp:ListItem>
                                                                                    <asp:ListItem Value="65">Singapore (+65)</asp:ListItem>
                                                                                    <asp:ListItem Value="421">Slovak Republic (+421)</asp:ListItem>
                                                                                    <asp:ListItem Value="386">Slovenia (+386)</asp:ListItem>
                                                                                    <asp:ListItem Value="677">Solomon Islands (+677)</asp:ListItem>
                                                                                    <asp:ListItem Value="252">Somalia (+252)</asp:ListItem>
                                                                                    <asp:ListItem Value="27">South Africa (+27)</asp:ListItem>
                                                                                    <asp:ListItem Value="34">Spain (+34)</asp:ListItem>
                                                                                    <asp:ListItem Value="94">Sri Lanka (+94)</asp:ListItem>
                                                                                    <asp:ListItem Value="290">St. Helena (+290)</asp:ListItem>
                                                                                    <asp:ListItem Value="1869">St. Kitts (+1869)</asp:ListItem>
                                                                                    <asp:ListItem Value="1758">St. Lucia (+1758)</asp:ListItem>
                                                                                    <asp:ListItem Value="249">Sudan (+249)</asp:ListItem>
                                                                                    <asp:ListItem Value="597">Suriname (+597)</asp:ListItem>
                                                                                    <asp:ListItem Value="268">Swaziland (+268)</asp:ListItem>
                                                                                    <asp:ListItem Value="46">Sweden (+46)</asp:ListItem>
                                                                                    <asp:ListItem Value="41">Switzerland (+41)</asp:ListItem>
                                                                                    <asp:ListItem Value="963">Syria (+963)</asp:ListItem>
                                                                                    <asp:ListItem Value="886">Taiwan (+886)</asp:ListItem>
                                                                                    <asp:ListItem Value="7">Tajikstan (+7)</asp:ListItem>
                                                                                    <asp:ListItem Value="66">Thailand (+66)</asp:ListItem>
                                                                                    <asp:ListItem Value="228">Togo (+228)</asp:ListItem>
                                                                                    <asp:ListItem Value="676">Tonga (+676)</asp:ListItem>
                                                                                    <asp:ListItem Value="1868">Trinidad &amp; Tobago (+1868)</asp:ListItem>
                                                                                    <asp:ListItem Value="216">Tunisia (+216)</asp:ListItem>
                                                                                    <asp:ListItem Value="90">Turkey (+90)</asp:ListItem>
                                                                                    <asp:ListItem Value="7">Turkmenistan (+7)</asp:ListItem>
                                                                                    <asp:ListItem Value="993">Turkmenistan (+993)</asp:ListItem>
                                                                                    <asp:ListItem Value="1649">Turks &amp; Caicos Islands (+1649)</asp:ListItem>
                                                                                    <asp:ListItem Value="688">Tuvalu (+688)</asp:ListItem>
                                                                                    <asp:ListItem Value="256">Uganda (+256)</asp:ListItem>
                                                                                    <asp:ListItem Value="44">UK (+44)</asp:ListItem>
                                                                                    <asp:ListItem Value="380">Ukraine (+380)</asp:ListItem>
                                                                                    <asp:ListItem Value="971">United Arab Emirates (+971)</asp:ListItem>
                                                                                    <asp:ListItem Value="598">Uruguay (+598)</asp:ListItem>
                                                                                    <asp:ListItem Value="1">USA (+1)</asp:ListItem>
                                                                                    <asp:ListItem Value="7">Uzbekistan (+7)</asp:ListItem>
                                                                                    <asp:ListItem Value="678">Vanuatu (+678)</asp:ListItem>
                                                                                    <asp:ListItem Value="379">Vatican City (+379)</asp:ListItem>
                                                                                    <asp:ListItem Value="58">Venezuela (+58)</asp:ListItem>
                                                                                    <asp:ListItem Value="84">Vietnam (+84)</asp:ListItem>
                                                                                    <asp:ListItem Value="84">Virgin Islands - British (+1284)</asp:ListItem>
                                                                                    <asp:ListItem Value="84">Virgin Islands - US (+1340)</asp:ListItem>
                                                                                    <asp:ListItem Value="681">Wallis &amp; Futuna (+681)</asp:ListItem>
                                                                                    <asp:ListItem Value="969">Yemen (North)(+969)</asp:ListItem>
                                                                                    <asp:ListItem Value="967">Yemen (South)(+967)</asp:ListItem>
                                                                                    <asp:ListItem Value="260">Zambia (+260)</asp:ListItem>
                                                                                    <asp:ListItem Value="263">Zimbabwe (+263)</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                 <label class="popup106lable">
                                                                                    Mobile Number<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtmobileno" MaxLength="10" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Mobile No"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers"
                                                                                    TargetControlID="txtmobileno" />
                                                                            </div>
                                                                              <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                <label class="popup106lable">
                                                                                    Email Id<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtemail" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Email ID"></asp:TextBox>
                                                                            </div>
                                                                               <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                               <label class="popup106lable">
                                                                                    DOB<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtdob" TextMode="Date" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter DOB Name"></asp:TextBox>
                                                                            </div>
                                                                          <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                   <label class="popup106lable">
                                                                                    Nationality<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtnationality" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Nationality Name"></asp:TextBox>
                                                                            </div>
                                                                             <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                               <label class="popup106lable">
                                                                                    Pancard No<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtpancard" runat="server" MaxLength="10" class="form-control  fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Pan Card No"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers, LowercaseLetters, UppercaseLetters"
                                                                                    TargetControlID="txtpancard" />
                                                                            </div>
                                                                                    <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                               <label class="popup106lable">
                                                                                   Aadhaar No<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtaadhaar" runat="server" MaxLength="12" class="form-control  fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Aadhaar No"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers"
                                                                                    TargetControlID="txtaadhaar" />
                                                                            </div>
                                                                     
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                </asp:Panel>
                                                                <div style="display: block; text-align: center;">
                                                                    <asp:Panel ID="pnladdbookingdisplay"   runat="server">  
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel7" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>

                                                                            <asp:LinkButton runat="server" ID="lnkaddbooking" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="lnkaddnewbooking_Clicked">
                                                  Add
                                                                            </asp:LinkButton>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="lnkaddbooking" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                    
                                                                    </asp:Panel>
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel14" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:LinkButton runat="server" ID="LinkButton6" Style="margin-right: 0px !important;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="btnstep3_Clicked">
                                                Previous
                                                                            </asp:LinkButton>
                                                                            <asp:LinkButton runat="server" ID="LinkButton11" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="btnlocation_Clicked">
                                                  Next
                                                                            </asp:LinkButton>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="lnkaddbooking" EventName="Click" />
                                                                            <asp:AsyncPostBackTrigger ControlID="LinkButton11" EventName="Click" />
                                                                            <asp:AsyncPostBackTrigger ControlID="LinkButton6" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnllocation" Visible="false" runat="server">
                                                                <div style="display: block; text-align: center;">
                                                                    <asp:Label Text="Communnication Address" ID="Label25" class="popup106lable" runat="server" />
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-3">
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  form-group">
                                                                                <asp:Label Text="Building / Flat No" ID="Label26" class="popup106lable" runat="server" /><span style="color: Red;">*</span>

                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtbuilding"
                                                                                    placeholder="Enter Building / Flat No" runat="server"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-6 col-lg-6  form-group">
                                                                                <asp:Label Text="Landmark" ID="Label27" class="popup106lable" runat="server" />
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtlandmark"
                                                                                    placeholder="Enter Landmark" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-6 col-lg-6  form-group">
                                                                                <asp:Label Text="Area" ID="Label28" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtarea"
                                                                                    placeholder="Enter Area" runat="server"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-4 col-lg-4  form-group">
                                                                                <asp:Label Text="City" ID="Label29" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtcity"
                                                                                    placeholder="Enter City" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-4 col-lg-4  form-group">
                                                                                <asp:Label Text="State" ID="Label30" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtstate"
                                                                                    placeholder="Enter State" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-4 col-lg-4  form-group">
                                                                                <asp:Label Text="Pincode" ID="Label31" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtpincode"
                                                                                    placeholder="Enter Pincode" MaxLength="6" runat="server"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
                                                                                    TargetControlID="txtpincode" />

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="display: block; text-align: center; margin-top: 30px;">
                                                                    <asp:Label Text="Permanent Address" ID="Label32" class="popup106lable" runat="server" />
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-3">
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  form-group">
                                                                                <asp:Label Text="Building / Flat No" ID="Label33" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtbuilding1"
                                                                                    placeholder="Enter Building / Flat No" runat="server"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-6 col-lg-6  form-group">
                                                                                <asp:Label Text="Landmark" ID="Label34" class="popup106lable" runat="server" />
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtlandmark1"
                                                                                    placeholder="Enter Landmark" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-6 col-lg-6  form-group">
                                                                                <asp:Label Text="Area" ID="Label35" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtarea1"
                                                                                    placeholder="Enter Area" runat="server"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-4 col-lg-4  form-group">
                                                                                <asp:Label Text="City" ID="Label36" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtcity1"
                                                                                    placeholder="Enter City" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-4 col-lg-4  form-group">
                                                                                <asp:Label Text="State" ID="Label37" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtstate1"
                                                                                    placeholder="Enter State" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-4 col-lg-4  form-group">
                                                                                <asp:Label Text="Pincode" ID="Label38" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtpincode1"
                                                                                    placeholder="Enter Pincode" MaxLength="6" runat="server"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderEE3" runat="server" FilterType="Numbers"
                                                                                    TargetControlID="txtpincode1" />

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="display: block; text-align: center;">
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel20" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkprev" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="lnkprev_Click">
                                                  Previous
                                                                            </asp:LinkButton>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="lnkprev" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel21" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:LinkButton runat="server" ID="LinkButton8" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="btnother_Clicked">
                                                  Next
                                                                            </asp:LinkButton>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="LinkButton8" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnlother" Visible="false" runat="server">
                                                                <div style="display: block; text-align: center;">
                                                                    <asp:Label Text="" ID="Label14" class="popup106lable" runat="server" />
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-md-offset-3">
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  padding0">
                                                                                <div class="popup106 borderradius10 subcolor101   fontweight600" style="margin-bottom: 0px;">
                                                                                    <asp:Label Text="Purchasing property for " ID="Label11" class="popup106lable"  runat="server" /><span style="color: Red;">*</span> <br />
                                                                                    <asp:RadioButton ID="rdenduse" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                        class="form-control  fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                        Text="End Use" GroupName="purchase" runat="server" />
                                                                                    <asp:RadioButton ID="rdinvestment" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                        class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                        Text="Investment" GroupName="purchase" runat="server" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12 col-lg-12 padding0">
                                                                                <div class="popup106 borderradius10 subcolor101   fontweight600" style="margin-bottom: 0px;">

                                                                                    <div class="col-md-6 col-lg-6 padding0">
                                                                                        <asp:Label Text="Will you be availing loan?" ID="Label12" class="popup106lable"   runat="server" /><span style="color: Red;">*</span> <br />
                                                                                        <asp:RadioButton ID="rdyes" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                            Text="Yes" GroupName="loan" runat="server" OnCheckedChanged="rdyes_CheckedChanged" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdno" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                            Text="No" GroupName="loan" runat="server" OnCheckedChanged="rdyes_CheckedChanged" AutoPostBack="true" />
                                                                                    </div>
                                                                                    <div runat="server" visible="false" id="divloan" class="col-md-6 col-lg-6  popup106 borderradius10 bordercolor101 subcolor101   fontweight600 ">
                                                                                        <asp:Label Text="Please Specify" ID="Label16" class="popup106lable" runat="server" />
                                                                                        <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                            ID="txtloanspecify"
                                                                                            placeholder="Enter Specify Bank" runat="server"></asp:TextBox>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-12 col-lg-12 padding0">
                                                                                    <div class="popup106 borderradius10 subcolor101   fontweight600" style="margin-bottom: 0px;">

                                                                                        <asp:Label Text="How did you hear about us?" ID="Label13" class="popup106lable"   runat="server" /><span style="color: Red;">*</span> <br />
                                                                                        <asp:RadioButton ID="rdhoarding" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Hoarding" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdemail" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Emails" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdweb" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Website" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdbroker" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Broker" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdacq" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Acquaintance" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdother" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Other" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <div runat="server" id="divadv" visible="false" class="col-md-6 col-lg-6  popup106 borderradius10 bordercolor101 subcolor101   fontweight600 ">
                                                                                            <asp:Label Text="Please Specify" ID="Label17" class="popup106lable" runat="server" />
                                                                                            <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                                ID="txtadvspecify"
                                                                                                placeholder="Enter Specify" runat="server"></asp:TextBox>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-12 col-lg-12 padding0">
                                                                                    <div class="popup106 borderradius10 subcolor101   fontweight600" style="margin-bottom: 0px;">
                                                                                        <asp:Label Text="How would you like to be connected?" ID="Label15" class="popup106lable"  runat="server" /><span style="color: Red;">*</span> <br />
                                                                                        <asp:RadioButton ID="rdmobile" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                            Text="Mobile" GroupName="conn" runat="server" />
                                                                                        <asp:RadioButton ID="rdtele" Style="border: none !important; font-size: 12px; display: none; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                            Text="Telephone" GroupName="conn" runat="server" />
                                                                                        <asp:RadioButton ID="rdltr" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                            Text="Letters" GroupName="conn" runat="server" />
                                                                                        <asp:RadioButton ID="rdemails" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                            Text="Emails" GroupName="conn" runat="server" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                             <div class="col-md-6 col-lg-6  form-group">
                                                                                 
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtaddremark" style="margin-top:10px;"
                                                                                    placeholder="Enter remark" runat="server"></asp:TextBox>

                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="display: block; text-align: center;">
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel19" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:LinkButton runat="server" ID="LinkButton7" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="lnkpre1_Click">
                                                  Previous
                                                                            </asp:LinkButton>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="lnkprev" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel22" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:LinkButton runat="server" ID="LinkButton9" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="lnkconti_Click">
                                                  Next
                                                                            </asp:LinkButton>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="LinkButton8" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </div>

                                                            </asp:Panel>
                                                        </div>
                                                    </div>

                                                </div>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:Panel>

                               <asp:Panel ID="pnlpay" visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color:#ffffff;">
                                    <div class="righttimer">
                                        <asp:Label ID="lblpay" runat="server"></asp:Label>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">
                                        <asp:Label Text="Payment" ID="lblheader" runat="server" /></span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101" style="width:500px;">
                                            <asp:Label ID="lblpaymentmsg" Text="" runat="server" />   
                                        </div>
                                    </div>
                                    <asp:Panel ID="pnlsuccess" Visible="false" runat="server">  
                                    <img src="images/paid1.png" class="imgsuccess" />
                                    
                                    </asp:Panel>
                                      <asp:Panel ID="pnlfailed" Visible="false" runat="server">  
                                    <img src="images/failed.png" style="margin-top:20px;" class="imgsuccess" />
                                    
                                    </asp:Panel>
                                       <asp:Panel ID="pnlthanks" Visible="false" runat="server">  
                                  
                                                <div style="display: block; text-align: center;"> 
                                                        <asp:LinkButton runat="server" ID="LinkButton38" Style="width: 200px; margin-right: 0px !important; margin-top: 40px;"
                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                            OnClientClick="javascript:window.close();">
                                             Thank you
                                                        </asp:LinkButton>
                                                    </div>
                                                     </asp:Panel>
                                   
                                </div>
                            </asp:Panel> 
                            <asp:Panel ID="pnlconfirmdoc" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color:#ffffff;">
                                    <div class="righttimer">
                                        <div id="countdown3"></div>

                                        <asp:Label ID="lblconf" runat="server"></asp:Label>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Confirm Booking</span>
                                    <div>
                                      <%--  <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Confirm Booking Details
                                        </div>--%>
                                    </div>
                                </div>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel17">
                                    <ContentTemplate>
                                        <div>
                                            <div style="padding: 0px 10px 10px 10px !important;" class="margintop30">
                                                <div class="displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding">
                                                 <div class="fontsize12 displayblock" style="MARGIN-BOTTOM:10px;">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <%--<div>
                                                                           Kindly review the below information carefully before submitting the form. On confirmation of the below form, the selected unit will be reserved for the next 20 minutes. You will then be redirected to a secured payment gateway and you are required to make payments in the next 20 minutes, else the selected unit will be released.
                                                                            </div>--%>
                                                                    </div>
                                                                </div>
                                                                
                                                                
                                                                    <div class="headercolor101 fontsize13 displayblock textalignleft" style="padding: 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px;">
                                                        Project Name : <b>The Virtuoso</b>  &nbsp; &nbsp;
                                                <div style="display: inline-block">
                                                    Unit No : <b>
                                                        <asp:Label Text="A-201-2BHK" ID="lblcunit" runat="server" /></b>
                                                </div>
                                                    </div>
                                                    <asp:Repeater ID="rptdbooking" runat="server">
                                                        <ItemTemplate>
                                                            <div class="headercolor101 fontsize13 displayblock textalignleft margintop5" style="padding: 5px 20px 5px 5px; background: #424b57; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 10px;">
                                                                PERSONAL DETAILS FOR APPLICANT
                                                <asp:Label Text='<%#Eval("srno") %>' ID="Label41" runat="server" />
                                                            </div>

                                                            <div class="row margintop30" style="text-align: left">
                                                                <div class="col-md-12">
                                                                    <div class="row popup105 ">
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Title" ID="lbltitle1222" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldtitle" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("sname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="First Name" ID="Label18" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldfirstname" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("firstname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Middle Name" ID="Label21" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldmiddlename" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("middlename") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Last Name" ID="Label23" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldlastname" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("lastname") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Mobile No." ID="Label42" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldmobileno" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("mobileno") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="DOB" ID="Label22" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lblddob" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("dob1") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Pancard No." ID="Label24" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldpancard" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("panno") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                          <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Aadhaarno" ID="Label3" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label4" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("aadharno") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Nationality" ID="Label39" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldnationality" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("nationality") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-3 col-lg-3 padding0">
                                                                            <div class="popup106  subcolor101   fontweight600">
                                                                                <asp:Label Text="Email-Id" ID="Label44" class="popup106lable fontsize12" runat="server" />
                                                                                <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldemail" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                                    Text='<%#Eval("emailid") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>



                                                    <div class="headercolor101 fontsize13 displayblock textalignleft" style="padding: 5px 20px 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px; display: inline-block; float: left; font-size: 10px; text-transform: uppercase;">
                                                        Communication Address 
                                                    </div>
                                                    <div class="row margintop30" style="text-align: left">
                                                        <div class="col-md-12">
                                                            <div class="row popup105 ">
                                                                <div class="col-md-12  col-lg-12 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Building/Flat No." ID="Label19" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldbuilding" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Landmark" ID="Label40" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldlandmark" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Area" ID="Labelsa45" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldarea" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4  col-lg-4 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="City" ID="Label4s5" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldcity" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-lg-4 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="State" ID="Label47" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldstate" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4  col-lg-4 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Pincode" ID="Label45" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldpincode" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="headercolor101 fontsize13 displayblock textalignleft" style="padding: 5px 20px 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px; display: inline-block; float: left; font-size: 10px; text-transform: uppercase;">
                                                        Permanent Address 
                                                    </div>
                                                    <div class="row margintop30" style="text-align: left">
                                                        <div class="col-md-12">
                                                            <div class="row popup105 ">
                                                                <div class="col-md-12  col-lg-12 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Building/Flat No." ID="Label20" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldbuilding1" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Landmark" ID="Label43" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldlandmark1" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Area" ID="Label46" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldarea1" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4  col-lg-4 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="City" ID="Label48" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldcity1" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-lg-4 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="State" ID="Label49" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldstate1" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4  col-lg-4 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Pincode" ID="Label50" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldpincode1" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="headercolor101 fontsize13 displayblock textalignleft margintop5" style="padding: 5px 20px 5px 5px; background: #424b57; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 10px;">
                                                        OTHER INFORMATION
                                                    </div>
                                                    <div class="row margintop30" style="text-align: left">
                                                        <div class="col-md-12">
                                                            <div class="row popup105 ">
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Purchasing property for: " ID="Label62" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldenduse" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row popup105 ">
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Will you be availing loan?" ID="Label64" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldloan" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6  col-lg-6 padding0" runat="server" id="divdremarkloan">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Remark" ID="Label70" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldremarkloan" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row popup105 ">
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="How did you hear about us?" ID="Label66" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldadv" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6  col-lg-6 padding0" runat="server" id="divdremarkadv">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Remark" ID="Label72" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldremarkadv" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row popup105 ">
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="How would you like to be contacted?" ID="Label68" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldcon" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row popup105 ">
                                                                <div class="col-md-6  col-lg-6 padding0">
                                                                    <div class="popup106  subcolor101   fontweight600">
                                                                        <asp:Label Text="Remark" ID="Label2" class="popup106lable fontsize12" runat="server" />
                                                                        <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldremarkbooking" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                                            Text="" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>


                                                </div>
                                            </div>
                                                  <div style="padding: 0px 10px 10px 10px !important;" class="margintop15 lineheight25">
                                                        <div class="width600  textaligncenter marginleftauto border101 costpadding">
                                                 
                                                             <div class="displayblock  textaligncenter marginleftauto  padding30 " style="width: 730px; padding-top: 0px !important;">
                                                               
                                                                 <div class="margintop5 fontsize12 displayblock ">
                                                                    <div class="headercolor101 textalignleft fontweight600">
                                                                        <div class="schedule101">
                                                                          Booking Terms and Conditions
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                   <asp:Repeater ID="rptconfirmterms" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                            <div class="subcolor101 textalignleft fontweight400">
                                                                                <div style="line-height:24px;">
                                                                                    <%#Eval("terms") %>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                 <div style="display:none;">
                                                                    
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                           Please read the following terms and conditions on online booking carefully as it sets out the terms of legally binding agreement between you and BramhaCorp Ltd.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                       The online payment of booking amount of INR 50,000/- (Indian Rupees Fifty Thousand only) (“Token Amount”) is subject to applicable laws of the Reserve Bank of India (RBI) as well as the applicable and prevailing laws, rules and regulations framed with regard to the Credit Card/ Debit Card/Net Banking.</div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                 Indian Residents/Non- Resident Indians (NRIs)/Persons of Indian Origin (PIOs) who are competent to enter into a contract under the Indian Contract Act, 1872, shall be eligible to apply. The Applicant(s) shall be responsible to comply with all the statutory compliances as required from time to time under the applicable laws prevailing in India including the laws applicable to NRIs/PIOs and the Company shall not be liable for non-compliance of the same, in any manner whatsoever.    </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                         	The payment of Token Amount through Credit Card/ Debit Card/Net Banking is subject to the risks involved in any electronic payment transactions including but not limited to technical failure in the payment gateway operations. The Company shall not be liable for any failure of any payment transaction/s or for any amount/s debited from the Applicant/s account but not credited to the Company’s account. The Applicant/s shall not have any claim/s against the Company for such failed transaction/s under any circumstances whatsoever.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                          	On successful payment of Token Amount, the Applicant(s) shall be assigned an order number which will be communicated to the email address provided by the Applicant(s) on the online form. The Company shall confirm the availability of the Unit within 48 hours of receipt of Token Amount.If Company is not in position to confirm the Unit within said 48 hours, for any reason whatsoever, shall refund the Token Amount to buyer and the refund process will be initiated within next 15 working days.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                         	It is hereby clarified that the payment of Token Amount shall merely constitute an expression of interest in a particular Unit by the Applicant(s) and shall under no circumstances be construed as creation of right, title or interest in a particular Unit. On acceptance of online booking by the Company, the Applicant(s) shall be required to submit duly filled-in Booking Application Form for allotment of Unit envisaging broader terms and conditions of inter-alia allotment, payment schedule, and agreement for sale. The Booking Application Form shall be submitted by the Applicant(s) within a period of 2 (two) working days from the Company’s confirmation about the availability of Unit.     
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                       	Upon the Applicant(s) submitting the duly filled-in Booking Application Form to Company as above, the said Token Amount shall be adjusted against the sale consideration payable towards the Unit, as per the Booking Application Form.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                          BramhaCorp Limited and/or its affiliates/subsidiaries/group entities (“Company”) reserves its right to accept or reject any online booking by the Applicant(s). 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                The terms and conditions contained herein and in the Booking Application Form shall be construed in accordance with the laws of India, State of Maharashtra and any disputes/issues arising out of this transaction will be subject to the exclusive jurisdiction of Courts in Pune only
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                             
                                                             </div>
                                                             
                                                                <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div>
                                                                            <asp:CheckBox ID="chkterms" style="display:inline-block;
    vertical-align: text-bottom;"  runat="server" /> 
                                                                            <asp:Label ID="lblchkterms"  runat="server" class="fontweight600"> I/We acknowledge that I have read, understood, and agree to all the Terms & Conditions mentioned herewith.
                                                                     </asp:Label> 
                                                                       </div>
                                                                    </div>
                                                                </div>
                                                             </div>
                                                   
                                                   <div style="display: block; text-align: center;">
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel26" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:LinkButton runat="server" ID="LinkButton37" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                                OnClick="lnkprebook_Click">
                                                  Previous
                                                                            </asp:LinkButton>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="LinkButton37" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                        <asp:LinkButton runat="server" ID="lnkpayment" Style="width: 200px; margin-right: 0px !important; margin-top: 40px;"
                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                            OnClick="btnpaymentredirect_Clicked">
                                               Confirm 
                                                        </asp:LinkButton>
                                                    </div>

                                                 </div>
                                                 </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>



                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="clearbtn" runat="server" OnClick="btnclear_Clicked" Style="display: none" />
    </form>
    <script src="css/jquery-3.2.1.min.js" type="text/javascript"></script>
    <%--    <script>
        
           function rand(min, max) {
               return Math.random() * (max - min) + min;
           }
           var color = ['#b8282e', '#424b57', '#b8282e', '#424b57', '#b8282e', '#424b57', "#b8282e", "#424b57"];
           var label = ['10', '200', '50', '100', '5', '500', '0', "jPOT"];
           var slices = color.length;
           var sliceDeg = 360 / slices;
           var deg = rand(0, 360);
           var speed = 0;
           var slowDownRand = 0;
           var ctx = canvas.getContext('2d');
           var width = canvas.width; // size
           var center = width / 2;      // center
           var isStopped = false;
           var lock = false;
           function deg2rad(deg) {
               return deg * Math.PI / 180;
           }
           function drawSlice(deg, color) {
               ctx.beginPath();
               ctx.fillStyle = color;
               ctx.moveTo(center, center);
               ctx.arc(center, center, width / 2, deg2rad(deg), deg2rad(deg + sliceDeg));
               ctx.lineTo(center, center);
               ctx.fill();
           }
           function drawText(deg, text) {
               ctx.save();
               ctx.translate(center, center);
               ctx.rotate(deg2rad(deg));
               ctx.textAlign = "right";
               ctx.fillStyle = "#fff";
               ctx.font = 'bold 30px sans-serif';
               ctx.fillText(text, 130, 10);
               ctx.restore();
           }
           function drawImg() {
               ctx.clearRect(0, 0, width, width);
               for (var i = 0; i < slices; i++) {
                   drawSlice(deg, color[i]);
                   drawText(deg + sliceDeg / 2, label[i]);
                   deg += sliceDeg;
               }
           }
            (function anim() {
                   deg += speed;
                   deg %= 360;
                   // Increment speed
                   if (!isStopped && speed < 7) {
                       speed = speed + 1 * 0.3;
                   }
                   // Decrement Speed
                   if (isStopped) {
                       if (!lock) {
                           lock = true;
                           slowDownRand = rand(0.984, 0.988);
                       }
                       speed = speed > 0.2 ? speed *= slowDownRand : 0;
                   }
                   // Stopped!
                   if (lock && !speed) {
                       var ai = Math.floor(((360 - deg - 90) % 360) / sliceDeg); // deg 2 Array Index
                       ai = (slices + ai) % slices; // Fix negative index
                       return alert("You got:\n" + label[ai]); // Get Array Item from end Degree
                   }
                   drawImg();
                   window.requestAnimationFrame(anim);
               } ());
               setTimeout(
                function () {
                    isStopped = true;
                }, 5000);
//           drawImg();
//           function myFunction() {
//               function rand(min, max) {
//                   return Math.random() * (max - min) + min;
//               }
//               var color = ['#b8282e', '#424b57', '#b8282e', '#424b57', '#b8282e', '#424b57', "#b8282e", "#424b57"];
//               var label = ['10', '200', '50', '100', '5', '500', '0', "jPOT"];
//               var slices = color.length;
//               var sliceDeg = 360 / slices;
//               var deg = rand(0, 360);
//               var speed = 0;
//               var slowDownRand = 0;
//               var ctx = canvas.getContext('2d');
//               var width = canvas.width; // size
//               var center = width / 2;      // center
//               var isStopped = false;
//               var lock = false;
//               function deg2rad(deg) {
//                   return deg * Math.PI / 180;
//               }
//               function drawSlice(deg, color) {
//                   ctx.beginPath();
//                   ctx.fillStyle = color;
//                   ctx.moveTo(center, center);
//                   ctx.arc(center, center, width / 2, deg2rad(deg), deg2rad(deg + sliceDeg));
//                   ctx.lineTo(center, center);
//                   ctx.fill();
//               }
//               function drawText(deg, text) {
//                   ctx.save();
//                   ctx.translate(center, center);
//                   ctx.rotate(deg2rad(deg));
//                   ctx.textAlign = "right";
//                   ctx.fillStyle = "#fff";
//                   ctx.font = 'bold 30px sans-serif';
//                   ctx.fillText(text, 130, 10);
//                   ctx.restore();
//               }
//               function drawImg() {
//                   ctx.clearRect(0, 0, width, width);
//                   for (var i = 0; i < slices; i++) {
//                       drawSlice(deg, color[i]);
//                       drawText(deg + sliceDeg / 2, label[i]);
//                       deg += sliceDeg;
//                   }
//               }
//               (function anim() {
//                   deg += speed;
//                   deg %= 360;
//                   // Increment speed
//                   if (!isStopped && speed < 7) {
//                       speed = speed + 1 * 0.3;
//                   }
//                   // Decrement Speed
//                   if (isStopped) {
//                       if (!lock) {
//                           lock = true;
//                           slowDownRand = rand(0.984, 0.988);
//                       }
//                       speed = speed > 0.2 ? speed *= slowDownRand : 0;
//                   }
//                   // Stopped!
//                   if (lock && !speed) {
//                       var ai = Math.floor(((360 - deg - 90) % 360) / sliceDeg); // deg 2 Array Index
//                       ai = (slices + ai) % slices; // Fix negative index
//                       return alert("You got:\n" + label[ai]); // Get Array Item from end Degree
//                   }
//                   drawImg();
//                   window.requestAnimationFrame(anim);
//               } ());
//               setTimeout(
//                function () {
//                    isStopped = true;
//                }, 5000);
//           }
           //         document.getElementById("spin").addEventListener("mousedown", function () {
           //             isStopped = true;
           //         }, false);
       
    </script>
    --%>
    <script src="css/bootstrap.min.js" type="text/javascript"></script>
    <script src="plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
    <script type="text/javascript" src='https://unitegallery.net/unitegallery/js/unitegallery.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/unitegallery/1.7.31/themes/default/ug-theme-default.min.js'></script>
    <script type="text/javascript">

        jQuery(document).ready(function () {

            jQuery("#output").unitegallery({
                theme_enable_text_panel: false,
                gallery_width: 1140,
                slider_zoom_max_ratio: 1
            });

        });
        $(document).ready(function () {
            $(".select2_single").select2({
            });
            $(".select2_group").select2({});
            $(".select2_multiple").select2({
                allowClear: true
            });
        });

 
    </script>
    <script>
        function zoomin() {
            var myImg = document.getElementById("Layer_1");
           
    var currWidth = myImg.clientHeight;
                if (currWidth >= 1200) {

                } else {
                    myImg.style.height = (currWidth + 300) + "px";
                }
             
  
        }
        function zoomout() {
            var myImg = document.getElementById("Layer_1");


  
                var currWidth = myImg.clientHeight;
          
                if (currWidth <= 500) {

                } else {
                    myImg.style.height = (currWidth - 300) + "px";
                }

 
             
           
        }
</script>
    <script>
        function zoominimg() {
   var myImg1 = document.getElementById("imgunit");
    
           
                var currWidth1 = myImg1.clientHeight;


                if (currWidth1 >= 1200) {

                } else {
                    myImg1.style.height = (currWidth1 + 300) + "px";
                }
            
        }
        function zoomoutimg() {
             
            var myImg1 = document.getElementById("imgunit");

 
                var currWidth1 = myImg1.clientHeight;


                if (currWidth1 <= 500) {

                } else {
                    myImg1.style.height = (currWidth1 - 300) + "px";
                }
 
           


        }
</script>
</body>
</html>
