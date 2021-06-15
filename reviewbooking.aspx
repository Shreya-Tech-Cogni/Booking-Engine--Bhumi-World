<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reviewbooking.aspx.cs" Inherits="bramhacorp.reviewbooking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <!-- Favicon -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="shortcut icon" type="image/x-icon" href="loginscript/embassysmall.jpg">
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
    <link href="login.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        form label {
            border-bottom: none !important;
            display: inline-block;
        }

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
        
        
        <asp:Panel ID="pnlconfirmdoc" Visible="true" runat="server">
            <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80">
                <div class="righttimer">
                    <div id="countdown3"></div>

                    <asp:Label ID="lblconf" runat="server"></asp:Label>
                </div>
                <hr class="bordercolor width400" />
                <span class="displayinline backwhite heading101">Confirm Booking Agreement</span>
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
                                <div class="logo" style="position: relative; height: 100%; padding-bottom: 80px;">

                                    <img src="images/2130387.png" id="img1" runat="server" style="float: left; width: 86px;"></img>
                                    <img src="images/logo.png" id="img2" runat="server" style="float: right; width: 86px;"></img>
                                </div>
                                <%--                                <hr />--%>
                                <div class="fontsize12 displayblock" style="margin-bottom: 18px;">

                                    <div class="subcolor101 textalignleft fontweight400" style="text-align: center;">
                                        <div>
                                            <p style="font-size: 16px;">
                                                <b>NAM ESTATES PRIVATE LIMITED </br>
                                                           Booking application for allotment of apartments in "Embassy Edge"</b>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="fontsize12 displayblock" style="margin-bottom: 18px;">

                                    <div class="subcolor101 textalignleft fontweight400" style="text-align: center;">
                                        <p style="background-color: #668014; color: white; padding: 3px;">
                                            RERA ACKNOWLEDGEMENT NO. PR/KN/18049/002674
                                        </p>
                                    </div>
                                </div>



                                <div class="headercolor101 fontsize13 displayblock textalignleft" style="padding: 5px 5px; background: #f9f9f9; border-radius: 0px 0px 90px 0px; display: none;">
                                    Project Name : <b>Embassy Edge Apartments</b>  &nbsp; &nbsp;
                                                <div style="display: inline-block">
                                                    Unit No : <b>
                                                        <asp:Label Text="A-201-2BHK" ID="lblcunit" runat="server" />
                                                        <asp:Label Text="" ID="lblconfigname" runat="server" />
                                                    </b>
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

                                <div class="headercolor101 fontsize13 displayblock textalignleft margintop5" style="padding: 5px 20px 5px 5px; background: #668014; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 10px;">
                                  <b>  1. Details of Apartment</b>
                                </div>
                                </br></br>
                                
                            <div class="subcolor101 textalignleft fontweight400">
                                <table cellspacing="2" cellpadding="12" style="border-collapse: collapse; border: 1px solid #ccc; font-size: 9pt; width: 100%;">

                                    <tr>
                                        <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; width: 160px; padding: 6px;">Apartment No.</th>
                                        <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; width: 160px; padding: 6px;">Block </th>
                                        <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; width: 160px; padding: 6px;">Carpet Area(sq.ft) 
                                        </th>
                                        <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; padding: 6px;">Super Buillt Up Area(sq. ft) </th>




                                    </tr>

                                    <tr>

                                        <td style="border: 1px solid #ccc; padding: 6px;">
                                            <asp:Label ID="lblwe" runat="server" Text="120"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; padding: 6px;">
                                            <asp:Label ID="lblbasewater" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; padding: 6px;">
                                            <asp:Label ID="lblabatementwater" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #ccc; padding: 6px;">
                                            <asp:Label ID="lbltaxwater" runat="server" Text=""></asp:Label>
                                        </td>


                                    </tr>
                                </table>
                            </div>

                                <div class="headercolor101 fontsize13 displayblock textalignleft margintop5" style="padding: 5px 20px 5px 5px; background: #668014; border-radius: 0px 0px 90px 0px; color: white; display: inline-block; float: left; font-size: 10px;">
                                 <b>   2. Total Sale Consideration </b>
                                </div>


                                <div class="row margintop30" style="text-align: left">
                                    <div class="col-md-12">
                                        <div class="row popup105 ">
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">

                                                    <asp:Label Text="" ID="lbltotalsale" class="popup106lable fontsize16" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label5" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="subcolor101 textalignleft fontweight400">
                                    <table cellspacing="2" cellpadding="12" style="border-collapse: collapse; border: 1px solid #ccc; font-size: 9pt; width: 100%;">

                                        <tr>
                                            <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; width: 136px; padding: 6px;">Rate per sq. ft</th>
                                            <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; width: 138px; padding: 6px;">Floor rise charges </th>
                                            <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; width: 142px; padding: 6px;">Statutory payments/charges 
                                            </th>
                                            <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; padding: 6px; width: 129px;">Deposits and other charges</th>


                                            <th style="background-color: #668014; border: 1px solid #ccc; color: #fff; padding: 6px;">Total </th>


                                        </tr>

                                        <tr>

                                            <td style="border: 1px solid #ccc; padding: 6px;">
                                                <asp:Label ID="Label1" runat="server" Text="120"></asp:Label>
                                            </td>
                                            <td style="border: 1px solid #ccc; padding: 6px;">
                                                <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td style="border: 1px solid #ccc; padding: 6px;">
                                                <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td style="border: 1px solid #ccc; padding: 6px;">
                                                <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                                            </td>

                                            <td style="border: 1px solid #ccc; padding: 6px;">
                                                <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>



                                <div class="fontsize12 displayblock" style="margin-bottom: 5px; margin-top: 25px;">

                                    <div class="subcolor101 textalignleft fontweight400" style="text-align: center;">
                                        <p style="background-color: #668014; color: white; padding: 3px;">
                                           <b> Document to be furnished by the Applicant</b>
                                        </p>
                                    </div>
                                </div>

                                <div class="row margintop5" style="text-align: left">
                                    <div class="col-md-12">
                                        <div class="row popup105 ">
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">

                                                    <li style="margin-bottom: 3px;">
                                                        <asp:Label Text="Aadhar Card" ID="Label10" class="popup106lable fontsize16 marginbottom3" runat="server" />
                                                    </li>
                                                    <li style="margin-bottom: 3px;">
                                                        <asp:Label Text="PAN  Card" ID="Label11" class="popup106lable fontsize16 marginbottom3" runat="server" />
                                                    </li>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="fontsize12 displayblock" style="margin-bottom: 5px; margin-top: 25px;">

                                    <div class="subcolor101 textalignleft fontweight400" style="text-align: center;">
                                        <p style="background-color: #668014; color: white; padding: 3px;">
                                          <b>  Details of Promoter</b>
                                        </p>
                                    </div>
                                </div>

                                <div class="row margintop30" style="text-align: left">
                                    <div class="col-md-12">
                                        <div class="row popup105 ">
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">

                                                    <p class="popup106lable fontsize16"><b>Name of the Promoter :</b> NAM ESTATES PRIVATE LIMITED </p>
                                                    <p class="popup106lable fontsize16"><b>Address of the Promoter :</b> No. 150, 1st floor,Embassy point ,Infantry road , Banglore 560001</p>

                                                    <asp:Label Text="" ID="Label12" class="popup106lable fontsize16" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label13" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="fontsize12 displayblock" style="margin-bottom: 5px; margin-top: 25px;">

                                    <div class="subcolor101 textalignleft fontweight400" style="text-align: center;">
                                        <p style="background-color: #668014; color: white; padding: 3px;">
                                            <b>Details of Project</b>
                                        </p>
                                    </div>
                                </div>

                                <div class="subcolor101 textalignleft fontweight400">
                                    <table cellspacing="2" cellpadding="8" style="border-collapse: collapse; border: 1px solid #ccc; font-size: 9pt; width: 100%;">


                                        <tr>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;"><b>Land:</b></td>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;">
                                                <p>
                                                    Sy. No. 67/287 measuring 4.24 Acres situated at Navarathna Agrahara Village, Jala Hobli,Banglore North Taluk, 
                                                Sy. No. 72/2 measuring 2.20 Acres and Sy. No. 72/3 measuring 1033 Acress both situated at Hegganahalli village, Kasaba Hobli,Devanahalli Taluk.
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;"><b>Project:</b></td>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;">
                                                <p>Apartments</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;"><b>Sanction of Plan By:</b></td>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;">
                                                <p>BIAAPA</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;"><b>Plan Sanction/ LP No.s:</b></td>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;">
                                                <p>BIAAPA/TP/01/CC/02/2017-18 dated 26.10.2017</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;"><b>Plan Approval No.:</b></td>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;">
                                                <p>BIAAPA/TP/01/CC/02/2017-18 dated 26.10.2017</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;"><b>Website Under Real Estate(Development & Regulation)Act, 2016 :</b></td>
                                            <td style="width: 210px; border: 1px solid #ccc; padding: 3px;">
                                                <p>http://embassyedge.com/</p>
                                            </td>
                                        </tr>



                                    </table>

                                </div>

                                <div class="fontsize12 displayblock" style="margin-bottom: 5px; margin-top: 25px;">

                                    <div class="subcolor101 textalignleft fontweight400" style="text-align: center;">
                                        <p style="background-color: #668014; color: white; padding: 3px;">
                                           <b> Details of Applicants</b>
                                        </p>
                                    </div>
                                </div>
                                 <asp:Repeater ID="rptapplicant" runat="server">
                                    <ItemTemplate>
                                  
                                <div class="row margintop10" style="text-align: left">
                                    <div class="col-md-12">
                                        <div class="row popup105 ">
                                            <div class="col-md-6 col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <p class="popup106lable fontsize15" style="background: #668014; border-radius: 0px 0px 75px 0px; color: white; padding: 5px 20px 5px 5px;">
                                                        <b>First Applicant(As in the passport)</b>
                                                    </p>

                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Name: " ID="Label14" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label15" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="shreya shripad samant" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Son/Daughter/Wife of" ID="Label16" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label17" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Date of Birth" ID="Label25" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label26" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="13-03-98" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Phone No." ID="Label27" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label28" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="8975513504" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Email ID" ID="Label29" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label30" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="shreya@cognilements.com" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Income Tax/PAN/GIR NO." ID="Label31" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label32" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Status" ID="Label33" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label34" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Resident Indians" ID="Label35" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label36" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="NRI" ID="Label37" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label38" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="PIO" ID="Label51" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label52" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Citizen of" ID="Label53" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label54" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Educational qualification" ID="Label55" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label56" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Profession" ID="Label57" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label58" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>


                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Name of the company" ID="Label19" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="lbldbuilding" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Designation" ID="Label59" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label60" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                               </ItemTemplate>
                                     </asp:Repeater>

                                 <div class="row margintop10" style="text-align: left">
                                    <div class="col-md-12">
                                        <div class="row popup105 ">
                                            <div class="col-md-6 col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <p class="popup106lable fontsize15" style="background: #668014; border-radius: 0px 0px 75px 0px; color: white; padding: 5px 20px 5px 5px;">
                                                        <b>Second Applicant(As in the passport)</b>
                                                    </p>

                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Name: " ID="Label40" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label45" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="shreya shripad samant" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Son/Daughter/Wife of" ID="Label47" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label61" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Date of Birth" ID="Label63" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label65" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="13-03-98" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Phone No." ID="Label67" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label69" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="8975513504" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Email ID" ID="Label71" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label73" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="shreya@cognilements.com" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Income Tax/PAN/GIR NO." ID="Label74" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label75" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Status" ID="Label76" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label77" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Resident Indians" ID="Label78" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label79" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="NRI" ID="Label80" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label81" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="PIO" ID="Label82" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label83" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Citizen of" ID="Label84" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label85" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Educational qualification" ID="Label86" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label87" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Profession" ID="Label88" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label89" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>


                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Name of the company" ID="Label90" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label91" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Designation" ID="Label92" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label93" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                 <div class="row margintop10" style="text-align: left">
                                    <div class="col-md-12">
                                        <div class="row popup105 ">
                                            <div class="col-md-6 col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <p class="popup106lable fontsize15" style="background: #668014; border-radius: 0px 0px 75px 0px; color: white; padding: 5px 20px 5px 5px;">
                                                        <b>Third Applicant(As in the passport)</b>
                                                    </p>

                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Name: " ID="Label94" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label95" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="shreya shripad samant" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Son/Daughter/Wife of" ID="Label96" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label97" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Date of Birth" ID="Label98" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label99" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="13-03-98" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Phone No." ID="Label100" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label101" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="8975513504" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Email ID" ID="Label102" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label103" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="shreya@cognilements.com" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Income Tax/PAN/GIR NO." ID="Label104" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label105" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Status" ID="Label106" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label107" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Resident Indians" ID="Label108" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label109" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="NRI" ID="Label110" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label111" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="PIO" ID="Label112" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label113" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Citizen of" ID="Label114" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label115" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Educational qualification" ID="Label116" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label117" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-6  col-lg-6 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Profession" ID="Label118" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label119" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>


                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Name of the company" ID="Label120" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label121" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Designation" ID="Label122" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label123" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="" runat="server"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                 <div class="fontsize12 displayblock" style="margin-bottom: 5px; margin-top: 25px;">

                                    <div class="subcolor101 textalignleft fontweight400" style="text-align: center;">
                                        <p style="background-color: #668014; color: white; padding: 3px;">
                                           <b> Agreement Address (Permant Address)/b>
                                        </p>
                                    </div>
                                </div>

                                <div class="row margintop10" style="text-align: left">
                                    <div class="col-md-12">
                                        <div class="row popup105 ">
                                           
                                            <div class="col-md-12  col-lg-12 padding0">
                                                <div class="popup106  subcolor101   fontweight600">
                                                    <asp:Label Text="Name: " ID="Label14" class="popup106lable fontsize12" runat="server" />
                                                    <asp:Label class="fontsize13 fontweight600 popup107   letterspacing1001 displayblock borderbottomcolor fontsize12" ID="Label15" Style="padding-bottom: 5px; padding-left: 0px !important; padding-top: 5px; margin: 0px;"
                                                        Text="shreya shripad samant" runat="server"></asp:Label>
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
                                                TERMS AND CONDITIONS OF CANCELLATION
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Repeater ID="rptconfirmterms" runat="server">
                                        <ItemTemplate>
                                            <div class="margintop5 fontsize12 displayblock costbordertop102">
                                                <div class="subcolor101 textalignleft fontweight400" style="text-align: justify;">
                                                    <div style="line-height: 24px;">
                                                        <%#Eval("terms") %>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <div style="display: none;">

                                        <div class="margintop5 fontsize12 displayblock costbordertop102" style="display: none;">
                                            <div class="subcolor101 textalignleft fontweight400">
                                                <div>
                                                    Please read the following terms and conditions on online booking carefully as it sets out the terms of legally binding agreement between you and Embassy Ltd.
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
                                                    It is hereby clarified that the payment of Token Amount shall merely constitute an expression of interest in a particular Unit by the Applicant(s) and shall under no circumstances be construed as creation of right, title or interest in a particular Unit. On acceptance of online booking by the Company, the Applicant(s) shall be required to submit duly filled-in Booking Application Form for allotment of Unit envisaging broader terms and conditions of inter-alia allotment, payment scheme, and agreement for sale. The Booking Application Form shall be submitted by the Applicant(s) within a period of 2 (two) working days from the Company’s confirmation about the availability of Unit.     
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
                                                    Embassy Limited and/or its affiliates/subsidiaries/group entities (“Company”) reserves its right to accept or reject any online booking by the Applicant(s). 
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
                                                <asp:Label ID="lblchkterms" runat="server" class="fontweight600"> I/We acknowledge that I have read, understood, and agree to all the Terms & Conditions mentioned herewith.
                                                </asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--<div style="display: block; text-align: center;">
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
                                               Confirm & Book
                                                        </asp:LinkButton>
                                                    </div>--%>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>


    </form>
</body>
</html>
