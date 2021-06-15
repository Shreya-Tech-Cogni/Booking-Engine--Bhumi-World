<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inventorytemp.aspx.cs"
    Inherits="bramhacorp.inventorytemp" %>

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
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
    <script>(function (i, s, o, g, r, a, m) { i["GoogleAnalyticsObject"] = r; i[r] = i[r] || function () { (i[r].q = i[r].q || []).push(arguments) }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) })(window, document, "script", "//www.google-analytics.com/analytics.js", "ga"); window["ga-disable-UA-190621997-1"] = true; ga("create", "UA-190621997-1", "auto"); ga("set", "anonymizeIp", true);</script>
	<meta name="description" content="Virtual Tour"/>
	<meta name="theme-color" content="#FFFFFF"/>
    <script src="lib/tdvplayer.js?v=1620837697373"></script>
    <style type="text/css">
        .mybutton:focus {
            outline: 0;
        }

        .preloader {
            position: fixed;
            left: 0;
            top: 0;
            z-index: 9999;
            width: 100%;
            height: 100%;
            overflow: visible;
            background: #ffffff;
        }

        #preloader {
            position: fixed;
            left: 0;
            top: 0;
            z-index: 9999;
            width: 100%;
            height: 100%;
            overflow: visible;
            background: #ffffff;
        }

        @keyframes blink {
            0% {
                opacity: 1;
            }

            50% {
                opacity: 0.2;
            }

            100% {
                opacity: 1;
            }
        }

        @-webkit-keyframes blink {
            0% {
                opacity: 1;
            }

            50% {
                opacity: 0.2;
            }

            100% {
                opacity: 1;
            }
        }

        .preloadercss {
            text-align: center;
            -moz-transition: all 0.5s ease-in-out;
            -webkit-transition: all 0.5s ease-in-out;
            -o-transition: all 0.5s ease-in-out;
            -ms-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
            -moz-animation: blink normal 1.5s infinite ease-in-out;
            /* Firefox */
            -webkit-animation: blink normal 1.5s infinite ease-in-out;
            /* Webkit */
            -ms-animation: blink normal 1.5s infinite ease-in-out;
            /* IE */
            animation: blink normal 1.5s infinite ease-in-out;
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
    <form id="form1" runat="server">

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
                    <img src=""  class="preloadercss" style="width: 250px; position: fixed; top: 40%; left: 50%; transform: translate(-50%, -50%); z-index: 11111; overflow: visible;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
                <%--<div id="timerdiv" runat="server" class="righttimer">
                    <b>
                        <div id="countdown"></div>
                    </b>
                </div>--%>
                <div id="divbody" runat="server">
                    <div class="topdiv">
                        <div class="displayinline">
                            <img src="images/logo.jpg" class="iconclassmargin"  />
                        </div>
                        <div class="displayinline menudisplay">
                           

                      <div class="displayinline marginleft5" id="step11" runat="server" style="border: 1px solid #b01b2a;">
                                <asp:LinkButton ID="divstep1" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;">
               
                    <i class="material-icons-outlined stepicon101 headingsubcolor">king_bed</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" id="steptext"  runat="server">
                     <%= Session["unitdetails"].ToString() %> <div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptextone"  runat="server">
                             <%= Session["step1"].ToString() %></div>
                    </div> 
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5" id="step22" runat="server" style="border: 1px solid #b01b2a;">
                                <asp:LinkButton ID="divstep2" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
                     <i class="material-icons-outlined stepicon101 headingsubcolor">fact_check</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" id="steptext2" runat="server">
                         <%= Session["costsheet"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptexttwo"  runat="server">
                              <%= Session["step2"].ToString() %></div>
                    </div> 
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5" id="step33" runat="server" style="border: 1px solid #b01b2a;">
                                <asp:LinkButton ID="divstep3" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
            
                    <i class="material-icons-outlined stepicon101 headingsubcolor">date_range</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" id="steptext3" runat="server">
                          <%= Session["paymentschedule"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptextthree"  runat="server">
                             <%= Session["step3"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5" id="step44" runat="server" style="border: 1px solid #b01b2a;">
                                <asp:LinkButton ID="divstep4" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
           
                    <i class="material-icons-outlined stepicon101 headingsubcolor">assignment</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" id="steptext4" runat="server">
                          <%= Session["bookingform"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptextfour"  runat="server">
                             <%=   Session["step4"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                            <div class="displayinline marginleft5" id="step55" runat="server" style="border: 1px solid #b01b2a;">
                                <asp:LinkButton ID="divstep5" runat="server" class="borderleft lineheight20 displayinline step101 "
                                    Style="text-decoration: none;" >
           
                     <i class="material-icons-outlined stepicon101 headingsubcolor">payment</i>
                    <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" id="steptext5" runat="server">
                          <%= Session["payment"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptextfive"  runat="server">
                             <%= Session["step5"].ToString() %></div>
                    </div>
                                </asp:LinkButton>
                            </div>
                       
                            
                        
                        </div>
                        <div class="displayinline menudisplayhideicon" >
                            <asp:Panel ID="Panel1" class="displayinline marginleft5" runat="server" >
                                <div id="step111" runat="server">
                                    <asp:LinkButton ID="divstep1b" runat="server" class="borderleft lineheight20 displayinline step101  "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">king_bed</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptext11"  runat="server">
                                 STEP 1</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" class="displayinline marginleft5" runat="server">

                                <div id="step222" runat="server">
                                    <asp:LinkButton ID="divstep2b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">fact_check</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptext22"  runat="server">
                                 STEP 2</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" class="displayinline marginleft5" runat="server">
                                <div id="step333" runat="server">
                                    <asp:LinkButton ID="divstep3b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                       >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">date_range</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptext33"  runat="server">
                                STEP 3</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" class="displayinline marginleft5" runat="server">
                                <div id="step444" runat="server">
                                    <asp:LinkButton ID="divstep4b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                       >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">assignment</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptext44"  runat="server">
                                STEP 4</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel5" class="displayinline marginleft5" runat="server">
                                <div id="step555" runat="server">
                                    <asp:LinkButton ID="divstep5b" runat="server" class="borderleft lineheight20 displayinline step101 "
                                        Style="text-decoration: none; width: 85px; padding: 12px 20px;"
                                        >
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">payment</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="steptext55"  runat="server">
                                STEP 5</div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                        </div>

                        <div class="displayinline menudisplayhide">
                            <asp:Panel ID="pnlstep1" runat="server">
                                <div class="displayinline marginleft5" >
                                    <asp:LinkButton ID="divstep1a" runat="server" class="borderleft lineheight20 displayinline step101 bgcolor"
                                        Style="text-decoration: none;" >
           
                        <i class="material-icons-outlined stepicon101 headingsubcolor">king_bed</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor  bgfontcolor" >
                         <%= Session["unitdetails"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400  bgfontcolor" >
                                <%= Session["step1"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep2" Visible="false" runat="server">
                                <div class="displayinline marginleft5" >
                                    <asp:LinkButton ID="divstep2a" runat="server" class="borderleft lineheight20 displayinline step101 step2 bgcolor"
                                        Style="text-decoration: none;" >
           
                       <i class="material-icons-outlined stepicon101 headingsubcolor">fact_check</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor  bgfontcolor" >
                            <%= Session["costsheet"].ToString()%> <div class="letterspacing1 fontsize10 headingsubcolor fontweight400  bgfontcolor" >
                                 <%= Session["step2"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep3" Visible="false" runat="server">
                                <div class="displayinline marginleft5" >
                                    <asp:LinkButton ID="divstep3a" runat="server" class="borderleft lineheight20 displayinline step101 step3 bgcolor"
                                        Style="text-decoration: none;" >
           
                        <i class="material-icons-outlined stepicon101 headingsubcolor">date_range</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor  bgfontcolor" >
                              <%= Session["paymentschedule"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400  bgfontcolor" >
                                  <%= Session["step3"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep4" Visible="false" runat="server">
                                <div class="displayinline marginleft5" >
                                    <asp:LinkButton ID="divstep4a" runat="server" class="borderleft lineheight20 displayinline step101 step4 bgcolor"
                                        Style="text-decoration: none;" >
          
                         <i class="material-icons-outlined stepicon101 headingsubcolor">assignment</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor  bgfontcolor" >
                           <%= Session["bookingform"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400  bgfontcolor" >
                                 <%= Session["step4"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlstep5" Visible="false" runat="server">
                                <div class="displayinline marginleft5" >
                                    <asp:LinkButton ID="divstep5a" runat="server" class="borderleft lineheight20 displayinline step101 bgcolor"
                                        Style="text-decoration: none;" >
          
                        <i class="material-icons-outlined stepicon101 headingsubcolor">payment</i>
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor bgfontcolor" >
                              <%= Session["payment"].ToString() %><div class="letterspacing1 fontsize10 headingsubcolor fontweight400  bgfontcolor" >
                                  <%= Session["step5"].ToString() %></div>
                        </div>
                                    </asp:LinkButton>
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="displayinline marginleft5 floatright">
                            <div class="borderleft lineheight20 displayinline step101 darkback">
                                <span class="stepicon101 headingsubcolor helveticafont fontsize25 verticalsuper darktextstroke sign" style="font-size: 22px !important; /* margin-top: -10px !important; */
    vertical-align: top; display: inline-block;">₹</span>
                                <div class="fontweight600 fontsize20 displayinline letterspacing0 headingcolor colorwhite" style="color: #fff !important;">
                                    <%= Session["regfees"].ToString()%><div class="letterspacing1 fontsize10 headingsubcolor colorwhite fontweight400" style="color: #fff !important;">
                                        Booking Amount
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:TextBox ID="txtseatnumber" runat="server" Visible="false"></asp:TextBox>
                    <div style="display: block; height: 100vh; width: 100%;">

                        <asp:UpdatePanel ID="upfilterpopup" runat="server">
                            <ContentTemplate>
                                <div id="divapply" class="popright" style="display: none;" runat="server">
                                    <div class="popup101" style="overflow-y: scroll;">
                                        <div class="popup102">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel18" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="popup103 borderradius10" style="right: 30px; background: transparent; margin-top: 15px !important">
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
                                                    <div class="popup103 borderradius10" style="right: 30px; background: transparent; margin-top: 15px !important">
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
                                                        <div id="output" style="max-width: 1140px !important; margin: 15px 40px 5px 40px !important;">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <img alt="Bhumi World" src='<%#Eval("userimageurl") %>' data-image='<%#Eval("userimageurl") %>'
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

                                <%--pop up  --%>
                        

                                <div id="divbottom" class="zindex1111" style="display: none;" runat="server">
                                    <div class="width800 popup101 popupbottom101">
                                        <div class="popup102">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="popup103 borderradius10" style="right: 30px; background: transparent; margin-top: 15px !important">
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
                                                    <div class="displayinline marginleft5 floatleft borderleftdark bordernonepopup poupbottom102">
                                                        <asp:Label Text=" " ID="lblbottomfacing" runat="server" />
                                                    </div>
                                                    <div class="displayinline marginleft5 floatright popupbottom103 textaligncenter" style="text-align: center;">
                                                        <div class="floorcss">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel8" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:LinkButton runat="server" ID="lnkbottombook" class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                        OnClick="btnunitright_Clicked">
                                                 Select Unit
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
                                                        <div class="popup103 borderradius10" style="right: 30px; background: transparent; margin-top: 15px !important">
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
                                                       <%--     function rand(min, max) {
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
                                                            }--%>
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
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color: #ffffff;background-image: url(images/bg.png);">

                                    <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                                        <ContentTemplate>
                                            <div class="fontsize11" style="margin-bottom: 16px;">
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel23" class="margintop20" UpdateMode="Conditional">
                                                            <ContentTemplate>
<asp:Panel ID="pnlheading" Visible="true" runat="server">
    <div class="pnlheadingone">
                                                       <span class="displayinline backwhite heading101 headingcolortitle">Unit Selection</span>
        <hr class="horiline" style="display:none;" />
         <hr class="horizontal" style="display:none;"/>
                                                     <div>
                                                    <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101 displaysmallhide headinggrey" style="color:#9e9e9e !important;font-size: 17px;font-weight: 600;">
                                                     Select Filters
                                                    </div>
                                                </div>


    </div>
     <div class="costmobile" style="display:none;">
                                         <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101 unitfont ">Unit Selection</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101" style="margin-bottom: 10px;">
                                              Select Filters
                                        </div>
                                    </div>
         </div>

    </asp:Panel>
                                                                <asp:Panel ID="pnlheadingtwo" Visible="false" runat="server">
                                       <div class="pnlheadingcontent">
                                                       <span class="displayinline backwhite heading101 headingcolortitle">Unit Selection</span>

                                                     <div>
                                                    <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101 displaysmallhide headinggreynext" id="headinggreynext" runat="server" style="color:#9e9e9e !important;font-size: 17px;font-weight: 600;">
                                                     Select Unit To Continue
                                                    </div>
                                    <div class="headingright-unitselect">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel29" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                       <asp:LinkButton runat="server" ID="LinkButton1328" Visible="false" 
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn  headingright-continue"
                                                                            OnClick="btnnextcostsheet_Clicked">
                                                Continue
                                                                        </asp:LinkButton>
                                                                          
                                                                        <asp:LinkButton runat="server" ID="LinkButton1327" 
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn headingrightone"
                                                                            OnClick="btnstepunit_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1327" EventName="Click" />
                                                                      <asp:AsyncPostBackTrigger ControlID="LinkButton1328" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                            </div>


                                                



                                                </div>
                                          
                                     

                                       </div>
    
                                                                
                                                                 <div class="costmobile" style="display:none;">
                                         <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101 unitfont ">Unit Selection</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                                Select Unit To Continue
                                        </div>
                                    </div>
									
									
									
									      <div>
                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel32" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1336" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn"
                                                                            OnClick="btnstepunit_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton runat="server" visible="false" ID="LinkButton1337" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn"
                                                                            OnClick="btnnextcostsheet_Clicked">
                                                Continue
                                                                        </asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1336" EventName="Click" />
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1337" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>


                                    </div>
                                                                
                                                                
                                                                
                                                                
                                                                </asp:Panel>




                                                                <div class="drpdown">
                                                                <asp:DropDownList ID="ddunit" class="form-control select2_single border101 width135 marginleftauto "
                                                                    runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddunit_SelectedIndexChanged">
                                                                    <asp:ListItem Text="Select Unit Type" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="SHED" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="RCC" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:DropDownList ID="ddtower" class="form-control select2_single border101 width135 marginleftauto "
                                                                    runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddtower_SelectedIndexChanged">
                                                                      <asp:ListItem Text="Select Tower" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>

                                                                <asp:DropDownList ID="ddunitvalue" class="form-control select2_single border101 width135 marginleftauto"
                                                                    runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddunitvalue_SelectedIndexChanged">
                                                                    <asp:ListItem Text="No. of unit" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>

                                                                </asp:DropDownList>
                                                                    </div>
                                                                <div class="col-sm-12">
                                                                 <%-- <asp:Button ID="btnContinue" runat="server" Visible="false" Text="Continue" OnClick="btnContinue_Clicked" Style="margin-right: 0px !important;background-color: #b01b2a !important;border-radius: 7px !important;"  class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"/>
                                                                  <asp:Button ID="btnPrevious" runat="server"  Visible="false" Text="Previous" OnClick="btnPrevious_Clicked" Style="margin-right: 0px !important;background-color: #b01b2a !important; border-radius: 7px !important;"  class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"/>
                                                             --%>  </div>
                                                                    </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="ddtower" EventName="SelectedIndexChanged" />
                                                                <asp:AsyncPostBackTrigger ControlID="ddunitvalue" EventName="SelectedIndexChanged" />
                                                                <asp:AsyncPostBackTrigger ControlID="ddunit" EventName="SelectedIndexChanged" />
                                                                <%--<asp:AsyncPostBackTrigger ControlID="btnContinue" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnPrevious" EventName="Click" />--%>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </div>

                                                    <asp:Label ID="lblmsg" class="erroemsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                                               <asp:Panel ID="pnlfloorplan2" Visible="false" runat="server">
                                                  <div class="svgsingle">
                                              
                                              
                                                    <div class="selectunit" style="margin-top: -15px; margin-bottom: 10px;">
                                                        <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel24" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                     <div class="col-sm-12 buttonaligncss">
                                                                        <p class="headingleft"> <span class="firstword">Detailed</span>  <span class="secondword">Unit floor plan - Click on floor plan to continue  </span> </p>
                                                                         <%-- <p class="headingleft"> <span class="firstword"></span>   </p>--%>
                                                                   <asp:Button ID="btnContinue" runat="server" Visible="false" Text="Continue" OnClick="btnContinue_Clicked"   class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn headingright-continue"/>
                                                               
                                                                   <asp:Button ID="btnPrevious" runat="server"  Visible="true" Text="Previous" OnClick="btnPrevious_Clicked"   class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn headingright"/>
                                                          
                                                                         
                                                                  
                                                                    <br />
                                                                          </div>
                                                                   
                                                                      
                                                                    <br />
                                                                            
                                                                    

                                                                </ContentTemplate>
                                                                <Triggers>
                                                                     <asp:AsyncPostBackTrigger ControlID="btnContinue" EventName="Click" />
                                                                <asp:AsyncPostBackTrigger ControlID="btnPrevious" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                   

                                                
                                                      </div>


                                                   <div class="divunitbutton" style="display:none;">
                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel30" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                         <p class="headingleft"><span class="secondword">Unit floor plan  </span> <span class="firstword"> - Click on floor plan to continue </span>   </p>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1333" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn "
                                                                            OnClick="btnPrevious_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1333" EventName="Click" />
                                                                      
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>   




                                            </asp:Panel>
                                            
                                             <asp:Panel ID="pnlboth" Visible="true" runat="server">
                                                  <div class="divimgheight" style="display: block; width: 100%; text-align: center;margin-top: 30px;">

<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1800 1800" style="enable-background:new 0 0 1800 1800;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }

                                                            .cls-blur {
                                                                fill: #77777700;
                                                            }
                                                        </style>
                                                    </defs>
<g id="RCC">
	
		<image style="overflow:visible;enable-background:new    ;" width="7500" height="7504" xlink:href="images/bhumi/99ED0C5E.jpg"  transform="matrix(0.2399 0 0 0.2399 0.24 -2.3999)">
	</image>
  
  <asp:LinkButton ID="LinkButton1246"  runat="server" CommandArgument="C10_pnlrC10g" CommandName=""  OnClick="btn3click"> 
	<rect id="C10" x="857" y="324" class="cls-2 myclass" width="57.6" height="259.2"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1247"  runat="server" CommandArgument="C7_pnlrC7g" CommandName=""  OnClick="btn3click"> 
	<polygon id="C7" class="cls-2 myclass" points="800.8,609.2 745.4,609.2 746.1,870.5 800.8,870.5 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1248"  runat="server" CommandArgument="D8_pnlrD8g" CommandName=""  OnClick="btn3click"> 
	<rect id="D8" x="678.4" y="609.2" class="cls-2 myclass" width="54.7" height="261.4"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1249"  runat="server" CommandArgument="D7_pnlrD7g" CommandName=""  OnClick="btn3click"> 
	<rect id="D7" x="604.2" y="609.2" class="cls-2 myclass" width="53.3" height="261.4"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1250"  runat="server" CommandArgument="E8_pnlrE8g" CommandName=""  OnClick="btn3click"> 
	<rect id="E8" x="535.1" y="609.2" class="cls-2 myclass" width="53.3" height="261.4"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1251"  runat="server" CommandArgument="F7" CommandName=""  OnClick="btn3click"> 
	<rect id="F7" x="460.2" y="609.2" class="cls-2 myclass" width="52.6" height="261.4"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1252"  runat="server" CommandArgument="F8_pnlrF8g" CommandName=""  OnClick="btn3click"> 
	<rect id="F8" x="391.8" y="609.2" class="cls-2 myclass" width="55.4" height="261.4"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1253"  runat="server" CommandArgument="C5_pnlrC5g" CommandName=""  OnClick="btn3click"> 
	<rect id="C5" x="745.4" y="896.5" class="cls-2 myclass" width="55.4" height="260.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1254"  runat="server" CommandArgument="D6_pnlrD6g" CommandName=""  OnClick="btn3click"> 
	<polygon id="D6" class="cls-2 myclass" points="733.1,896.5 733.1,1157.1 678.4,1157.1 678.4,896 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1255"  runat="server" CommandArgument="D5_pnlrD5g" CommandName=""  OnClick="btn3click"> 
	<rect id="D5" x="604.2" y="896.5" class="cls-2 myclass" width="53.3" height="260.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1256"  runat="server" CommandArgument="E6_pnlrE6g" CommandName=""  OnClick="btn3click"> 
	<polygon id="E6" class="cls-2 myclass" points="588.4,896.5 588.4,1157.1 534.1,1157.1 535.1,896.5 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1257"  runat="server" CommandArgument="E5_pnlrE5g" CommandName=""  OnClick="btn3click"> 
	<polygon id="E5" class="cls-2 myclass" points="513.8,894.5 513.8,1153.8 460.2,1153.8 460.2,894 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1258"  runat="server" CommandArgument="F6_pnlrF6g" CommandName=""  OnClick="btn3click"> 
	<polygon id="F6" class="cls-2 myclass" points="447.3,894 391.8,894 391.5,1154.2 447.3,1154.2 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1259"  runat="server" CommandArgument="F5" CommandName=""  OnClick="btn3click"> 
	<rect id="F5" x="317.7" y="894" class="cls-2 myclass" width="51.1" height="258.8"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1260"  runat="server" CommandArgument="G6" CommandName=""  OnClick="btn3click"> 
	<polygon id="G6" class="cls-2 myclass" points="305.4,894 305.4,1152.8 255,1152.8 255,971.3 296.8,894 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1261"  runat="server" CommandArgument="B6" CommandName=""  OnClick="btn3click"> 
	<rect id="B6" x="990.9" y="890.7" class="cls-2 myclass" width="51.8" height="168.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1262"  runat="server" CommandArgument="A7_pnlrA7f" CommandName=""  OnClick="btn3click"> 
	<rect id="A7" x="1174.5" y="1056.3" class="cls-2 myclass" width="57.6" height="103"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1263"  runat="server" CommandArgument="C3" CommandName=""  OnClick="btn3click"> 
	<rect id="C3" x="745.4" y="1179.4" class="cls-2 myclass" width="48.2" height="129.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1264"  runat="server" CommandArgument="D4" CommandName=""  OnClick="btn3click"> 
	<rect id="D4" x="678.4" y="1179.4" class="cls-2 myclass" width="50.9" height="129.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1265"  runat="server" CommandArgument="E4" CommandName=""  OnClick="btn3click"> 
	<polygon id="E4" class="cls-2 myclass" points="537.3,1176.5 593,1176.5 593,1230.3 537.3,1231.2 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1266"  runat="server" CommandArgument="E4-1" CommandName=""  OnClick="btn3click"> 
	<rect id="E4_1_" x="541.6" y="1234.6" class="cls-2 myclass" width="46.8" height="66.2"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1267"  runat="server" CommandArgument="D3" CommandName=""  OnClick="btn3click"> 
	<polygon id="D3" class="cls-2 myclass" points="659.7,1174.6 659.7,1232.2 597.3,1232.2 597.4,1174.6 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1268"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click"> 
	<rect id="D3_1_" x="604.2" y="1234.6" class="cls-2 myclass" width="47.8" height="66.2"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1269"  runat="server" CommandArgument="E3" CommandName=""  OnClick="btn3click"> 
	<rect id="E3" x="460.2" y="1185.6" class="cls-2 myclass" width="49.2" height="119"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1270"  runat="server" CommandArgument="F4_pnlrF4g" CommandName=""  OnClick="btn3click"> 
	<rect id="F4" x="396.6" y="1185.6" class="cls-2 myclass" width="50.6" height="119"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1271"  runat="server" CommandArgument="F3" CommandName=""  OnClick="btn3click"> 
	<polygon id="F3" class="cls-2 myclass" points="317.7,1185.6 368.8,1185.6 368.8,1304.7 317.7,1302.8 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1272"  runat="server" CommandArgument="G4" CommandName=""  OnClick="btn3click"> 
	<rect id="G4" x="255" y="1185.6" class="cls-2 myclass" width="50.4" height="119"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1273"  runat="server" CommandArgument="G2" CommandName=""  OnClick="btn3click"> 
	<rect id="G2" x="255" y="1319.6" class="cls-2 myclass" width="50.4" height="52.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1274"  runat="server" CommandArgument="F1" CommandName=""  OnClick="btn3click"> 
	<rect id="F1" x="317.7" y="1319.6" class="cls-2 myclass" width="46.3" height="52.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1275"  runat="server" CommandArgument="F1-1" CommandName=""  OnClick="btn3click"> 
	<rect id="F1_1_" x="315" y="1382.9" class="cls-2 myclass" width="47" height="59"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1276"  runat="server" CommandArgument="G2-1" CommandName=""  OnClick="btn3click"> 
	<polygon id="G2_1_" class="cls-2 myclass" points="303,1382.9 303,1442 255,1440 255,1382.9 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1277"  runat="server" CommandArgument="F2" CommandName=""  OnClick="btn3click"> 
	<rect id="F2" x="389.9" y="1327.2" class="cls-2 myclass" width="57.4" height="108.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1278"  runat="server" CommandArgument="E1" CommandName=""  OnClick="btn3click"> 
	<rect id="E1" x="455.7" y="1327.2" class="cls-2 myclass" width="53.8" height="108.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1279"  runat="server" CommandArgument="E2" CommandName=""  OnClick="btn3click"> 
	<polygon id="E2" class="cls-2 myclass" points="539.2,1359.9 539.2,1430.9 577.1,1430.9 577.1,1416 583.8,1416 596.3,1398.3 596.3,1359.9 	
		"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1280"  runat="server" CommandArgument="D1" CommandName=""  OnClick="btn3click"> 
	<polygon id="D1" class="cls-2 myclass" points="604.2,1334.9 660.6,1334.9 662.6,1442 604.2,1442 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1281"  runat="server" CommandArgument="D2-1" CommandName=""  OnClick="btn3click"> 
	<rect id="D2_1_" x="681.8" y="1319.6" class="cls-2 myclass" width="47.5" height="52.8"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1282"  runat="server" CommandArgument="D2" CommandName=""  OnClick="btn3click"> 
	<rect id="D2" x="681.8" y="1381.5" class="cls-2 myclass" width="47.5" height="60.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1283"  runat="server" CommandArgument="C1-1" CommandName=""  OnClick="btn3click"> 
	<rect id="C1_1_" x="740.3" y="1381.5" class="cls-2 myclass" width="47" height="62.4"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1284"  runat="server" CommandArgument="C1_pnlrC10g" CommandName=""  OnClick="btn3click"> 
	<polygon id="C1" class="cls-2 myclass" points="789.3,1317.6 789.3,1372.4 742.2,1372.4 742.2,1317.6 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1285"  runat="server" CommandArgument="B1_pnlrB1s" CommandName=""  OnClick="btn3click"> 
	<rect id="B1" x="916" y="1315.6" class="cls-2 myclass" width="50.8" height="128.3"/></asp:LinkButton>

 
</g>

<g id="SHED">
   

  <asp:LinkButton ID="LinkButton1286"  runat="server" CommandArgument="E12_pnlsE12g" CommandName=""  OnClick="btn3click"> 
	<rect id="E-12" x="535.1" y="181.6" class="cls-2 myclass" width="61.1" height="117.7"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1287"  runat="server" CommandArgument="D11" CommandName=""  OnClick="btn3click"> 
	<rect id="D-11" x="596.2" y="129.8" class="cls-2 myclass" width="60" height="169.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1288"  runat="server" CommandArgument="D12" CommandName=""  OnClick="btn3click"> 
	<rect id="D-12" x="678.4" y="102.8" class="cls-2 myclass" width="73.8" height="196.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1289"  runat="server" CommandArgument="C11_pnlsC11g" CommandName=""  OnClick="btn3click"> 
	<rect id="C-11" x="752.2" y="142.7" class="cls-2 myclass" width="75" height="156.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1290"  runat="server" CommandArgument="C12_pnlsC12g" CommandName=""  OnClick="btn3click"> 
	<rect id="C-12" x="849.2" y="119" class="cls-2 myclass" width="116" height="180.4"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1291"  runat="server" CommandArgument="F10_pnlsF10g" CommandName=""  OnClick="btn3click"> 
	<rect id="F-10" x="392.1" y="331.4" class="cls-2 myclass" width="61.1" height="246"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1292"  runat="server" CommandArgument="E9_pnlsE9g" CommandName=""  OnClick="btn3click"> 
	<rect id="E-9" x="453.2" y="331.4" class="cls-2 myclass" width="60" height="246"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1293"  runat="server" CommandArgument="E10_pnlsE10g" CommandName=""  OnClick="btn3click"> 
	<rect id="E-10" x="535.1" y="331.4" class="cls-2 myclass" width="61.1" height="246"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1294"  runat="server" CommandArgument="D9_pnlsD9g" CommandName=""  OnClick="btn3click"> 
	<rect id="D-9" x="596.2" y="331.4" class="cls-2 myclass" width="60" height="246"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1295"  runat="server" CommandArgument="D10_pnlsD10g" CommandName=""  OnClick="btn3click"> 
	<rect id="D-10" x="678.4" y="325.6" class="cls-2 myclass" width="75.1" height="258.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1296"  runat="server" CommandArgument="C9_pnlsC9g" CommandName=""  OnClick="btn3click"> 
	<rect id="C-9" x="753.5" y="325.6" class="cls-2 myclass" width="73.7" height="258.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1297"  runat="server" CommandArgument="B9" CommandName=""  OnClick="btn3click"> 
	<polygon id="B-9" class="cls-2 myclass" points="917,325.6 962.2,325.6 981.2,461 981.2,584.1 917,584.1 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1298"  runat="server" CommandArgument="C8_pnlsC8g" CommandName=""  OnClick="btn3click"> 
	<rect id="C-8" x="857" y="609.6" class="cls-2 myclass" width="56.2" height="261.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1299"  runat="server" CommandArgument="B7_pnlsB7g" CommandName=""  OnClick="btn3click"> 
	<rect id="B-7" x="913.2" y="609.6" class="cls-2 myclass" width="57.1" height="261.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1300"  runat="server" CommandArgument="B8_pnlsB8g" CommandName=""  OnClick="btn3click"> 
	<polygon id="B-8" class="cls-2 myclass" points="987.6,619.4 1016.8,618.8 1027.9,751.4 1036,877.1 987.6,877.1 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1301"  runat="server" CommandArgument="C6_pnlsC6g" CommandName=""  OnClick="btn3click"> 
	<rect id="C-6" x="857" y="896.6" class="cls-2 myclass" width="56.2" height="261.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1302"  runat="server" CommandArgument="B5_pnlsB5g" CommandName=""  OnClick="btn3click"> 
	<rect id="B-5" x="913.2" y="896.6" class="cls-2 myclass" width="57.1" height="261.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1303"  runat="server" CommandArgument="C4_pnlsC4g" CommandName=""  OnClick="btn3click"> 
	<rect id="C-4" x="851.1" y="1172.6" class="cls-2 myclass" width="62" height="136.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1304"  runat="server" CommandArgument="B3_pnlsB3g" CommandName=""  OnClick="btn3click"> 
	<rect id="B-3" x="912.1" y="1172.6" class="cls-2 myclass" width="58.2" height="136.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1305"  runat="server" CommandArgument="B4_pnlsB4g" CommandName=""  OnClick="btn3click"> 
	<rect id="B-4" x="985.1" y="1172.6" class="cls-2 myclass" width="62" height="136.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1306"  runat="server" CommandArgument="A2_pnlsA2g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-2" x="1046.1" y="1172.6" class="cls-2 myclass" width="58.2" height="136.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1307"  runat="server" CommandArgument="C2" CommandName=""  OnClick="btn3click"> 
	<rect id="C-2" x="851.1" y="1308.6" class="cls-2 myclass" width="62" height="140.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1308"  runat="server" CommandArgument="B2_pnlsB2g" CommandName=""  OnClick="btn3click"> 
	<rect id="B-2" x="985.1" y="1309.6" class="cls-2 myclass" width="62" height="136.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1309"  runat="server" CommandArgument="A1_pnlrA1g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-1" x="1046.1" y="1308.6" class="cls-2 myclass" width="58.2" height="136.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1310"  runat="server" CommandArgument="A5_pnlsA5g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-5" x="1117.9" y="1180.6" class="cls-2 myclass" width="55.3" height="264.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1311"  runat="server" CommandArgument="A6_pnlsA6g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-6" x="1172.1" y="1180.6" class="cls-2 myclass" width="58.2" height="264.5"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1312"  runat="server" CommandArgument="A9_pnlsA9g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-9" x="1245.1" y="1180.6" class="cls-2 myclass" width="57.8" height="206.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1313"  runat="server" CommandArgument="A10_pnlsA10g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-10" x="1302.9" y="1180.6" class="cls-2 myclass" width="56.9" height="206.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1314"  runat="server" CommandArgument="A13_pnlsA13g" CommandName=""  OnClick="btn3click"> 
	<polygon id="A-13" class="cls-2 myclass" points="1372.9,1180.6 1429.8,1180.6 1429.8,1364.3 1410.5,1364.9 1410,1351.2 1389.1,1351.2 
		1389.3,1339.8 1375.1,1338.9 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1315"  runat="server" CommandArgument="A14_pnlsA14g" CommandName=""  OnClick="btn3click"> 
	<polygon id="A-14" class="cls-2 myclass" points="1432.9,1180.6 1489.8,1180.6 1487.4,1401.4 1468,1402 1467.5,1388.2 1448.8,1388.2 
		1448.5,1376.8 1432.9,1376.8 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1316"  runat="server" CommandArgument="A3_pnlsA3g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-3" x="987.6" y="1062.6" class="cls-2 myclass" width="116.7" height="100.7"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1317"  runat="server" CommandArgument="A8_pnlsA8g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-8" x="1245.1" y="1052.6" class="cls-2 myclass" width="59.4" height="110.7"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1318"  runat="server" CommandArgument="A11_pnlsA11g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-11" x="1303.6" y="1052.6" class="cls-2 myclass" width="55.7" height="110.7"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1319"  runat="server" CommandArgument="A4" CommandName=""  OnClick="btn3click"> 
	<rect id="A-4" x="1116.1" y="1069.4" class="cls-2 myclass" width="59.4" height="94"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1320"  runat="server" CommandArgument="A12_pnlsA12g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-12" x="1375.1" y="1042.4" class="cls-2 myclass" width="59.4" height="121"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1321"  runat="server" CommandArgument="A15_pnlsA15g" CommandName=""  OnClick="btn3click"> 
	<rect id="A-15" x="1433.6" y="1042.4" class="cls-2 myclass" width="55.7" height="121"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1322"  runat="server" CommandArgument="A16" CommandName=""  OnClick="btn3click"> 
	<rect id="A-16" x="1519.6" y="1019.7" class="cls-2 myclass" width="52.9" height="143.6"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1323"  runat="server" CommandArgument="A17" CommandName=""  OnClick="btn3click"> 
	<rect id="A-17" x="1579.6" y="1019.7" class="cls-2 myclass" width="93.4" height="56.2"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1324"  runat="server" CommandArgument="A18" CommandName=""  OnClick="btn3click"> 
	<rect id="A-18" x="1503.6" y="1176.3" class="cls-2 myclass" width="55.7" height="107"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1325"  runat="server" CommandArgument="A19" CommandName=""  OnClick="btn3click"> 
	<rect id="A-19" x="1553.6" y="1176.3" class="cls-2 myclass" width="55.7" height="107"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1326"  runat="server" CommandArgument="A20" CommandName=""  OnClick="btn3click"> 
	<rect id="A-20" x="1503.6" y="1300.3" class="cls-2 myclass" width="76.1" height="101.7"/></asp:LinkButton>


</g>


</svg>
                                                  </div>
                                            </asp:Panel>


                                             <asp:Panel ID="pnlsShed" Visible="false" runat="server">
                                                  <div class="divimgheight" style="display: block; width: 100%; text-align: center;margin-top:30px;">
                                                      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1800 1800" style="enable-background:new 0 0 1800 1800;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .cls-disable {
                                                                /* fill: #777777a1;*/
                                                                fill: #007bff45;
                                                            }

                                                            .cls-myclass2 {
                                                                fill: #ff57229c;
                                                            }

                                                            .myclass {
                                                                /* //fill: transparent;*/
                                                                fill: #007bff45;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }

                                                            .cls-blur {
                                                                fill: #77777700;
                                                            }
                                                        </style>
                                                    </defs>

<g id="SHED">
   <image style="overflow:visible;" width="7500" height="7500" xlink:href="images/bhumi/99ED0C5E.jpg"  transform="matrix(0.24 0 0 0.24 0 -2.16)">
	</image>
  

 <asp:LinkButton ID="LinkButton1222"  runat="server" CommandArgument="E12" CommandName=""  OnClick="btn3click"> 
	<rect id="E-12" x="535.1" y="181.6" class="cls-2 myclass" width="61.1" height="117.7"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1144"  runat="server" CommandArgument="D11" CommandName=""  OnClick="btn3click"> 
	<rect id="D-11" x="596.2" y="129.8" class="cls-2 myclass" width="60" height="169.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1145"  runat="server" CommandArgument="D12" CommandName=""  OnClick="btn3click"> 
	<rect id="D-12" x="678.4" y="102.8" class="cls-2 myclass" width="73.8" height="196.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1146"  runat="server" CommandArgument="C11" CommandName=""  OnClick="btn3click">
	<rect id="C-11" x="752.2" y="142.7" class="cls-2 myclass" width="75" height="156.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1147"  runat="server" CommandArgument="C12" CommandName=""  OnClick="btn3click">
	<rect id="C-12" x="849.2" y="119" class="cls-2 myclass" width="116" height="180.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1148"  runat="server" CommandArgument="F10" CommandName=""  OnClick="btn3click">
	<rect id="F-10" x="392.1" y="331.4" class="cls-2 myclass" width="61.1" height="246"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1149"  runat="server" CommandArgument="E9" CommandName=""  OnClick="btn3click">
	<rect id="E-9" x="453.2" y="331.4" class="cls-2 myclass" width="60" height="246"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1150"  runat="server" CommandArgument="E10" CommandName=""  OnClick="btn3click">
	<rect id="E-10" x="535.1" y="331.4" class="cls-2 myclass" width="61.1" height="246"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1151"  runat="server" CommandArgument="D9" CommandName=""  OnClick="btn3click">
	<rect id="D-9" x="596.2" y="331.4" class="cls-2 myclass" width="60" height="246"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1152"  runat="server" CommandArgument="D10" CommandName=""  OnClick="btn3click">
	<rect id="D-10" x="678.4" y="325.6" class="cls-2 myclass" width="75.1" height="258.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1153"  runat="server" CommandArgument="C9" CommandName=""  OnClick="btn3click">
	<rect id="C-9" x="753.5" y="325.6" class="cls-2 myclass" width="73.7" height="258.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1154"  runat="server" CommandArgument="B9" CommandName=""  OnClick="btn3click">
	<polygon id="B-9" class="cls-2 myclass" points="917,325.6 962.2,325.6 981.2,461 981.2,584.1 917,584.1 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1155"  runat="server" CommandArgument="C8" CommandName=""  OnClick="btn3click">
	<rect id="C-8" x="857" y="609.6" class="cls-2 myclass" width="56.2" height="261.3"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1156"  runat="server" CommandArgument="B7" CommandName=""  OnClick="btn3click">
	<rect id="B-7" x="913.2" y="609.6" class="cls-2 myclass" width="57.1" height="261.3"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1157"  runat="server" CommandArgument="B8" CommandName=""  OnClick="btn3click">
	<polygon id="B-8" class="cls-2 myclass" points="987.6,619.4 1016.8,618.8 1027.9,751.4 1036,877.1 987.6,877.1 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1158"  runat="server" CommandArgument="C6" CommandName=""  OnClick="btn3click">
	<rect id="C-6" x="857" y="896.6" class="cls-2 myclass" width="56.2" height="261.3"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1159"  runat="server" CommandArgument="B5" CommandName=""  OnClick="btn3click">
	<rect id="B-5" x="913.2" y="896.6" class="cls-2 myclass" width="57.1" height="261.3"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1160"  runat="server" CommandArgument="C4" CommandName=""  OnClick="btn3click">
	<rect id="C-4" x="851.1" y="1172.6" class="cls-2 myclass" width="62" height="136.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1161"  runat="server" CommandArgument="B3" CommandName=""  OnClick="btn3click">
	<rect id="B-3" x="912.1" y="1172.6" class="cls-2 myclass" width="58.2" height="136.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1162"  runat="server" CommandArgument="B4" CommandName=""  OnClick="btn3click">
	<rect id="B-4" x="985.1" y="1172.6" class="cls-2 myclass" width="62" height="136.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1163"  runat="server" CommandArgument="A2" CommandName=""  OnClick="btn3click">
	<rect id="A-2" x="1046.1" y="1172.6" class="cls-2 myclass" width="58.2" height="136.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1164"  runat="server" CommandArgument="C2" CommandName=""  OnClick="btn3click">
	<rect id="C-2" x="851.1" y="1308.6" class="cls-2 myclass" width="62" height="140.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1165"  runat="server" CommandArgument="B2" CommandName=""  OnClick="btn3click">
	<rect id="B-2" x="985.1" y="1309.6" class="cls-2 myclass" width="62" height="136.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton69"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click">
 <rect id="A-1" x="1046.1" y="1308.6" class="cls-2 myclass" width="58.2" height="136.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1168"  runat="server" CommandArgument="A5" CommandName=""  OnClick="btn3click">
	<rect id="A-5" x="1117.9" y="1180.6" class="cls-2 myclass" width="55.3" height="264.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1167"  runat="server" CommandArgument="A6" CommandName=""  OnClick="btn3click">
	<rect id="A-6" x="1172.1" y="1180.6" class="cls-2 myclass" width="58.2" height="264.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1169"  runat="server" CommandArgument="A9" CommandName=""  OnClick="btn3click">
	<rect id="A-9" x="1245.1" y="1180.6" class="cls-2 myclass" width="57.8" height="206.3"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1170"  runat="server" CommandArgument="A10" CommandName=""  OnClick="btn3click">
	<rect id="A-10" x="1302.9" y="1180.6" class="cls-2 myclass" width="56.9" height="206.3"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1329"  runat="server" CommandArgument="A13" CommandName=""  OnClick="btn3click"> 
	<polygon id="A-13" class="cls-2 myclass" points="1372.9,1180.6 1429.8,1180.6 1429.8,1364.3 1410.5,1364.9 1410,1351.2 1389.1,1351.2 
		1389.3,1339.8 1375.1,1338.9 	"/></asp:LinkButton>

  <asp:LinkButton ID="LinkButton1330"  runat="server" CommandArgument="A14" CommandName=""  OnClick="btn3click"> 
	<polygon id="A-14" class="cls-2 myclass" points="1432.9,1180.6 1489.8,1180.6 1487.4,1401.4 1468,1402 1467.5,1388.2 1448.8,1388.2 
		1448.5,1376.8 1432.9,1376.8 	"/></asp:LinkButton>
 <asp:LinkButton ID="LinkButton1172"  runat="server" CommandArgument="A3" CommandName=""  OnClick="btn3click">
	<rect id="A-3" x="987.6" y="1062.6" class="cls-2 myclass" width="116.7" height="100.7"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1171"  runat="server" CommandArgument="A8" CommandName=""  OnClick="btn3click">
	<rect id="A-8" x="1245.1" y="1052.6" class="cls-2 myclass" width="59.4" height="110.7"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1173"  runat="server" CommandArgument="A11" CommandName=""  OnClick="btn3click">
	<rect id="A-11" x="1303.6" y="1052.6" class="cls-2 myclass" width="55.7" height="110.7"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1174"  runat="server" CommandArgument="A4" CommandName=""  OnClick="btn3click">
	<rect id="A-4" x="1116.1" y="1069.4" class="cls-2 myclass" width="59.4" height="94"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1175"  runat="server" CommandArgument="A12" CommandName=""  OnClick="btn3click">
	<rect id="A-12" x="1375.1" y="1042.4" class="cls-2 myclass" width="59.4" height="121"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1176"  runat="server" CommandArgument="A15" CommandName=""  OnClick="btn3click">
	<rect id="A-15" x="1433.6" y="1042.4" class="cls-2 myclass" width="55.7" height="121"/></asp:LinkButton>
   

 <asp:LinkButton ID="LinkButton44"  runat="server" CommandArgument="A16" CommandName=""  OnClick="btn3click">
	<rect id="A-16" x="1519.6" y="1019.7" class="cls-2 myclass" width="52.9" height="143.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton45"  runat="server" CommandArgument="A17" CommandName=""  OnClick="btn3click">
	<rect id="A-17" x="1579.6" y="1019.7" class="cls-2 myclass" width="93.4" height="56.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton66"  runat="server" CommandArgument="A18" CommandName=""  OnClick="btn3click">
	<rect id="A-18" x="1503.6" y="1176.3" class="cls-2 myclass" width="55.7" height="107"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton67"  runat="server" CommandArgument="A19" CommandName=""  OnClick="btn3click">
	<rect id="A-19" x="1553.6" y="1176.3" class="cls-2 myclass" width="55.7" height="107"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton68"  runat="server" CommandArgument="A20" CommandName=""  OnClick="btn3click">
	<rect id="A-20" x="1503.6" y="1300.3" class="cls-2 myclass" width="76.1" height="101.7"/></asp:LinkButton>

 


</g>
<g id="RCC">

	
	<rect id="C10" x="857" y="324" class="cls-blur" width="57.6" height="259.2"/>
	<polygon id="C7" class="cls-blur" points="800.8,609.2 745.4,609.2 746.1,870.5 800.8,870.5 	"/>
	<rect id="D8" x="678.4" y="609.2" class="cls-blur" width="54.7" height="261.4"/>
	<rect id="D7" x="604.2" y="609.2" class="cls-blur" width="53.3" height="261.4"/>
	<rect id="E8" x="535.1" y="609.2" class="cls-blur" width="53.3" height="261.4"/>
	<rect id="F7" x="460.2" y="609.2" class="cls-blur" width="52.6" height="261.4"/>
	<rect id="F8" x="391.8" y="609.2" class="cls-blur" width="55.4" height="261.4"/>
	<rect id="C5" x="745.4" y="896.5" class="cls-blur" width="55.4" height="260.6"/>
	<polygon id="D6" class="cls-blur" points="733.1,896.5 733.1,1157.1 678.4,1157.1 678.4,896 	"/>
	<rect id="D5" x="604.2" y="896.5" class="cls-blur" width="53.3" height="260.6"/>
	<polygon id="E6" class="cls-blur" points="588.4,896.5 588.4,1157.1 534.1,1157.1 535.1,896.5 	"/>
	<polygon id="E5" class="cls-blur" points="513.8,894.5 513.8,1153.8 460.2,1153.8 460.2,894 	"/>
	<polygon id="F6" class="cls-blur" points="447.3,894 391.8,894 391.5,1154.2 447.3,1154.2 	"/>
	<rect id="F5" x="317.7" y="894" class="cls-blur" width="51.1" height="258.8"/>
	<polygon id="G6" class="cls-blur" points="305.4,894 305.4,1152.8 255,1152.8 255,971.3 296.8,894 	"/>
	<rect id="B6" x="990.9" y="890.7" class="cls-blur" width="51.8" height="168.5"/>
	<rect id="A7" x="1174.5" y="1056.3" class="cls-blur" width="57.6" height="103"/>
	<rect id="C3" x="745.4" y="1179.4" class="cls-blur" width="48.2" height="129.6"/>
	<rect id="D4" x="678.4" y="1179.4" class="cls-blur" width="50.9" height="129.6"/>
	<polygon id="E4" class="cls-blur" points="537.3,1176.5 593,1176.5 593,1230.3 537.3,1231.2 	"/>
	<rect id="E4_1_" x="541.6" y="1234.6" class="cls-blur" width="46.8" height="66.2"/>
	<polygon id="D3" class="cls-blur" points="659.7,1174.6 659.7,1232.2 597.3,1232.2 597.4,1174.6 	"/>
	<rect id="D3_1_" x="604.2" y="1234.6" class="cls-blur" width="47.8" height="66.2"/>
	<rect id="E3" x="460.2" y="1185.6" class="cls-blur" width="49.2" height="119"/>
	<rect id="F4" x="396.6" y="1185.6" class="cls-blur" width="50.6" height="119"/>
	<polygon id="F3" class="cls-blur" points="317.7,1185.6 368.8,1185.6 368.8,1304.7 317.7,1302.8 	"/>
	<rect id="G4" x="255" y="1185.6" class="cls-blur" width="50.4" height="119"/>
	<rect id="G2" x="255" y="1319.6" class="cls-blur" width="50.4" height="52.3"/>
	<rect id="F1" x="317.7" y="1319.6" class="cls-blur" width="46.3" height="52.3"/>
	<rect id="F1_1_" x="315" y="1382.9" class="cls-blur" width="47" height="59"/>
	<polygon id="G2_1_" class="cls-blur" points="303,1382.9 303,1442 255,1440 255,1382.9 	"/>
	<rect id="F2" x="389.9" y="1327.2" class="cls-blur" width="57.4" height="108.5"/>
	<rect id="E1" x="455.7" y="1327.2" class="cls-blur" width="53.8" height="108.5"/>
	<polygon id="E2" class="cls-blur" points="539.2,1359.9 539.2,1430.9 577.1,1430.9 577.1,1416 583.8,1416 596.3,1398.3 596.3,1359.9 	
		"/>
	<polygon id="D1" class="cls-blur" points="604.2,1334.9 660.6,1334.9 662.6,1442 604.2,1442 	"/>
	<rect id="D2_1_" x="681.8" y="1319.6" class="cls-blur" width="47.5" height="52.8"/>
	<rect id="D2" x="681.8" y="1381.5" class="cls-blur" width="47.5" height="60.5"/>
	<rect id="C1_1_" x="740.3" y="1381.5" class="cls-blur" width="47" height="62.4"/>
	<polygon id="C1" class="cls-blur" points="789.3,1317.6 789.3,1372.4 742.2,1372.4 742.2,1317.6 	"/>
	<rect id="B1" x="916" y="1315.6" class="cls-blur" width="50.8" height="128.3"/>
</g>


</svg>

                                                 </div>
                                         </asp:Panel>
                                        
                                             <asp:Panel ID="pnlrRcc" Visible="false" runat="server">
                                                  <div class="divimgheight" style="display: block; width: 100%; text-align: center;margin-top: 30px;">
                                                      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1800 1800" style="enable-background:new 0 0 1800 1800;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                /*fill: transparent;*/
                                                               /* fill: #e6916d80;*/
                                                                fill:#007bff7d;
                                                            }

                                                            .cls-disable {
                                                                /*fill: #777777a1;*/
                                                                fill: #e6916d80;
                                                            }

                                                            .cls-myclass2 {
                                                                fill: #ff57229c;
                                                            }

                                                            .myclass:hover {
                                                                fill: #424b57;
                                                                opacity: 0.4;
                                                            }

                                                            .cls-blur {
                                                                /*fill: #777777a1;*/
                                                                fill: #77777700;
                                                                 
                                                            }
                                                        </style>
                                                    </defs>
<g id="RCC">
	
		<image style="overflow:visible;" width="7500" height="7500" xlink:href="images/bhumi/9E57EDF4.jpg"  transform="matrix(0.24 0 0 0.24 0 -2.16)">
	</image>

 <asp:LinkButton ID="LinkButton1182"  runat="server" CommandArgument="C10" CommandName=""  OnClick="btn3click">
	<rect id="C10" x="857" y="324" class="cls-2 myclass" width="57.6" height="259.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1183"  runat="server" CommandArgument="C7" CommandName=""  OnClick="btn3click">
	<polygon id="C7" class="cls-2 myclass" points="800.8,609.2 745.4,609.2 746.1,870.5 800.8,870.5 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1184"  runat="server" CommandArgument="D8" CommandName=""  OnClick="btn3click">
	<rect id="D8" x="678.4" y="609.2" class="cls-2 myclass" width="54.7" height="261.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1185"  runat="server" CommandArgument="D7" CommandName=""  OnClick="btn3click">
	<rect id="D7" x="604.2" y="609.2" class="cls-2 myclass" width="53.3" height="261.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1186"  runat="server" CommandArgument="E8" CommandName=""  OnClick="btn3click">
	<rect id="E8" x="535.1" y="609.2" class="cls-2 myclass" width="53.3" height="261.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1187"  runat="server" CommandArgument="F7" CommandName=""  OnClick="btn3click">
	<rect id="F7" x="460.2" y="609.2" class="cls-2 myclass" width="52.6" height="261.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1188"  runat="server" CommandArgument="F8" CommandName=""  OnClick="btn3click">
	<rect id="F8" x="391.8" y="609.2" class="cls-2 myclass" width="55.4" height="261.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1190"  runat="server" CommandArgument="C5" CommandName=""  OnClick="btn3click">
	<rect id="C5" x="745.4" y="896.5" class="cls-2 myclass" width="55.4" height="260.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1189"  runat="server" CommandArgument="D6" CommandName=""  OnClick="btn3click">
	<polygon id="D6" class="cls-2 myclass" points="733.1,896.5 733.1,1157.1 678.4,1157.1 678.4,896 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1191"  runat="server" CommandArgument="D5" CommandName=""  OnClick="btn3click">
	<rect id="D5" x="604.2" y="896.5" class="cls-2 myclass" width="53.3" height="260.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1192"  runat="server" CommandArgument="E6" CommandName=""  OnClick="btn3click">
	<polygon id="E6" class="cls-2 myclass" points="588.4,896.5 588.4,1157.1 534.1,1157.1 535.1,896.5 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1193"  runat="server" CommandArgument="E5" CommandName=""  OnClick="btn3click">
	<polygon id="E5" class="cls-2 myclass" points="513.8,894.5 513.8,1153.8 460.2,1153.8 460.2,894 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1194"  runat="server" CommandArgument="F6" CommandName=""  OnClick="btn3click">
	<polygon id="F6" class="cls-2 myclass" points="447.3,894 391.8,894 391.5,1154.2 447.3,1154.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1195"  runat="server" CommandArgument="F5" CommandName=""  OnClick="btn3click">
	<rect id="F5" x="317.7" y="894" class="cls-2 myclass" width="51.1" height="258.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1196"  runat="server" CommandArgument="G6" CommandName=""  OnClick="btn3click">
	<polygon id="G6" class="cls-2 myclass" points="305.4,894 305.4,1152.8 255,1152.8 255,971.3 296.8,894 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1197"  runat="server" CommandArgument="B6" CommandName=""  OnClick="btn3click">
	<rect id="B6" x="990.9" y="890.7" class="cls-2 myclass" width="51.8" height="168.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1199"  runat="server" CommandArgument="A7" CommandName=""  OnClick="btn3click">
	<rect id="A7" x="1174.5" y="1056.3" class="cls-2 myclass" width="57.6" height="103"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1198"  runat="server" CommandArgument="C3" CommandName=""  OnClick="btn3click">
	<rect id="C3" x="745.4" y="1179.4" class="cls-2 myclass" width="48.2" height="129.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1200"  runat="server" CommandArgument="D4" CommandName=""  OnClick="btn3click">
	<rect id="D4" x="678.4" y="1179.4" class="cls-2 myclass" width="50.9" height="129.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1201"  runat="server" CommandArgument="E4" CommandName=""  OnClick="btn3click">
	<polygon id="E4" class="cls-2 myclass" points="537.3,1176.5 593,1176.5 593,1230.3 537.3,1231.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1202"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click">
	<rect id="E4_1_" x="541.6" y="1234.6" class="cls-2 myclass" width="46.8" height="66.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1203"  runat="server" CommandArgument="D3" CommandName=""  OnClick="btn3click">
	<polygon id="D3" class="cls-2 myclass" points="659.7,1174.6 659.7,1232.2 597.3,1232.2 597.4,1174.6 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1204"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click">
	<rect id="D3_1_" x="604.2" y="1234.6" class="cls-2 myclass" width="47.8" height="66.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1205"  runat="server" CommandArgument="E3" CommandName=""  OnClick="btn3click">
	<rect id="E3" x="460.2" y="1185.6" class="cls-2 myclass" width="49.2" height="119"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1206"  runat="server" CommandArgument="F4" CommandName=""  OnClick="btn3click">
	<rect id="F4" x="396.6" y="1185.6" class="cls-2 myclass" width="50.6" height="119"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1207"  runat="server" CommandArgument="F3" CommandName=""  OnClick="btn3click">
	<polygon id="F3" class="cls-2 myclass" points="317.7,1185.6 368.8,1185.6 368.8,1304.7 317.7,1302.8 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1208"  runat="server" CommandArgument="G4" CommandName=""  OnClick="btn3click">
	<rect id="G4" x="255" y="1185.6" class="cls-2 myclass" width="50.4" height="119"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1209"  runat="server" CommandArgument="G2" CommandName=""  OnClick="btn3click">
	<rect id="G2" x="255" y="1319.6" class="cls-2 myclass" width="50.4" height="52.3"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1210"  runat="server" CommandArgument="F1" CommandName=""  OnClick="btn3click">
	<rect id="F1" x="317.7" y="1319.6" class="cls-2 myclass" width="46.3" height="52.3"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1211"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click">
	<rect id="F1_1_" x="315" y="1382.9" class="cls-2 myclass" width="47" height="59"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1212"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click">
	<polygon id="G2_1_" class="cls-2 myclass" points="303,1382.9 303,1442 255,1440 255,1382.9 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1213"  runat="server" CommandArgument="F2" CommandName=""  OnClick="btn3click">
	<rect id="F2" x="389.9" y="1327.2" class="cls-2 myclass" width="57.4" height="108.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1214"  runat="server" CommandArgument="E1" CommandName=""  OnClick="btn3click">
	<rect id="E1" x="455.7" y="1327.2" class="cls-2 myclass" width="53.8" height="108.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1215"  runat="server" CommandArgument="E2" CommandName=""  OnClick="btn3click">
	<polygon id="E2" class="cls-2 myclass" points="539.2,1359.9 539.2,1430.9 577.1,1430.9 577.1,1416 583.8,1416 596.3,1398.3 596.3,1359.9 	
		"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1216"  runat="server" CommandArgument="D1" CommandName=""  OnClick="btn3click">
	<polygon id="D1" class="cls-2 myclass" points="604.2,1334.9 660.6,1334.9 662.6,1442 604.2,1442 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1217"  runat="server" CommandArgument="D2" CommandName=""  OnClick="btn3click">
	<rect id="D2_1_" x="681.8" y="1319.6" class="cls-2 myclass" width="47.5" height="52.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1218"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click">
	<rect id="D2" x="681.8" y="1381.5" class="cls-2 myclass" width="47.5" height="60.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1219"  runat="server" CommandArgument="" CommandName=""  OnClick="btn3click">
	<rect id="C1_1_" x="740.3" y="1381.5" class="cls-2 myclass" width="47" height="62.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1220"  runat="server" CommandArgument="C1" CommandName=""  OnClick="btn3click">
	<polygon id="C1" class="cls-2 myclass" points="789.3,1317.6 789.3,1372.4 742.2,1372.4 742.2,1317.6 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1221"  runat="server" CommandArgument="B1" CommandName=""  OnClick="btn3click">
	<rect id="B1" x="916" y="1315.6" class="cls-2 myclass" width="50.8" height="128.3"/></asp:LinkButton>

</g>
   

<g id="SHED">
	<rect id="E-12" x="535.1" y="181.6" class="cls-blur" width="61.1" height="117.7"/>
	<rect id="D-11" x="596.2" y="129.8" class="cls-blur" width="60" height="169.6"/>
	<rect id="D-12" x="678.4" y="102.8" class="cls-blur" width="73.8" height="196.6"/>
	<rect id="C-11" x="752.2" y="142.7" class="cls-blur" width="75" height="156.6"/>
	<rect id="C-12" x="849.2" y="119" class="cls-blur" width="116" height="180.4"/>
	<rect id="F-10" x="392.1" y="331.4" class="cls-blur" width="61.1" height="246"/>
	<rect id="E-9" x="453.2" y="331.4" class="cls-blur" width="60" height="246"/>
	<rect id="E-10" x="535.1" y="331.4" class="cls-blur" width="61.1" height="246"/>
	<rect id="D-9" x="596.2" y="331.4" class="cls-blur" width="60" height="246"/>
	<rect id="D-10" x="678.4" y="325.6" class="cls-blur" width="75.1" height="258.5"/>
	<rect id="C-9" x="753.5" y="325.6" class="cls-blur" width="73.7" height="258.5"/>
	<polygon id="B-9" class="cls-blur" points="917,325.6 962.2,325.6 981.2,461 981.2,584.1 917,584.1 	"/>
	<rect id="C-8" x="857" y="609.6" class="cls-blur" width="56.2" height="261.3"/>
	<rect id="B-7" x="913.2" y="609.6" class="cls-blur" width="57.1" height="261.3"/>
	<polygon id="B-8" class="cls-blur" points="987.6,619.4 1016.8,618.8 1027.9,751.4 1036,877.1 987.6,877.1 	"/>
	<rect id="C-6" x="857" y="896.6" class="cls-blur" width="56.2" height="261.3"/>
	<rect id="B-5" x="913.2" y="896.6" class="cls-blur" width="57.1" height="261.3"/>
	<rect id="C-4" x="851.1" y="1172.6" class="cls-blur" width="62" height="136.5"/>
	<rect id="B-3" x="912.1" y="1172.6" class="cls-blur" width="58.2" height="136.5"/>
	<rect id="B-4" x="985.1" y="1172.6" class="cls-blur" width="62" height="136.5"/>
	<rect id="A-2" x="1046.1" y="1172.6" class="cls-blur" width="58.2" height="136.5"/>
	<rect id="C-2" x="851.1" y="1308.6" class="cls-blur" width="62" height="140.5"/>
	<rect id="B-2" x="985.1" y="1309.6" class="cls-blur" width="62" height="136.5"/>
	<rect id="A-1" x="1046.1" y="1308.6" class="cls-blur" width="58.2" height="136.5"/>
	<rect id="A-5" x="1117.9" y="1180.6" class="cls-blur" width="55.3" height="264.5"/>
	<rect id="A-6" x="1172.1" y="1180.6" class="cls-blur" width="58.2" height="264.5"/>
	<rect id="A-9" x="1245.1" y="1180.6" class="cls-blur" width="57.8" height="206.3"/>
	<rect id="A-10" x="1302.9" y="1180.6" class="cls-blur" width="56.9" height="206.3"/>
	<polygon id="A-13" class="cls-blur" points="1372.9,1180.6 1429.8,1180.6 1429.8,1364.3 1410.5,1364.9 1410,1351.2 1389.1,1351.2 
		1389.3,1339.8 1375.1,1338.9 	"/>
	<polygon id="A-14" class="cls-blur" points="1432.9,1180.6 1489.8,1180.6 1487.4,1401.4 1468,1402 1467.5,1388.2 1448.8,1388.2 
		1448.5,1376.8 1432.9,1376.8 	"/>
	<rect id="A-3" x="987.6" y="1062.6" class="cls-blur" width="116.7" height="100.7"/>
	<rect id="A-8" x="1245.1" y="1052.6" class="cls-blur" width="59.4" height="110.7"/>
	<rect id="A-11" x="1303.6" y="1052.6" class="cls-blur" width="55.7" height="110.7"/>
	<rect id="A-4" x="1116.1" y="1069.4" class="cls-blur" width="59.4" height="94"/>
	<rect id="A-12" x="1375.1" y="1042.4" class="cls-blur" width="59.4" height="121"/>
	<rect id="A-15" x="1433.6" y="1042.4" class="cls-blur" width="55.7" height="121"/>
	<rect id="A-16" x="1519.6" y="1019.7" class="cls-blur" width="52.9" height="143.6"/>
	<rect id="A-17" x="1579.6" y="1019.7" class="cls-blur" width="93.4" height="56.2"/>
	<rect id="A-18" x="1503.6" y="1176.3" class="cls-blur" width="55.7" height="107"/>
	<rect id="A-19" x="1553.6" y="1176.3" class="cls-blur" width="55.7" height="107"/>
	<rect id="A-20" x="1503.6" y="1300.3" class="cls-blur" width="76.1" height="101.7"/>
</g>



</svg>

                                                 </div>
                                         </asp:Panel>



                                     <asp:Panel ID="pnlrA1g" Visible="false" runat="server">
                                       <div class="divimgheight" style="display: block; width: 100%; text-align: center;"> 
                                           <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 842.2 595.2" style="enable-background:new 0 0 842.2 595.2;" xml:space="preserve" class="imgclass">
                                                  <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
  <g id="A-1">
	
		<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/A/A-1.jpg"  transform="matrix(0.2591 0 0 0.2591 -8.8169 8.7561)">
	</image>
	<polygon id="outline_3_" class="cls-2 myclass" points="353.4,369.8 360.4,369.8 360.4,374 386.2,374 386.2,369 392.9,369.5 392.9,374 
		418.7,374 418.7,369.5 425.4,369.5 425.4,374 451.9,374 451.9,239.9 122.6,239.9 122.6,369.2 130.4,369.4 130.4,374 156.9,374 
		156.9,369.6 163.3,369.6 163.2,374 189.5,374 189.5,369.2 196.3,369.4 196.3,374 222.5,374 222.5,370 228.9,370 228.9,374 
		254.9,374 254.9,369.8 261.7,369.8 261.9,374 287.9,374 287.9,369.8 294.4,369.8 294.7,374 320.1,374 320.1,370.1 326.7,370 
		326.7,374 353.2,374 	"/>

 <asp:LinkButton ID="LinkButton170"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-11" class="cls-2 myclass" points="121.9,240.4 156.2,240.4 156.2,369.5 156.2,374.5 129.7,374.5 129.7,369.9 121.9,369.8 	
		"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton171"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-12" class="cls-2 myclass" points="155.9,240.4 188.4,240.4 188.8,374.5 162.4,374.5 162.6,370.1 156.2,370.1 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton172"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-13" class="cls-2 myclass" points="188.4,240.4 221.3,240.4 221.8,374.5 195.6,374.5 195.6,369.9 188.8,369.8 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton173"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-14" class="cls-2 myclass" points="254.2,240.4 221.3,240.4 221.8,370.5 228.2,370.5 228.2,374.5 254.2,374.5 254.2,295.2 	
		"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton174"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-15" class="cls-2 myclass" points="287.2,240.4 254.2,240.4 254.2,370.3 260.9,370.3 261.2,374.5 287.2,374.5 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton175"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-16" class="cls-2 myclass" points="319.4,240.4 287.2,240.4 287.2,370.3 293.7,370.3 294,374.5 319.4,374.5 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton176"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-17" class="cls-2 myclass" points="319.4,240.4 352.7,240.4 352.7,370.3 352.7,374.5 326.4,374.5 326.4,370 319.4,369.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton177"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-18" class="cls-2 myclass" points="385.4,240.4 385.4,374.5 359.7,374.5 359.7,370.3 352.7,370.3 352.7,240.4 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton178"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-19" class="cls-2 myclass" points="417.9,240.4 417.9,374.5 392.2,374.5 392.2,370 385.4,369.5 385.4,240.4 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton179"  runat="server" CommandArgument="1_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A1-20" class="cls-2 myclass" points="451.2,240.4 417.9,240.4 417.9,370 424.7,370 424.7,374.5 451.2,374.5 	"/></asp:LinkButton>

</g>

                                           </svg>

                                           </div>
                                       </asp:Panel>

                                    <asp:Panel ID="pnlsA2g" Visible="false" runat="server">
                                       <div class="divimgheight" style="display: block; width: 100%; text-align: center;"> 

                                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 842.2 595.2" style="enable-background:new 0 0 842.2 595.2;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<g id="A-2">
	
		<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/A/A-2.jpg"  transform="matrix(0.2602 0 0 0.2602 -35.4862 -25.08)">
	</image>


 <asp:LinkButton ID="LinkButton180"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A2-11" class="cls-2 myclass" points="426.8,208.1 458.1,208.1 458.1,343.3 433.1,343.3 433.1,338.7 426,338.4 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton181"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click"> 
	<polygon id="A2-12" class="cls-2 myclass" points="459,208.1 492,208.1 492,343.3 465.9,343.3 465.9,338.8 458.1,338.8 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton182"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-13" class="cls-2 myclass" points="524.7,208.1 492,208.1 492,339.2 498.5,339.2 498.7,343.3 524.7,343.3 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton183"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-14" class="cls-2 myclass" points="557.3,208.1 558.3,343.3 531.5,343.3 531.5,338.6 524.7,338.2 524.7,208.1 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton184"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-15" class="cls-2 myclass" points="590.3,207.2 557.3,207.2 558.2,338.8 564.5,338.8 564.9,343.3 591.1,343.3 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton185"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-16" class="cls-2 myclass" points="623.3,207.2 590.3,207.2 591.1,338.6 597.3,338.6 597.7,343.3 623.3,343.3 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton186"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-17" class="cls-2 myclass" points="656.1,207.2 656.7,343.3 630.1,343.3 630.1,338.2 623.3,338.4 623.3,207.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton187"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-18" class="cls-2 myclass" points="689.3,207.2 689.7,343.3 663.4,343.3 663.4,338.8 656.7,338.8 656.1,207.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton188"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-19" class="cls-2 myclass" points="722.4,207.2 722.5,343.3 696,343.3 696,338.4 689.7,338.4 689.3,207.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton189"  runat="server" CommandArgument="16_0" CommandName=""  OnClick="btn1click">
	<polygon id="A2-20" class="cls-2 myclass" points="755.8,339 754.6,339 754.6,343.3 728.2,343.3 728.2,338.8 722.5,338.8 722.4,207.2 
		755.8,207.2 	"/></asp:LinkButton>

 
</g>
</svg>
                                         </div>
                                              </asp:Panel>
                                    
                                        <asp:Panel ID="pnlsA3g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                                <svg version="1.1" id="A-3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="2480" height="3509" xlink:href="images/bhumi/A/A-3.jpg"  transform="matrix(0.3427 0 0 0.3427 534.7057 -61.1111)">
</image>



 <asp:LinkButton ID="LinkButton145"  runat="server" CommandArgument="17_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A3-01" class="cls-2 myclass" points="1282.7,104.3 1282.7,304.4 1183.1,304.4 1183.1,102.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton146"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<rect id="A3-02_NA" x="1087.8" y="102.8" class="cls-2 myclass" width="95.3" height="201.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton147"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A3-03_NA" class="cls-2 myclass" points="1087.8,102.8 1087.8,304.4 988.2,304.4 988.2,101.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton148"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A3-04_NA" class="cls-2 myclass" points="988.2,102.8 988.2,304.4 887.1,304.4 888.6,102.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton149"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A3-05_NA" class="cls-2 myclass" points="888.6,102.8 887.1,304.4 787.5,304.4 787.5,102.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton150"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<rect id="A3-06_NA" x="692.2" y="102.8" class="cls-2 myclass" width="95.3" height="201.5"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton151"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<rect id="A3-07_NA" x="592.6" y="102.8" class="cls-2 myclass" width="99.6" height="201.5"/></asp:LinkButton>

</svg>
                                             </div>
                                       </asp:Panel>
                                      
                                     <asp:Panel ID="pnlsA5g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                                <svg version="1.1" id="A5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 848.74 335.48" style="enable-background:new 0 0 848.74 335.48;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3371" height="1286" xlink:href="images/bhumi/A/A5.jpg"  transform="matrix(0.24 0 0 0.24 18.8671 13.8252)">
</image>


 <asp:LinkButton ID="LinkButton12"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-23" class="cls-2 myclass" points="80.56,56.27 115.87,56.36 116.11,203.99 88.99,203.99 88.99,199.43 80.59,199.43 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton47"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-24" class="cls-2 myclass" points="150.91,56.27 151.39,203.99 124.03,203.99 124.03,199.25 116.1,199.18 115.87,56.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton48"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-25" class="cls-2 myclass" points="185.95,56.48 186.19,203.99 159.07,203.99 159.07,199.43 151.37,199.42 150.91,56.45 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton49"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-26" class="cls-2 myclass" points="221.47,56.46 221.47,203.99 194.35,203.99 194.35,198.95 186.37,198.95 185.95,56.48 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton50"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-27" class="cls-2 myclass" points="256.27,56.12 256.75,203.99 229.39,203.99 229.39,199.55 221.47,199.48 220.99,56.48 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton51"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-28" class="cls-2 myclass" points="291.07,56.12 256.27,56.12 256.73,198.94 264.73,198.94 264.91,203.99 292.03,203.99 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton52"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-29" class="cls-2 myclass" points="326.11,56.12 326.11,203.99 300.19,203.99 300.19,199.13 292,199.03 291.07,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton53"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-30" class="cls-2 myclass" points="326.11,199.13 334.75,199.13 334.75,203.99 362.11,203.99 362.11,132.71 362.11,56.12 
	326.11,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton54"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-31" class="cls-2 myclass" points="397.39,203.99 370.03,203.99 370.03,198.77 362.11,198.77 362.11,56.12 397.39,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton55"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-32" class="cls-2 myclass" points="404.95,203.99 404.95,199.31 397.39,199.31 397.39,56.12 431.95,56.12 431.95,203.99 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton56"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-33" class="cls-2 myclass" points="467.05,203.99 440.23,203.99 440.23,199.31 431.95,199.31 431.95,56.12 467.05,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton57"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-34" class="cls-2 myclass" points="502.15,203.99 502.15,198.77 502.15,56.12 467.05,56.12 467.05,199.49 475.15,199.67 
	475.33,203.99 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton58"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-35" class="cls-2 myclass" points="536.89,56.12 502.15,56.12 502.15,199.67 509.89,199.67 510.07,203.99 536.89,203.99 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton59"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-36" class="cls-2 myclass" points="571.99,56.12 536.89,56.12 536.89,199.49 545.35,199.49 545.35,203.99 571.71,203.99 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton60"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-37" class="cls-2 myclass" points="607.27,56.12 571.99,56.12 571.45,199.67 580.63,199.67 580.63,203.99 607.27,203.99 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton61"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-38" class="cls-2 myclass" points="642.55,56.12 642.73,203.99 615.55,203.99 615.55,199.13 607.27,199.13 607.27,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton62"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-39" class="cls-2 myclass" points="642.72,198.94 650.65,199.13 650.65,203.99 677.83,203.99 677.29,56.12 642.55,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton63"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-40" class="cls-2 myclass" points="712.93,203.99 685.93,203.99 685.93,198.77 677.81,198.77 677.29,56.12 712.93,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton64"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-41" class="cls-2 myclass" points="748.21,203.99 720.85,203.99 720.85,199.31 712.93,199.31 712.93,56.12 748.21,56.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton65"  runat="server" CommandArgument="19_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A5-42" class="cls-2 myclass" points="783.31,203.99 755.95,203.99 755.95,199.13 748.21,199.13 748.21,56.12 783.31,56.12 "/></asp:LinkButton>

</svg>

                                        </div>
                                         </asp:Panel>
                                    
                                     <asp:Panel ID="pnlsA6g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                                <svg version="1.1" id="A-6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 794 375" style="enable-background:new 0 0 794 375;" xml:space="preserve" class="imgclass">
<%--<style type="text/css">
	.st0{fill:none;stroke:#4C4C4C;stroke-miterlimit:10;}
</style>--%>
                                                    <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3088" height="1231" xlink:href="images/bhumi/A/A6.jpg"  transform="matrix(0.24 0 0 0.24 27.94 42)">
</image>


 <asp:LinkButton ID="LinkButton16"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A6-20_2_" class="cls-2 myclass" points="661.55,228.56 685.55,228.56 685.55,224.47 692.44,224.47 692.07,103.71 662.05,103.71 
	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton18"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A6-19" class="cls-2 myclass" points="631.85,229.04 655.32,229.04 655.32,225.3 661.55,225.21 662.55,104.24 632.26,104.24 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton23"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-18" class="cls-2 myclass" points="621.41,228.56 621.41,224.63 631.81,224.3 631.83,104.24 602.56,104.24 601.84,228.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton24"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-17" class="cls-2 myclass" points="572.68,228.56 589.18,228.56 589.18,224.63 601.84,224.63 602.56,104.24 572.68,104.24 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton14"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-16" class="cls-2 myclass" points="543.61,228.56 543.61,224.17 543.61,104.24 572.68,104.24 572.68,224.78 565.28,224.93 
	565.11,228.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton25"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-15" class="cls-2 myclass" points="513.87,104.24 543.61,104.24 543.61,224.93 536.54,224.93 536.37,228.56 513.87,228.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton26"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-14" class="cls-2 myclass" points="483.8,104.24 513.87,104.24 513.87,224.78 506.14,224.78 506.14,228.56 484.06,228.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton27"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-13" class="cls-2 myclass" points="454.57,104.24 483.8,104.24 484.3,224.93 475.91,224.93 475.91,228.56 454.57,228.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton28"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-12" class="cls-2 myclass" points="425.34,104.24 425.17,228.56 447.01,228.56 447.01,224.47 454.57,224.47 454.57,104.24 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton29"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-11" class="cls-2 myclass" points="425.18,224.32 417.94,224.47 417.94,228.56 395.11,228.56 394.6,104.24 425.34,104.24 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton30"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-10" class="cls-2 myclass" points="352.55,229.56 376.55,229.56 376.55,225.47 383.44,225.47 383.07,104.71 353.05,104.71 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton31"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-09" class="cls-2 myclass" points="322.86,230.04 346.32,230.04 346.32,226.3 352.55,226.21 353.55,105.24 323.26,105.24 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton32"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-08" class="cls-2 myclass" points="312.41,229.56 312.41,225.63 322.81,225.3 322.83,105.24 293.56,105.24 292.84,229.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton33"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-07" class="cls-2 myclass" points="263.68,229.56 280.18,229.56 280.18,225.63 292.84,225.63 293.56,105.24 263.68,105.24 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton34"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-06" class="cls-2 myclass" points="234.61,229.56 234.61,225.17 234.61,105.24 263.68,105.24 263.68,225.78 256.28,225.93 
	256.11,229.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton39"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-05" class="cls-2 myclass" points="204.87,105.24 234.61,105.24 234.61,225.93 227.54,225.93 227.37,229.56 204.87,229.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton40"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-04" class="cls-2 myclass" points="174.8,105.24 204.87,105.24 204.87,225.78 197.14,225.78 197.14,229.56 175.06,229.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton41"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-03" class="cls-2 myclass" points="145.57,105.24 174.8,105.24 175.3,225.93 166.91,225.93 166.91,229.56 145.57,229.56 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton42"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-02" class="cls-2 myclass" points="116.34,105.24 116.17,229.56 138.01,229.56 138.01,225.47 145.57,225.47 145.57,105.24 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton43"  runat="server" CommandArgument="20_0" CommandName=""  OnClick="btn1click">
<polygon id="A6-01" class="cls-2 myclass" points="116.18,225.32 108.94,225.47 108.94,229.56 86.11,229.56 85.6,105.24 116.34,105.24 "/></asp:LinkButton>

 

</svg>


                                            </div>
                                        </asp:Panel>
                                  
                                     <asp:Panel ID="pnlrA7f" Visible="false" runat="server">
                                       <div class="divimgheight" style="display: block; width: 100%; text-align: center;">                                   
<svg version="1.1" id="A-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="2819" height="1983" xlink:href="images/bhumi/A/A7-F-FLOOR.jpg"  transform="matrix(0.5485 0 0 0.5485 187.2267 -3.8374)">
</image>
<rect id="outline" x="326.7" y="136.7" class="cls-2 myclass" width="1262.2" height="640"/>    
 <asp:LinkButton ID="LinkButton152"  runat="server" CommandArgument="2_1" CommandName=""  OnClick="btn1click">
<rect id="A7-101_NA" x="326.4" y="136.7" class="cls-2 myclass" width="222.3" height="640"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton153"  runat="server" CommandArgument="2_1" CommandName=""  OnClick="btn1click">
<rect id="A7-102" x="546.2" y="136.7" class="cls-2 myclass" width="160.5" height="640"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton154"  runat="server" CommandArgument="2_1" CommandName=""  OnClick="btn1click">
<rect id="A7-103_NA" x="706.7" y="136.7" class="cls-2 myclass" width="361.4" height="640"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton155"  runat="server" CommandArgument="2_1" CommandName=""  OnClick="btn1click">
<rect id="A7-104_NA" x="1068.2" y="136.7" class="cls-2 myclass" width="178.6" height="640"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton156"  runat="server" CommandArgument="2_1" CommandName=""  OnClick="btn1click">
<rect id="A7-105" x="1246.7" y="136.7" class="cls-2 myclass" width="173.3" height="640"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton157"  runat="server" CommandArgument="2_1" CommandName=""  OnClick="btn1click">
<rect id="A7-106" x="1416.7" y="136.7" class="cls-2 myclass" width="173.3" height="640"/></asp:LinkButton>

</svg>
                                       </div>
                                    </asp:Panel>

                                         <asp:Panel ID="pnlrA7s" Visible="false" runat="server">
                                       <div class="divimgheight" style="display: block; width: 100%; text-align: center;">     
                                           <svg version="1.1" id="A-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="2964" height="2085" xlink:href="images/bhumi/A/A7-S-FLOOR.jpg"  transform="matrix(0.5182 0 0 0.5182 192.061 -0.2)">
</image>
<rect id="outline" x="276.4" y="89.4" class="cls-2 myclass" width="1363.7" height="704.2"/>

 <asp:LinkButton ID="LinkButton158"  runat="server" CommandArgument="2_2" CommandName=""  OnClick="btn1click">
<rect id="A7-201_NA" x="276.2" y="89.4" class="cls-2 myclass" width="240.2" height="704.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton159"  runat="server" CommandArgument="2_2" CommandName=""  OnClick="btn1click">
<rect id="A7-202" x="513.6" y="89.4" class="cls-2 myclass" width="173.4" height="704.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton160"  runat="server" CommandArgument="2_2" CommandName=""  OnClick="btn1click">
<rect id="A7-203_NA" x="687" y="89.4" class="cls-2 myclass" width="390.5" height="704.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton161"  runat="server" CommandArgument="2_2" CommandName=""  OnClick="btn1click">
<rect id="A7-204_NA" x="1077.5" y="89.4" class="cls-2 myclass" width="192.9" height="704.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton162"  runat="server" CommandArgument="2_2" CommandName=""  OnClick="btn1click">
<rect id="A7-205" x="1270.4" y="89.4" class="cls-2 myclass" width="187.2" height="704.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton163"  runat="server" CommandArgument="2_2" CommandName=""  OnClick="btn1click">
<rect id="A7-206" x="1454.1" y="89.4" class="cls-2 myclass" width="187.2" height="704.2"/></asp:LinkButton>


</svg>

                                       </div>
                                             </asp:Panel>

                                         <asp:Panel ID="pnlrA7g" Visible="false" runat="server">
                                       <div class="divimgheight" style="display: block; width: 100%; text-align: center;">     
                                           <svg version="1.1" id="A-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="2778" height="1954" xlink:href="images/bhumi/A/A7 Ground floor.jpg"  transform="matrix(0.508 0 0 0.508 254.7302 44.1515)">
</image>
<rect id="outline" x="353.62" y="145.32" class="cls-2 myclass" width="1200.36" height="610.64"/>


 <asp:LinkButton ID="LinkButton164"  runat="server" CommandArgument="2_0" CommandName=""  OnClick="btn1click">
<rect id="A7-01" x="353.62" y="145.32" class="cls-2 myclass" width="208.51" height="610.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton165"  runat="server" CommandArgument="2_0" CommandName=""  OnClick="btn1click">
<rect id="A7-02" x="562.13" y="145.32" class="cls-2 myclass" width="150.51" height="610.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton166"  runat="server" CommandArgument="2_0" CommandName=""  OnClick="btn1click">
<rect id="A7-03" x="712.62" y="145.32" class="cls-2 myclass" width="341" height="610.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton167"  runat="server" CommandArgument="2_0" CommandName=""  OnClick="btn1click">
<rect id="A7-04" x="1053.62" y="145.32" class="cls-2 myclass" width="178.72" height="610.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton168"  runat="server" CommandArgument="2_0" CommandName=""  OnClick="btn1click">
<rect id="A7-05" x="1232.34" y="145.32" class="cls-2 myclass" width="160.64" height="610.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton169"  runat="server" CommandArgument="2_0" CommandName=""  OnClick="btn1click">
<rect id="A7-06" x="1393.34" y="145.32" class="cls-2 myclass" width="160.64" height="610.64"/></asp:LinkButton>


</svg>
                                       
                                       </div>
                                             </asp:Panel>


                                       

                                     <asp:Panel ID="pnlsA8g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                        <svg version="1.1" id="A8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 842.16 595.2" style="enable-background:new 0 0 842.16 595.2;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/A/A8.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>


 <asp:LinkButton ID="LinkButton84"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-10" class="cls-2 myclass" points="641.48,106.64 583.16,106.64 582.8,394.22 589.04,394.27 588.92,402.2 629.42,402.2 
	629.42,394.16 641.48,394.16 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton85"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-11" class="cls-2 myclass" points="583.48,106.64 527.16,106.64 526.8,394.22 532.04,394.27 531.92,402.2 572.42,402.2 
	572.42,394.16 583.48,394.16 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton86"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-12" class="cls-2 myclass" points="527.48,106.64 471.16,106.64 470.8,394.22 476.04,394.27 475.92,402.2 516.42,402.2 
	516.42,394.16 527.48,394.16 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton87"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-13" class="cls-2 myclass" points="470.48,106.64 414.16,106.64 413.8,394.22 419.04,394.27 418.92,402.2 459.42,402.2 
	459.42,394.16 470.48,394.16 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton88"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-14" class="cls-2 myclass" points="414.48,106.64 358.16,106.64 357.8,394.22 363.04,394.27 362.92,402.2 403.42,402.2 
	403.42,394.16 414.48,394.16 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton89"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-15" class="cls-2 myclass" points="357.48,106.64 301.16,106.64 300.8,394.22 306.04,394.27 305.92,402.2 346.42,402.2 
	346.42,394.16 357.48,394.16 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton90"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-16" class="cls-2 myclass" points="301.48,106.64 245.16,106.64 244.8,394.22 250.04,394.27 249.92,402.2 290.42,402.2 
	290.42,394.16 301.48,394.16 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton91"  runat="server" CommandArgument="21_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A8-17" class="cls-2 myclass" points="245.48,106.64 164.28,106.64 163.76,394.22 171.32,394.27 171.14,402.2 229.53,402.2 
	229.53,394.16 245.48,394.16 "/></asp:LinkButton>

 
</svg>

                                            
                                            </div>
                                         </asp:Panel>
                                    
                                         
                                     <asp:Panel ID="pnlsA9g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                            <svg version="1.1" id="A-9" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3331 1996" style="enable-background:new 0 0 3331 1996;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="14042" height="9934" xlink:href="images/bhumi/A/A9.jpg"  transform="matrix(0.24 0 0 0.24 -19 -185)">
</image>


 <asp:LinkButton ID="LinkButton70"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-38" class="cls-2 myclass" points="2723.8,779.7 2865.7,873 2863.6,1563.4 2848.6,1563.4 2848.6,1582.6 2749.2,1582.6 
	2748.9,1564 2723.8,1563.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton71"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-37" class="cls-2 myclass" points="2585.8,684.7 2723.7,778 2722.6,1563.4 2710.6,1563.4 2710.6,1582.6 2611.2,1582.6 
	2610.9,1564 2585.8,1563.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton72"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-36" class="cls-2 myclass" points="2448.8,591.7 2586.7,685 2585.6,1563.4 2572.6,1563.4 2572.6,1582.6 2473.2,1582.6 
	2472.9,1563 2448.8,1563.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton73"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-35" class="cls-2 myclass" points="2311.8,498.1 2449.7,592.1 2448.6,1563.8 2434.6,1563.8 2434.6,1581.6 2335.2,1581.6 
	2334.9,1565.5 2311.8,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton74"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-34" class="cls-2 myclass" points="2311.8,1002.1 2172.3,1002.1 2171.4,1566.1 2196.4,1566.2 2196.1,1581.6 2296,1581.6 
	2296,1566 2311.8,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton75"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-33" class="cls-2 myclass" points="2171.9,1002.1 2034.5,1003.1 2035.7,1566.1 2057.3,1566.2 2057.1,1581.6 2156.2,1581.6 
	2156.2,1566 2171.9,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton76"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-32" class="cls-2 myclass" points="2034.3,1003.1 1896.1,1003.1 1895.2,1566.1 1921,1566.2 1920.7,1581.6 2019.4,1581.6 
	2019.4,1566 2034.3,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton77"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-31" class="cls-2 myclass" points="1896.4,1003.1 1759.2,1003.1 1758.3,1566.1 1783.1,1566.2 1782.8,1581.6 1881.5,1581.6 
	1881.5,1566 1896.4,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton78"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-30" class="cls-2 myclass" points="1759.8,1002.1 1620.3,1002.1 1619.4,1566.1 1644.4,1566.2 1644.1,1581.6 1744,1581.6 
	1744,1566 1759.8,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton79"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-29" class="cls-2 myclass" points="1619.9,1002.1 1482.5,1003.1 1483.7,1566.1 1505.3,1566.2 1505.1,1581.6 1604.2,1581.6 
	1604.2,1566 1619.9,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton80"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-28" class="cls-2 myclass" points="1482.3,1003.1 1344.1,1003.1 1343.2,1566.1 1369,1566.2 1368.7,1581.6 1467.4,1581.6 
	1467.4,1566 1482.3,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton81"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-27" class="cls-2 myclass" points="1344.4,1003.1 1207.2,1003.1 1206.3,1566.1 1231.1,1566.2 1230.8,1581.6 1329.5,1581.6 
	1329.5,1566 1344.4,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton82"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-26" class="cls-2 myclass" points="1204.3,1003.1 1066.1,1003.1 1065.2,1566.1 1091,1566.2 1090.7,1581.6 1189.4,1581.6 
	1189.4,1566 1204.3,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton83"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-25" class="cls-2 myclass" points="1066.4,1003.1 929.2,1003.1 928.3,1566.1 953.1,1566.2 952.8,1581.6 1051.5,1581.6 
	1051.5,1566 1066.4,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton92"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-24" class="cls-2 myclass" points="929.8,1002.1 790.3,1002.1 789.4,1566.1 814.4,1566.2 814.1,1581.6 914,1581.6 914,1566 
	929.8,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton93"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-23" class="cls-2 myclass" points="789.9,1002.1 652.5,1003.1 653.7,1566.1 675.3,1566.2 675.1,1581.6 774.2,1581.6 
	774.2,1566 789.9,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton94"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-22" class="cls-2 myclass" points="652.3,1003.1 514.1,1003.1 513.2,1566.1 539,1566.2 538.7,1581.6 637.4,1581.6 637.4,1566 
	652.3,1566 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton95"  runat="server" CommandArgument="3_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A9-21" class="cls-2 myclass" points="514.4,1003.1 372.4,1003.1 371.4,1566.1 397.1,1566.2 396.8,1581.6 499,1581.6 499,1566 
	514.4,1566 "/></asp:LinkButton>

</svg>

                                             </div>
                                         </asp:Panel>
                                    
                                         
                                     <asp:Panel ID="pnlsA10g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3326.4 1915.2" style="enable-background:new 0 0 3326.4 1915.2;" xml:space="preserve" class="imgclass"> 
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="14042" height="9934" xlink:href="images/bhumi/A/A10.jpg"  transform="matrix(0.24 0 0 0.24 -19.08 -220.16)">
</image>


 <asp:LinkButton ID="LinkButton96"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-07" class="cls-2 myclass" points="2308.4,462.48 2308.4,931.11 2168.9,931.11 2168.4,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton97"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-08" class="cls-2 myclass" points="2170.4,932.6 2033,931.6 2034.2,368.6 2055.9,368.5 2055.6,353.1 2154.8,353.1 
	2154.8,368.7 2170.4,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton98"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-09" class="cls-2 myclass" points="2032.9,931.6 1894.7,931.6 1893.8,368.6 1919.5,368.5 1919.3,353.1 2017.9,353.1 
	2017.9,368.7 2032.9,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton99"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-10" class="cls-2 myclass" points="1895,931.6 1757.8,931.6 1756.9,368.6 1781.7,368.5 1781.4,353.1 1880,353.1 1880,368.7 
	1895,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton100"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-11" class="cls-2 myclass" points="1758.4,932.6 1618.9,932.6 1618,368.6 1642.9,368.5 1642.6,353.1 1742.5,353.1 
	1742.5,368.7 1758.4,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton101"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-12" class="cls-2 myclass" points="1618.4,932.6 1481,931.6 1482.2,368.6 1503.9,368.5 1503.6,353.1 1602.8,353.1 
	1602.8,368.7 1618.4,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton102"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-13" class="cls-2 myclass" points="1480.9,931.6 1342.7,931.6 1341.8,368.6 1367.5,368.5 1367.3,353.1 1465.9,353.1 
	1465.9,368.7 1480.9,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton103"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-14" class="cls-2 myclass" points="1343,931.6 1204.24,931.6 1203.33,368.6 1228.41,368.5 1228.11,353.1 1327.83,353.1 
	1327.83,368.7 1343,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton104"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-15" class="cls-2 myclass" points="1202.9,931.6 1041.29,931.6 1040.24,368.6 1070.29,368.5 1070.06,353.1 1185.36,353.1 
	1185.36,368.7 1202.9,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton105"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-16" class="cls-2 myclass" points="1040.24,931.6 927.64,931.6 926.9,368.6 947.25,368.5 947.01,353.1 1027.93,353.1 
	1027.93,368.7 1040.24,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton108"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-17" class="cls-2 myclass" points="928.4,932.6 788.9,932.6 788,368.6 812.9,368.5 812.6,353.1 912.5,353.1 912.5,368.7 
	928.4,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton109"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-18" class="cls-2 myclass" points="788.4,932.6 651,931.6 652.2,368.6 673.9,368.5 673.6,353.1 772.8,353.1 772.8,368.7 
	788.4,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton110"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-19" class="cls-2 myclass" points="650.9,931.6 512.7,931.6 511.8,368.6 537.5,368.5 537.3,353.1 635.9,353.1 635.9,368.7 
	650.9,368.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton111"  runat="server" CommandArgument="22_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A10-20_1_" class="cls-2 myclass" points="513,931.6 370.9,931.6 370,368.6 395.7,368.5 395.3,353.1 497.5,353.1 497.5,368.7 
	513,368.7 "/></asp:LinkButton>


</svg>

                                            
                                            </div>
                                         </asp:Panel>
                                    
                                     <asp:Panel ID="pnlsA11g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                                <svg version="1.1" id="A11" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                    viewBox="0 0 842.16 595.2" style="enable-background: new 0 0 842.16 595.2;" xml:space="preserve" class="imgclass">
                                                 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
                                                    
                                                    <%--<style type="text/css">
                                                        .st0 {
                                                            fill: none;
                                                            stroke: #4C4C4C;
                                                            stroke-miterlimit: 10;
                                                        }
                                                    </style>--%>
                                                    <image style="overflow: visible;" width="3509" height="2480" xlink:href="images/bhumi/A/DF41AD4C.jpg" transform="matrix(0.24 0 0 0.24 0 0)">
                                                    </image>
                                                 

                                                 <asp:LinkButton ID="LinkButton112"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-01" class="cls-2 myclass" points="175.23,170.98 104,170.98 103.56,381.92 113,382.2 113,391.76 162.22,391.87 
	                                                162.43,382.17 175.23,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton113"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-02" class="cls-2 myclass" points="244.23,170.98 175.65,170.98 175.23,381.92 182.32,382.2 182.32,391.76 231.7,391.87 
	                                                231.91,382.17 244.23,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton114"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-03" class="cls-2 myclass" points="314.23,170.98 245.65,170.98 245.23,381.92 252.32,382.2 252.32,391.76 301.7,391.87 
	                                                    301.91,382.17 314.23,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton115"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-04" class="cls-2 myclass" points="382.23,170.98 313.65,170.98 313.23,381.92 320.32,382.2 320.32,391.76 369.7,391.87 
	                                                                    369.91,382.17 382.23,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton116"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-05" class="cls-2 myclass" points="452.43,170.98 382.66,170.98 382.23,381.92 389.44,382.2 389.44,391.76 439.69,391.87 
	                                                    439.9,382.17 452.43,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton117"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-06" class="cls-2 myclass" points="522.23,170.98 452.66,170.98 452.23,381.92 459.42,382.2 459.42,391.76 509.52,391.87 
	                                                    509.73,382.17 522.23,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton118"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-07" class="cls-2 myclass" points="590.44,170.98 522.65,170.98 522.23,381.92 529.24,382.2 529.24,391.76 578.06,391.87 
	                                                578.26,382.17 590.44,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton119"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-08" class="cls-2 myclass" points="660.23,170.98 590.66,170.98 590.23,381.92 597.42,382.2 597.42,391.76 647.52,391.87 
                                                    	647.73,382.17 660.23,381.92 " /></asp:LinkButton>

                                                    <asp:LinkButton ID="LinkButton120"  runat="server" CommandArgument="23_0" CommandName=""  OnClick="btn1click"> 
                                                    <polygon id="A11-09" class="cls-2 myclass" points="730.76,170.98 660.66,170.98 660.23,381.92 667.48,382.2 667.48,391.76 717.95,391.87 
	                                                  718.17,382.17 730.76,381.92 " /></asp:LinkButton>

  
                                                  
                                                </svg>


                                            </div>
                                        </asp:Panel>

                                     <asp:Panel ID="pnlsA12g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                       
                                              <svg version="1.1" id="A-12" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1170.2 613.7" style="enable-background:new 0 0 1170.2 613.7;" xml:space="preserve" class="imgclass" >
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new  ;" width="4876" height="2557" xlink:href="images/bhumi/A/A 12.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>


 <asp:LinkButton ID="LinkButton136"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-12" class="cls-2 myclass" points="177.4,97 56.8,97 56,484.5 69.3,484.5 69.4,500.9 164.3,501.6 164.3,484.5 177.4,484.5 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton137"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-13" class="cls-2 myclass" points="295.4,97 177.8,97 177.4,484.5 186,484.6 186,501.4 281.9,501.6 281.9,484.8 294.4,484.5 
	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton138"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-14" class="cls-2 myclass" points="412.4,97 295.8,97 294.4,484.5 303.6,484.5 303.6,501.4 398.6,501.6 398.6,484.5 
	411.6,484.6 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton139"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-15" class="cls-2 myclass" points="527.2,97 412.4,97 411.6,484.6 420.1,484.6 420.1,501.2 515.6,501.1 515.4,484.9 
	527.2,484.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton140"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-16" class="cls-2 myclass" points="644.4,97 527.8,97 527,484.5 537.3,484.5 537.4,500.9 632.3,501.6 632.3,484.5 
	644.4,484.5 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton141"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-17" class="cls-2 myclass" points="761.4,97 644.8,97 644.4,484.5 655,484.6 655,501.4 749.9,501.6 749.9,484.8 761.4,484.5 
	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton142"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-18" class="cls-2 myclass" points="879.7,97 761.8,97 761.4,484.5 771.6,484.5 771.6,501.4 866.6,501.6 866.6,484.5 
	879.7,484.6 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton143"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-19" class="cls-2 myclass" points="998.2,96.8 879.7,97 879.7,484.6 888.1,484.6 888.1,501.2 984.6,501.1 984.4,484.9 
	998.2,484.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton144"  runat="server" CommandArgument="24_0" CommandName=""  OnClick="btn1click"> 
<polygon id="A12-20" class="cls-2 myclass" points="1117.2,96.8 998.7,97 998.7,484.6 1007.1,484.6 1007.1,501.2 1103.6,501.1 1103.4,484.9 
	1117.2,484.8 "/></asp:LinkButton>


</svg>
  
                                            </div>
                                         </asp:Panel>

                                         
                                     <asp:Panel ID="pnlsA13g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                           <svg version="1.1" id="A-13" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 871.7 448.11" style="enable-background:new 0 0 871.7 448.11;" xml:space="preserve" class="imgclass">


                                                    <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/A/A-13.jpg"  transform="matrix(0.24 0 0 0.24 43.6226 -79.1132)">
</image>


 <asp:LinkButton ID="LinkButton121"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-21" class="cls-2 myclass" points="190.26,125.26 154.12,125.21 154.08,268.94 161.32,268.94 161.32,273.98 186.4,273.98 
	186.34,268.97 190.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton122"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-22" class="cls-2 myclass" points="225.76,125.26 190.12,125.21 190.26,268.94 196.78,268.94 196.78,273.6 221.81,273.37 
	221.81,268.93 225.63,268.87 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton123"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-23" class="cls-2 myclass" points="261.26,125.26 226.12,125.21 226.08,268.94 233.32,268.94 233.32,273.98 258.4,273.98 
	258.34,268.97 261.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton124"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-24" class="cls-2 myclass" points="296.76,125.26 261.12,125.21 261.26,268.94 267.78,268.94 267.78,273.6 293.81,273.37 
	293.81,268.57 297.08,268.48 "/></asp:LinkButton>

<asp:LinkButton ID="LinkButton125"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-25" class="cls-2 myclass" points="332.26,125.26 297.12,125.21 296.68,268.49 303.32,268.45 303.32,273.98 328.4,273.98 
	328.34,268.97 332.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton126"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-26" class="cls-2 myclass" points="367.76,125.26 332.12,125.21 332.26,268.94 338.78,268.94 338.78,273.6 363.81,273.37 
	363.81,268.93 367.63,268.87 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton128"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-27" class="cls-2 myclass" points="403.26,125.26 367.74,125.21 367.69,268.94 375.02,268.94 375.02,273.98 400.37,273.98 
	400.31,268.97 403.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton129"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-28" class="cls-2 myclass" points="438.43,125.26 403.12,125.21 403.26,268.94 409.78,268.94 409.78,273.6 435.81,273.37 
	435.81,268.57 438.56,268.49 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton130"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-29" class="cls-2 myclass" points="473.76,125.26 438.12,125.21 438.26,268.94 444.78,268.94 444.78,273.6 469.81,273.37 
	469.81,268.93 473.63,268.87 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton131"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-30" class="cls-2 myclass" points="509.26,125.26 474.12,125.21 474.08,268.94 481.32,268.94 481.32,273.98 506.4,273.98 
	506.34,268.97 509.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton132"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-31" class="cls-2 myclass" points="544.76,125.26 509.12,125.21 509.26,268.94 515.78,268.94 515.78,273.6 541.81,273.37 
	541.81,268.57 545.08,268.48 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton133"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-32" class="cls-2 myclass" points="580.26,125.26 545.12,125.21 544.68,268.49 551.32,268.45 551.32,273.98 576.4,273.98 
	576.34,268.97 580.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton134"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-33" class="cls-2 myclass" points="615.76,125.26 580.12,125.21 580.26,268.94 586.78,268.94 586.78,273.6 611.81,273.37 
	611.81,268.93 615.63,268.87 "/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton135"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-34" class="cls-2 myclass" points="651.26,125.26 615.74,125.21 615.69,268.94 623.02,268.94 623.02,273.98 648.37,273.98 
	648.31,268.97 651.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton190"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-35" class="cls-2 myclass" points="651.12,125.21 686.43,125.26 686.74,218.86 653.35,267.37 653.35,268.81 651.08,268.94 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton191"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A13-36" class="cls-2 myclass" points="750.55,125.21 750.55,128.86 686.74,218.86 687.19,125.21 "/></asp:LinkButton>


</svg>

                                            </div>
                                         </asp:Panel>
                                       
                                     <asp:Panel ID="pnlsA14g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                       <svg version="1.1" id="A-14" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 842.16 595.2" style="enable-background:new 0 0 842.16 595.2;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/A/A 14.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>


 <asp:LinkButton ID="LinkButton106"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-20" class="cls-2 myclass" points="104.93,357.63 68.55,357.68 68.51,213.92 75.8,213.92 75.8,208.88 101.05,208.88 
	100.98,214.52 104.93,214.76 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton192"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-19" class="cls-2 myclass" points="140.67,357.63 104.79,357.68 104.93,214.76 111.5,214.52 111.5,209.26 136.7,209.5 
	136.7,214.64 140.33,215.05 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton193"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-18" class="cls-2 myclass" points="175.4,357.63 141.03,357.68 140.33,215.05 147.28,215 147.28,208.88 172.53,208.88 
	172.47,214.89 175.76,214.91 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton194"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-17" class="cls-2 myclass" points="211.14,357.63 176.27,357.68 175.76,214.91 181.97,214.92 181.97,209.26 207.18,209.5 
	207.18,214.3 211.46,214.38 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton195"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-16" class="cls-2 myclass" points="246.88,357.63 211.51,357.68 211.06,214.37 216.75,214.42 216.75,208.88 243,208.88 
	242.94,213.89 245.84,213.92 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton196"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-15" class="cls-2 myclass" points="281.62,357.63 246.74,357.68 245.84,213.92 252.44,213.92 252.44,209.26 277.64,209.5 
	277.64,213.94 281.59,213.97 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton197"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-14" class="cls-2 myclass" points="316.52,357.64 281.59,357.68 281.59,213.97 287.92,213.92 287.92,208.88 313.44,208.88 
	313.38,214.4 316.52,214.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton198"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-13" class="cls-2 myclass" points="356.89,357.68 316.52,357.64 316.52,214.4 328.76,214.4 328.92,209.26 354.12,209.5 
	354.12,214.3 356.89,214.37 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton199"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-12" class="cls-2 myclass" points="392.6,357.68 356.89,357.68 356.89,214.37 363.44,214.4 363.68,209.28 388.35,209.5 
	388.35,213.94 392.19,214 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton200"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-11" class="cls-2 myclass" points="427.4,357.63 392.6,357.68 392.19,214 397.93,213.92 397.93,208.88 424.18,208.88 
	424.12,213.89 427.76,213.93 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton201"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-10" class="cls-2 myclass" points="462.68,357.68 426.92,357.68 427.76,213.93 433.62,213.92 433.62,209.26 458.83,209.5 
	458.83,214.3 462.68,214.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton202"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-09" class="cls-2 myclass" points="498.35,357.63 462.68,357.68 462.68,214.4 468.4,214.42 468.4,208.88 494.65,208.88 
	494.59,213.89 498.35,213.92 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton203"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-08" class="cls-2 myclass" points="533.27,357.63 498.35,357.63 498.35,213.92 504.1,213.92 504.09,209.26 529.29,209.5 
	529.29,213.94 533.13,214 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton204"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-07" class="cls-2 myclass" points="569,357.63 533.24,357.68 533.2,213.92 539.57,213.92 539.57,208.88 565.09,208.88 
	565.03,213.89 568.82,213.92 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton205"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-06" class="cls-2 myclass" points="604,357.63 568.95,357.68 568.91,213.92 575.15,213.92 575.15,208.88 600.17,208.88 
	600.11,213.89 603.82,213.92 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton206"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-05" class="cls-2 myclass" points="638.42,357.63 604.24,357.68 604.2,213.92 610.29,213.92 610.29,208.88 634.69,208.88 
	634.63,213.89 638.24,213.92 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton207"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-04" class="cls-2 myclass" points="674.06,357.63 638.47,357.68 638.42,213.92 644.76,213.92 644.76,208.88 670.17,208.88 
	670.11,213.89 673.88,213.92 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton208"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-03" class="cls-2 myclass" points="674.84,213.8 680.36,213.8 680.36,209.36 705.8,209.36 705.8,214.28 709.52,214.28 
	709.16,310.04 674.84,357.68 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton209"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-02" class="cls-2 myclass" points="734.72,209.36 734.72,214.16 738.92,214.16 738.92,269.48 709.16,310.04 709.52,209.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton210"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A14-01" class="cls-2 myclass" points="769.88,209.36 744.68,209.36 744.68,214.28 738.92,214.16 738.92,269.48 776.12,217.4 
	776.12,214.04 770,214.04 "/></asp:LinkButton>

</svg>

                                                </div>
                                         </asp:Panel>
                                    
                                         
                                     <asp:Panel ID="pnlsA15g" Visible="false" runat="server">
                                            <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 792 612" style="enable-background:new 0 0 792 612;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/A/A-15.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>


 <asp:LinkButton ID="LinkButton211"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-10" class="cls-2 myclass" points="711.52,143 649.18,143 649.18,390.93 655.52,391.1 655.39,400 700.5,400 700.5,392.01 
	711.52,392.01 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton212"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-09" class="cls-2 myclass" points="649.02,143 588.18,143 588.18,390.93 594.37,391.1 594.24,400 638.27,400 638.27,392.01 
	649.02,392.01 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton213"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-08" class="cls-2 myclass" points="587.68,143 514.64,143 514.48,391.62 520.58,391.66 520.54,399.62 565.12,400.01 
	564.88,391.12 587.68,391.12 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton214"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-07" class="cls-2 myclass" points="514.2,143 441.49,143 441.02,392.06 447.88,392.1 447.72,400 491.73,400 491.73,391.7 
	514.48,391.62 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton215"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-06" class="cls-2 myclass" points="441.02,143 380.18,143 380.18,390.93 386.37,391.1 386.24,400 430.27,400 430.27,392.01 
	441.02,392.01 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton216"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-05" class="cls-2 myclass" points="379.8,143 319.36,143 319.36,391.17 325.03,391.16 324.91,400 368.81,400 368.81,391.01 
	380.18,390.88 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton217"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-04" class="cls-2 myclass" points="318.97,143 258.35,143 258.16,391.05 264.47,391.1 264.34,400 307.56,400 307.56,391.01 
	319.36,391.01 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton218"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-03" class="cls-2 myclass" points="257.97,143 197.44,143 197.44,391.11 203.12,391.1 202.99,400 246.89,400 246.89,391.01 
	258.16,391 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton219"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-02" class="cls-2 myclass" points="197.05,143 136.25,143 136.08,391.17 142.12,391.1 141.99,400 185.54,400 185.54,391.01 
	197.44,391.06 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton220"  runat="server" CommandArgument="" CommandName=""  OnClick="btn1click"> 
<polygon id="A15-01" class="cls-2 myclass" points="135.91,143 73.52,143 73.12,391.06 81.89,391.1 81.76,400 126.34,400 126.34,391.01 
	136.12,391.12 "/></asp:LinkButton>

</svg>

                                        </div>
                                         </asp:Panel>
                                    
                                         
                                     <asp:Panel ID="pnlrB1s" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B-1_2nd_floor" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
	 y="0px" viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="9934" height="7017" xlink:href="images/bhumi/B/B1-second floor.jpg"  transform="matrix(0.145 0 0 0.1518 239.84 7.5391)">
</image>
<rect id="outline" x="343.84" y="440.8" class="cls-2 myclass" width="1088.64" height="465.12"/>


 <asp:LinkButton ID="LinkButton221"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-211" x="344.2" y="438.28" class="cls-2 myclass" width="111.24" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton222"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-212" x="454.2" y="438.28" class="cls-2 myclass" width="110" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton223"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-213" x="564.2" y="438.28" class="cls-2 myclass" width="107.24" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton224"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-214" x="671.2" y="438.28" class="cls-2 myclass" width="109" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton225"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-215" x="780.2" y="438.28" class="cls-2 myclass" width="111.24" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton226"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-216" x="891.44" y="438.28" class="cls-2 myclass" width="108.76" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton227"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-217" x="1000.2" y="438.28" class="cls-2 myclass" width="107.24" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton228"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-218" x="1108.2" y="438.28" class="cls-2 myclass" width="111.24" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton229"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-219" x="1219.44" y="438.28" class="cls-2 myclass" width="108.76" height="465.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton230"  runat="server" CommandArgument="4_2" CommandName=""  OnClick="btn1click">
<rect id="B1-220" x="1328.2" y="438.28" class="cls-2 myclass" width="107.24" height="465.48"/></asp:LinkButton>


</svg>

                                           </div>
                                   </asp:Panel>

                                     <asp:Panel ID="pnlrB1g" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B-1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
  <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="9934" height="7017" xlink:href="images/bhumi/B/GROUND FLOOR - B1.jpg"  transform="matrix(0.1486 0 0 0.1486 221.9316 18.64)">
</image>
<rect id="outline" x="293.44" y="400.96" class="cls-2 myclass" width="1174.01" height="486.6"/>

 <asp:LinkButton ID="LinkButton231"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-11" x="293.83" y="398.32" class="cls-2 myclass" width="119.96" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton232"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 

<rect id="B1-12" x="412.45" y="398.32" class="cls-2 myclass" width="118.63" height="486.98"/></asp:LinkButton>
 <asp:LinkButton ID="LinkButton233"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 

<rect id="B1-13" x="531.08" y="398.32" class="cls-2 myclass" width="115.65" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton234"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-14" x="646.47" y="398.32" class="cls-2 myclass" width="117.55" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton235"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-15" x="764.02" y="398.32" class="cls-2 myclass" width="119.96" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton236"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-16" x="883.98" y="398.32" class="cls-2 myclass" width="117.29" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton237"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-17" x="1001.27" y="398.32" class="cls-2 myclass" width="115.65" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton238"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-18" x="1117.74" y="398.32" class="cls-2 myclass" width="119.96" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton239"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-19" x="1237.7" y="398.32" class="cls-2 myclass" width="117.29" height="486.98"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton240"  runat="server" CommandArgument="4_0" CommandName=""  OnClick="btn1click"> 
<rect id="B1-20" x="1354.99" y="398.32" class="cls-2 myclass" width="115.65" height="486.98"/></asp:LinkButton>



</svg>
                                           </div>
                                   </asp:Panel>

                                     <asp:Panel ID="pnlsB2g" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3389 2183.5" style="enable-background:new 0 0 3389 2183.5;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3389" height="1907" xlink:href="images/bhumi/B/B2.jpg"  transform="matrix(1 0 0 1 0 276.48)">
</image>
<polygon id="outline_3_" class="cls-2 myclass" points="1248.4,1355.3 1279.5,1355.3 1279.5,1374.5 1393.6,1374.5 1393.6,1351.8 
	1423.5,1354.1 1423.5,1374.5 1537.6,1374.5 1537.6,1354.1 1567.6,1354.1 1567.6,1374.5 1685.1,1374.5 1685.1,767.8 225.3,767.8 
	225.3,1353 259.8,1353.8 259.8,1374.5 377.4,1374.5 377.4,1354.7 405.6,1354.7 405,1374.5 522,1374.5 522,1353 551.9,1353.5 
	551.9,1374.5 668.3,1374.5 668.3,1356.4 696.5,1356.4 696.5,1374.5 811.7,1374.5 811.7,1355.3 841.7,1355.3 842.8,1374.5 
	958.1,1374.5 958.1,1355.3 986.9,1355.3 988,1374.5 1100.9,1374.5 1100.9,1357 1129.9,1356.6 1129.9,1374.5 1247.4,1374.5 "/>
<polygon id="B2-01" class="cls-2 myclass" points="225.3,770.8 377.4,770.8 377.4,1348.4 377.4,1370.8 259.8,1370.8 259.8,1350.3 
	225.3,1349.5 "/>
<polygon id="B2-02" class="cls-2 myclass" points="376,770.8 520.2,770.8 522,1370.8 405,1370.8 405.6,1351.2 377.4,1351.2 "/>
<polygon id="B2-03" class="cls-2 myclass" points="520.2,770.8 666,770.8 668.3,1370.8 551.9,1370.8 551.9,1350.1 522,1349.5 "/>
<polygon id="B2-04" class="cls-2 myclass" points="811.7,770.8 666,770.8 668.3,1352.9 696.5,1352.9 696.5,1370.8 811.7,1370.8 811.7,1015.8 
	"/>
<polygon id="B2-05" class="cls-2 myclass" points="958.1,770.8 811.7,770.8 811.7,1351.8 841.7,1351.8 842.8,1370.8 958.1,1370.8 "/>
<polygon id="B2-06" class="cls-2 myclass" points="1100.9,770.8 958.1,770.8 958.1,1351.8 986.9,1351.8 988,1370.8 1100.9,1370.8 "/>
<polygon id="B2-07" class="cls-2 myclass" points="1100.9,770.8 1248.4,770.8 1248.4,1351.8 1248.4,1370.8 1132,1370.8 1132,1350.6 
	1100.9,1347.2 "/>
<polygon id="B2-08" class="cls-2 myclass" points="1393.6,770.8 1393.6,1370.8 1279.5,1370.8 1279.5,1351.8 1248.4,1351.8 1248.4,770.8 "/>
<polygon id="B2-09" class="cls-2 myclass" points="1537.6,770.8 1537.6,1370.8 1423.5,1370.8 1423.5,1350.6 1393.6,1348.4 1393.6,770.8 "/>
<polygon id="B2-10" class="cls-2 myclass" points="1685.1,770.8 1537.6,770.8 1537.6,1350.6 1567.6,1350.6 1567.6,1370.8 1685.1,1370.8 "/>
</svg>

                                           </div>
                                   </asp:Panel>
                                    
                                    <asp:Panel ID="pnlsB3g" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 2808 2449.4" style="enable-background:new 0 0 2808 2449.4;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/B/B3.jpg"  transform="matrix(1 0 0 1 -296.56 -33.88)">
</image>

 <asp:LinkButton ID="LinkButton241"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-20" class="cls-2 myclass" points="297.4,233.3 297.4,205.2 463.7,205.2 463.7,238.3 526.3,238.3 524.2,1117.4 297.4,1117.4 
	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton242"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-19" class="cls-2 myclass" points="750.2,235.4 688.3,231.8 688.3,208.8 540,208.8 540,235.4 526.3,235.4 524.2,1117.4 
	750.2,1117.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton243"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-18" class="cls-2 myclass" points="752.4,233.3 752.4,205.2 918.7,205.2 918.7,238.3 981.3,238.3 979.2,1117.4 752.4,1117.4 
	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton244"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-17" class="cls-2 myclass" points="1205.2,231.5 1140.1,231.6 1141.2,207 988.2,205.2 988.2,234 981.3,235.4 979.2,1117.4 
	1205.2,1117.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton245"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-16" class="cls-2 myclass" points="1428.2,231.5 1363.1,231.6 1364.2,207 1211.2,205.2 1211.2,234 1204.3,235.4 1202.2,1117.4 
	1428.2,1117.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton246"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-15" class="cls-2 myclass" points="1651.2,231.5 1586.1,231.6 1587.2,207 1434.2,205.2 1434.2,234 1427.3,235.4 1425.2,1117.4 
	1651.2,1117.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton247"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-14" class="cls-2 myclass" points="1876.2,231.5 1811.1,231.6 1812.2,207 1659.2,205.2 1659.2,234 1652.3,235.4 1650.2,1117.4 
	1876.2,1117.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton248"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-13" class="cls-2 myclass" points="2099.2,231.5 2034.1,231.6 2035.2,207 1882.2,205.2 1882.2,234 1875.3,235.4 1873.2,1117.4 
	2099.2,1117.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton249"  runat="server" CommandArgument="29_0" CommandName=""  OnClick="btn1click">
<polygon id="B3-12" class="cls-2 myclass" points="2322.2,231.5 2257.1,231.6 2258.2,207 2105.2,205.2 2105.2,234 2098.3,235.4 2096.2,1117.4 
	2322.2,1117.4 "/>
<polygon id="B3-11" class="cls-2 myclass" points="2555.2,231.5 2488.1,231.6 2489.2,207 2331.6,205.2 2331.6,234 2324.5,235.4 2322.2,1117.4 
	2555.2,1117.4 "/></asp:LinkButton>



</svg>

                                           </div>
                                   </asp:Panel> 
                                    
                                     <asp:Panel ID="pnlsB4g" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3389 1907" style="enable-background:new 0 0 3389 1907;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3389" height="1907" xlink:href="images/bhumi/B/B4.jpg" >
</image>
<polygon id="outline_3_" class="cls-2 myclass" points="2700.2,1079.4 2731.3,1079.4 2730.5,1098.6 2847.1,1098.6 2847.1,1078 2877,1078.2 
	2877,1098.6 2990.8,1098.6 2990.8,1078.2 3019.4,1078.2 3019.2,1097.1 3137.9,1098.6 3137.9,491.9 1681.8,491.9 1681.8,1077.1 
	1716.3,1077.9 1716.3,1098.6 1831.6,1097.1 1830.9,1078.8 1861.7,1078.8 1861.1,1096.3 1977.8,1098.6 1977.8,1077.1 2003.7,1077.6 
	2004,1098.6 2120.1,1098.6 2120,1080.5 2148.8,1080.5 2148.8,1098.6 2266.7,1098.6 2266.7,1079.4 2293.7,1079.4 2294.8,1098.6 
	2412.8,1098.6 2412.8,1079.4 2441.5,1079.4 2442.6,1098.6 2555.2,1096.7 2555.2,1081.1 2584.1,1080.7 2583.8,1096.7 2701.2,1096.5 
	"/>

 <asp:LinkButton ID="LinkButton250"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-01" class="cls-2 myclass" points="1681.8,491.9 1829.2,491.9 1829.2,1072.5 1829.2,1097.4 1716.3,1098.6 1716.3,1077.9 
	1681.8,1077.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton251"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-02" class="cls-2 myclass" points="1827.8,494.9 1972,494.9 1973.8,1097.4 1859,1096.7 1860,1077.3 1827.8,1077.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton252"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-03" class="cls-2 myclass" points="1972,494.9 2117.8,494.9 2120.1,1094.9 2003.7,1094.9 2003.7,1074.2 1973.8,1073.6 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton253"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-04" class="cls-2 myclass" points="2263.5,494.9 2117.8,494.9 2117.8,1077 2149.8,1077 2148.8,1098.6 2266.7,1097.1 
	2263.5,739.9 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton254"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-05" class="cls-2 myclass" points="2409.9,494.9 2263.5,491.9 2263.5,1075.9 2293.5,1075.9 2294.6,1094.9 2409.9,1094.9 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton255"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-06" class="cls-2 myclass" points="2554.5,491.9 2408,491.9 2408,1075.9 2440.7,1075.9 2439.9,1096.7 2557,1096.7 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton256"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-07" class="cls-2 myclass" points="2552.7,494.9 2700.2,494.9 2702.4,1075.9 2701.3,1098.6 2583.8,1096.7 2583.8,1078.4 
	2554.5,1077.6 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton257"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-08" class="cls-2 myclass" points="2845.4,494.9 2845.4,1094.9 2731.3,1094.9 2731.3,1075.9 2700.2,1075.9 2700.2,494.9 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton258"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-09" class="cls-2 myclass" points="2991.9,491.9 2990.8,1097.1 2875.3,1097.1 2875.3,1078.2 2843.9,1078.7 2843.9,491.9 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton259"  runat="server" CommandArgument="30_0" CommandName=""  OnClick="btn1click">
<polygon id="B4-10" class="cls-2 myclass" points="3136.9,494.9 2989.4,494.9 2990.8,1078.2 3019.4,1078.2 3019.2,1097.1 3136.9,1097.1 "/></asp:LinkButton>


</svg>

                                           </div>
                                   </asp:Panel>
                                    
                                    
                                     <asp:Panel ID="pnlsB5g" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B-5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/B/B5.jpg"  transform="matrix(0.561 0 0 0.561 -24.3311 -155.68)">
</image>


 <asp:LinkButton ID="LinkButton260"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-26" x="191.92" y="327.78" class="cls-2 myclass" width="118.58" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton261"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-25" x="310.5" y="327.78" class="cls-2 myclass" width="118.28" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton262"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-24" x="428.78" y="327.78" class="cls-2 myclass" width="118.75" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton263"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-23" x="548.4" y="327.78" class="cls-2 myclass" width="119.13" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton264"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-22" x="667.54" y="327.78" class="cls-2 myclass" width="118" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton265"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-21" x="785.39" y="327.78" class="cls-2 myclass" width="117.66" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton266"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-20" x="904.08" y="327.78" class="cls-2 myclass" width="119.96" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton267"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-19" x="1024.03" y="327.78" class="cls-2 myclass" width="119.46" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton268"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-18" x="1143.49" y="327.78" class="cls-2 myclass" width="117.86" height="313.33"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton269"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-17" x="1262.24" y="327.78" class="cls-2 myclass" width="118.19" height="313.33"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton270"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-16" x="1380.43" y="327.78" class="cls-2 myclass" width="115.77" height="313.33"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton271"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-15" x="1496.2" y="329.58" class="cls-2 myclass" width="120.57" height="309.53"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton272"  runat="server" CommandArgument="31_0" CommandName=""  OnClick="btn1click">
<rect id="B5-14" x="1616.82" y="329.58" class="cls-2 myclass" width="120.52" height="309.53"/></asp:LinkButton>


</svg>
                                           </div>
                                   </asp:Panel>
                                    
                                    
                                     <asp:Panel ID="pnlsB7g" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/B/EAF73083.jpg"  transform="matrix(0.5548 0 0 0.5548 -13.3333 -147.9073)">
</image>


 <asp:LinkButton ID="LinkButton273"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-26" x="197.78" y="327.78" class="cls-2 myclass" width="117.82" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton274"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-25" x="315.6" y="327.78" class="cls-2 myclass" width="117.53" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton275"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-24" x="433.13" y="327.78" class="cls-2 myclass" width="117.99" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton276"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-23" x="551.99" y="327.78" class="cls-2 myclass" width="118.37" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton277"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-22" x="670.37" y="327.78" class="cls-2 myclass" width="117.25" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton278"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-21" x="787.46" y="327.78" class="cls-2 myclass" width="116.91" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton279"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-20" x="905.4" y="327.78" class="cls-2 myclass" width="119.19" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton280"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-19" x="1024.58" y="327.78" class="cls-2 myclass" width="118.7" height="310.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton281"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-18" x="1143.28" y="327.78" class="cls-2 myclass" width="117.11" height="313.33"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton282"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-17" x="1261.27" y="327.78" class="cls-2 myclass" width="117.44" height="313.33"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton283"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-16" x="1378.71" y="327.78" class="cls-2 myclass" width="115.03" height="313.33"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton284"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-15" x="1493.74" y="329.58" class="cls-2 myclass" width="119.8" height="309.53"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton285"  runat="server" CommandArgument="32_0" CommandName=""  OnClick="btn1click">
<rect id="B7-14" x="1613.59" y="329.58" class="cls-2 myclass" width="119.75" height="309.53"/></asp:LinkButton>

</svg>
                                           </div>
                                   </asp:Panel>
                                    
                                     <asp:Panel ID="pnlsB8g" Visible="false" runat="server">
                                          <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                              <svg version="1.1" id="B-8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/B/74798B98.jpg"  transform="matrix(0.5651 0 0 0.5651 -31.3868 -160.6667)">
</image>


 <asp:LinkButton ID="LinkButton286"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-20" x="1717.6" y="324.16" class="cls-2 myclass" width="84.83" height="300.96"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton287"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-19" x="1634.08" y="332.42" class="cls-2 myclass" width="83.23" height="292.7"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton288"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-18" x="1553.44" y="338.56" class="cls-2 myclass" width="80.99" height="286.56"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton289"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-17" x="1469.92" y="346.42" class="cls-2 myclass" width="83.52" height="278.7"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton290"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-16" x="1386.6" y="354.4" class="cls-2 myclass" width="84.83" height="270.72"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton291"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-15" x="1303.08" y="361.83" class="cls-2 myclass" width="83.23" height="263.29"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton292"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-14" x="1222.44" y="367.35" class="cls-2 myclass" width="80.99" height="257.77"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton293"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-13" x="1138.92" y="374.43" class="cls-2 myclass" width="83.52" height="250.69"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton294"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-12" x="1054.92" y="382.72" class="cls-2 myclass" width="83.52" height="242.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton295"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-11" x="974.6" y="391.36" class="cls-2 myclass" width="80.32" height="233.76"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton296"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-10" x="891.08" y="399.29" class="cls-2 myclass" width="83.23" height="225.83"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton297"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-09" x="808.48" y="404.03" class="cls-2 myclass" width="82.95" height="221.09"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton298"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-08" x="726.92" y="412.48" class="cls-2 myclass" width="83.52" height="212.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton299"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-07" x="643.6" y="419.68" class="cls-2 myclass" width="84.83" height="205.44"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton300"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-06" x="560.08" y="426.24" class="cls-2 myclass" width="83.23" height="198.88"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton301"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-05" x="479.44" y="435.04" class="cls-2 myclass" width="80.99" height="190.08"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton302"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-04" x="395.92" y="442.72" class="cls-2 myclass" width="83.52" height="182.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton303"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-03" x="311.92" y="449.44" class="cls-2 myclass" width="83.52" height="175.68"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton304"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-02" x="230.92" y="456.64" class="cls-2 myclass" width="83.52" height="168.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton305"  runat="server" CommandArgument="33_0" CommandName=""  OnClick="btn1click">
<rect id="B8-01" x="146.92" y="462.85" class="cls-2 myclass" width="83.52" height="162.27"/></asp:LinkButton>
</svg>

                                           </div>
                                   </asp:Panel>
                                   
                                        <asp:Panel ID="pnlsC4g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 2795.04 2445.12" style="enable-background:new 0 0 2795.04 2445.12;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/C/C-4.jpg"  transform="matrix(1 0 0 1 -335.44 -59.8)">
</image>


 <asp:LinkButton ID="LinkButton306"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-01" class="cls-2 myclass" points="262.36,2030.96 262.36,2059.04 428.68,2059.04 428.68,2025.92 491.32,2025.92 
	489.16,1146.8 262.36,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton307"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-02" class="cls-2 myclass" points="715.24,2028.8 653.32,2032.4 653.32,2055.44 505,2055.44 505,2028.8 491.32,2028.8 
	489.16,1146.8 715.24,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton308"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-03" class="cls-2 myclass" points="717.36,2030.96 717.36,2059.04 883.68,2059.04 883.68,2025.92 946.32,2025.92 
	944.16,1146.8 717.36,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton309"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-04" class="cls-2 myclass" points="1170.24,2032.76 1105.09,2032.59 1106.2,2057.24 953.2,2059.04 953.2,2030.24 
	946.32,2028.8 944.16,1146.8 1170.24,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton310"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-05" class="cls-2 myclass" points="1393.24,2032.76 1328.09,2032.59 1329.2,2057.24 1176.2,2059.04 1176.2,2030.24 
	1169.32,2028.8 1167.16,1146.8 1393.24,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton311"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-06" class="cls-2 myclass" points="1616.24,2032.76 1551.09,2032.59 1552.2,2057.24 1399.2,2059.04 1399.2,2030.24 
	1392.32,2028.8 1390.16,1146.8 1616.24,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton312"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-07" class="cls-2 myclass" points="1841.24,2032.76 1776.09,2032.59 1777.2,2057.24 1624.2,2059.04 1624.2,2030.24 
	1617.32,2028.8 1615.16,1146.8 1841.24,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton313"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-08" class="cls-2 myclass" points="2064.24,2032.76 1999.09,2032.59 2000.2,2057.24 1847.2,2059.04 1847.2,2030.24 
	1840.32,2028.8 1838.16,1146.8 2064.24,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton314"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-09" class="cls-2 myclass" points="2287.24,2032.76 2222.09,2032.59 2223.2,2057.24 2070.2,2059.04 2070.2,2030.24 
	2063.32,2028.8 2061.16,1146.8 2287.24,1146.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton315"  runat="server" CommandArgument="71_0" CommandName=""  OnClick="btn1click">
<polygon id="C4-10" class="cls-2 myclass" points="2520.24,2032.76 2453.09,2032.59 2454.24,2057.24 2296.56,2059.04 2296.56,2030.24 
	2289.47,2028.8 2287.24,1146.8 2520.24,1146.8 "/></asp:LinkButton>
</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlrC5g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 723.76 496.04" style="enable-background:new 0 0 723.76 496.04;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/C/C5.jpg"  transform="matrix(0.24 0 0 0.24 -60.604 -62.8515)">
</image>


 <asp:LinkButton ID="LinkButton316"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-21" x="645.2" y="96.11" class="cls-2 myclass" width="31.68" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton317"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-22" x="614.2" y="96.11" class="cls-2 myclass" width="31" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton318"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-23" x="582.2" y="96.11" class="cls-2 myclass" width="32" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton319"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-24" x="551.2" y="96.11" class="cls-2 myclass" width="31" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton320"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-25" x="520.19" y="96.11" class="cls-2 myclass" width="31" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton321"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-26" x="489.85" y="96.11" class="cls-2 myclass" width="30.34" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton322"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-27" x="458.54" y="96.11" class="cls-2 myclass" width="31.32" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton323"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-28" x="428.2" y="96.11" class="cls-2 myclass" width="30.34" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton324"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-29" x="396.6" y="96.11" class="cls-2 myclass" width="31.59" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton325"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-30" x="365.69" y="96.11" class="cls-2 myclass" width="30.92" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton326"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-31" x="333.77" y="96.11" class="cls-2 myclass" width="31.91" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton327"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-32" x="303.68" y="96.11" class="cls-2 myclass" width="31.32" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton328"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-33" x="273.45" y="96.11" class="cls-2 myclass" width="29.41" height="118.8"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton329"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-35" x="210.45" y="87.71" class="cls-2 myclass" width="32" height="127.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton330"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-34" x="242.45" y="87.71" class="cls-2 myclass" width="31" height="127.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton331"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-36" x="180.45" y="86.97" class="cls-2 myclass" width="30" height="127.93"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton332"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-37" x="149.42" y="86.82" class="cls-2 myclass" width="31.04" height="128.09"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton333"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-38" x="118.28" y="86.82" class="cls-2 myclass" width="30.18" height="128.13"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton334"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-39" x="87.2" y="86.74" class="cls-2 myclass" width="30.26" height="128.17"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton335"  runat="server" CommandArgument="79_0" CommandName=""  OnClick="btn1click">
<rect id="C5-40" x="56" y="87.71" class="cls-2 myclass" width="31.46" height="127.2"/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlsC6g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/C/93CCC6C3.jpg"  transform="matrix(0.5586 0 0 0.5586 -19.9246 -153.0222)">
</image>


 <asp:LinkButton ID="LinkButton336"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-01" x="226.39" y="333.28" class="cls-2 myclass" width="115.3" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton337"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-02" x="341.69" y="333.28" class="cls-2 myclass" width="115.02" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton338"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-03" x="456.71" y="333.28" class="cls-2 myclass" width="115.47" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton339"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-04" x="573.03" y="333.28" class="cls-2 myclass" width="115.84" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton340"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-05" x="688.88" y="333.28" class="cls-2 myclass" width="114.74" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton341"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-06" x="803.46" y="333.28" class="cls-2 myclass" width="114.41" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton342"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-07" x="918.88" y="333.28" class="cls-2 myclass" width="116.64" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton343"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-08" x="1035.52" y="333.28" class="cls-2 myclass" width="116.16" height="303.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton344"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-09" x="1151.68" y="333.28" class="cls-2 myclass" width="114.61" height="306.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton345"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-10" x="1267.15" y="333.28" class="cls-2 myclass" width="114.93" height="306.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton346"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-11" x="1382.08" y="333.28" class="cls-2 myclass" width="116.64" height="306.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton347"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-12" x="1498.72" y="333.28" class="cls-2 myclass" width="113.17" height="306.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton348"  runat="server" CommandArgument="72_0" CommandName=""  OnClick="btn1click">
<rect id="C6-13" x="1611.93" y="333.28" class="cls-2 myclass" width="117.19" height="306.24"/></asp:LinkButton>

 
</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlrC7g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 792 612" style="enable-background:new 0 0 792 612;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/C/C-7 ground floor.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>

 <asp:LinkButton ID="LinkButton349"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<polygon id="C7-40" class="cls-2 myclass" points="68.82,284.77 104.24,284.77 104.2,144.82 67.76,144.67 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton350"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<polygon id="C7-39" class="cls-2 myclass" points="136.71,284.77 136.71,145.09 104.24,144.82 104.28,284.77 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton351"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<polygon id="C7-38" class="cls-2 myclass" points="138.14,285.27 173.36,285.27 173.36,144.82 136.71,145.09 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton352"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<polygon id="C7-37" class="cls-2 myclass" points="173.36,144.82 205.65,144.75 205.65,284.77 173.36,284.77 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton353"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-36" x="205.65" y="144.75" class="cls-2 myclass" width="34.71" height="140.01"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton354"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-35" x="240.36" y="145.98" class="cls-2 myclass" width="34.47" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton355"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-34" x="274.83" y="145.98" class="cls-2 myclass" width="34.47" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton356"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-33" x="309.3" y="145.98" class="cls-2 myclass" width="34.95" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton357"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-32" x="344.45" y="145.98" class="cls-2 myclass" width="33.83" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton358"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-31" x="378.28" y="145.98" class="cls-2 myclass" width="34.47" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton359"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-30" x="412.74" y="145.98" class="cls-2 myclass" width="34.95" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton360"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<polygon id="C7-29" class="cls-2 myclass" points="483.53,285.27 482.21,145.09 446.97,144.82 447.01,284.77 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton361"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<polygon id="C7-28" class="cls-2 myclass" points="483.53,285.27 516.31,285.27 516.31,144.82 482.21,145.09 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton362"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<polygon id="C7-27" class="cls-2 myclass" points="516.31,144.82 551.14,144.75 551.14,284.77 516.31,284.77 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton363"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-26" x="551.14" y="144.75" class="cls-2 myclass" width="34.71" height="140.01"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton364"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-25" x="585.85" y="145.98" class="cls-2 myclass" width="34.47" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton365"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-24" x="620.32" y="145.98" class="cls-2 myclass" width="34.47" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton366"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-23" x="654.79" y="145.98" class="cls-2 myclass" width="34.95" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton367"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-22" x="689.94" y="145.98" class="cls-2 myclass" width="33.83" height="138.78"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton368"  runat="server" CommandArgument="73_0" CommandName=""  OnClick="btn1click">
<rect id="C7-21" x="723.77" y="145.98" class="cls-2 myclass" width="34.47" height="138.78"/></asp:LinkButton>



</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlrC7f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/C/C-7 first floor.jpg"  transform="matrix(0.5037 0 0 0.5037 128.8889 -102.2222)">
</image>
<rect id="outline" x="314.68" y="260.08" class="cls-2 myclass" width="1372.48" height="279.92"/>

 <asp:LinkButton ID="LinkButton369"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-140" x="314.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton370"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-139" x="383.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton371"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-138" x="452.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton372"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-137" x="522.68" y="260.08" class="cls-2 myclass" width="68.31" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton373"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-136" x="590.52" y="260.08" class="cls-2 myclass" width="68.31" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton374"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-135" x="658.37" y="260.08" class="cls-2 myclass" width="68.31" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton375"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-134" x="726.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton376"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-133" x="795.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton377"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-132" x="864.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton378"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-131" x="933.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton379"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-130" x="1003.68" y="260.08" class="cls-2 myclass" width="68.31" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton380"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-129" x="1071.99" y="260.08" class="cls-2 myclass" width="67.84" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton381"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-128" x="1139.37" y="260.08" class="cls-2 myclass" width="68.31" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton382"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-127" x="1207.68" y="260.08" class="cls-2 myclass" width="69.48" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton383"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-126" x="1277.16" y="260.08" class="cls-2 myclass" width="64.6" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton384"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-125" x="1341.76" y="260.08" class="cls-2 myclass" width="67.8" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton385"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-124" x="1409.56" y="260.08" class="cls-2 myclass" width="71.66" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton386"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-123" x="1480.76" y="260.08" class="cls-2 myclass" width="67.62" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton387"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-122" x="1548.38" y="260.08" class="cls-2 myclass" width="68.78" height="279.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton388"  runat="server" CommandArgument="73_1" CommandName=""  OnClick="btn1click">
<rect id="C7-121" x="1618.38" y="260.08" class="cls-2 myclass" width="68.78" height="279.92"/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlrC7s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3080.16 1814.4" style="enable-background:new 0 0 3080.16 1814.4;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/C/C7-Second-floor.jpg"  transform="matrix(1 0 0 1 -195.88 -439.96)">
</image>

 <asp:LinkButton ID="LinkButton389"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-241" x="2847.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton390"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-242" x="2702.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton391"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-243" x="2558.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton392"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-244" x="2413.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton393"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-245" x="2268.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton394"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-246" x="2121.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton395"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-247" x="1975.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton396"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-248" x="1831.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton397"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-249" x="1686.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton398"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-250" x="1541.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton399"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-251" x="1394.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton400"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-252" x="1252.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton401"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-253" x="1108.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton402"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-254" x="963.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton403"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-255" x="818.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton404"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-256" x="671.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton405"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-257" x="526.68" y="529.2" class="cls-2 myclass" width="145.28" height="269"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton406"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-258" x="381.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton407"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-259" x="236.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton408"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-260" x="91.96" y="529.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton409"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-261" x="2847.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton410"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-262" x="2702.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton411"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-263" x="2558.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton412"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-264" x="2413.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton413"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-265" x="2268.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton414"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-266" x="2178.96" y="205.2" class="cls-2 myclass" width="87.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton415"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-267" x="1974.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton416"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-268" x="1830.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton417"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-269" x="1685.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton418"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-270" x="1540.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton419"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-271" x="1393.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton420"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-272" x="1253.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton421"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-273" x="1103.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton422"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-274" x="958.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton423"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-275" x="813.96" y="205.2" class="cls-2 myclass" width="87.84" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton424"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-276" x="666.96" y="205.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton425"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-277" x="526.68" y="205.2" class="cls-2 myclass" width="140.28" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton426"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-278" x="381.96" y="206.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton427"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-279" x="236.96" y="206.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton428"  runat="server" CommandArgument="73_2" CommandName=""  OnClick="btn1click">
<rect id="C7-280" x="91.96" y="206.2" class="cls-2 myclass" width="144.72" height="270"/></asp:LinkButton>

<rect id="outline" x="91.96" y="170.99" class="cls-2 myclass" width="2900.72" height="628.21"/>
</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlsC8g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/C/EE1D78CE.jpg"  transform="matrix(0.5885 0 0 0.5885 -72.48 -190.166)">
</image>


 <asp:LinkButton ID="LinkButton429"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-01" x="140.78" y="315" class="cls-2 myclass" width="126.18" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton430"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-02" x="266.96" y="315" class="cls-2 myclass" width="125.87" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton431"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-03" x="392.83" y="315" class="cls-2 myclass" width="126.36" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton432"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-04" x="520.12" y="315" class="cls-2 myclass" width="126.77" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton433"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-05" x="646.9" y="315" class="cls-2 myclass" width="125.57" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton434"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-06" x="772.29" y="315" class="cls-2 myclass" width="125.2" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton435"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-07" x="898.6" y="315" class="cls-2 myclass" width="127.65" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton436"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-08" x="1026.24" y="315" class="cls-2 myclass" width="127.12" height="328.52"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton437"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-09" x="1153.36" y="315" class="cls-2 myclass" width="125.42" height="329"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton438"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-10" x="1279.72" y="315" class="cls-2 myclass" width="125.77" height="329"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton439"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-11" x="1405.49" y="315" class="cls-2 myclass" width="123.19" height="329"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton440"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-12" x="1528.68" y="316.9" class="cls-2 myclass" width="128.3" height="327.09"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton441"  runat="server" CommandArgument="74_0" CommandName=""  OnClick="btn1click">
<rect id="C8-13" x="1657.03" y="316.9" class="cls-2 myclass" width="128.25" height="327.09"/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlsC9g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-9" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 758.49 424.53" style="enable-background:new 0 0 758.49 424.53;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/C/C-9.jpg"  transform="matrix(0.24 0 0 0.24 -46.4717 -69.2264)">
</image>


 <asp:LinkButton ID="LinkButton442"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-21" class="cls-2 myclass" points="42.05,104.13 75.17,104.13 75.17,278.37 72.29,278.37 72.29,285.57 53.09,285.57 
	52.85,278.61 42.05,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton443"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-22" class="cls-2 myclass" points="75.05,104.13 108.17,104.13 108.17,278.37 105.29,278.37 105.29,285.57 86.09,285.57 
	85.85,278.61 75.05,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton444"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-23" class="cls-2 myclass" points="108.17,104.13 140.17,104.13 140.17,278.37 137.39,278.37 137.39,285.57 118.83,285.57 
	118.6,278.61 108.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton445"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-24" class="cls-2 myclass" points="140.17,104.13 172.17,104.13 172.17,278.37 169.39,278.37 169.39,285.57 150.83,285.57 
	150.6,278.61 140.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton446"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-25" class="cls-2 myclass" points="172.17,104.13 205.17,104.13 205.17,278.37 202.3,278.37 202.3,285.57 183.17,285.57 
	182.93,278.61 172.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton447"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-26" class="cls-2 myclass" points="205.17,104.13 237.17,104.13 237.17,278.37 234.39,278.37 234.39,285.57 215.83,285.57 
	215.6,278.61 205.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton448"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-27" class="cls-2 myclass" points="237.17,104.13 270.17,104.13 270.17,278.37 267.3,278.37 267.3,285.57 248.17,285.57 
	247.93,278.61 237.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton449"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-28" class="cls-2 myclass" points="270.17,104.13 302.17,104.13 302.17,278.37 299.39,278.37 299.39,285.57 280.83,285.57 
	280.6,278.61 270.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton450"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-29" class="cls-2 myclass" points="302.17,104.13 335.17,104.13 335.17,278.37 332.3,278.37 332.3,285.57 313.17,285.57 
	312.93,278.61 302.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton451"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-30" class="cls-2 myclass" points="335.17,104.13 367.17,104.13 367.17,278.37 364.39,278.37 364.39,285.57 345.83,285.57 
	345.6,278.61 335.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton452"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-31" class="cls-2 myclass" points="367.17,104.13 399.17,104.13 399.17,278.37 396.39,278.37 396.39,285.57 377.83,285.57 
	377.6,278.61 367.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton453"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-32" class="cls-2 myclass" points="399.17,104.13 432.17,104.13 432.17,278.37 429.3,278.37 429.3,285.57 410.17,285.57 
	409.93,278.61 399.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton454"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-33" class="cls-2 myclass" points="432.17,104.13 465.17,104.13 465.17,278.37 462.3,278.37 462.3,285.57 443.17,285.57 
	442.93,278.61 432.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton455"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-34" class="cls-2 myclass" points="465.17,104.13 497.17,104.13 497.17,278.37 494.39,278.37 494.39,285.57 475.83,285.57 
	475.6,278.61 465.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton456"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-35" class="cls-2 myclass" points="497.17,104.13 529.49,104.13 529.49,278.37 526.68,278.37 526.68,285.57 507.94,285.57 
	507.71,278.61 497.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton457"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-36" class="cls-2 myclass" points="529.49,104.13 562.17,104.13 562.17,278.37 559.33,278.37 559.33,285.57 540.38,285.57 
	540.14,278.61 529.49,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton458"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-37" class="cls-2 myclass" points="562.17,104.13 594.17,104.13 594.17,278.37 591.39,278.37 591.39,285.57 572.83,285.57 
	572.6,278.61 562.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton459"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-38" class="cls-2 myclass" points="594.17,104.13 626.91,104.13 626.91,278.37 624.07,278.37 624.07,285.57 605.08,285.57 
	604.85,278.61 594.17,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton460"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-39" class="cls-2 myclass" points="626.91,104.13 659.09,104.13 659.09,278.37 656.29,278.37 656.29,285.57 637.64,285.57 
	637.41,278.61 626.91,278.61 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton461"  runat="server" CommandArgument="75_0" CommandName=""  OnClick="btn1click">
<polygon id="C9-40" class="cls-2 myclass" points="659.09,104.13 692.45,104.13 692.45,278.37 689.55,278.37 689.55,285.57 670.21,285.57 
	669.97,278.61 659.09,278.61 "/></asp:LinkButton>

 
</svg>

                                           </div>

                                        </asp:Panel>

                                        <asp:Panel ID="pnlrC10g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="2899" height="1175" xlink:href="images/bhumi/C/C-10 SALE DRAWING.jpg"  transform="matrix(0.6394 0 0 0.6394 33.0933 164.3621)">
</image>


 <asp:LinkButton ID="LinkButton462"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-01" x="177.78" y="325.56" class="cls-2 myclass" width="80" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton463"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-02" x="257.78" y="325.56" class="cls-2 myclass" width="78" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton464"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-03" x="335.78" y="325.56" class="cls-2 myclass" width="77" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton465"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-04" x="412.78" y="325.56" class="cls-2 myclass" width="80" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton466"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-05" x="491.78" y="325.56" class="cls-2 myclass" width="80" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton467"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-06" x="571.78" y="325.56" class="cls-2 myclass" width="78" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton468"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-07" x="649.78" y="325.56" class="cls-2 myclass" width="77" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton469"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-08" x="726.78" y="325.56" class="cls-2 myclass" width="80" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton470"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-09" x="807.78" y="325.56" class="cls-2 myclass" width="80" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton471"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-10" x="887.78" y="325.56" class="cls-2 myclass" width="78" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton472"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-11" x="965.78" y="325.56" class="cls-2 myclass" width="77" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton473"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-12" x="1042.78" y="325.56" class="cls-2 myclass" width="80" height="420"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton474"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-13" x="1121.78" y="325.56" class="cls-2 myclass" width="80" height="379.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton475"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-14" x="1201.78" y="325.56" class="cls-2 myclass" width="78" height="379.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton476"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-15" x="1279.78" y="325.56" class="cls-2 myclass" width="82.14" height="379.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton477"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-16" x="1361.92" y="325.56" class="cls-2 myclass" width="77.86" height="379.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton478"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-17" x="1439.78" y="325.56" class="cls-2 myclass" width="82.14" height="379.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton479"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-18" x="1521.92" y="325.56" class="cls-2 myclass" width="77.86" height="379.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton480"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-19" x="1599.78" y="325.56" class="cls-2 myclass" width="82.14" height="379.48"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton481"  runat="server" CommandArgument="76_0" CommandName=""  OnClick="btn1click">
<rect id="C10-20" x="1681.92" y="325.56" class="cls-2 myclass" width="77.86" height="379.48"/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlsC11g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-11" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 842.16 595.2" style="enable-background:new 0 0 842.16 595.2;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/C/C-11 Model.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>


 <asp:LinkButton ID="LinkButton482"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-21" class="cls-2 myclass" points="106.76,128.72 155.76,128.72 155.28,385.04 150.29,385.04 150.29,392 116.51,392 
	116.27,384.8 106.76,384.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton483"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-22" class="cls-2 myclass" points="155.76,128.72 203.24,128.72 202.78,385.04 197.94,385.04 197.94,392 164.12,392 
	164,384.8 155.76,384.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton484"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-23" class="cls-2 myclass" points="202.76,128.72 250.52,128.72 250.06,385.04 245.19,385.04 245.19,391.16 211.64,391.28 
	211.4,384.8 202.76,384.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton485"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-24" class="cls-2 myclass" points="250.52,128.72 297.8,128.72 297.34,385.04 292.52,385.04 292.52,391.04 258.26,391.28 
	258.45,385.19 250.06,385.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton486"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-25" class="cls-2 myclass" points="296.76,128.72 344.52,128.72 344.06,385.04 340.25,385.04 340.16,391.16 305.64,391.28 
	305.4,384.8 296.76,384.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton487"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-26" class="cls-2 myclass" points="344.76,128.72 392.72,128.72 392.25,385.04 388.59,385.04 388.49,391.28 353.67,391.28 
	353.71,385.14 344.29,385.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton488"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-27" class="cls-2 myclass" points="391.76,128.72 439.52,128.72 439.06,385.04 435.25,385.04 435.16,391.16 400.64,391.28 
	400.4,384.8 391.76,384.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton489"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-28" class="cls-2 myclass" points="439.53,128.72 487.72,128.72 487.25,385.04 483.57,385.04 483.47,391.28 448.48,391.28 
	448.52,385.14 439.06,385.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton490"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-29" class="cls-2 myclass" points="487.76,128.72 535.52,128.72 535.06,385.04 531.25,385.04 531.16,391.16 496.64,391.28 
	496.4,384.8 487.76,384.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton491"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-30" class="cls-2 myclass" points="535.5,128.72 580.52,128.72 580.08,385.04 576.64,385.04 576.55,391.28 543.86,391.28 
	543.9,385.14 535.06,385.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton492"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-31" class="cls-2 myclass" points="579.76,128.72 630.07,128.72 629.59,385.04 625.58,385.04 625.48,391.16 589.11,391.28 
	588.86,384.8 579.76,384.8 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton493"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-32" class="cls-2 myclass" points="630.05,128.72 677.48,128.72 677.02,385.04 673.39,385.04 673.3,391.28 638.86,391.28 
	638.9,385.14 629.59,385.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton494"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polyline id="C11-33_2_" class="cls-2 myclass" points="724.52,128.72 677.48,128.72 677.19,288.8 685.22,288.8 685.22,295.64 719.42,295.64 
	719.42,287.9 724.52,287.72 724.52,128.72 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton495"  runat="server" CommandArgument="77_0" CommandName=""  OnClick="btn1click">
<polygon id="C11-34" class="cls-2 myclass" points="772.28,129.92 772.28,240.8 726.92,288.8 724.52,288.8 724.52,128.72 "/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlsC12g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="C-12" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 792 612" style="enable-background:new 0 0 792 612;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/C/C-12.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>


 <asp:LinkButton ID="LinkButton496"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<path id="C12-04" class="cls-2 myclass" d="M45.76,128.68c0,0,5.28,0.48,5.4,0c0.12-0.48,0-6.72,0-6.72h28.32l0.48,6.93h15.12l0.24,260.91
	h-4.68v6.48H62.08v-4.92h-16.2L45.76,128.68z"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton497"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-05" class="cls-2 myclass" points="130.24,435.28 130.24,441.88 101.92,441.88 101.92,435.28 93.64,435.28 95.56,128.89 
	104.08,128.89 103.84,121.96 132.76,122.44 133,128.92 135.28,128.92 135.09,435.28 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton498"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-06" class="cls-2 myclass" points="135.28,128.92 139.36,128.92 139.43,121.96 167.56,121.96 167.96,128.44 177.43,128.14 
	177.64,474.28 173.59,474.28 173.59,479.76 144.52,480.04 144.27,474.41 135.09,474.52 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton499"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-07_x2F_08" class="cls-2 myclass" points="231.99,474.31 231.88,480.76 203.92,480.76 203.81,474.28 177.64,474.28 
	177.43,128.14 204.07,128.08 203.92,122.12 232.76,122.5 232.84,128.58 236.32,128.74 236.32,474.22 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton500"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-09" class="cls-2 myclass" points="272.16,474.24 272.16,480.66 243.9,480.66 243.9,474.24 235.64,474.24 236.32,128.74 
	239.08,128.62 239.01,122.37 267.16,122.2 267.22,128.73 276.52,128.73 276.04,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton501"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-10" class="cls-2 myclass" points="276.52,128.73 285.16,128.67 285.16,122.44 312.88,122.44 312.88,128.35 316.6,128.23 
	316.12,474.28 311.43,474.28 311.43,479.76 283.6,480.03 283.6,474.4 276.04,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton502"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-11" class="cls-2 myclass" points="351.89,474.24 351.89,480.66 323.84,480.66 323.84,474.24 315.64,474.24 316.31,128.74 
	319.05,128.62 318.98,122.37 346.93,122.2 346.99,128.73 356.22,128.73 355.74,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton503"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-12" class="cls-2 myclass" points="356.22,128.73 364.79,128.67 364.79,122.44 392.31,122.44 392.31,128.35 396,128.23 
	395.53,474.28 390.87,474.28 390.87,479.76 363.25,480.03 363.24,474.4 355.74,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton504"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-13" class="cls-2 myclass" points="430.5,474.24 430.5,480.66 402.85,480.66 402.85,474.24 394.76,474.24 395.43,128.74 
	398.13,128.62 398.06,122.37 425.61,122.2 425.67,128.73 434.77,128.73 434.3,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton505"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-14" class="cls-2 myclass" points="435.03,128.73 443.86,128.67 443.86,122.44 472.2,122.44 472.2,128.35 476,128.23 
	475.51,474.28 470.71,474.28 470.71,479.76 442.27,480.03 442.27,474.4 434.54,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton506"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-15" class="cls-2 myclass" points="511.34,474.24 511.34,480.66 482.94,480.66 482.94,474.24 474.64,474.24 475.32,128.74 
	478.1,128.62 478.03,122.37 506.32,122.2 506.38,128.73 515.72,128.73 515.24,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton507"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-16" class="cls-2 myclass" points="515.72,128.73 524.41,128.67 524.41,122.44 552.27,122.44 552.27,128.35 556,128.23 
	555.52,474.28 550.8,474.28 550.8,479.76 522.84,480.03 522.84,474.4 515.24,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton508"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-17" class="cls-2 myclass" points="590.89,474.24 590.89,480.66 562.84,480.66 562.84,474.24 554.64,474.24 555.31,128.74 
	558.05,128.62 557.98,122.37 585.93,122.2 585.99,128.73 595.22,128.73 594.74,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton509"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-18" class="cls-2 myclass" points="595.22,128.73 603.79,128.67 603.79,122.44 632.31,122.44 632.31,128.35 635,128.23 
	634.53,474.28 629.87,474.28 629.87,479.76 602.25,480.03 602.24,474.4 594.74,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton510"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-19" class="cls-2 myclass" points="670.89,474.24 670.89,480.66 642.84,480.66 642.84,474.24 634.64,474.24 635.31,128.74 
	638.05,128.62 637.98,122.37 665.93,122.2 665.99,128.73 675.22,128.73 674.74,474.4 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton511"  runat="server" CommandArgument="78_0" CommandName=""  OnClick="btn1click">
<polygon id="C12-20" class="cls-2 myclass" points="675.22,128.73 683.79,128.67 683.79,122.44 712.31,122.44 712.31,128.35 715,128.23 
	714.53,474.28 709.87,474.28 709.87,479.76 682.25,480.03 682.24,474.4 674.74,474.4 "/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>





                                        <asp:Panel ID="pnlrD6g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 723.76 496.04" style="enable-background:new 0 0 723.76 496.04;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>

<g id="D6">
    <image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/D/8AB129A0.jpg"  transform="matrix(0.24 0 0 0.24 -60.604 -62.8515)">
	</image>
	<rect id="outline_1_" x="55.84" y="222.11" class="cls-2 myclass" width="621.7" height="164.4"/>

 <asp:LinkButton ID="LinkButton512"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-20" x="645.8" y="223.31" class="cls-2 myclass" width="31.73" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton513"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-19" x="614.75" y="223.31" class="cls-2 myclass" width="31.05" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton514"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-18" x="582.7" y="223.31" class="cls-2 myclass" width="32.05" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton515"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-17" x="551.65" y="223.31" class="cls-2 myclass" width="31.05" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton516"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-16" x="520.6" y="223.31" class="cls-2 myclass" width="31.06" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton517"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-15" x="490.21" y="223.31" class="cls-2 myclass" width="30.39" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton518"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-14" x="458.84" y="223.31" class="cls-2 myclass" width="31.37" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton519"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-13" x="428.45" y="223.31" class="cls-2 myclass" width="30.39" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton520"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-12" x="396.8" y="223.31" class="cls-2 myclass" width="31.65" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton521"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-11" x="365.84" y="223.31" class="cls-2 myclass" width="30.97" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton522"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-10" x="333.87" y="223.31" class="cls-2 myclass" width="31.96" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton523"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-09" x="302.91" y="223.31" class="cls-2 myclass" width="30.97" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton524"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-08" x="273.45" y="223.31" class="cls-2 myclass" width="29.46" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton525"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-07" x="242.8" y="223.31" class="cls-2 myclass" width="30.65" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton526"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-06" x="211.75" y="223.31" class="cls-2 myclass" width="31.05" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton527"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-05" x="179.7" y="223.31" class="cls-2 myclass" width="32.05" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton528"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-04" x="148.65" y="223.31" class="cls-2 myclass" width="31.05" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton529"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-03" x="117.6" y="223.31" class="cls-2 myclass" width="31.06" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton530"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-02" x="87.21" y="223.31" class="cls-2 myclass" width="30.39" height="163.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton531"  runat="server" CommandArgument="80_0" CommandName=""  OnClick="btn1click">
	<rect id="D6-01" x="55.84" y="223.31" class="cls-2 myclass" width="31.37" height="163.2"/></asp:LinkButton>


</g>
</svg>

                                           </div>
                                        </asp:Panel>
                                      
                                        <asp:Panel ID="pnlsD9g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlsD10g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="D-10" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 735 328.8" style="enable-background:new 0 0 735 328.8;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="735" height="329" xlink:href="images/bhumi/D/D-10.jpg"  transform="matrix(1 0 0 1 1 -0.1)">
</image>


 <asp:LinkButton ID="LinkButton532"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-01" class="cls-2 myclass" points="91.63,218.73 88.39,218.63 88.39,227 69.17,227 69.17,218.04 58.28,218.04 58.28,45.36 
	91.63,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton533"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polyline id="D10-02" class="cls-2 myclass" points="123.57,218.43 123.26,45.36 91.63,45.36 91.63,218.73 101.19,218.7 101.19,227 
	120.41,227 120.41,218.43 123.57,218.43 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton534"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-03" class="cls-2 myclass" points="156.56,218.73 153.32,218.63 153.32,227 134.11,227 134.14,218.73 123.57,218.43 
	123.22,45.36 156.56,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton535"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-04" class="cls-2 myclass" points="188.59,218.73 185.34,218.63 185.34,227 166.13,227 166.13,218.7 156.56,218.73 
	156.56,45.36 188.2,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton536"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-05" class="cls-2 myclass" points="221.5,218.73 218.26,218.63 218.26,227 199.04,227 199.04,218.04 188.15,218.04 
	188.15,45.36 221.5,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton537"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polyline id="D10-06" class="cls-2 myclass" points="253.44,218.43 253.13,45.36 221.5,45.36 221.5,218.73 231.07,218.7 231.07,227 
	250.28,227 250.28,218.43 253.44,218.43 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton538"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-07" class="cls-2 myclass" points="285.43,218.73 282.19,218.63 282.19,227 262.98,227 263.02,218.73 252.44,218.43 
	252.09,45.36 285.43,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton539"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-08" class="cls-2 myclass" points="317.46,218.73 314.21,218.63 314.21,227 295,227 295,218.7 285.43,218.73 285.43,45.36 
	317.07,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton540"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-09" class="cls-2 myclass" points="348.59,218.73 345.54,218.63 345.54,227 327.5,227 327.5,218.04 317.27,218.04 
	317.27,45.36 348.59,45.36 </asp:LinkButton>

 <asp:LinkButton ID="LinkButton541"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polyline id="D10-10" class="cls-2 myclass" points="381.54,218.43 381.23,45.36 349.59,45.36 349.59,218.73 359.16,218.7 359.16,227 
	378.37,227 378.37,218.43 381.54,218.43 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton542"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-11" class="cls-2 myclass" points="414.52,218.73 411.28,218.63 411.28,227 392.07,227 392.11,218.73 381.54,218.43 
	381.18,45.36 414.52,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton543"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-12" class="cls-2 myclass" points="446.55,218.73 443.31,218.63 443.31,227 424.09,227 424.09,218.7 414.52,218.73 
	414.52,45.36 446.16,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton544"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-13" class="cls-2 myclass" points="479.46,218.73 476.22,218.63 476.22,227 457,227 457,218.04 446.12,218.04 446.12,45.36 
	479.46,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton545"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polyline id="D10-14" class="cls-2 myclass" points="511.41,218.43 511.1,45.36 479.46,45.36 479.46,218.73 489.03,218.7 489.03,227 
	508.24,227 508.24,218.43 511.41,218.43 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton546"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-15" class="cls-2 myclass" points="542.64,218.73 539.57,218.63 539.57,227 521.37,227 521.4,218.73 511.39,218.43 
	511.05,45.36 542.64,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton547"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-16" class="cls-2 myclass" points="576.42,218.73 573.18,218.63 573.18,227 553.96,227 553.96,218.7 544.39,218.73 
	544.39,45.36 576.03,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton548"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-17" class="cls-2 myclass" points="608.44,218.73 605.31,218.63 605.31,227 586.75,227 586.75,218.04 576.23,218.04 
	576.23,45.36 608.44,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton549"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polyline id="D10-18" class="cls-2 myclass" points="640.39,218.43 640.08,45.36 608.44,45.36 608.44,218.73 618.01,218.7 618.01,227 
	637.22,227 637.22,218.43 640.39,218.43 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton550"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-19" class="cls-2 myclass" points="673.38,218.73 670.13,218.63 670.13,227 650.92,227 650.96,218.73 640.39,218.43 
	640.03,45.36 673.38,45.36 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton551"  runat="server" CommandArgument="52_0" CommandName=""  OnClick="btn1click">
<polygon id="D10-20" class="cls-2 myclass" points="706,218.73 702.7,218.63 702.7,227 683.12,227 683.12,218.7 673.38,218.73 673.38,45.36 
	705.61,45.36 "/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>
                                        
                                         <asp:Panel ID="pnlrD5g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3154 2550" style="enable-background:new 0 0 3154 2550;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>

	
		
<g id="Layer_5">
	
		<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/D/D-5 ground floor.jpg"  transform="matrix(0.8984 0 0 0.8984 95 130)">
	</image>

 <asp:LinkButton ID="LinkButton552"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click"></asp:LinkButton>

 <asp:LinkButton ID="LinkButton553"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<polygon id="D5-40" class="cls-2 myclass" points="363.92,1193.15 495.99,1193.15 495.84,674.35 360,673.79 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton554"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<polygon id="D5-39" class="cls-2 myclass" points="617.04,1193.15 617.04,675.35 495.99,674.35 496.14,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton555"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<polygon id="D5-38" class="cls-2 myclass" points="622.33,1195 753.66,1195 753.66,674.35 617.04,675.35 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton556"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<polygon id="D5-37" class="cls-2 myclass" points="753.66,674.35 874.03,674.09 874.03,1193.15 753.66,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton557"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-36" x="874.03" y="674.09" class="cls-2 myclass" width="129.39" height="519.02"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton558"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-35" x="1003.43" y="678.65" class="cls-2 myclass" width="128.5" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton559"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-34" x="1131.92" y="678.65" class="cls-2 myclass" width="128.5" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton560"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-33" x="1260.42" y="678.65" class="cls-2 myclass" width="130.29" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton561"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-32" x="1391.46" y="678.65" class="cls-2 myclass" width="126.11" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton562"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-31" x="1517.53" y="678.65" class="cls-2 myclass" width="128.5" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton563"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-30" x="1646.03" y="678.65" class="cls-2 myclass" width="130.29" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton564"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<polygon id="D5-29" class="cls-2 myclass" points="1909.92,1195 1904.97,675.35 1773.64,674.35 1773.78,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton565"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<polygon id="D5-28" class="cls-2 myclass" points="1909.92,1195 2032.12,1195 2032.12,674.35 1904.97,675.35 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton566"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<polygon id="D5-27" class="cls-2 myclass" points="2032.12,674.35 2161.96,674.09 2161.96,1193.15 2032.12,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton567"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-26" x="2161.96" y="674.09" class="cls-2 myclass" width="129.39" height="519.02"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton568"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-25" x="2291.36" y="678.65" class="cls-2 myclass" width="128.5" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton569"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-24" x="2419.85" y="678.65" class="cls-2 myclass" width="128.5" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton570"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-23" x="2548.35" y="678.65" class="cls-2 myclass" width="130.29" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton571"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-22" x="2679.39" y="678.65" class="cls-2 myclass" width="126.11" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton572"  runat="server" CommandArgument="7_0" CommandName=""  OnClick="btn1click">
	<rect id="D5-21" x="2805.5" y="678.65" class="cls-2 myclass" width="128.5" height="514.46"/></asp:LinkButton>


	<polygon id="outline_4_" class="cls-2 myclass" points="361.96,658 457.47,658 457.47,674.08 500.07,674.08 500.07,658 595.14,658 
		595.14,674.08 623.41,674.08 623.41,660.67 713.08,660.67 713.08,674.08 758.81,674.08 758.81,660.67 1227.43,660.67 
		1227.43,674.08 1271.37,674.08 1271.37,659.78 1485.27,659.78 1485.27,674.08 1526.98,674.08 1526.98,658 1620.7,658 
		1620.7,674.08 1668.66,674.08 1668.66,660.23 1762.38,660.23 1762.38,674.08 1805.43,674.08 1805.43,659.78 1896.92,659.78 
		1896.92,674.08 1926.5,674.08 1926.5,658 2017.55,658 2017.55,674.08 2061.04,674.08 2061.04,659.34 2209.46,659.34 
		2532.34,659.34 2532.34,674.08 2575.84,674.08 2575.84,659.34 2668.67,659.34 2668.67,674.08 2698.69,674.08 2698.69,661.56 
		2788.36,661.56 2788.36,674.08 2831.41,674.08 2831.41,658 2930.97,658 2930.97,1195 361.96,1195 	"/>
</g>
</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrD5f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="D-5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/D/D-5.jpg"  transform="matrix(0.4928 0 0 0.4928 146.9086 -88.2979)">
</image>
<rect id="outline_2_" x="325.84" y="264" class="cls-2 myclass" width="1343.52" height="276"/>

 <asp:LinkButton ID="LinkButton573"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-140" x="325.84" y="264" class="cls-2 myclass" width="68.01" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton574"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-139" x="393.38" y="264" class="cls-2 myclass" width="68.01" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton575"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-138" x="460.93" y="264" class="cls-2 myclass" width="68.01" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton576"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-137" x="529.45" y="264" class="cls-2 myclass" width="66.87" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton577"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-136" x="595.86" y="264" class="cls-2 myclass" width="66.87" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton578"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-135" x="662.27" y="264" class="cls-2 myclass" width="66.87" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton579"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-134" x="729.15" y="264" class="cls-2 myclass" width="68.01" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton580"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-133" x="796.69" y="264" class="cls-2 myclass" width="68.01" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton581"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-132" x="864.23" y="264" class="cls-2 myclass" width="68.01" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton582"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-131" x="931.78" y="264" class="cls-2 myclass" width="65.82" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton583"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-130" x="997.6" y="264" class="cls-2 myclass" width="66.47" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton584"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-129" x="1064.07" y="264" class="cls-2 myclass" width="69.52" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton585"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-128" x="1133.12" y="264" class="cls-2 myclass" width="66.87" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton586"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-127" x="1200" y="264" class="cls-2 myclass" width="64.87" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton587"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-126" x="1264.87" y="264" class="cls-2 myclass" width="66.38" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton588"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-125" x="1333.25" y="264" class="cls-2 myclass" width="66.37" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton589"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-124" x="1397.62" y="264" class="cls-2 myclass" width="70.15" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton590"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-123" x="1467.32" y="264" class="cls-2 myclass" width="66.2" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton591"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-122" x="1533.51" y="264" class="cls-2 myclass" width="67.32" height="276"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton592"  runat="server" CommandArgument="7_1" CommandName=""  OnClick="btn1click">
<rect id="D5-121" x="1602.04" y="264" class="cls-2 myclass" width="67.32" height="276"/></asp:LinkButton>

</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrD5s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="D-5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 718 481" style="enable-background:new 0 0 718 481;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/D/D-5 2nd floor.jpg"  transform="matrix(0.24 0 0 0.24 -58 -71)">
</image>

 <asp:LinkButton ID="LinkButton593"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-240" x="29.5" y="81.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton594"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-239" x="62.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton595"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-238" x="95.1" y="81.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton596"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-237" x="128.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton597"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-236" x="161.1" y="81.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton598"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-235" x="195.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton599"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-234" x="228.1" y="81.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton600"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-233" x="261.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton601"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-232" x="294.5" y="81.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton602"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-231" x="327.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton603"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-230" x="360.1" y="81.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton604"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-229" x="393.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton605"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-228" x="426.1" y="81.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton606"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-227" x="460.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton607"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-226" x="493.1" y="81.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton608"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-225" x="526.5" y="81.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton609"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-224" x="559.1" y="81.8" class="cls-2 myclass" width="32.7" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton610"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-223" x="591.8" y="81.8" class="cls-2 myclass" width="33.1" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton611"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-222" x="624.9" y="81.8" class="cls-2 myclass" width="32.9" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton612"  runat="server" CommandArgument="7_2" CommandName=""  OnClick="btn1click">
<rect id="D5-221" x="657.8" y="81.8" class="cls-2 myclass" width="34.3" height="135.1"/></asp:LinkButton>



</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrD7g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1066" style="enable-background:new 0 0 1920 1066;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<g id="Layer_3">
	
		<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/D/D-7 ground floor edited.jpg"  transform="matrix(0.5428 0 0 0.5428 64.4533 -159.0133)">
	</image>
	<polygon id="outline_2_" class="cls-2 myclass" points="226.5,158 284.2,158 284.2,168.1 310,168.1 310,158 367.4,158 367.4,168.1 
		384.5,168.1 384.5,159.6 438.7,159.6 438.7,168.1 466.4,168.1 466.4,159.6 749.7,159.6 749.7,168.1 776.2,168.1 776.2,159.1 
		905.6,159.1 905.6,168.1 930.8,168.1 930.8,158 987.4,158 987.4,168.1 1016.4,168.1 1016.4,159.4 1073.1,159.4 1073.1,168.1 
		1099.1,168.1 1099.1,159.1 1154.4,159.1 1154.4,168.1 1172.3,168.1 1172.3,158 1227.3,158 1227.3,168.1 1253.6,168.1 1253.6,158.8 
		1343.3,158.8 1538.5,158.8 1538.5,168.1 1564.8,168.1 1564.8,158.8 1620.9,158.8 1620.9,168.1 1639.1,168.1 1639.1,160.2 
		1693.3,160.2 1693.3,168.1 1719.3,168.1 1719.3,158 1779.5,158 1779.5,498 226.5,498 	"/>

 <asp:LinkButton ID="LinkButton613"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-40" class="cls-2 myclass" points="228.7,486.2 302.8,486.2 302.7,157.2 226.5,156.9 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton614"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-39" class="cls-2 myclass" points="381.6,486.2 381.6,157.9 302.8,157.2 302.8,486.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton615"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-38" class="cls-2 myclass" points="381.6,486.2 458.3,486.2 458.3,157.2 381.6,157.9 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton616"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-37" class="cls-2 myclass" points="458.3,157.2 536.6,157.1 536.6,486.2 458.3,486.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton617"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-36" x="536.6" y="157.1" class="cls-2 myclass" width="78.1" height="329.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton618"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-35" x="614.7" y="160" class="cls-2 myclass" width="77.5" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton619"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-34" x="692.2" y="160" class="cls-2 myclass" width="77.5" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton620"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-33" x="769.8" y="160" class="cls-2 myclass" width="78.6" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton621"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-32" x="848.8" y="160" class="cls-2 myclass" width="76.1" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton622"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-31" x="924.9" y="160" class="cls-2 myclass" width="77.5" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton623"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-30" x="1002.4" y="160" class="cls-2 myclass" width="78.6" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton624"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-29" class="cls-2 myclass" points="1161.6,487.4 1158.7,161.7 1080.9,161.1 1080.9,486.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton625"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-28" class="cls-2 myclass" points="1161.6,487.4 1235.4,487.4 1235.4,161.1 1158.7,161.7 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton626"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-27" class="cls-2 myclass" points="1235.4,160.1 1313.7,160 1313.7,486.2 1235.4,486.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton627"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-26" x="1313.7" y="160" class="cls-2 myclass" width="78.1" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton628"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-25" x="1391.8" y="160" class="cls-2 myclass" width="77.5" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton629"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-24" x="1469.3" y="160" class="cls-2 myclass" width="77.5" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton630"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-23" x="1546.8" y="160" class="cls-2 myclass" width="78.6" height="326.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton631"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-22A" class="cls-2 myclass" points="1702,169.4 1695.5,169.4 1695.5,160 1664.3,160 1664.3,486.2 1702,486.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton632"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<polygon id="D7-22B" class="cls-2 myclass" points="1623.6,169.8 1637.9,169.8 1637.9,160 1664.3,160 1664.3,486.2 1624.6,486.2 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton633"  runat="server" CommandArgument="8_0" CommandName=""  OnClick="btn1click">
	<rect id="D7-21" x="1702" y="160" class="cls-2 myclass" width="77.5" height="326.2"/></asp:LinkButton>

</g>
</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrD7f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="D-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/D/D-7.jpg"  transform="matrix(0.5453 0 0 0.5453 36.2776 -192.24)">
</image>
<rect id="outline_2_" x="238.72" y="198.16" class="cls-2 myclass" width="1484.64" height="304.84"/>

 <asp:LinkButton ID="LinkButton634"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-140" x="238.72" y="198.16" class="cls-2 myclass" width="75.15" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton635"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-139" x="313.35" y="198.16" class="cls-2 myclass" width="75.15" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton636"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-138" x="388" y="198.16" class="cls-2 myclass" width="75.15" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton637"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-137" x="463.72" y="198.16" class="cls-2 myclass" width="73.89" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton638"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-136" x="537.1" y="198.16" class="cls-2 myclass" width="73.89" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton639"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-135" x="610.49" y="198.16" class="cls-2 myclass" width="73.89" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton640"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-134" x="684.39" y="198.16" class="cls-2 myclass" width="75.15" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton641"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-133" x="759.03" y="198.16" class="cls-2 myclass" width="75.15" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton642"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-132" x="833.66" y="198.16" class="cls-2 myclass" width="75.15" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton643"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-131" x="908.31" y="198.16" class="cls-2 myclass" width="72.73" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton644"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-130" x="981.04" y="198.16" class="cls-2 myclass" width="73.45" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton645"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-129" x="1054.49" y="198.16" class="cls-2 myclass" width="76.82" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton646"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-128" x="1130.79" y="198.16" class="cls-2 myclass" width="73.89" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton647"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-127" x="1204.7" y="198.16" class="cls-2 myclass" width="71.68" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton648"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-126" x="1276.38" y="198.16" class="cls-2 myclass" width="73.35" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton649"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-125" x="1351.95" y="198.16" class="cls-2 myclass" width="73.34" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton650"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-124" x="1423.08" y="198.16" class="cls-2 myclass" width="77.52" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton651"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-123" x="1500.1" y="198.16" class="cls-2 myclass" width="73.15" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton652"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-122" x="1573.24" y="198.16" class="cls-2 myclass" width="74.39" height="304.84"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton653"  runat="server" CommandArgument="8_1" CommandName=""  OnClick="btn1click">
<rect id="D7-121" x="1648.97" y="198.16" class="cls-2 myclass" width="74.39" height="304.84"/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrD7s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="D-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 2294.4 1622.64" style="enable-background:new 0 0 2294.4 1622.64;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="9560" height="6761" xlink:href="images/bhumi/D/D7- 2ND FLOOR.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
</image>

 <asp:LinkButton ID="LinkButton654"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-254" x="1703.07" y="277.1" class="cls-2 myclass" width="115.92" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton655"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-253" x="1590.77" y="277.1" class="cls-2 myclass" width="112.3" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton656"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-252" x="1473.82" y="277.1" class="cls-2 myclass" width="116.96" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton657"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-251" x="1359.41" y="277.1" class="cls-2 myclass" width="114.44" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton658"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-250" x="1241.27" y="277.1" class="cls-2 myclass" width="118.1" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton659"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-249" x="1126.86" y="277.1" class="cls-2 myclass" width="114.44" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton660"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-248" x="1018" y="277.1" class="cls-2 myclass" width="108.86" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton661"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-247" x="904.74" y="277.1" class="cls-2 myclass" width="113.26" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton662"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-246" x="790" y="277.1" class="cls-2 myclass" width="114.74" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton663"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-245" x="671.57" y="277.1" class="cls-2 myclass" width="118.43" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton664"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-244" x="556.83" y="277.1" class="cls-2 myclass" width="114.74" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton665"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-243" x="442.09" y="277.1" class="cls-2 myclass" width="114.78" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton666"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-242" x="329.79" y="277.1" class="cls-2 myclass" width="112.3" height="466.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton667"  runat="server" CommandArgument="8_2" CommandName=""  OnClick="btn1click">
<rect id="D7-241" x="213.87" y="277.1" class="cls-2 myclass" width="115.92" height="466.67"/></asp:LinkButton>

<rect id="outline_1_" x="213.87" y="277.1" class="cls-2 myclass" width="1605.13" height="466.67"/>

</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrD8g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3154 2550" style="enable-background:new 0 0 3154 2550;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>

	
		
<g id="Layer_4">
	
		<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/D/D-8-ground-floor.jpg"  transform="matrix(1 0 0 1 -146 0)">
	</image>

 <asp:LinkButton ID="LinkButton668"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<polygon id="D8-01" class="cls-2 myclass" points="151.16,1310.06 287.17,1310.06 287.17,1894.32 147,1895.14 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton669"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<polygon id="D8-02" class="cls-2 myclass" points="433.17,1310.06 433.17,1893.09 287.17,1894.32 287.17,1310.06 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton670"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<polygon id="D8-03" class="cls-2 myclass" points="438.57,1308 574.59,1308 574.59,1894.32 433.17,1893.09 	"/>
	<polygon id="D8-04" class="cls-2 myclass" points="574.59,1894.32 718.92,1894.73 718.92,1310.06 574.59,1310.06 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton671"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-05" x="718.92" y="1310.06" class="cls-2 myclass" width="143.92" height="584.68"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton672"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-06" x="863.25" y="1310.06" class="cls-2 myclass" width="143.08" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton673"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-07" x="1005.92" y="1310.06" class="cls-2 myclass" width="143.08" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton674"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-08" x="1149" y="1310.06" class="cls-2 myclass" width="145.16" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton675"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-09" x="1295" y="1310.06" class="cls-2 myclass" width="140.17" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton676"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-10" x="1435.17" y="1310.06" class="cls-2 myclass" width="143.08" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton677"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-11" x="1578.25" y="1310.06" class="cls-2 myclass" width="145.16" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton678"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<polygon id="D8-12" class="cls-2 myclass" points="1871.91,1308 1866.08,1893.09 1720.09,1894.32 1720.09,1310.06 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton679"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<polygon id="D8-13" class="cls-2 myclass" points="1871.91,1308 2007.5,1308 2007.5,1894.32 1866.08,1893.09 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton680"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<polygon id="D8-14" class="cls-2 myclass" points="2007.5,1894.32 2152.25,1894.73 2152.25,1310.06 2007.5,1310.06 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton681"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-15" x="2152.25" y="1310.06" class="cls-2 myclass" width="143.92" height="584.68"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton682"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-16" x="2296.17" y="1310.06" class="cls-2 myclass" width="143.08" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton683"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-17" x="2439.25" y="1310.06" class="cls-2 myclass" width="143.08" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton684"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-18" x="2581.92" y="1310.06" class="cls-2 myclass" width="145.16" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton685"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-19" x="2727.91" y="1310.06" class="cls-2 myclass" width="140.17" height="579.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton686"  runat="server" CommandArgument="9_0" CommandName=""  OnClick="btn1click">
	<rect id="D8-20" x="2868.08" y="1310.06" class="cls-2 myclass" width="143.08" height="579.74"/></asp:LinkButton>

 
	
</g>
</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrD8f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="D-8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/D/D-8 first floor.jpg"  transform="matrix(0.5804 0 0 0.5804 2.3529 -200)">
</image>


<rect id="outline_1_" x="220" y="603.52" class="cls-2 myclass" width="1572.48" height="324"/>

 <asp:LinkButton ID="LinkButton687"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-101" x="220" y="603.52" class="cls-2 myclass" width="79.6" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton688"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-102" x="299.06" y="603.52" class="cls-2 myclass" width="79.6" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton689"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-103" x="378.11" y="603.52" class="cls-2 myclass" width="79.6" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton690"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-104" x="458.3" y="603.52" class="cls-2 myclass" width="78.27" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton691"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-105" x="536.04" y="603.52" class="cls-2 myclass" width="78.27" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton692"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-106" x="613.77" y="603.52" class="cls-2 myclass" width="78.27" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton693"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-107" x="692.03" y="603.52" class="cls-2 myclass" width="79.6" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton694"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-108" x="771.09" y="603.52" class="cls-2 myclass" width="79.6" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton695"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-109" x="850.15" y="603.52" class="cls-2 myclass" width="79.6" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton696"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-110" x="929.2" y="603.52" class="cls-2 myclass" width="79.6" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton697"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-111" x="1006.23" y="603.52" class="cls-2 myclass" width="77.79" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton698"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-112" x="1084.03" y="603.52" class="cls-2 myclass" width="81.37" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton699"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-113" x="1164.86" y="603.52" class="cls-2 myclass" width="78.27" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton700"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-114" x="1239.87" y="603.52" class="cls-2 myclass" width="79.18" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton701"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-115" x="1322.74" y="603.52" class="cls-2 myclass" width="74.02" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton702"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-116" x="1396.75" y="603.52" class="cls-2 myclass" width="77.69" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton703"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-117" x="1474.44" y="603.52" class="cls-2 myclass" width="82.1" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton704"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-118" x="1556.01" y="603.52" class="cls-2 myclass" width="77.48" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton705"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-119" x="1633.47" y="603.52" class="cls-2 myclass" width="78.8" height="324"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton706"  runat="server" CommandArgument="9_1" CommandName=""  OnClick="btn1click">
<rect id="D8-120" x="1713.68" y="603.52" class="cls-2 myclass" width="78.8" height="324"/></asp:LinkButton>

 
</svg>

                                           </div>
                                        </asp:Panel>

                                         <asp:Panel ID="pnlrD8s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3075.84 1723.68" style="enable-background:new 0 0 3075.84 1723.68;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/D/D8-Second-floor.jpg"  transform="matrix(1 0 0 1 -192.88 -491.8)">
</image>
<rect id="outline" x="91.96" y="861.99" class="cls-2 myclass" width="2900.72" height="628.21"/>

 <asp:LinkButton ID="LinkButton707"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-240" x="96.36" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton708"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-239" x="241.37" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton709"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-238" x="386.38" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton710"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-237" x="531.1" y="862.87" class="cls-2 myclass" width="145.29" height="277.62"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton711"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-236" x="676.39" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton712"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-235" x="823.4" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton713"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-234" x="968.41" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton714"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-233" x="1113.42" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton715"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-232" x="1257.42" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton716"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-231" x="1399.43" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton717"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-230" x="1546.44" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton718"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-229" x="1691.45" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton719"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-228" x="1836.46" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton720"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-227" x="1980.46" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton721"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-226" x="2126.47" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton722"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-225" x="2272.48" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton723"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-224" x="2417.49" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton724"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-223" x="2560.5" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton725"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-222" x="2707.5" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton726"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-221" x="2852.51" y="861.84" class="cls-2 myclass" width="144.73" height="278.65"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton727"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-220" x="2852.51" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton728"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-219" x="2707.5" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton729"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-218" x="2563.5" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton730"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-217" x="2418.49" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton731"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-216" x="2273.48" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton732"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-215" x="2183.48" y="1189.14" class="cls-2 myclass" width="87.72" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton733"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-214" x="1979.46" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton734"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-213" x="1835.46" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton735"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-212" x="1690.45" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton736"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-211" x="1545.44" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton737"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-210" x="1398.43" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton738"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-209" x="1258.42" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton739"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-208" x="1108.42" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton740"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-207" x="963.41" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton741"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-206" x="818.4" y="1189.14" class="cls-2 myclass" width="87.84" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton742"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-205" x="671.39" y="1189.14" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton743"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-204" x="531.1" y="1189.14" class="cls-2 myclass" width="140.29" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton744"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-203" x="386.38" y="1188" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton745"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-202" x="241.37" y="1188" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton746"  runat="server" CommandArgument="9_2" CommandName=""  OnClick="btn1click">
<rect id="C8-201" x="96.36" y="1188" class="cls-2 myclass" width="144.73" height="307.74"/></asp:LinkButton>


</svg>
                                           </div>
                                        </asp:Panel>



                                        <asp:Panel ID="pnlsE9g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
<svg version="1.1" id="E-9" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 813 403.8" style="enable-background:new 0 0 813 403.8;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/E/E-9.jpg"  transform="matrix(0.24 0 0 0.24 -14 -76)">
</image>


 <asp:LinkButton ID="LinkButton747"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-21" class="cls-2 myclass" points="20.04,99.56 57.23,99.56 57.23,258.42 54,258.42 54,264.98 32.44,264.98 32.17,258.64 
	20.04,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton748"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-22" class="cls-2 myclass" points="57.1,99.56 94.29,99.56 94.29,258.42 91.06,258.42 91.06,264.98 69.5,264.98 69.23,258.64 
	57.1,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton749"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-23" class="cls-2 myclass" points="94.29,99.56 130.23,99.56 130.23,258.42 127.1,258.42 127.1,264.98 106.26,264.98 
	106,258.64 94.29,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton750"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-24" class="cls-2 myclass" points="130.23,99.56 166.16,99.56 166.16,258.42 163.04,258.42 163.04,264.98 142.2,264.98 
	141.94,258.64 130.23,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton751"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-25" class="cls-2 myclass" points="166.16,99.56 203.22,99.56 203.22,258.42 200,258.42 200,264.98 178.51,264.98 
	178.25,258.64 166.16,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton752"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-26" class="cls-2 myclass" points="203.22,99.56 239.16,99.56 239.16,258.42 236.03,258.42 236.03,264.98 215.19,264.98 
	214.93,258.64 203.22,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton753"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-27" class="cls-2 myclass" points="239.16,99.56 276.21,99.56 276.21,258.42 272.99,258.42 272.99,264.98 251.51,264.98 
	251.24,258.64 239.16,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton754"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-28" class="cls-2 myclass" points="276.21,99.56 312.15,99.56 312.15,258.42 309.03,258.42 309.03,264.98 288.18,264.98 
	287.93,258.64 276.21,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton755"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-29" class="cls-2 myclass" points="312.15,99.56 349.21,99.56 349.21,258.42 345.98,258.42 345.98,264.98 324.5,264.98 
	324.23,258.64 312.15,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton756"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-30" class="cls-2 myclass" points="349.21,99.56 385.14,99.56 385.14,258.42 382.02,258.42 382.02,264.98 361.18,264.98 
	360.92,258.64 349.21,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton757"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-31" class="cls-2 myclass" points="385.14,99.56 421.08,99.56 421.08,258.42 417.96,258.42 417.96,264.98 397.11,264.98 
	396.86,258.64 385.14,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton758"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-32" class="cls-2 myclass" points="421.08,99.56 458.14,99.56 458.14,258.42 454.91,258.42 454.91,264.98 433.43,264.98 
	433.16,258.64 421.08,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton759"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-33" class="cls-2 myclass" points="458.14,99.56 495.19,99.56 495.19,258.42 491.97,258.42 491.97,264.98 470.49,264.98 
	470.22,258.64 458.14,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton760"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-34" class="cls-2 myclass" points="494.28,99.56 531.13,99.56 531.13,258.42 527.93,258.42 527.93,264.98 506.56,264.98 
	506.29,258.64 494.28,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton761"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-35" class="cls-2 myclass" points="531.13,99.56 567.42,99.56 567.42,258.42 564.27,258.42 564.27,264.98 543.22,264.98 
	542.97,258.64 531.13,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton762"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-36" class="cls-2 myclass" points="567.42,99.56 604.12,99.56 604.12,258.42 600.93,258.42 600.93,264.98 579.65,264.98 
	579.38,258.64 567.42,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton763"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-37" class="cls-2 myclass" points="604.12,99.56 640.06,99.56 640.06,258.42 636.94,258.42 636.94,264.98 616.09,264.98 
	615.84,258.64 604.12,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton764"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-38" class="cls-2 myclass" points="640.06,99.56 676.83,99.56 676.83,258.42 673.64,258.42 673.64,264.98 652.31,264.98 
	652.05,258.64 640.06,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton765"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-39" class="cls-2 myclass" points="676.83,99.56 712.96,99.56 712.96,258.42 709.82,258.42 709.82,264.98 688.87,264.98 
	688.62,258.64 676.83,258.64 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton766"  runat="server" CommandArgument="55_0" CommandName=""  OnClick="btn1click">
<polygon id="E9-40" class="cls-2 myclass" points="712.96,99.56 750.43,99.56 750.43,258.42 747.17,258.42 747.17,264.98 725.45,264.98 
	725.18,258.64 712.96,258.64 "/></asp:LinkButton>


</svg>

                                           </div>
                                        </asp:Panel>
                                         
                                        <asp:Panel ID="pnlsE12g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="E-12" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 9791 13788" style="enable-background:new 0 0 9791 13788;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="9791" height="13788" xlink:href="E12.jpg" >
</image>

 <asp:LinkButton ID="LinkButton767"  runat="server" CommandArgument="57_0" CommandName=""  OnClick="btn1click">
<polygon id="E12-16" class="cls-2 myclass" points="8297,7055 7081.05,7055 7081.05,12149.88 7195.12,12149.68 7192.7,12331.16 
	8075.9,12331.16 8075.9,12146.6 8304.64,12143.93 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton768"  runat="server" CommandArgument="57_0" CommandName=""  OnClick="btn1click">
<polygon id="E12-17" class="cls-2 myclass" points="7073.57,7055 5911.41,7055 5907.77,12147.42 6028.74,12148.45 6026.24,12331.16 
	6854.82,12331.16 6854.82,12146.6 7081.05,12146.6 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton769"  runat="server" CommandArgument="57_0" CommandName=""  OnClick="btn1click">
<polygon id="E12-18" class="cls-2 myclass" points="5904.12,7055 4743.69,7055 4743.69,12148.65 4852.58,12148.45 4850.09,12331.16 
	5691.71,12331.16 5691.71,12146.6 5907.77,12146.39 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton770"  runat="server" CommandArgument="57_0" CommandName=""  OnClick="btn1click">
<polygon id="E12-19" class="cls-2 myclass" points="4736.21,7055 3570.6,7055 3567.34,12149.88 3683.14,12148.45 3680.64,12331.16 
	4515.55,12331.16 4515.55,12146.6 4743.69,12147.62 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton771"  runat="server" CommandArgument="57_0" CommandName=""  OnClick="btn1click">
<polygon id="E12-20" class="cls-2 myclass" points="3564.08,7055 2367.99,7055 2360.32,12147.62 2528.45,12148.45 2525.96,12331.16 
	3380.61,12331.16 3380.61,12146.6 3568.11,12148.86 "/></asp:LinkButton>



</svg>

                                           </div>
                                        </asp:Panel>
                                        
                                        <asp:Panel ID="pnlrE5g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3154 2550" style="enable-background:new 0 0 3154 2550;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>


<g id="Layer_6">
	
		<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/E/E-5 ground floor.jpg"  transform="matrix(0.8867 0 0 0.8867 114 144.5)">
	</image>

 <asp:LinkButton ID="LinkButton772"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<polygon id="E5-40" class="cls-2 myclass" points="373.87,1193.15 504.41,1193.15 504.26,674.35 370,673.79 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton773"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<polygon id="E5-39" class="cls-2 myclass" points="624.04,1193.15 624.04,675.35 504.41,674.35 504.55,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton774"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<polygon id="E5-38" class="cls-2 myclass" points="629.27,1195 759.07,1195 759.07,674.35 624.04,675.35 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton775"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<polygon id="E5-37" class="cls-2 myclass" points="759.07,674.35 878.04,674.09 878.04,1193.15 759.07,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton776"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-36" x="878.04" y="674.09" class="cls-2 myclass" width="127.89" height="519.02"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton777"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-35" x="1005.93" y="678.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton778"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-34" x="1132.93" y="678.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton779"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-33" x="1259.93" y="678.65" class="cls-2 myclass" width="128.77" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton780"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-32" x="1389.44" y="678.65" class="cls-2 myclass" width="124.64" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton781"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-31" x="1514.04" y="678.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton782"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-30" x="1641.04" y="678.65" class="cls-2 myclass" width="128.77" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton783"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<polygon id="E5-29" class="cls-2 myclass" points="1901.86,1195 1896.96,675.35 1767.16,674.35 1767.31,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton784"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<polygon id="E5-28" class="cls-2 myclass" points="1901.86,1195 2022.63,1195 2022.63,674.35 1896.96,675.35 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton785"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<polygon id="E5-27" class="cls-2 myclass" points="2022.63,674.35 2150.96,674.09 2150.96,1193.15 2022.63,1193.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton786"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-26" x="2150.96" y="674.09" class="cls-2 myclass" width="127.89" height="519.02"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton787"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-25" x="2278.85" y="678.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton788"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-24" x="2405.85" y="678.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton789"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-23" x="2532.85" y="678.65" class="cls-2 myclass" width="128.77" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton790"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-22" x="2662.35" y="678.65" class="cls-2 myclass" width="124.64" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton791"  runat="server" CommandArgument="12_0" CommandName=""  OnClick="btn1click">
	<rect id="E5-21" x="2787" y="678.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 
</g>
</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrE5f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="E-5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/E/E-5.jpg"  transform="matrix(0.5132 0 0 0.5132 113.1915 -114.352)">
</image>
<rect id="outline_2_" x="302.55" y="255.96" class="cls-2 myclass" width="1395.74" height="284.04"/>

 <asp:LinkButton ID="LinkButton792"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-140" x="302.55" y="255.96" class="cls-2 myclass" width="70.65" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton793"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-139" x="372.72" y="255.96" class="cls-2 myclass" width="70.65" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton794"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-138" x="442.89" y="255.96" class="cls-2 myclass" width="70.65" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton795"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-137" x="514.08" y="255.96" class="cls-2 myclass" width="69.47" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton796"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-136" x="583.07" y="255.96" class="cls-2 myclass" width="69.47" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton797"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-135" x="652.06" y="255.96" class="cls-2 myclass" width="69.47" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton798"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-134" x="721.54" y="255.96" class="cls-2 myclass" width="70.65" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton799"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-133" x="791.71" y="255.96" class="cls-2 myclass" width="70.65" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton800"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-132" x="861.87" y="255.96" class="cls-2 myclass" width="70.65" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton801"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-131" x="932.05" y="255.96" class="cls-2 myclass" width="68.38" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton802"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-130" x="1000.43" y="255.96" class="cls-2 myclass" width="69.05" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton803"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-129" x="1069.48" y="255.96" class="cls-2 myclass" width="72.22" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton804"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-128" x="1141.21" y="255.96" class="cls-2 myclass" width="69.47" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton805"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-127" x="1210.69" y="255.96" class="cls-2 myclass" width="67.39" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton806"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-126" x="1278.08" y="255.96" class="cls-2 myclass" width="68.96" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton807"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-125" x="1349.12" y="255.96" class="cls-2 myclass" width="68.95" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton808"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-123" x="1488.4" y="255.96" class="cls-2 myclass" width="68.77" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton809"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-124" x="1415.99" y="255.96" class="cls-2 myclass" width="72.88" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton810"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-122" x="1557.17" y="255.96" class="cls-2 myclass" width="69.94" height="284.04"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton811"  runat="server" CommandArgument="12_1" CommandName=""  OnClick="btn1click">
<rect id="E5-121" x="1628.36" y="255.96" class="cls-2 myclass" width="69.94" height="284.04"/></asp:LinkButton>

 
</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrE5s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="E-5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 716 469" style="enable-background:new 0 0 716 469;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/E/E-5 2nd floor.jpg"  transform="matrix(0.24 0 0 0.24 -60 -88)">
</image>

 <asp:LinkButton ID="LinkButton812"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-240" x="28.5" y="63.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton813"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-239" x="61.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton814"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-238" x="94.1" y="63.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton815"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-237" x="127.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton816"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-236" x="160.1" y="63.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton817"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-235" x="194.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton818"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-234" x="227.1" y="63.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton819"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-233" x="260.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton820"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-232" x="293.5" y="63.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton821"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-231" x="326.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton822"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-230" x="359.1" y="63.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton823"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-229" x="392.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton824"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-228" x="425.1" y="63.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton825"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-227" x="459.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton826"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-226" x="492.1" y="63.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton827"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-225" x="525.5" y="63.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton828"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-224" x="558.1" y="63.8" class="cls-2 myclass" width="32.7" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton829"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-223" x="590.8" y="63.8" class="cls-2 myclass" width="33.1" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton830"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-222" x="623.9" y="63.8" class="cls-2 myclass" width="32.9" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton831"  runat="server" CommandArgument="12_2" CommandName=""  OnClick="btn1click">
<rect id="E5-221" x="656.8" y="63.8" class="cls-2 myclass" width="34.3" height="135.1"/></asp:LinkButton>



</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrE6g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3154 2550" style="enable-background:new 0 0 3154 2550;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>


<g id="Layer_7">
	
		<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/E/E-6 ground floor.jpg"  transform="matrix(0.9519 0 0 0.9519 6.2941 61.2727)">
	</image>

 <asp:LinkButton ID="LinkButton832"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<polygon id="E6-01" class="cls-2 myclass" points="290.96,1309.94 420.32,1309.94 420.32,1861.32 287,1862.09 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton833"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<polygon id="E6-02" class="cls-2 myclass" points="559.18,1309.94 559.18,1860.15 420.32,1861.32 420.32,1309.94 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton834"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<polygon id="E6-03" class="cls-2 myclass" points="564.33,1308 693.69,1308 693.69,1861.32 559.18,1860.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton835"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<polygon id="E6-04" class="cls-2 myclass" points="693.69,1861.32 830.97,1861.7 830.97,1309.94 693.69,1309.94 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton836"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-05" x="830.97" y="1309.94" class="cls-2 myclass" width="136.88" height="551.76"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton837"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-06" x="968.25" y="1309.94" class="cls-2 myclass" width="136.09" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton838"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-07" x="1103.95" y="1309.94" class="cls-2 myclass" width="136.09" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton839"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-08" x="1240.04" y="1309.94" class="cls-2 myclass" width="138.07" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton840"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-09" x="1378.9" y="1309.94" class="cls-2 myclass" width="133.32" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton841"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-10" x="1512.22" y="1309.94" class="cls-2 myclass" width="136.09" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton842"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-11" x="1648.31" y="1309.94" class="cls-2 myclass" width="138.07" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton843"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<polygon id="E6-12" class="cls-2 myclass" points="1927.62,1308 1922.08,1860.15 1783.22,1861.32 1783.22,1309.94 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton844"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<polygon id="E6-13" class="cls-2 myclass" points="1927.62,1308 2056.59,1308 2056.59,1861.32 1922.08,1860.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton845"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<polygon id="E6-14" class="cls-2 myclass" points="2056.59,1861.32 2194.26,1861.7 2194.26,1309.94 2056.59,1309.94 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton846"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-15" x="2194.26" y="1309.94" class="cls-2 myclass" width="136.88" height="551.76"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton847"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-16" x="2331.15" y="1309.94" class="cls-2 myclass" width="136.09" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton848"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-17" x="2467.24" y="1309.94" class="cls-2 myclass" width="136.09" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton849"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-18" x="2602.93" y="1309.94" class="cls-2 myclass" width="138.07" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton850"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-19" x="2741.8" y="1309.94" class="cls-2 myclass" width="133.32" height="547.11"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton851"  runat="server" CommandArgument="13_0" CommandName=""  OnClick="btn1click">
	<rect id="E6-20" x="2875.12" y="1309.94" class="cls-2 myclass" width="136.09" height="547.11"/></asp:LinkButton>



</g>
</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrE6f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="E-6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/E/E-6.jpg"  transform="matrix(0.4973 0 0 0.4973 139.4743 -94.0426)">
</image>
<rect id="outline_1_" x="321.42" y="592" class="cls-2 myclass" width="1357.73" height="295.2"/>

 <asp:LinkButton ID="LinkButton852"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-101" x="321.42" y="592" class="cls-2 myclass" width="68.73" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton853"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-102" x="389.68" y="592" class="cls-2 myclass" width="68.73" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton854"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-103" x="457.94" y="592" class="cls-2 myclass" width="68.73" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton855"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-104" x="527.18" y="592" class="cls-2 myclass" width="67.58" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton856"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-105" x="594.3" y="592" class="cls-2 myclass" width="67.58" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton857"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-106" x="661.41" y="592" class="cls-2 myclass" width="67.58" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton858"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-107" x="728.99" y="592" class="cls-2 myclass" width="68.73" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton859"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-108" x="797.25" y="592" class="cls-2 myclass" width="68.73" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton860"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-109" x="865.51" y="592" class="cls-2 myclass" width="68.73" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton861"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-110" x="933.77" y="592" class="cls-2 myclass" width="68.73" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton862"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-111" x="1000.28" y="592" class="cls-2 myclass" width="67.17" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton863"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-112" x="1067.45" y="592" class="cls-2 myclass" width="70.26" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton864"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-113" x="1137.24" y="592" class="cls-2 myclass" width="67.58" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton865"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-114" x="1202.01" y="592" class="cls-2 myclass" width="68.37" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton866"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-115" x="1273.56" y="592" class="cls-2 myclass" width="63.91" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton867"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-116" x="1337.46" y="592" class="cls-2 myclass" width="67.08" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton868"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-117" x="1404.54" y="592" class="cls-2 myclass" width="70.89" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton869"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-118" x="1474.97" y="592" class="cls-2 myclass" width="66.9" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton870"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-119" x="1541.86" y="592" class="cls-2 myclass" width="68.04" height="295.2"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton871"  runat="server" CommandArgument="13_1" CommandName=""  OnClick="btn1click">
<rect id="E6-120" x="1611.11" y="592" class="cls-2 myclass" width="68.04" height="295.2"/></asp:LinkButton>


</svg>
                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrE6s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="E-6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 713 478" style="enable-background:new 0 0 713 478;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/E/E-6 2nd floor.jpg"  transform="matrix(0.24 0 0 0.24 -62 -78.5)">
</image>

 <asp:LinkButton ID="LinkButton872"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-220" x="654.8" y="236.8" class="cls-2 myclass" width="34.3" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton873"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-219" x="621.9" y="236.8" class="cls-2 myclass" width="32.9" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton874"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-218" x="588.8" y="236.8" class="cls-2 myclass" width="33.1" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton875"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-217" x="555.1" y="236.8" class="cls-2 myclass" width="32.7" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton876"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-216" x="522.3" y="236.8" class="cls-2 myclass" width="33.8" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton877"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-215" x="490.1" y="236.8" class="cls-2 myclass" width="32.2" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton878"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-214" x="457.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton879"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-213" x="423.1" y="236.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton880"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-212" x="390.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton881"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-211" x="357.1" y="236.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton882"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-210" x="324.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton883"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-209" x="291.5" y="236.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton884"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-208" x="258.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton885"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-207" x="225.1" y="236.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton886"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-206" x="192.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton887"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-205" x="158.1" y="236.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton888"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-204" x="125.5" y="236.5" class="cls-2 myclass" width="33" height="135"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton889"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-203" x="92.1" y="236.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton890"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-202" x="59.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton891"  runat="server" CommandArgument="13_2" CommandName=""  OnClick="btn1click">
<rect id="E6-201" x="26.5" y="236.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>



</svg>
                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrE7g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3154 2550" style="enable-background:new 0 0 3154 2550;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>

<g id="Layer_8">
	
		<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/E/E-7 ground floor.jpg"  transform="matrix(0.8875 0 0 0.8875 112.7059 143.5)">
	</image>

 <asp:LinkButton ID="LinkButton892"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<polygon id="E7-40" class="cls-2 myclass" points="373.87,1197.15 504.41,1197.15 504.26,678.35 370,677.79 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton893"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<polygon id="E7-39" class="cls-2 myclass" points="624.04,1197.15 624.04,679.35 504.41,678.35 504.55,1197.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton894"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<polygon id="E7-38" class="cls-2 myclass" points="629.27,1199 759.07,1199 759.07,678.35 624.04,679.35 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton895"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<polygon id="E7-37" class="cls-2 myclass" points="759.07,678.35 878.04,678.09 878.04,1197.15 759.07,1197.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton896"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-36" x="878.04" y="678.09" class="cls-2 myclass" width="127.89" height="519.02"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton897"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-35" x="1005.93" y="682.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton898"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-34" x="1132.93" y="682.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton899"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-33" x="1259.93" y="682.65" class="cls-2 myclass" width="128.77" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton900"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-32" x="1389.44" y="682.65" class="cls-2 myclass" width="124.64" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton901"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-31" x="1514.04" y="682.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton902"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-30" x="1641.04" y="682.65" class="cls-2 myclass" width="128.77" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton903"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<polygon id="E7-29" class="cls-2 myclass" points="1901.86,1199 1896.96,679.35 1767.16,678.35 1767.31,1197.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton904"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<polygon id="E7-28" class="cls-2 myclass" points="1901.86,1199 2022.63,1199 2022.63,678.35 1896.96,679.35 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton905"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<polygon id="E7-27" class="cls-2 myclass" points="2022.63,678.35 2150.96,678.09 2150.96,1197.15 2022.63,1197.15 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton906"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-26" x="2150.96" y="678.09" class="cls-2 myclass" width="127.89" height="519.02"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton907"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-25" x="2278.85" y="682.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton908"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-24" x="2405.85" y="682.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton909"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-23" x="2532.85" y="682.65" class="cls-2 myclass" width="128.77" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton910"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-22" x="2662.35" y="682.65" class="cls-2 myclass" width="124.64" height="514.46"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton911"  runat="server" CommandArgument="14_0" CommandName=""  OnClick="btn1click">
	<rect id="E7-21" x="2787" y="682.65" class="cls-2 myclass" width="127" height="514.46"/></asp:LinkButton>



</g>
</svg>
                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrE7f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
<svg version="1.1" id="E-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/E/E-7 first floor.jpg"  transform="matrix(0.5342 0 0 0.5342 78.5621 -141.1111)">
</image>
<rect id="outline_2_" x="277.78" y="243.33" class="cls-2 myclass" width="1455.04" height="296.67"/>

 <asp:LinkButton ID="LinkButton912"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-140" x="277.78" y="243.33" class="cls-2 myclass" width="73.65" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton913"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-139" x="350.93" y="243.33" class="cls-2 myclass" width="73.65" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton914"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-138" x="424.08" y="243.33" class="cls-2 myclass" width="73.65" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton915"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-137" x="498.3" y="243.33" class="cls-2 myclass" width="72.42" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton916"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-136" x="570.22" y="243.33" class="cls-2 myclass" width="72.42" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton917"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-135" x="642.14" y="243.33" class="cls-2 myclass" width="72.42" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton918"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-134" x="714.57" y="243.33" class="cls-2 myclass" width="73.65" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton919"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-133" x="787.72" y="243.33" class="cls-2 myclass" width="73.65" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton920"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-132" x="860.86" y="243.33" class="cls-2 myclass" width="73.65" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton921"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-131" x="934.02" y="243.33" class="cls-2 myclass" width="71.29" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton922"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-130" x="1005.31" y="243.33" class="cls-2 myclass" width="71.98" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton923"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-129" x="1077.29" y="243.33" class="cls-2 myclass" width="75.29" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton924"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-128" x="1152.07" y="243.33" class="cls-2 myclass" width="72.42" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton925"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-127" x="1224.5" y="243.33" class="cls-2 myclass" width="70.25" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton926"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-126" x="1294.76" y="243.33" class="cls-2 myclass" width="71.89" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton927"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-125" x="1368.81" y="243.33" class="cls-2 myclass" width="71.88" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton928"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-123" x="1514.01" y="243.33" class="cls-2 myclass" width="71.69" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton929"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-124" x="1438.53" y="243.33" class="cls-2 myclass" width="75.98" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton930"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-122" x="1585.7" y="243.33" class="cls-2 myclass" width="72.91" height="296.67"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton931"  runat="server" CommandArgument="14_1" CommandName=""  OnClick="btn1click">
<rect id="E7-121" x="1659.92" y="243.33" class="cls-2 myclass" width="72.91" height="296.67"/></asp:LinkButton>   
 
</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrE7s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="E-7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 729 461" style="enable-background:new 0 0 729 461;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/E/E-7 2nd floor.jpg"  transform="matrix(0.24 0 0 0.24 -52 -91)">
</image> 

 <asp:LinkButton ID="LinkButton932"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-240" x="35.5" y="59.8" class="cls-2 myclass" width="33" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton933"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-239" x="68.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton934"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-238" x="101.1" y="59.8" class="cls-2 myclass" width="33.4" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton935"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-237" x="134.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton936"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-236" x="167.1" y="59.8" class="cls-2 myclass" width="34.4" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton937"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-235" x="201.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton938"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-234" x="234.1" y="59.8" class="cls-2 myclass" width="33.4" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton939"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-233" x="267.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton940"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-232" x="300.5" y="59.8" class="cls-2 myclass" width="33" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton941"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-231" x="333.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton942"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-230" x="366.1" y="59.8" class="cls-2 myclass" width="33.4" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton943"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-229" x="399.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton944"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-228" x="432.1" y="59.8" class="cls-2 myclass" width="34.4" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton945"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-227" x="466.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton946"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-226" x="499.1" y="59.8" class="cls-2 myclass" width="33.4" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton947"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-225" x="532.5" y="59.8" class="cls-2 myclass" width="32.6" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton948"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-224" x="565.1" y="59.8" class="cls-2 myclass" width="32.7" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton949"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-223" x="597.8" y="59.8" class="cls-2 myclass" width="33.1" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton950"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-222" x="630.9" y="59.8" class="cls-2 myclass" width="32.9" height="135.1"/> </asp:LinkButton>

 <asp:LinkButton ID="LinkButton951"  runat="server" CommandArgument="14_2" CommandName=""  OnClick="btn1click">
<rect id="E7-221" x="663.8" y="59.8" class="cls-2 myclass" width="34.3" height="135.1"/> </asp:LinkButton>

 
</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrE8g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="Layer_9" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 3154 2550" style="enable-background:new 0 0 3154 2550;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/E/E-8 ground floor.jpg"  transform="matrix(0.9455 0 0 0.9455 -46 70)">
</image>

 <asp:LinkButton ID="LinkButton952"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<polygon id="E8-01" class="cls-2 myclass" points="236.94,1311.93 365.69,1311.93 365.69,1859.43 233,1860.2 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton953"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<polygon id="E8-02" class="cls-2 myclass" points="503.88,1311.93 503.88,1858.28 365.69,1859.43 365.69,1311.93 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton954"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<polygon id="E8-03" class="cls-2 myclass" points="509,1310 637.75,1310 637.75,1859.43 503.88,1858.28 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton955"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<polygon id="E8-04" class="cls-2 myclass" points="637.75,1859.43 774.38,1859.82 774.38,1311.93 637.75,1311.93 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton956"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-05" x="774.38" y="1311.93" class="cls-2 myclass" width="136.23" height="547.89"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton957"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-06" x="911" y="1311.93" class="cls-2 myclass" width="135.44" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton958"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-07" x="1046.05" y="1311.93" class="cls-2 myclass" width="135.44" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton959"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-08" x="1181.49" y="1311.93" class="cls-2 myclass" width="137.41" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton960"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-09" x="1319.69" y="1311.93" class="cls-2 myclass" width="132.69" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton961"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-10" x="1452.38" y="1311.93" class="cls-2 myclass" width="135.44" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton962"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-11" x="1587.82" y="1311.93" class="cls-2 myclass" width="137.41" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton963"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<polygon id="E8-12" class="cls-2 myclass" points="1865.79,1310 1860.28,1858.28 1722.08,1859.43 1722.08,1311.93 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton964"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<polygon id="E8-13" class="cls-2 myclass" points="1865.79,1310 1994.15,1310 1994.15,1859.43 1860.28,1858.28 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton965"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<polygon id="E8-14" class="cls-2 myclass" points="1994.15,1859.43 2131.16,1859.82 2131.16,1311.93 1994.15,1311.93 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton966"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-15" x="2131.16" y="1311.93" class="cls-2 myclass" width="136.23" height="547.89"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton967"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-16" x="2267.39" y="1311.93" class="cls-2 myclass" width="135.44" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton968"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-17" x="2402.84" y="1311.93" class="cls-2 myclass" width="135.44" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton969"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-18" x="2537.89" y="1311.93" class="cls-2 myclass" width="137.41" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton970"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-19" x="2676.08" y="1311.93" class="cls-2 myclass" width="132.69" height="543.27"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton971"  runat="server" CommandArgument="15_0" CommandName=""  OnClick="btn1click">
<rect id="E8-20" x="2808.77" y="1311.93" class="cls-2 myclass" width="135.44" height="543.27"/></asp:LinkButton>

 
</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrE8f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/E/E-8.jpg"  transform="matrix(0.5345 0 0 0.5345 23.6562 -176.6361)">
</image>
<rect id="outline_1_" x="222.51" y="563.2" class="cls-2 myclass" width="1086.13" height="296.64"/>

 <asp:LinkButton ID="LinkButton972"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-101" x="222.51" y="563.2" class="cls-2 myclass" width="73.47" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton973"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-102" x="295.48" y="563.2" class="cls-2 myclass" width="73.47" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton974"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-103" x="368.45" y="563.2" class="cls-2 myclass" width="73.47" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton975"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-104" x="442.46" y="563.2" class="cls-2 myclass" width="72.24" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton976"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-105" x="514.21" y="563.2" class="cls-2 myclass" width="72.24" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton977"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-106" x="585.95" y="563.2" class="cls-2 myclass" width="72.24" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton978"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-107" x="658.19" y="563.2" class="cls-2 myclass" width="73.47" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton979"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-108" x="731.16" y="563.2" class="cls-2 myclass" width="73.47" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton980"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-109" x="804.13" y="563.2" class="cls-2 myclass" width="73.47" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton981"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-110" x="877.1" y="563.2" class="cls-2 myclass" width="73.47" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton982"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-111" x="950.57" y="563.2" class="cls-2 myclass" width="69.43" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton983"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-112" x="1020" y="563.2" class="cls-2 myclass" width="75.11" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton984"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-113" x="1094.6" y="563.2" class="cls-2 myclass" width="72.24" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton985"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-114" x="1166.84" y="563.2" class="cls-2 myclass" width="70.08" height="296.64"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton986"  runat="server" CommandArgument="15_1" CommandName=""  OnClick="btn1click">
<rect id="E8-115" x="1236.92" y="563.2" class="cls-2 myclass" width="71.72" height="296.64"/></asp:LinkButton>

 
</svg>
                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrE8s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 2294.4 1622.64" style="enable-background:new 0 0 2294.4 1622.64;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
	
		
	

<g id="E-8">
    <image style="overflow:visible;" width="9560" height="6761" xlink:href="images/bhumi/E/D7- 2ND FLOOR.jpg"  transform="matrix(0.24 0 0 0.24 0 0)">
	</image>
	<rect id="outline_2_" x="213.87" y="833.48" class="cls-2 myclass" width="1605.13" height="214.92"/>

 <asp:LinkButton ID="LinkButton987"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="outline2" x="213.87" y="1093.48" class="cls-2 myclass" width="1605.13" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton988"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-227" x="1701.07" y="833.48" class="cls-2 myclass" width="115.92" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton989"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-228" x="1588.77" y="833.48" class="cls-2 myclass" width="112.3" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton990"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-229" x="1471.82" y="833.48" class="cls-2 myclass" width="116.96" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton991"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-230" x="1357.41" y="833.48" class="cls-2 myclass" width="114.44" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton992"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-231" x="1246.16" y="833.48" class="cls-2 myclass" width="111.21" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton993"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-232" x="1129.52" y="833.48" class="cls-2 myclass" width="116.64" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton994"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-233" x="1016" y="833.48" class="cls-2 myclass" width="113.52" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton995"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-234" x="902.74" y="833.48" class="cls-2 myclass" width="113.26" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton996"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-235" x="788" y="833.48" class="cls-2 myclass" width="63.04" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton997"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-236" x="669.57" y="833.48" class="cls-2 myclass" width="118.43" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton998"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-237" x="554.83" y="833.48" class="cls-2 myclass" width="114.74" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton999"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-238" x="440.09" y="833.48" class="cls-2 myclass" width="114.78" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1000"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-239" x="327.79" y="833.48" class="cls-2 myclass" width="112.3" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1001"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-240" x="211.87" y="833.48" class="cls-2 myclass" width="115.92" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1002"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-214" x="1701.07" y="1091.48" class="cls-2 myclass" width="115.92" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1003"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-213" x="1588.77" y="1091.48" class="cls-2 myclass" width="112.3" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1004"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-212" x="1471.82" y="1091.48" class="cls-2 myclass" width="116.96" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1005"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<polygon id="E8-211" class="cls-2 myclass" points="1357.41,1091.48 1471.85,1091.48 1471.85,1306.4 1365.41,1306.4 1366.04,1117.8 
		1357.41,1118.28 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1006"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-208" x="1016" y="1091.48" class="cls-2 myclass" width="113.52" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1007"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-207" x="902.74" y="1091.48" class="cls-2 myclass" width="113.26" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1008"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-206" x="850.52" y="1091.48" class="cls-2 myclass" width="50.52" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1009"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-205" x="669.57" y="1091.48" class="cls-2 myclass" width="118.43" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1010"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-204" x="554.83" y="1091.48" class="cls-2 myclass" width="114.74" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1011"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-203" x="440.09" y="1091.48" class="cls-2 myclass" width="114.78" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1012"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-202" x="327.79" y="1091.48" class="cls-2 myclass" width="112.3" height="214.92"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1013"  runat="server" CommandArgument="15_2" CommandName=""  OnClick="btn1click">
	<rect id="E8-201" x="211.87" y="1091.48" class="cls-2 myclass" width="115.92" height="214.92"/></asp:LinkButton>

 
</g>
</svg>
                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlsE10g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="E-10" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve" class="imgclass">
 <defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="7282" height="5147" xlink:href="images/bhumi/E/AEE7255B.jpg"  transform="matrix(0.24 0 0 0.24 84.96 -77.04)">
</image>


 <asp:LinkButton ID="LinkButton1014"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-01" class="cls-2 myclass" points="222.22,291.22 298.83,291.22 298.83,621.64 292.18,621.64 292.18,635.29 247.76,635.29 
	247.2,622.1 222.22,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1015"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-02" class="cls-2 myclass" points="298.54,291.22 375.16,291.22 375.16,621.64 368.5,621.64 368.5,635.29 324.08,635.29 
	323.54,622.1 298.54,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1016"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-03" class="cls-2 myclass" points="375.16,291.22 449.18,291.22 449.18,621.64 442.75,621.64 442.75,635.29 399.83,635.29 
	399.29,622.1 375.16,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1017"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-04" class="cls-2 myclass" points="449.18,291.22 523.21,291.22 523.21,621.64 516.78,621.64 516.78,635.29 473.85,635.29 
	473.31,622.1 449.18,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1018"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-05" class="cls-2 myclass" points="523.21,291.22 599.53,291.22 599.53,621.64 592.9,621.64 592.9,635.29 548.64,635.29 
	548.09,622.1 523.21,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1019"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-06" class="cls-2 myclass" points="599.53,291.22 673.56,291.22 673.56,621.64 667.13,621.64 667.13,635.29 624.2,635.29 
	623.66,622.1 599.53,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1020"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-07" class="cls-2 myclass" points="673.56,291.22 749.88,291.22 749.88,621.64 743.24,621.64 743.24,635.29 698.99,635.29 
	698.44,622.1 673.56,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1021"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-08" class="cls-2 myclass" points="749.88,291.22 823.91,291.22 823.91,621.64 817.48,621.64 817.48,635.29 774.55,635.29 
	774.01,622.1 749.88,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1022"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-09" class="cls-2 myclass" points="823.91,291.22 900.23,291.22 900.23,621.64 893.59,621.64 893.59,635.29 849.34,635.29 
	848.81,622.1 823.91,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1023"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-10" class="cls-2 myclass" points="900.23,291.22 974.26,291.22 974.26,621.64 967.83,621.64 967.83,635.29 924.9,635.29 
	924.36,622.1 900.23,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1024"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-11" class="cls-2 myclass" points="974.26,291.22 1048.29,291.22 1048.29,621.64 1041.85,621.64 1041.85,635.29 
	998.93,635.29 998.39,622.1 974.26,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1025"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-12" class="cls-2 myclass" points="1048.29,291.22 1124.61,291.22 1124.61,621.64 1117.97,621.64 1117.97,635.29 
	1073.72,635.29 1073.16,622.1 1048.29,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1026"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-13" class="cls-2 myclass" points="1124.61,291.22 1200.95,291.22 1200.95,621.64 1194.31,621.64 1194.31,635.29 
	1150.06,635.29 1149.5,622.1 1124.61,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1027"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-14" class="cls-2 myclass" points="1199.07,291.22 1274.96,291.22 1274.96,621.64 1268.36,621.64 1268.36,635.29 
	1224.34,635.29 1223.8,622.1 1199.07,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1028"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-15" class="cls-2 myclass" points="1274.96,291.22 1349.73,291.22 1349.73,621.64 1343.21,621.64 1343.21,635.29 
	1299.87,635.29 1299.34,622.1 1274.96,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1029"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-16" class="cls-2 myclass" points="1349.73,291.22 1425.31,291.22 1425.31,621.64 1418.75,621.64 1418.75,635.29 
	1374.91,635.29 1374.36,622.1 1349.73,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1030"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-17" class="cls-2 myclass" points="1425.31,291.22 1499.33,291.22 1499.33,621.64 1492.9,621.64 1492.9,635.29 
	1449.98,635.29 1449.44,622.1 1425.31,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1031"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-18" class="cls-2 myclass" points="1499.33,291.22 1575.06,291.22 1575.06,621.64 1568.5,621.64 1568.5,635.29 
	1524.56,635.29 1524.04,622.1 1499.33,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1032"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-19" class="cls-2 myclass" points="1575.06,291.22 1649.5,291.22 1649.5,621.64 1643.02,621.64 1643.02,635.29 
	1599.89,635.29 1599.35,622.1 1575.06,622.1 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1033"  runat="server" CommandArgument="56_0" CommandName=""  OnClick="btn1click">
<polygon id="E10-20" class="cls-2 myclass" points="1649.5,291.22 1726.67,291.22 1726.67,621.64 1719.97,621.64 1719.97,635.29 
	1675.22,635.29 1674.66,622.1 1649.5,622.1 "/></asp:LinkButton>

</svg>
                                           </div>
                                        </asp:Panel>


                                        <asp:Panel ID="pnlrF4g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
<svg version="1.1" id="F-4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3507" height="2479" xlink:href="images/bhumi/F/17CFE498.jpg"  transform="matrix(0.5031 0 0 0.5031 77.8268 -83.5835)">
</image>
<rect id="F4-01" x="484.96" y="305.56" class="cls-2 myclass" width="104.5" height="404.52"/>
<rect id="F4-02" x="590.23" y="305.56" class="cls-2 myclass" width="97.04" height="404.52"/>
<rect id="F4-03" x="687.52" y="305.56" class="cls-2 myclass" width="104.5" height="404.52"/>
<rect id="F4-04" x="785.92" y="305.56" class="cls-2 myclass" width="103.9" height="404.52"/>
<rect id="F4-05" x="888.48" y="305.56" class="cls-2 myclass" width="101.9" height="404.52"/>
<rect id="F4-06" x="991.12" y="305.56" class="cls-2 myclass" width="94.62" height="404.52"/>
<rect id="F4-07" x="1085.99" y="305.56" class="cls-2 myclass" width="101.9" height="404.52"/>
<rect id="F4-08" x="1188.64" y="305.56" class="cls-2 myclass" width="94.62" height="404.52"/>
<rect id="F4-09" x="1285.62" y="305.56" class="cls-2 myclass" width="101.9" height="404.52"/>
<rect id="F4-10" x="1388.26" y="305.56" class="cls-2 myclass" width="94.62" height="404.52"/>

</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrF4f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="F-4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3509" height="2480" xlink:href="images/bhumi/F/F-4 FIRST FLOOR.jpg"  transform="matrix(0.5076 0 0 0.5076 69.3932 -89.44)">
</image>
<rect id="F4-101" x="570.07" y="287.87" class="cls-2 myclass" width="103.35" height="396.65"/>
<rect id="F4-102" x="674.18" y="287.87" class="cls-2 myclass" width="95.98" height="396.65"/>
<rect id="F4-103" x="770.4" y="287.87" class="cls-2 myclass" width="103.35" height="396.65"/>
<rect id="F4-104" x="867.73" y="287.87" class="cls-2 myclass" width="102.76" height="396.65"/>
<rect id="F4-105" x="969.16" y="287.87" class="cls-2 myclass" width="100.78" height="396.65"/>
<rect id="F4-106" x="1070.67" y="287.87" class="cls-2 myclass" width="93.58" height="396.65"/>
<rect id="F4-107" x="1164.5" y="287.87" class="cls-2 myclass" width="100.78" height="396.65"/>
<rect id="F4-108" x="1266.03" y="287.87" class="cls-2 myclass" width="93.58" height="396.65"/>
<rect id="F4-109" x="1361.94" y="287.87" class="cls-2 myclass" width="100.78" height="396.65"/>
<rect id="F4-110" x="1463.46" y="287.87" class="cls-2 myclass" width="93.58" height="396.65"/>

</svg>

                                           </div>
                                        </asp:Panel>
                                       
                                        <asp:Panel ID="pnlrF6g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1066" style="enable-background:new 0 0 1920 1066;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>

	
		<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/F/F-6 ground floor.jpg"  transform="matrix(0.4498 0 0 0.4374 203.583 -24.9098)">
	</image>

 <asp:LinkButton ID="LinkButton1034"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<polygon id="F6-01" class="cls-2 myclass" points="339.18,546.07 400.39,546.07 400.39,804.92 337.31,805.28 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1035"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<polygon id="F6-02" class="cls-2 myclass" points="466.09,546.07 466.09,804.37 400.39,804.92 400.39,546.07 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1036"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<polygon id="F6-03" class="cls-2 myclass" points="468.53,545.16 529.74,545.16 529.74,804.92 466.09,804.37 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1037"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<polygon id="F6-04" class="cls-2 myclass" points="529.74,804.92 594.7,805.1 594.7,546.07 529.74,546.07 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1038"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-05" x="594.7" y="546.07" class="cls-2 myclass" width="64.77" height="259.03"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1039"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-06" x="659.65" y="546.07" class="cls-2 myclass" width="64.39" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1040"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-07" x="723.86" y="546.07" class="cls-2 myclass" width="64.39" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1041"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-08" x="788.26" y="546.07" class="cls-2 myclass" width="65.33" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1042"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-09" x="853.96" y="546.07" class="cls-2 myclass" width="63.08" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1043"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-10" x="917.04" y="546.07" class="cls-2 myclass" width="64.39" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1044"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-11" x="981.44" y="546.07" class="cls-2 myclass" width="65.33" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1045"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<polygon id="F6-12" class="cls-2 myclass" points="1113.6,545.16 1110.98,804.37 1045.27,804.92 1045.27,546.07 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1046"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<polygon id="F6-13" class="cls-2 myclass" points="1113.6,545.16 1174.62,545.16 1174.62,804.92 1110.98,804.37 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1047"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<polygon id="F6-14" class="cls-2 myclass" points="1174.62,804.92 1239.77,805.1 1239.77,546.07 1174.62,546.07 	"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1048"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-15" x="1239.77" y="546.07" class="cls-2 myclass" width="64.77" height="259.03"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1049"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-16" x="1304.53" y="546.07" class="cls-2 myclass" width="64.39" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1050"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-17" x="1368.93" y="546.07" class="cls-2 myclass" width="64.39" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1051"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-18" x="1433.14" y="546.07" class="cls-2 myclass" width="65.33" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1052"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-19" x="1498.84" y="546.07" class="cls-2 myclass" width="63.08" height="256.85"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1053"  runat="server" CommandArgument="61_0" CommandName=""  OnClick="btn1click">
	<rect id="F6-20" x="1561.93" y="546.07" class="cls-2 myclass" width="64.39" height="256.85"/></asp:LinkButton>


	

</svg>

                                           </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlrF6f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="F-6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/F/F-6.jpg"  transform="matrix(0.5475 0 0 0.5475 56.5825 -158.0953)">
</image>
<rect id="outline_1_" x="260.32" y="599.2" class="cls-2 myclass" width="1486" height="324.6"/>

 <asp:LinkButton ID="LinkButton1054"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-101" x="260.32" y="599.2" class="cls-2 myclass" width="75.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1055"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-102" x="335.03" y="599.2" class="cls-2 myclass" width="75.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1056"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-103" x="409.74" y="599.2" class="cls-2 myclass" width="75.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1057"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-104" x="485.52" y="599.2" class="cls-2 myclass" width="73.96" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1058"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-105" x="558.98" y="599.2" class="cls-2 myclass" width="73.96" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1059"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-106" x="632.43" y="599.2" class="cls-2 myclass" width="73.96" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1060"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-107" x="706.39" y="599.2" class="cls-2 myclass" width="75.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1061"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-108" x="781.1" y="599.2" class="cls-2 myclass" width="75.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1062"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-109" x="855.81" y="599.2" class="cls-2 myclass" width="75.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1063"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-110" x="930.52" y="599.2" class="cls-2 myclass" width="75.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1064"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-111" x="1003.31" y="599.2" class="cls-2 myclass" width="73.52" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1065"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-112" x="1076.83" y="599.2" class="cls-2 myclass" width="76.9" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1066"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-113" x="1153.21" y="599.2" class="cls-2 myclass" width="73.96" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1067"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-114" x="1224.1" y="599.2" class="cls-2 myclass" width="74.83" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1068"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-115" x="1302.41" y="599.2" class="cls-2 myclass" width="69.95" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1069"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-116" x="1372.35" y="599.2" class="cls-2 myclass" width="73.42" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1070"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-117" x="1445.76" y="599.2" class="cls-2 myclass" width="77.59" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1071"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-118" x="1522.85" y="599.2" class="cls-2 myclass" width="73.22" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1072"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-119" x="1596.06" y="599.2" class="cls-2 myclass" width="74.47" height="324.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1073"  runat="server" CommandArgument="61_1" CommandName=""  OnClick="btn1click">
<rect id="F6-120" x="1671.85" y="599.2" class="cls-2 myclass" width="74.47" height="324.6"/></asp:LinkButton>

</svg>

                                           </div>
                                        </asp:Panel>
                                         <asp:Panel ID="pnlrF6s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
<svg version="1.1" id="F-6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 726 483" style="enable-background:new 0 0 726 483;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/F/F-6 2nd floor.jpg"  transform="matrix(0.24 0 0 0.24 -58 -66)">
</image>

 <asp:LinkButton ID="LinkButton1074"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-220" x="658" y="249" class="cls-2 myclass" width="34.3" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1075"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-219" x="625.1" y="249" class="cls-2 myclass" width="32.9" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1076"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-218" x="592" y="249" class="cls-2 myclass" width="33.1" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1077"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-217" x="559.3" y="249" class="cls-2 myclass" width="32.7" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1078"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-216" x="525.5" y="249" class="cls-2 myclass" width="33.8" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1079"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-215" x="493.3" y="249" class="cls-2 myclass" width="32.2" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1080"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-214" x="460.7" y="249" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1081"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-213" x="426.3" y="249" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1082"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-212" x="393.7" y="249" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1083"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-211" x="360.3" y="249" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1084"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-210" x="327.7" y="249" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1085"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-209" x="294.7" y="249" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1086"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-208" x="261.7" y="249" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1087"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-207" x="228.3" y="249" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1088"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-206" x="195.7" y="249" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1089"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-205" x="161.3" y="249" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1090"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-204" x="128.7" y="248.7" class="cls-2 myclass" width="33" height="135"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1091"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-203" x="95.3" y="249" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1092"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-202" x="62.7" y="249" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1093"  runat="server" CommandArgument="61_2" CommandName=""  OnClick="btn1click">
<rect id="F6-201" x="29.7" y="249" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>



</svg>

                                           </div>
                                        </asp:Panel>
                                       
                                        <asp:Panel ID="pnlrF8g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="F-8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/F/F-8 ground floor.jpg"  transform="matrix(0.4109 0 0 0.416 282 9.6533)">
</image>

 <asp:LinkButton ID="LinkButton1094"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<polygon id="F8-01" class="cls-2 myclass" points="404.8,553.3 460.6,553.3 460.5,798.8 403.2,799 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1095"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<polygon id="F8-02" class="cls-2 myclass" points="520.5,553.3 520.5,798.3 460.5,798.8 460.6,553.3 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1096"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<polygon id="F8-03" class="cls-2 myclass" points="522.8,552.4 578.6,552.4 578.6,798.8 520.5,798.3 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1097"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<polygon id="F8-04" class="cls-2 myclass" points="578.6,798.8 637.8,798.9 637.8,553.3 578.6,553.3 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1098"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-05" x="637.8" y="553.3" class="cls-2 myclass" width="59.1" height="245.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1099"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-06" x="696.9" y="553.3" class="cls-2 myclass" width="58.7" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1100"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-07" x="755.6" y="553.3" class="cls-2 myclass" width="58.7" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1101"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-08" x="814.3" y="553.3" class="cls-2 myclass" width="59.5" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1102"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-09" x="874.1" y="553.3" class="cls-2 myclass" width="57.6" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1103"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-10" x="931.7" y="553.3" class="cls-2 myclass" width="58.7" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1104"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-11" x="990.3" y="553.3" class="cls-2 myclass" width="59.5" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1105"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<polygon id="F8-12" class="cls-2 myclass" points="1110.8,552.4 1108.6,798.3 1048.6,798.8 1048.7,553.3 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1106"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<polygon id="F8-13" class="cls-2 myclass" points="1110.8,552.4 1166.6,552.4 1166.6,798.8 1108.6,798.3 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1107"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<polygon id="F8-14" class="cls-2 myclass" points="1166.6,798.8 1225.9,798.9 1225.9,553.3 1166.6,553.3 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1108"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-15" x="1225.9" y="553.3" class="cls-2 myclass" width="59.1" height="245.6"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1109"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-16" x="1285" y="553.3" class="cls-2 myclass" width="58.7" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1110"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-17" x="1343.6" y="553.3" class="cls-2 myclass" width="58.7" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1111"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-18" x="1402.3" y="553.3" class="cls-2 myclass" width="59.5" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1112"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-19" x="1462.1" y="553.3" class="cls-2 myclass" width="57.6" height="243.4"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1113"  runat="server" CommandArgument="62_0" CommandName=""  OnClick="btn1click">
<rect id="F8-20" x="1519.7" y="553.3" class="cls-2 myclass" width="58.7" height="243.4"/></asp:LinkButton>



</svg>

                                           </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlrF8f" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="F-8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3300" height="2550" xlink:href="images/bhumi/F/F-8 first floor.jpg"  transform="matrix(0.5279 0 0 0.5279 88.8889 -133.1313)">
</image>
<rect id="outline_1_" x="282.22" y="599.2" class="cls-2 myclass" width="1440" height="295.24"/>

 <asp:LinkButton ID="LinkButton1114"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-101" x="282.22" y="599.2" class="cls-2 myclass" width="72.89" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1115"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-102" x="354.62" y="599.2" class="cls-2 myclass" width="72.89" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1116"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-103" x="427.01" y="599.2" class="cls-2 myclass" width="72.89" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1117"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-104" x="500.45" y="599.2" class="cls-2 myclass" width="71.67" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1118"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-105" x="571.64" y="599.2" class="cls-2 myclass" width="71.67" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1119"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-106" x="642.81" y="599.2" class="cls-2 myclass" width="71.67" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1120"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-107" x="714.49" y="599.2" class="cls-2 myclass" width="72.89" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1121"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-108" x="786.88" y="599.2" class="cls-2 myclass" width="72.89" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1122"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-109" x="859.28" y="599.2" class="cls-2 myclass" width="72.89" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1123"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-110" x="931.68" y="599.2" class="cls-2 myclass" width="72.89" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1124"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-111" x="1002.22" y="599.2" class="cls-2 myclass" width="71.24" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1125"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-112" x="1073.46" y="599.2" class="cls-2 myclass" width="74.52" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1126"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-113" x="1147.48" y="599.2" class="cls-2 myclass" width="71.67" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1127"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-114" x="1216.17" y="599.2" class="cls-2 myclass" width="72.51" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1128"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-115" x="1292.06" y="599.2" class="cls-2 myclass" width="67.78" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1129"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-116" x="1359.83" y="599.2" class="cls-2 myclass" width="71.14" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1130"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-117" x="1430.97" y="599.2" class="cls-2 myclass" width="75.19" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1131"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-118" x="1505.67" y="599.2" class="cls-2 myclass" width="70.95" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1132"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-119" x="1576.61" y="599.2" class="cls-2 myclass" width="72.16" height="295.24"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1133"  runat="server" CommandArgument="62_1" CommandName=""  OnClick="btn1click">
<rect id="F8-120" x="1650.06" y="599.2" class="cls-2 myclass" width="72.16" height="295.24"/></asp:LinkButton>


</svg>
                                           </div>
                                        </asp:Panel>
                                        
                                        <asp:Panel ID="pnlrF8s" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
<svg version="1.1" id="F-8" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 734.4 476" style="enable-background:new 0 0 734.4 476;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;enable-background:new    ;" width="3300" height="2550" xlink:href="images/bhumi/F/F-8 2nd floor.jpg"  transform="matrix(0.24 0 0 0.24 -46.5208 -79.4375)">
</image>

 <asp:LinkButton ID="LinkButton1134"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-220" x="670.8" y="236.8" class="cls-2 myclass" width="34.3" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1135"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-219" x="637.9" y="236.8" class="cls-2 myclass" width="32.9" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1136"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-218" x="604.8" y="236.8" class="cls-2 myclass" width="33.1" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1137"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-217" x="572.1" y="236.8" class="cls-2 myclass" width="32.7" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1138"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-216" x="538.3" y="236.8" class="cls-2 myclass" width="33.8" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1139"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-215" x="506.1" y="236.8" class="cls-2 myclass" width="32.2" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1140"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-214" x="472.1" y="236.8" class="cls-2 myclass" width="33.1" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1141"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-213" x="439.1" y="236.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1142"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-212" x="406.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1143"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-211" x="373.1" y="236.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1166"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-210" x="340.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1177"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-209" x="307.5" y="236.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1178"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-208" x="274.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1179"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-207" x="241.1" y="236.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1180"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-206" x="208.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1181"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-205" x="174.1" y="236.8" class="cls-2 myclass" width="34.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1223"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-204" x="141.5" y="236.5" class="cls-2 myclass" width="33" height="135"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1224"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-203" x="108.1" y="236.8" class="cls-2 myclass" width="33.4" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1225"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-202" x="75.5" y="236.8" class="cls-2 myclass" width="32.6" height="135.1"/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1226"  runat="server" CommandArgument="62_2" CommandName=""  OnClick="btn1click">
<rect id="F8-201" x="42.5" y="236.8" class="cls-2 myclass" width="33" height="135.1"/></asp:LinkButton>



</svg>

                                           </div>
                                        </asp:Panel>
                                       
                                        <asp:Panel ID="pnlsF10g" Visible="false" runat="server">
                                           <div class="divimgheight" style="display: block; width: 100%; text-align: center;">
                                               <svg version="1.1" id="F-10" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
<defs>
                                                        <style>
                                                            .cls-1, .cls-2 {
                                                                fill: none;
                                                                stroke-width: 0;
                                                            }

                                                            .cls-2 {
                                                                stroke-width: 0;
                                                                stroke: #000;
                                                                stroke-miterlimit: 10;
                                                            }

                                                            .myclass {
                                                                fill: transparent;
                                                            }

                                                                .myclass:hover {
                                                                    fill: #424b57;
                                                                    opacity: 0.4;
                                                                }
                                                        </style>
                                                    </defs>
<image style="overflow:visible;" width="3509" height="2480" xlink:href="images/bhumi/F/f-10.jpg"  transform="matrix(0.5105 0 0 0.5105 64.3353 -93.0146)">
</image>


 <asp:LinkButton ID="LinkButton1227"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-01" class="cls-2 myclass" points="274.89,307.02 346.94,307.02 346.94,615.61 340.68,615.61 340.68,628.36 298.92,628.36 
	298.39,616.04 274.89,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1228"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-02" class="cls-2 myclass" points="346.67,307.02 418.73,307.02 418.73,615.61 412.46,615.61 412.46,628.36 370.7,628.36 
	370.19,616.04 346.67,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1229"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-03" class="cls-2 myclass" points="418.73,307.02 488.35,307.02 488.35,615.61 482.3,615.61 482.3,628.36 441.92,628.36 
	441.42,616.04 418.73,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1230"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-04" class="cls-2 myclass" points="488.35,307.02 557.97,307.02 557.97,615.61 551.92,615.61 551.92,628.36 511.55,628.36 
	511.04,616.04 488.35,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1231"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-05" class="cls-2 myclass" points="557.97,307.02 629.75,307.02 629.75,615.61 623.5,615.61 623.5,628.36 581.89,628.36 
	581.37,616.04 557.97,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1232"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-06" class="cls-2 myclass" points="629.75,307.02 699.37,307.02 699.37,615.61 693.32,615.61 693.32,628.36 652.95,628.36 
	652.45,616.04 629.75,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1233"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-07" class="cls-2 myclass" points="699.37,307.02 771.15,307.02 771.15,615.61 764.9,615.61 764.9,628.36 723.29,628.36 
	722.77,616.04 699.37,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1234"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-08" class="cls-2 myclass" points="771.15,307.02 840.77,307.02 840.77,615.61 834.72,615.61 834.72,628.36 794.35,628.36 
	793.85,616.04 771.15,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1235"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-10" class="cls-2 myclass" points="912.55,307.02 982.16,307.02 982.16,615.61 976.12,615.61 976.12,628.36 935.76,628.36 
	935.24,616.04 912.55,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1236"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-11" class="cls-2 myclass" points="982.16,307.02 1051.79,307.02 1051.79,615.61 1045.74,615.61 1045.74,628.36 
	1005.37,628.36 1004.86,616.04 982.16,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1237"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-12" class="cls-2 myclass" points="1051.79,307.02 1123.56,307.02 1123.56,615.61 1117.33,615.61 1117.33,628.36 
	1075.7,628.36 1075.18,616.04 1051.79,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1238"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-13" class="cls-2 myclass" points="1123.56,307.02 1195.37,307.02 1195.37,615.61 1189.13,615.61 1189.13,628.36 
	1147.51,628.36 1146.98,616.04 1123.56,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1239"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-14" class="cls-2 myclass" points="1193.59,307.02 1264.96,307.02 1264.96,615.61 1258.77,615.61 1258.77,628.36 
	1217.37,628.36 1216.86,616.04 1193.59,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1240"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-15" class="cls-2 myclass" points="1264.96,307.02 1335.29,307.02 1335.29,615.61 1329.17,615.61 1329.17,628.36 
	1288.39,628.36 1287.9,616.04 1264.96,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1241"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-16" class="cls-2 myclass" points="1335.29,307.02 1406.36,307.02 1406.36,615.61 1400.21,615.61 1400.21,628.36 
	1358.97,628.36 1358.45,616.04 1335.29,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1242"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-17" class="cls-2 myclass" points="1406.36,307.02 1475.99,307.02 1475.99,615.61 1469.94,615.61 1469.94,628.36 
	1429.57,628.36 1429.06,616.04 1406.36,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1243"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-18" class="cls-2 myclass" points="1475.99,307.02 1547.21,307.02 1547.21,615.61 1541.04,615.61 1541.04,628.36 
	1499.71,628.36 1499.23,616.04 1475.99,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1244"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-19" class="cls-2 myclass" points="1547.21,307.02 1617.22,307.02 1617.22,615.61 1611.13,615.61 1611.13,628.36 
	1570.56,628.36 1570.05,616.04 1547.21,616.04 "/></asp:LinkButton>

 <asp:LinkButton ID="LinkButton1245"  runat="server" CommandArgument="63_0" CommandName=""  OnClick="btn1click">
<polygon id="F10-20" class="cls-2 myclass" points="1617.22,307.02 1689.79,307.02 1689.79,615.61 1683.49,615.61 1683.49,628.36 
	1641.4,628.36 1640.87,616.04 1617.22,616.04 "/></asp:LinkButton>

 
</svg>

                                           </div>
                                        </asp:Panel>
  
                                            
                                            
                                            <asp:Panel ID="pnlzoom" runat="server">
                                                <div style="background: white; display: inline-block; position: fixed; /* border-radius: 15px; */
    width: 45px; right: 10px; border: 1px solid #c7c7c7; bottom: 10px;">

                                                    <button type="button" style="background: transparent; border: none; /* border-radius: 15px; */
    font-size: 12px; padding: 12px; border-bottom: 1px solid #c7c7c7;"
                                                        class="mybutton" onclick="zoomin()">
                                                        <img style="width: 20px;" src="images/zoom-in3.png">
                                                    </button>
                                                    <br>

                                                    <button type="button" style="background: transparent; border: none; border-radius: 15px; font-size: 12px; padding: 12px;"
                                                        class="mybutton" onclick="zoomout()">
                                                        <img style="width: 20px;" src="images/zoom-out3.png">
                                                    </button>
                                                </div>

                                            </asp:Panel>
                                            <asp:Panel ID="pnlzoomimg" Visible="false" runat="server">
                                                <div style="background: white; display: inline-block; position: fixed; /* border-radius: 15px; */
    width: 45px; right: 10px; border: 1px solid #c7c7c7; bottom: 10px;">

                                                    <button type="button" style="background: transparent; border: none; /* border-radius: 15px; */
    font-size: 12px; padding: 12px; border-bottom: 1px solid #c7c7c7;"
                                                        class="mybutton" onclick="zoominimg()">
                                                        <img style="width: 20px;" src="images/zoom-in3.png">
                                                    </button>
                                                    <br>

                                                    <button type="button" style="background: transparent; border: none; border-radius: 15px; font-size: 12px; padding: 12px;"
                                                        class="mybutton" onclick="zoomoutimg()">
                                                        <img style="width: 20px;" src="images/zoom-out3.png">
                                                    </button>
                                                </div>

                                            </asp:Panel>
                                            <asp:Panel ID="pnlzoomimg1" Visible="false" runat="server">
                                                <div style="background: white; display: inline-block; position: fixed; /* border-radius: 15px; */
    width: 45px; right: 10px; border: 1px solid #c7c7c7; bottom: 10px;">

                                                    <button type="button" style="background: transparent; border: none; /* border-radius: 15px; */
    font-size: 12px; padding: 12px; border-bottom: 1px solid #c7c7c7;"
                                                        class="mybutton" onclick="zoominimg1()">
                                                        <img style="width: 20px;" src="images/zoom-in3.png">
                                                    </button>
                                                    <br>

                                                    <button type="button" style="background: transparent; border: none; border-radius: 15px; font-size: 12px; padding: 12px;"
                                                        class="mybutton" onclick="zoomoutimg1()">
                                                        <img style="width: 20px;" src="images/zoom-out3.png">
                                                    </button>
                                                </div>

                                            </asp:Panel>

                                            <asp:Panel ID="pnlunitdetails" Visible="false" runat="server">
                                                <hr class="bordercolor width400 horiunit" />
                                                <%--<span class="displayinline horibackwhite heading101 headingcolor">Unit Selection</span>--%>
                                               <%-- <p  class="displayinline backwhite heading101 headingcolorgrey">  </p>--%>
                                                <div>
                                                    <%--<div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101 displaysmallhide" style="color:#9e9e9e !important;font-size: 17px;font-weight: 600;">
                                                     Select Filters
                                                    </div>--%>
                                                </div>
                                                <div>

                                                    
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

                                                           <div class="divbutton" style="display:none;">
                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel28" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1331" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                            OnClick="btnstepunit_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton runat="server" visible="false" ID="LinkButton1332" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                            OnClick="btnnextcostsheet_Clicked">
                                                Continue
                                                                        </asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1331" EventName="Click" />
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1332" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>   
                                                    <span class="unitinfosmall">Unit Information</span>
                                                    <div class="unitinfosmall" style="margin-top: 15px; width: auto; text-align: center; /* border: 1px solid #e8e7e7; */
                                        /* padding: 15px 20px; */
                                        margin-bottom: 20px;">
                                                        <div style="/* margin-bottom: 15px; */
                                            display: inline-block; width: 90px; height: 63px; padding: 5px; border: 1px solid #f7f7f7;">
                                                            <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; /* margin-top: 10px; */
    display: inline-block;">
                                                                <div class="floorcss">
                                                                    <a id="LinkButton1" class="unitsubbtn bordercolor101 borderradius6 button101" href="javascript:__doPostBack('LinkButton1','')" style="border: 1px solid #b01b2a; border-color: #b01b2a !important;"></a>
                                                                </div>
                                                            </div>
                                                            <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                Available
                                                            </div>
                                                        </div>
                                                        <div style="/* margin-bottom: 15px; */
                                            display: inline-block; width: 85px; padding: 5px; border: 1px solid #f7f7f7; ">
                                                            <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; /* margin-top: 10px; */
    display: inline-block;">
                                                                <div class="floorcss">
                                                                    <a id="LinkButton127" class="unitsubbtn bordercolor101 borderradius6 button101" href="javascript:__doPostBack('LinkButton127','')" style="background: #b01b2a;"></a>
                                                                </div>
                                                            </div>
                                                            <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                Selected
                                                            </div>
                                                        </div>
                                                        <div style="/* margin-bottom: 15px; */
                                            display: inline-block; width: 85px; padding: 5px; border: 1px solid #f7f7f7;">
                                                            <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; /* margin-top: 10px; */
    display: inline-block;">
                                                                <div class="floorcss">
                                                                    <a id="LinkButtdon127" class="unitsubbtn bordercolor101 borderradius6 button101" href="#" style="background: #9e9e9e;border: none;"></a>
                                                                </div>
                                                            </div>
                                                            <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                Sold
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="margintop30  width100 width600  borderunit" >
                                                        <div class="unitinfo" style="position: absolute; z-index: 2; margin-top: 3px; right: 100px; width: 100px; text-align: center; border: 1px solid #b01b2a; padding: 20px 0px;border-radius: 5px;">
                                                            <div style="margin-bottom: 15px;">
                                                                <div style="width: 30px; padding: 0px; height: 30px; margin-top: 10px; display: inline-block;">

                                                                    <div class="floorcss">

                                                                        <asp:LinkButton runat="server" ID="LinkButton5" Style="border: 1px solid #b01b2a; border-color: #b01b2a !important;" CommandArgument="1" CommandName="1st Floor" class="unitsubbtn bordercolor101 borderradius6 button101"
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

                                                                        <asp:LinkButton runat="server" Style="background: #b01b2a;"
                                                                            ID="LinkButton4" CommandArgument="1" CommandName="1st Floor" class="unitsubbtn bordercolor101 borderradius6 button101"
                                                                            OnClick="btnfloor_Clicked">
                                                    
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                                <div style="display: block; margin-top: 2px; line-height: 20px; color: #6a798d !important; font-size: 13px; font-weight: 400;">
                                                                   Selected
                                                                </div>
                                                            </div>
                                                            <div style="margin-bottom: 15px;">

                                                                <div style="width: 30px; padding: 0px; height: 30px; border-radius: 10px; margin-top: 10px; display: inline-block;">

                                                                    <div class="floorcss">

                                                                        <asp:LinkButton runat="server" Style="background: #9e9e9e; border-color:none !important;"
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
                                                        <div style="display: none; height: 10px; width: 100%; /*background: #fff;*/ text-align: center;">
                                                        </div>
                                                        <div style="width: 100%;">

                                                            <div style="display: inline-block; padding-top: 10px; text-align: right; padding: 10px 20px 0px 0px;">

                                                                <asp:Repeater ID="rptfloor" OnItemDataBound="rptfloor_ItemDataBound" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="margintop10" style="margin-left: 15px; margin-right: 10px; display: flex; flex-wrap: wrap;">
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
                                                                                                                            style="color: #b01b2a !important;">
                                                                                                                            Unit Info
                                                                                                                        </div>
                                                                                                                    </div>

                                                                                                                    <div class=" displayblock fontsize13 fontweight600 letterspacing0 colorwhite unit106"
                                                                                                                        style="padding: 0px; text-align: left; margin-bottom: 10px;">
                                                                                                                        <asp:Label Text="" ID="lblpoparea" runat="server" />
                                                                                                                        Sq. Ft.
                                                                                                    <div class="subcolor101 fontweight400 fontsize10 letterspacing1" style="color: #cecece !important;">
                                                                                                        Build Up Area
                                                                                                    </div>
                                                                                                                    </div>
                                                                                                                    <div class="fontsize13 fontweight600 colorwhite displayblock floatleft letterspacing0 textalignleft unit104"
                                                                                                                        style="padding: 0px; width: 100%; margin-bottom: 10px;">

                                                                                                                        <asp:Label Text="" ID="lblpopcarpet" runat="server" />
                                                                                                                        Sq. Ft.
                                                                                                            <div class="subcolor101 fontweight400 fontsize10 letterspacing1"
                                                                                                                style="color: #b01b2a !important;">
                                                                                                                Carpet Area
                                                                                                            </div>
                                                                                                                    </div>
                                                                                                                    <div class=" displayblock fontsize13 fontweight600 letterspacing0 colorwhite unit106"
                                                                                                                        style="padding: 0px; text-align: left; margin-bottom: 10px;">
                                                                                                                        <asp:Label Text="s" ID="lblpopunittype" runat="server" />

                                                                                                                        <div class="subcolor101 fontweight400 fontsize10 letterspacing1" style="color: #b01b2a !important;">
                                                                                                                            Unit Type
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div class=" displayblock fontsize13 fontweight600 letterspacing0 colorwhite unit106"
                                                                                                                        style="padding: 0px; text-align: left; margin-bottom: 10px; display: none;">
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
                                                            <div style="display: inline-block; height: 10px; width: 100%; margin-top: 10px; /*background:#fff;*/ text-align: center;">
                                                            </div>
                                                            <div style="text-align: center;">
                                                                <div style="display: none; height: 50px; margin-top: 15px; width: 50px; background: #fff; text-align: center;">
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div style="display: inline-block; height: 10px; width: 100%; /*background: #fff;*/ text-align: center;">
                                                                </div>
                                                            </div>
                                                            <div style="margin-bottom: 50px; display: block;">
                                                            </div>
                                                            <%--   //next button--%>


                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel16" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                      
                                                                        <asp:LinkButton runat="server" ID="LinkButton15" Visible="false" Style="margin-right: 0px !important;margin-bottom: 20px;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                            OnClick="btnnextcostsheet_Clicked">
                                                Continue next
                                                                        </asp:LinkButton>
                                                                        <asp:Button ID="btnback" runat="server" Text="Back" OnClick="btnback_Clicked" Style="margin-right: 0px !important;"  class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"/>
                                                                         <%--<asp:LinkButton runat="server" ID="lnkback" Visible="false" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                                            OnClick="btnback_Clicked">
                                                Back
                                                                        </asp:LinkButton>--%>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <%-- //<asp:AsyncPostBackTrigger ControlID="LinkButton12" EventName="Click" />--%>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton15" EventName="Click" />
                                                                          <asp:AsyncPostBackTrigger ControlID="btnback" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>

                                                        </div>
                                                    </div>
                                                     <%-- pop up mobile  --%>
                                                        
                                                     <div id="divpopup" class="divpopup" runat="server" style="display:none;">
                                 <div class="displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding monthcharge popid">
                                                                
                                                                <div class="headercolor101 fontsize13 displaynone textalignleft">
                                                                  Unit Information

                                                                </div>

                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                           Unit info
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="" ID="lbls" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                           Build Up Area
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="" ID="lblh" runat="server" /> Sq.ft.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                           Carpet Area
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="" ID="lblr" runat="server" />Sq.ft.
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                   <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                         Unit Type
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="" ID="lble" runat="server" />
                                                                        </div>
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



                            <asp:UpdatePanel ID="uptime" runat="server">
                                <ContentTemplate>
                                    <asp:Timer ID="timerbooking" runat="server" Interval="5000" OnTick="lnktimertick_Click">
                                    </asp:Timer>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger EventName="Tick" ControlID="timerbooking" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:Panel ID="pnlcostsheet" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color: #ffffff;background-image: url(images/bg.png);">
                                    <div class="righttimer">

                                        <b>
                                            <asp:Label ID="lblunittimer" runat="server"></asp:Label></b>
                                    </div>
                                   
                                    <div class="col-sm-12 buttonaligncss">
                                         <hr class="bordercolor width400" />
                                        <div class="headingleft">
                                    <span class="displayinline backwhite heading101 costsheetheading" style="color: #b01b2a !important;">Cost Sheet</span>
                                    <div class="costsheetsub">
                                          Please go through the cost sheet
                                      
                                    </div>
                                            </div>
                                        <div class="headingright-costsheet">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel27" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton runat="server" ID="LinkButton12471" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn headingright-continue"
                                                                            OnClick="btnoffer_Clicked">
                                                Continue
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton runat="server" ID="LinkButton12461" Style="margin-right: 7px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn headingrightone"
                                                                            OnClick="btnstep1_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton12461" EventName="Click" />
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton12471" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                            </div>


                                    </div>
                                    <div class="costmobile" style="display:none;">
                                         <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Cost Sheet</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Please go through the cost sheet
                                        </div>
                                    </div>
									
									
									
									      <div>
                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel31" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1334" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn "
                                                                            OnClick="btnstep1_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1335" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn"
                                                                            OnClick="btnoffer_Clicked">
                                                Continue
                                                                        </asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1334" EventName="Click" />
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1335" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>


                                    </div>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>
                                            <div class="costsheet">
                                                <asp:Panel ID="pnlcostsheetinside" Visible="false" runat="server">
                                                    <div style="padding: 0px 10px 10px 10px !important;" class="margintop30">
                                                        <div class="displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding costsheetmargin">

                                                            <%--  <asp:Repeater ID="rptcostsheetfirst" OnItemDataBound="rptcostsheetfirst_ItemDataBound" runat="server">
                                                                    <ItemTemplate>
                                                            --%>


                                                            
                                                            <asp:Repeater ID="rptcostsheet" runat="server">
                                                                <ItemTemplate>

                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel61">
                                                                        <ContentTemplate>
                                                                            <div class="headercolor101 fontsize13 displaynone textalignleft" style="color: #b01b2a !important;">
                                                                                Cost Break Up of <asp:Label Text='<%#Eval("configname") %>' ID="Label8" runat="server" />
                                                                           </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101" style="color: #b01b2a !important;">
                                                                                        Building Type
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline" style="color: #b01b2a !important;">
                                                                                        <asp:Label Text='<%#Eval("buildingtype") %>' ID="lblbuildingtype" runat="server" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Unit
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <asp:Label Text='<%#Eval("configname") %>' ID="lblunit" runat="server" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Built Up Area (in Sq. Ft.)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <asp:Label Text='<%#Eval("builduparea")%>' ID="lblbuiltup" runat="server" />
                                                                                        <span class="headercolor101 helveticafont fontsize11">Sq.ft</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Carpet Area ( In Sq Ft)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <asp:Label Text='<%#Eval("carpetarea") %>' ID="lblcarpetarea" runat="server" />
                                                                                        <span class="headercolor101 helveticafont fontsize11">Sq.ft</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Rate ( Per Sq. Ft.)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("pricesqft") %>' ID="lblrate" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Cost
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("cost") %>' ID="lblcost" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" id="wallcharge">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Additional charge of Partition Wall Errection (1 Unit)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("wallcharges") %>' ID="lblwallcharge" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Development charges
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("developmentcharges") %>' ID="lbldevelopment" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Net Cost
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("netcost") %>' ID="lblnetcost" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Stamp Duty @ 6% of Cost (***)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("stampduty") %>' ID="lblstampduty" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Registration (*)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("regfees") %>' ID="lblregistartion" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        GST @ 12% on Net Cost + 18% on development charge)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("gst") %>' ID="lblgst" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Legal fees Lumpsum (@Rs 15000 per agreement)
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("legalfees") %>' ID="lbllegalfess" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Total Other Charges Payable at Registration
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("payreg") %>' ID="lblpayreg" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        2 years Advance Maintainance (@ Rs 1.5 per sqft of Built Up Area PM)(Including 18% GST As Applicable){**}
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("maintainance") %>' ID="lblmaintainance" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                             <hr style="border-bottom: 1px solid #b01b2a;" />
                                                                            <div class="margintop15 fontsize13 displaynone" style="">
                                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                                    <div class="cost101">
                                                                                        Total value
                                                                                    </div>
                                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                                        <asp:Label Text='<%#Eval("totalvalue") %>' ID="lbltotalvalue" runat="server" />

                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <hr style="border-bottom: 1px solid #b01b2a;" />

                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </ItemTemplate>
                                                            </asp:Repeater>


                                                            <%-- </ItemTemplate>
                                                            </asp:Repeater>--%>








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
                                                                                <asp:LinkButton runat="server" ID="LinkButton20" Style="border-radius: 0px !important; width: 30px; height: 20px; border: none; background: #424b57 !important; margin: 0px; display: none; /* pointer-events: none; */
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
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Net Consideration Value
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="" ID="lblnetvalue" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Less (-) Land abatement
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="" ID="lblless" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Total Agreement Cost
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="" ID="lblAgreement" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Taxable Value for the charging GST
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline costfontsize15">
                                                                        <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                        <asp:Label Text="" ID="lbltaxable" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    GST (<asp:Label Text="" ID="lblgstper" runat="server" />%)
                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                        <asp:Label Text="" ID="lblgst1" runat="server" />
                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div class="cost101">
                                                                        Stamp Duty (<asp:Label Text="3" ID="lblstampdutyper" runat="server" />%)
                                                                    </div>
                                                                    <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                        <span class="headercolor101 helveticafont fontsize11">₹</span>
                                                                        <asp:Label Text="4,60,950" ID="lblstampduty11" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
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
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
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
                                                            <div class="margintop15 fontsize13 displayblock costbordertop101" style="display: none !important">
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
                                                            <asp:Label Text="" ID="lblfinal" Style="display: none;" runat="server" />
                                                            <div class="margintop15 fontsize13 displaynone" style="display: none !important">
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


                                                        </div>
                                                        <asp:Panel ID="pnlrcc" runat="server">
                                                            <div class="displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding monthcharge">
                                                                <div class="headercolor101 fontsize13 displaynone textalignleft">
                                                                    Monthly charges payable following possession
                                                                </div>

                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Maintainence(additional 18% GST As Applicable)
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="Rs 1.5 / Sq Ft / Month" ID="Label1" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Varai (on Carpet)
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="Rs 1/ Sq Ft / Month" ID="Label6" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Grampanchayat Property Tax
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="Rs 3.5/Sq ft / Year" ID="Label7" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding lumpsum">
                                                                <div class="headercolor101 fontsize13 displaynone textalignleft">
                                                                    Lumpsum one time charge
                                                                </div>

                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Additional charge of Partition Wall Errection (1 Unit)
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="" ID="lbllumwallcharge" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Transformer charges Payable to Bhumi Associates (Per HP) for LT 
Electric Connection
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="Rs 5500 Per HP" ID="Label9" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Land Charges Payable in case of HT Connection (Transformer)
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <span class="headercolor101 helveticafont fontsize131">₹</span>
                                                                            <asp:Label Text="2,00,000" ID="Label10" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Tentative Power Installation cost for Industrial Meter (Payable to 
Torrent Power Limited)
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="Rs 2500 Per HP" ID="Label51" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Agents Commission for Electric Connection
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="Rs 10,000.00" ID="Label52" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Grampanchayat Property tax Charge for first Year
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="Rs 7.5 Per sqft Per Years" ID="Label53" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Grampanchayat Power NOC
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="As Applicable" ID="Label54" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop15 fontsize13 displaynone" style="">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="cost101">
                                                                            Grampanchayat Gumastha
                                                                        </div>
                                                                        <div class="headercolor101 textalignright fontweight600 float-right displayinline">
                                                                            <asp:Label Text="As Applicable" ID="Label55" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="  fontsize13 displayblock " style="margin-top: 30px;">
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
                                                                                <div style="line-height: 24px;">
                                                                                    <%#Eval("terms") %>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </div>

                                                        </asp:Panel>











                                                        <div style="display:none;">
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
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color: #ffffff;background-image: url(images/bg.png);
    ">
                                    <div class="righttimer">
                                        <div id="countdown1"></div>

                                        <asp:Label ID="lblschedule" runat="server"></asp:Label>
                                    </div>


                                         <div class="col-sm-12 buttonaligncss">
                                         <hr class="bordercolor width400" />
                                        <div class="headingleft">
                                    <span class="displayinline backwhite heading101 paymentheading">Payment Schedule of  <asp:Label Text="A-201-2BHK" ID="lblunitname" runat="server" /></span>
                                   
                                    <div class="paymentsub">
                                             Please go through the payment schedule
                                      
                                    </div>
                                            </div>
                                        <div class="headingright-payment">
                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel11" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                     <asp:LinkButton runat="server" ID="LinkButton10"
                                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn headingright-continue"
                                                                        OnClick="btnschedule_Clicked">
                                                Continue
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton runat="server" ID="LinkButton3" 
                                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn headingrightone"
                                                                        OnClick="btnstep2_Clicked">
                                                Previous
                                                                    </asp:LinkButton>
                                                                   
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="LinkButton10" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="LinkButton3" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                            </div>

                                </div>

                                     <div class="costmobile" style="display:none;">
                                         <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Payment Schedule of  <asp:Label Text="A-201-2BHK" ID="lblunitmobile" runat="server" /></span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                             Please go through the payment schedule
                                        </div>
                                    </div>
									
									
									
									      <div>
                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel33" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1338" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn"
                                                                            OnClick="btnstep2_Clicked">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1339" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn"
                                                                            OnClick="btnschedule_Clicked">
                                                Continue
                                                                        </asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1338" EventName="Click" />
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1339" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>


                                    </div>
                                   
                                   <%-- <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Payment Schedule of  <asp:Label Text="A-201-2BHK" ID="lblunitname" runat="server" /></span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Please go through the payment schedule
                                        </div>
                                    </div>--%>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div>
                                                <asp:Panel ID="pnlscheduleinside" Visible="false" runat="server">

                                                    <div style="padding: 0px 10px 10px 10px !important;" class="margintop15 lineheight25">
                                                        <div class="width600  textaligncenter marginleftauto border101 costpadding paymentwidth paymentmargin">
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
                                                                            Amount ( <span class="headercolor101 helveticafont fontsize131">₹</span> )
                                                                        </div>
                                                                        <div class="headercolor101 textaligncenter fontweight600  displayinline width180">
                                                                            Amount ( <span class="headercolor101 helveticafont fontsize131">₹</span> )
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102" style="display: none;">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <div class="schedule101">
                                                                            <asp:Label ID="lblpschedule" runat="server" Text="Booking Amount - On Booking and  Issue of Allotment Letter"></asp:Label>
                                                                        </div>
                                                                        <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 300px;">
                                                                            <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                            <asp:Label ID="lblamount" runat="server" Text=""></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="margintop5 fontsize13 displayblock costbordertop102" style="display: none;">
                                                                    <div class="subcolor101 textalignleft fontweight400">
                                                                        <%--<div class="schedule101">
                                                                                    <asp:Label ID="lbl" runat="server" Text="On execution Of Agreement to Sell"></asp:Label>
                                                                                 </div>--%>
                                                                        <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 180px;">
                                                                            <span class="subcolor101 helveticafont fontsize131">%</span>
                                                                            <asp:Label ID="Label5" runat="server" Text="10.00"></asp:Label>
                                                                        </div>
                                                                        <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 65px;">
                                                                            <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                            <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <%-- <asp:Repeater ID="rptschedule" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                            <div class="subcolor101 textalignleft fontweight400">
                                                                                <div class="schedule101">
                                                                                    <%#Eval("schedule") %>
                                                                                </div>
                                                                                <div class="subcolor101 textaligncenter fontweight600  displayinline width40">
                                                                                    <%#Eval("") %>%
                                                                                </div>
                                                                                <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                    <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                    <%#Eval("") %>%
                                                                                </div>
                                                                               <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left:50px;">
                                                                                    <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                    <%#Eval("amount1") %>
                                                                                </div>
                                                                                <div class="subcolor101 textaligncenter fontweight600  displayinline width180"  style="padding-left:53px;">
                                                                                    <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                    <%#Eval("amount2") %>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>--%>
                                                                <%--  Shed payment schedule --%>
                                                                <asp:Panel ID="pnlshedpaymentschedule" runat="server" Visible="false">
                                                                    <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Booking 25% +(12% GST)" ID="Label56" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lbltwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Registration" ID="Label57" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblregone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="0.00" ID="lblregtwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Plinth 25% +(12% GST)" ID="Label58" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblplintone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblplinttwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Arrival of Structure 20% +(12% GST) " ID="Label61" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblArrivalone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblArrivaltwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Errection of PEB Structure 20% +(12% GST)" ID="Label67" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblpebone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblpebtwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Possession 10% +(12% GST)+ Development Charges+(12% 
GST) + Advance Maintainance+ wall Charges"
                                                                                    ID="Label73" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblpossesionone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblpossesiontwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Total"
                                                                                    ID="Label59" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lbltotalone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lbltotaltwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>

                                                                <%--  RCC payment schedule --%>
                                                                <asp:Panel ID="pnlrccpaymentschedule" runat="server" Visible="false">
                                                                    <div class="margintop5 fontsize13 displayblock costbordertop102">
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Booking 25% +(12% GST)" ID="Label60" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblbookrccone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblbookrcctwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Plinth 25% +(12% GST)" ID="Label90" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblplintrccone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblplintrcctwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Registration" ID="Label69" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblregrccone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="0.00" ID="lblregrcctwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="1st Slab 15% +(12% GST)" ID="Label75" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccsslabone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccsslabtwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="2nd Slab 15% +(12% GST)" ID="Label93" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccsslabthree" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccslabfour" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="3rd Slab 15% +(12% GST)" ID="Label96" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccsslabfive" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccsslabsix" runat="server" />
                                                                            </div>
                                                                        </div>


                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Possession 10% +(12% GST)+ Development Charges+(12% 
GST) + Advance Maintainance+ wall Charges"
                                                                                    ID="Label84" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccpossesionone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrccpossesiontwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="subcolor101 textalignleft fontweight400">
                                                                            <div class="schedule101">
                                                                                <asp:Label Text="Total"
                                                                                    ID="Label87" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150">
                                                                                <span class="subcolor101 helveticafont fontsize131"></span>
                                                                                <%--  <%#Eval("") %>%--%>
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width150" style="padding-left: 25px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrcctotalone" runat="server" />
                                                                            </div>
                                                                            <div class="subcolor101 textaligncenter fontweight600  displayinline width180" style="padding-left: 53px;">
                                                                                <span class="subcolor101 helveticafont fontsize131">₹</span>
                                                                                <asp:Label Text="" ID="lblrcctotaltwo" runat="server" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>

                                                            </div>
                                                            <div class="displayblock  textaligncenter marginleftauto  padding30 " style="width: 730px; padding-top: 0px !important; display: none;">
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
                                                       <%-- <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
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
                                                        </div>--%>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlbookingform" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color: #ffffff;background-image: url(images/bg.png);
    ">
                                    <div class="righttimer">
                                        <div id="countdown2"></div>

                                        <asp:Label ID="lblbookingform" runat="server"></asp:Label>
                                    </div>
                                    <div class="buttonaligncss">
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101" style="margin-top: 20px;" >Expression of Interest (Booking)</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101 marginleft">
                                            Please fill your details
                                        </div>
                                    </div>
                                        </div>
                                    <div class="costmobile" style="display:none;">
                                         <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Expression of Interest (Booking)</span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Please fill your details
                                        </div>
                                    </div>
                                    </div>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel13" class="margintop20">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlbookingforminside" Visible="false" runat="server">

                                                <div>
                                                    <div style="padding: 0px 10px 10px 10px !important;">
                                                        <div class="fontsize11 textalignleft displayblock margintop30">

                                                            <div class="displayinline textaligncenter" style="display: block; margin-bottom: 30px;">
                                                                <asp:Panel ID="Panel6" class="displayinline marginleft5 bordercolor" runat="server">
                                                                    <div id="buyer" runat="server">
                                                                        <asp:LinkButton ID="lnkbuyer" runat="server" class="bookingbtn101 borderleft lineheight20 displayinline step101 lnkbuyer"
                                                                            OnClick="btnbuyer_Clicked">
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">people</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400" id="textcolor1" runat="server">
                                Buyer Info</div>
                        </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </asp:Panel>
                                                                <asp:Panel ID="Panel8" class="displayinline marginleft5 bordercolor" runat="server">
                                                                    <div id="communiinfo" runat="server">
                                                                        <asp:LinkButton ID="lnklocation" runat="server" class="bookingbtn102 borderleft lineheight20 displayinline step101 lnklocation"
                                                                            OnClick="btnlocation_Clicked">
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">location_on</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400 " id="textcolor2" runat="server">
                                 Communication Info</div>
                        </div>
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </asp:Panel>
                                                                <asp:Panel ID="Panel7" class="displayinline marginleft5 bordercolor" runat="server">
                                                                    <div id="Otherinfo" runat="server">
                                                                        <asp:LinkButton ID="lnkother" runat="server" class="bookingbtn101 borderleft lineheight20 displayinline step101 lnkother "
                                                                            OnClick="btnother_Clicked">
           
                        
                        <div class="fontweight600 fontsize13 displayinline letterspacing0 headingcolor" style="text-align:center;">
                           <i class="material-icons-outlined stepicon101 headingsubcolor" style="margin: 0px auto !important;">info</i><div class="letterspacing1 fontsize10 headingsubcolor fontweight400 " id="textcolor3" runat="server">
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
                                                                                   
                                                                                    class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101  comminfo"
                                                                                    OnClick="btnedit_Clicked">
                                            
                                            <div style="text-align:left;">   
                                        <span style="font-weight:600;font-size:14;display:block;"> <b style="color:#b8282e;">Applicant  <%#Eval("srno") %>.</b> <%#Eval("fname") %></span>  
                                            
                                              <span style="font-size:12px;display:block;"><%#Eval("mobileno") %></span>  
                                             <span style="font-size:12px;display:block;"><%#Eval("emailid") %></span>  
                                              <i class="material-icons-outlined stepicon101 headingsubcolor margin0" style="
  
font-size: 25px !important;
    position: absolute; 
    right: 13px;
    top: 10px;color: #b01b2a !important;
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
                                                                            <asp:LinkButton runat="server" ID="LinkButton107" 
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 coapplicant"
                                                                                OnClick="btnopenbooking_Clicked">
                                                 <i class="material-icons-outlined stepicon101 headingsubcolor margin0" style="
    display: block;
    font-size: 40px !important;color: #b01b2a !important;
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
                                                                    <div class="row margintop30 margin">
                                                                        <div class="col-md-6 col-md-offset-3 applicant">
                                                                            <div class="row popup105 ">

                                                                                <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group  title">
                                                                                    <label class="popup106lable">
                                                                                        Title</label><br />
                                                                                    <asp:DropDownList ID="ddsalutation" class="form-control select2_single fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock dropdownwidth"
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
                                                                                <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group phonenumber">

                                                                                    <label class="popup106lable code" style="margin-bottom: 10px;">
                                                                                        Country Code</label>

                                                                                    <asp:DropDownList ID="ddcountrycode" class="form-control select2_single fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock dropdownwidth"
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
                                                                    <asp:Panel ID="pnladdbookingdisplay" runat="server">
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
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn"
                                                                                OnClick="btnstep3_Clicked">
                                                Previous
                                                                            </asp:LinkButton>
                                                                            <asp:LinkButton runat="server" ID="LinkButton11" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn"
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
                                                                <div class="communinfo">
                                                                <div style="display: block; text-align: center;margin-bottom: 10px;">
                                                                    <asp:Label Text="Communnication Address" ID="Label25" class="popup106lable" runat="server" />
                                                                </div>
                                                                <div class="row margin">
                                                                    <div class="col-md-6 col-md-offset-3 borderradius">
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  form-group">
                                                                                <asp:Label Text="Building / Flat No" ID="Label26" class="popup106lable" runat="server" /><span style="color: Red;">*</span>

                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtbuilding"
                                                                                    placeholder="Enter Building / Flat No" runat="server"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  form-group">
                                                                                <asp:Label Text="Landmark" ID="Label27" class="popup106lable" runat="server" />
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtlandmark"
                                                                                    placeholder="Enter Landmark" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-12 col-lg-12  form-group">
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
                                                                <div style="display: block; text-align: center; margin-top: 30px;margin-bottom: 10px;">
                                                                    <asp:Label Text="Permanent Address" ID="Label32" class="popup106lable" runat="server" />
                                                                </div>
                                                                <div class="row margin">
                                                                    <div class="col-md-6 col-md-offset-3 borderradius">
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  form-group">
                                                                                <asp:Label Text="Building / Flat No" ID="Label33" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtbuilding1"
                                                                                    placeholder="Enter Building / Flat No" runat="server"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  form-group">
                                                                                <asp:Label Text="Landmark" ID="Label34" class="popup106lable" runat="server" />
                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtlandmark1"
                                                                                    placeholder="Enter Landmark" runat="server"></asp:TextBox>

                                                                            </div>
                                                                            <div class="col-md-12 col-lg-12  form-group">
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
                                                                    </div>
                                                                <div style="display: block; text-align: center;">
                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel20" style="display: inline-block;"
                                                                        UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:LinkButton runat="server" ID="lnkprev" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn"
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
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn"
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
                                                                <div class="row margin">
                                                                    <div class="col-md-6 col-md-offset-3 borderradius">
                                                                        <div class="row popup105 ">
                                                                            <div class="col-md-12 col-lg-12  padding0">
                                                                                <div class="popup106 borderradius10 subcolor101   fontweight600" style="margin-bottom: 0px;">
                                                                                    <asp:Label Text="Purchasing property for " ID="Label11" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                    <br />
                                                                                    <asp:RadioButton ID="rdenduse" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                        class="form-control  fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                        Text="End Use" GroupName="purchase" runat="server" />
                                                                                    <asp:RadioButton ID="rdinvestment" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                        class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth"
                                                                                        Text="Investment" GroupName="purchase" runat="server" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-12 col-lg-12 padding0">
                                                                                <div class="popup106 borderradius10 subcolor101   fontweight600" style="margin-bottom: 0px;">

                                                                                    <div class="col-md-12 col-lg-12 padding0">
                                                                                        <asp:Label Text="Will you be availing loan?" ID="Label12" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                        <br />
                                                                                        <asp:RadioButton ID="rdyes" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth"
                                                                                            Text="Yes" GroupName="loan" runat="server" OnCheckedChanged="rdyes_CheckedChanged" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdno" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth"
                                                                                            Text="No" GroupName="loan" runat="server" OnCheckedChanged="rdyes_CheckedChanged" AutoPostBack="true" />
                                                                                    </div>
                                                                                    <div runat="server" visible="false" id="divloan" class="col-md-6 col-lg-6  popup106 borderradius10 bordercolor101 subcolor101   fontweight600 ">
                                                                                        <asp:Label Text="Please Specify" ID="Label16" class="popup106lable" runat="server" />
                                                                                        <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth"
                                                                                            ID="txtloanspecify"
                                                                                            placeholder="Enter Specify Bank" runat="server"></asp:TextBox>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-12 col-lg-12 padding0">
                                                                                    <div class="popup106 borderradius10 subcolor101   fontweight600" style="margin-bottom: 0px;">

                                                                                        <asp:Label Text="How did you hear about us?" ID="Label13" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                        <br />
                                                                                        <asp:RadioButton ID="rdhoarding" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Hoarding" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdemail" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Emails" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdweb" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Website" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdbroker" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Broker" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdacq" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth" OnCheckedChanged="rdother_CheckedChanged"
                                                                                            Text="Acquaintance" GroupName="adv" runat="server" AutoPostBack="true" />
                                                                                        <asp:RadioButton ID="rdother" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth" OnCheckedChanged="rdother_CheckedChanged"
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
                                                                                        <asp:Label Text="How would you like to be connected?" ID="Label15" class="popup106lable" runat="server" /><span style="color: Red;">*</span>
                                                                                        <br />
                                                                                        <asp:RadioButton ID="rdmobile" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth"
                                                                                            Text="Mobile" GroupName="conn" runat="server" />
                                                                                        <asp:RadioButton ID="rdtele" Style="border: none !important; font-size: 12px; display: none; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth"
                                                                                            Text="Telephone" GroupName="conn" runat="server" />
                                                                                        <asp:RadioButton ID="rdltr" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock  radiowidth"
                                                                                            Text="Letters" GroupName="conn" runat="server" />
                                                                                        <asp:RadioButton ID="rdemails" Style="border: none !important; font-size: 12px; display: inline-block; width: auto; padding-left: 0px !important; padding-top: 0px; margin: 10px 0px 0px 0px; height: 20px;"
                                                                                            class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock radiowidth"
                                                                                            Text="Emails" GroupName="conn" runat="server" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6 col-lg-6  form-group">

                                                                                <asp:TextBox class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    ID="txtaddremark" Style="margin-top: 10px;"
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
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn"
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
                                                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn"
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

                            <asp:Panel ID="pnlpay" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color: #ffffff;">
                                    <div class="righttimer">
                                        <asp:Label ID="lblpay" runat="server"></asp:Label>
                                    </div>
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">
                                        <asp:Label Text="Payment" ID="lblheader" runat="server" /></span>
                                    <div>
                                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101" style="width: 500px;">
                                            <asp:Label ID="lblpaymentmsg" Text="" runat="server" />
                                        </div>
                                    </div>
                                    <asp:Panel ID="pnlsuccess" Visible="false" runat="server">
                                        <img src="images/paid1.png" class="imgsuccess" />

                                    </asp:Panel>
                                    <asp:Panel ID="pnlfailed" Visible="false" runat="server">
                                        <img src="images/failed.png" style="margin-top: 20px;" class="imgsuccess" />

                                    </asp:Panel>
                                    <asp:Panel ID="pnlthanks" Visible="false" runat="server">

                                        <div style="display: block; text-align: center;">
                                            <asp:LinkButton runat="server" ID="LinkButton38" Style="width: 200px; margin-right: 0px !important; margin-top: 40px;"
                                                class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                >
                                             Thank you
                                            </asp:LinkButton>
                                        </div>
                                    </asp:Panel>

                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlconfirmdoc" Visible="false" runat="server">
                                <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80" style="background-color: #ffffff;">
                                    <div class="righttimer">
                                        <div id="countdown3"></div>

                                        <asp:Label ID="lblconf" runat="server"></asp:Label>
                                    </div>
                                     <div class="buttonaligncss">
                                    <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101" style="margin-top: -3px;">Confirm Booking</span>
                                    </div>
                                    <div class="costmobile" style="display:none;">
                                     <hr class="bordercolor width400" />
                                    <span class="displayinline backwhite heading101">Confirm Booking</span>
                                    
                                    </div>

                                    <div style="background-color: #fff;">
                                        <%--  <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                            Confirm Booking Details
                                        </div>--%>
                                    </div>
                                </div>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel17">
                                    <ContentTemplate>
                                        <div>
                                            <div style="padding: 0px 10px 10px 10px !important; background-color: #fff;background-color: #fff;background-image: url(images/bg.png);background-size: contain;" class="margintop30">
                                                <div class="displayblock width600 textaligncenter marginleftauto  padding30 border101 costpadding">
                                                    <div class="fontsize12 displayblock" style="margin-bottom: 10px;">
                                                        <div class="subcolor101 textalignleft fontweight400">
                                                            <%--<div>
                                                                           Kindly review the below information carefully before submitting the form. On confirmation of the below form, the selected unit will be reserved for the next 20 minutes. You will then be redirected to a secured payment gateway and you are required to make payments in the next 20 minutes, else the selected unit will be released.
                                                                            </div>--%>
                                                        </div>
                                                    </div>


                                                    <div class="headercolor101 fontsize13 displayblock textalignleft" style="padding: 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px;">
                                                        Project Name : <b>The Bhumi World</b>  &nbsp; &nbsp;
                                                <div style="display: inline-block">
                                                    Unit No : <b>
                                                        <asp:Label Text="A-201-2BHK" ID="lblcunit" runat="server" /></b>
                                                </div>
                                                    </div>
                                                    <asp:Repeater ID="rptdbooking" runat="server">
                                                        <ItemTemplate>
                                                            <div class="headercolor101 fontsize13 displayblock textalignleft margintop5" style="padding: 5px 20px 5px 5px; background: #b01b2a; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 10px;">
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



                                                    <div class="headercolor101 fontsize13 displayblock textalignleft" style="padding: 5px 20px 5px 5px; background: #b01b2a; color: white; border-radius: 0px 0px 90px 0px; display: inline-block; float: left; font-size: 10px; text-transform: uppercase;">
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

                                                    <div class="headercolor101 fontsize13 displayblock textalignleft" style="padding: 5px 20px 5px 5px; background: #b01b2a; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 10px; text-transform: uppercase;">
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


                                                    <div class="headercolor101 fontsize13 displayblock textalignleft margintop5" style="padding: 5px 20px 5px 5px; background: #b01b2a; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 10px;">
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
                                                <div class="width600  textaligncenter marginleftauto costpadding">

                                                    <div class="displayblock  textaligncenter marginleftauto  padding30 termsmargin" >

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
                                                                        <div style="line-height: 24px;">
                                                                            <%#Eval("terms") %>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <div style="display: none;">

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
                                                                        The online payment of booking amount of INR 50,000/- (Indian Rupees Fifty Thousand only) (“Token Amount”) is subject to applicable laws of the Reserve Bank of India (RBI) as well as the applicable and prevailing laws, rules and regulations framed with regard to the Credit Card/ Debit Card/Net Banking.
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                                <div class="subcolor101 textalignleft fontweight400">
                                                                    <div>
                                                                        Indian Residents/Non- Resident Indians (NRIs)/Persons of Indian Origin (PIOs) who are competent to enter into a contract under the Indian Contract Act, 1872, shall be eligible to apply. The Applicant(s) shall be responsible to comply with all the statutory compliances as required from time to time under the applicable laws prevailing in India including the laws applicable to NRIs/PIOs and the Company shall not be liable for non-compliance of the same, in any manner whatsoever.   
                                                                    </div>
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
                                                                    <asp:CheckBox ID="chkterms" Style="display: inline-block; vertical-align: text-bottom;"
                                                                        runat="server" />
                                                                    <asp:Label ID="lblchkterms" runat="server" class="fontweight600"  Style="color:#000;"> I/We acknowledge that I have read, understood, and agree to all the Terms & Conditions mentioned herewith.
                                                                    </asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div style="display: block; text-align: center;" class="confirmbtn">
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel26" style="display: inline-block;"
                                                            UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" ID="LinkButton37" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                                    class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn"
                                                                    OnClick="lnkprebook_Click">
                                                  Previous
                                                                </asp:LinkButton>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="LinkButton37" EventName="Click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                        <asp:LinkButton runat="server" ID="lnkpayment" 
                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn lnkpayment1"
                                                            OnClick="btnpaymentredirect_Clicked">
                                               Confirm & Pay
                                                        </asp:LinkButton>
                                                    </div>
                                                    
                                                                 <div class="costmobile" style="display:none;">
                                       
									                              <div>
                                                            <div class="floorcss" style="margin-right: 0px; display: block; text-align: center; width: 100%;">
                                                                <asp:UpdatePanel runat="server" ID="UpdatePanel34" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton runat="server" ID="LinkButton1340" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn previousbtn"
                                                                            OnClick="lnkprebook_Click">
                                                Previous
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton runat="server"  ID="LinkButton1341" Style="margin-right: 0px !important;"
                                                                            class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn continuebtn"
                                                                            OnClick="btnpaymentredirect_Clicked">
                                                Confirm & Pay
                                                                        </asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1340" EventName="Click" />
                                                                        <asp:AsyncPostBackTrigger ControlID="LinkButton1341" EventName="Click" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </div>


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


