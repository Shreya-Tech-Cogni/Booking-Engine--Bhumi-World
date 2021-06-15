<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visitform.aspx.cs" Inherits="bramhacorp.visitform" %>

<!DOCTYPE html>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <!-- Favicon -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <%-- <link rel="shortcut icon" type="image/x-icon" href="loginscript/embassysmall.jpg">--%>
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
        .container {
            top: 11rem;
            right: 38rem;
        }

        form label {
            border-bottom: none !important;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlsitevistform" runat="server" Visible="true">
                    <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>

                                <div class="righttimer">
                                    <div id="countdown2"></div>

                                    <asp:Label ID="lblbookingform" runat="server"></asp:Label>
                                </div>
                                <hr class="bordercolor width400" />
                                <span class="displayinline backwhite heading101">Site Visit form</span>
                                <div>
                                    <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101">
                                        Please fill your details
                                    </div>
                                </div>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel13" class="margintop20">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnlsitevisit1" runat="server">

                                            <div>
                                                <div style="padding: 0px 10px 10px 10px !important;">
                                                    <div class="fontsize11 textalignleft displayblock margintop30">


                                                        <asp:Panel ID="pnlsitevisit2" runat="server">
                                                            <div class="fontsize11 textaligncenter marginleftauto displayblock margintop30">
                                                            </div>
                                                            <asp:Panel ID="pnlbookingformdisplay" runat="server">

                                                                <div class="row margintop30">
                                                                    <div class="col-md-6 col-md-offset-3">
                                                                        <div class="row popup105 ">


                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                                                                <label class="popup106lable">
                                                                                    First Name<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtfirstname" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter First Name"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True" TargetControlID="txtfirstname" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" " />

                                                                            </div>

                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                                                                <label class="popup106lable">
                                                                                    Last Name<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtlastname" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Last Name"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="True" TargetControlID="txtlastname" FilterType="LowercaseLetters, UppercaseLetters, Custom" ValidChars=" " />

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
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ForeColor="Red" ErrorMessage="*" Display="Dynamic" />

                                                                            </div>
                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                                                                <label class="popup106lable">
                                                                                    Visit Date<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txtdate" TextMode="Date" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter visit date"></asp:TextBox>
                                                                            </div>
                                                                            <%-- <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                                                                <label class="popup106lable">
                                                                                    Visit Time<span style="color: Red;">*</span></label>
                                                                                <asp:TextBox ID="txttime" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter visit time"></asp:TextBox>
                                                                              
                                                                            </div>--%>
                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                                                                <label class="popup106lable">
                                                                                    Visit Time<span style="color: Red;">*</span></label>
                                                                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                                    <asp:ListItem Text="Select time" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="11 - 12 PM" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="12 - 1  PM" Value="2"></asp:ListItem>
                                                                                    <asp:ListItem Text=" 1 - 2  PM" Value="3"></asp:ListItem>
                                                                                    <asp:ListItem Text=" 2 - 3  PM" Value="4"></asp:ListItem>
                                                                                    <asp:ListItem Text=" 3 - 4  PM" Value="5"></asp:ListItem>
                                                                                    <asp:ListItem Text=" 4 - 5  PM" Value="6"></asp:ListItem>

                                                                                </asp:DropDownList>

                                                                            </div>

                                                                            <div class="Col-lg-4 col-md-4 col-sm-4 col-xs-12 form-group">
                                                                                <label class="popup106lable">
                                                                                    Remark<span style="color: Red;"></span></label>
                                                                                <asp:TextBox ID="txtremark" runat="server" class="form-control fontsize13 fontweight600 popup107 bordercolor101 letterspacing1001 displayblock"
                                                                                    placeholder="Enter Remark"></asp:TextBox>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </asp:Panel>

                                                        </asp:Panel>




                                                    </div>
                                                </div>

                                            </div>
                                        </asp:Panel>

                                        <div style="display: block; text-align: center;">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel22" style="display: inline-block;"
                                                UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:LinkButton runat="server" ID="LinkButton9" Style="margin-right: 0px !important; margin-top: 30px; margin-bottom: 30px;"
                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn"
                                                        OnClick="lnksubmit_Click">
                                                 Submit
                                                    </asp:LinkButton></br>
                                                  
                                                    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="LinkButton9" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>


                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
           <div class="back" runat="server" visible="true">                                                                                                                                                                             
                                                            <a href="inventorytemp.aspx" Style="    position: absolute;right: 40px;bottom: 73px;width: 100px;"
                                                                        class="btnclass bordercolor101 borderradius10 fontsize13 headercolor101 button101 poupbottombtn" >Back </a> 

                                                             
                                                            </div>
        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
            <ContentTemplate>

                <asp:Panel ID="pnlSuccessmsg" Visible="false" runat="server">
                    <div class="lefts102 fontsize14 fontweight600 headercolor101 margintop80">
                      <%--  <span class="displayinline backwhite heading101">
                            <asp:Label Text="Site Visit" ID="lblheader" runat="server" /></span>--%>

                        <div class="lefts103 fontsize13 subcolor101 displayinline lineheight20 headingsub101" style="width: 500px;">
                            <asp:Label ID="lblsitevisitmsg" Text="" runat="server" sty/>
                        </div>
                  
                    <asp:Panel ID="pnlsuccess" Visible="false" runat="server">
                        <img src="images/paid1.png" class="imgsuccess" />

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

            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlreg" Visible="false" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>

                            <div class="container " id="divcontainer" style="position:relative !important;margin:0 auto !important;right:auto !important;top:100px;" runat="server">             
                                <div style="padding: 15px 20px; display: block;">
                                    <div style="font-size: 13px; color: #9b95b8 !important; margin-bottom: 0px; font-weight: 600; line-height: 18px; text-transform: uppercase">
                                        <asp:Label ID="lbllogin" runat="server"> Login</asp:Label>
                                    </div>
                                    <form class="registration-form">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Panel Visible="false" runat="server" ID="pnlregi">
                                                    <label id="lblname" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">person_outline </span>
                                                        <asp:TextBox placeholder="Name" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtname" runat="server"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                                            TargetControlID="txtname" ValidChars=",./- " />
                                                    </label>
                                                    <label id="lblemailid" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">email </span>
                                                        <asp:TextBox placeholder="Email" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            type="email" ID="txtemailid" runat="server"></asp:TextBox>
                                                    </label>
                                                    <label id="lblmobile" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">call </span>
                                                        <asp:TextBox class="input" placeholder="Phone Number" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtmob" runat="server" MaxLength="10"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtmob" />
                                                    </label>
                                                </asp:Panel>
                                                <asp:Panel runat="server" ID="pnllogin">
                                                    <label id="Label4" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">person_outline</span>
                                                        <asp:TextBox class="input" placeholder="Enter Mobile No." MaxLength="10" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtloginname" runat="server"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtloginname" />
                                                    </label>
                                                    <label id="Label5" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Password" TextMode="Password" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtloginpass" runat="server" MaxLength="15"></asp:TextBox>
                                                    </label>
                                                </asp:Panel>
                                                <asp:Panel Visible="false" runat="server" ID="pnlotp">
                                                    <label id="Label1" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Otp" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtotp" runat="server" MaxLength="6"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtotp" />
                                                    </label>
                                                    <label id="Label2" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Password" TextMode="Password" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtpass" runat="server" MaxLength="15"></asp:TextBox>
                                                    </label>
                                                    <label id="Label3" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Confirm Password" TextMode="Password"
                                                            Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtcmpass" runat="server" MaxLength="15"></asp:TextBox>
                                                    </label>
                                                    <label id="Label7" runat="server" style="margin-top: 20px; display:none;">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Executive Code (Optional)"
                                                            Style="display: none; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtexecutive" runat="server" MaxLength="10"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtexecutive" />
                                                    </label>
                                                </asp:Panel>
                                                <asp:Panel Visible="false" runat="server" ID="pnlfor">
                                                    <label id="Label6" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">call </span>
                                                        <asp:TextBox class="input" placeholder="Phone Number" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtformob" runat="server" MaxLength="10"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtformob" />
                                                    </label>
                                                    <label id="lblforotp" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Otp" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtforotp" runat="server" MaxLength="6"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtforotp" />
                                                    </label>
                                                    <label id="lblforpass" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Password" TextMode="Password" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtforpass" runat="server" MaxLength="15"></asp:TextBox>
                                                    </label>
                                                    <label id="lblforcmpass" runat="server" style="margin-top: 20px">
                                                        <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                                        <asp:TextBox class="input" placeholder="Enter Confirm Password" TextMode="Password"
                                                            Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                            ID="txtforcmpass" runat="server" MaxLength="15"></asp:TextBox>
                                                    </label>
                                                    <asp:Button ID="btnforgot" Style="width: 300px; background: #43a4f1; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                                        class="submit" runat="server"
                                                        OnClick="btnforget_Click" Text="Continue" />
                                                    <asp:Button ID="btnforcon" Style="width: 300px; background: #43a4f1; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                                        class="submit" runat="server"
                                                        OnClick="btnforgetReg_Click" Text="Verify Account" />
                                                </asp:Panel>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnregister" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <div class="text-center">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>

                                                    <asp:Button ID="btnlogin" Style="width: 300px; background: #212529; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                                        class="submit" runat="server"
                                                        OnClick="btnlogin_Click" Text="Login" />
                                                    <asp:Button ID="btnregister" Style="width: 300px; background: #212529; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                                        class="submit" runat="server"
                                                        OnClick="Register_Click" Text="Continue" />
                                                    <asp:Button ID="Button1" Visible="false" Style="width: 300px; background: #212529; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                                        class="submit" runat="server" OnClick="Registerotp_Click" Text="Verify OTP" />

                                                    <div style="margin-top: 8px;">
                                                        <asp:LinkButton ID="btnresendotp" Style="color: #212529 !important; text-transform: uppercase;"
                                                            Visible="false" runat="server" OnClick="resendotp_Click" Text="Resend OTP"></asp:LinkButton>
                                                    </div>
                                                    <div style="margin-top: 8px;">
                                                        <asp:LinkButton ID="lnkforget" Style="color: #212529 !important;" runat="server"
                                                            OnClick="lnkforget_Click" CommandArgument="0"> Forget Password? </asp:LinkButton>
                                                    </div>
                                                    <div style="margin-top: 8px;">
                                                        <asp:LinkButton ID="lnklogin" Style="color: #212529 !important;" runat="server" OnClick="lnklogin_Click"
                                                            CommandArgument="0"> Don't have an account? Register </asp:LinkButton>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnlogin" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnregister" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnresendotp" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="lnkforget" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="lnklogin" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <div style="margin-top: 8px;">
                                                <asp:Label ID="lblmesg" runat="server" Style="color: Red;"></asp:Label>
                                            </div>
                                            <div style="margin-top: 8px;">
                                                <asp:Label ID="lblresend" runat="server" Visible="false">Didn’t received otp yet? Wait for few more seconds.</asp:Label>
                                            </div>
                                        </div>
                                        <div style="font-size: 11px; color: #c7c7c7 !important; margin-top: 15px; font-weight: 400; letter-spacing: 0.5px; line-height: 18px;">
                                            <asp:Label ID="lblagree" Text="By clicking continue, you are agreeing to our privacy policy and terms of use."
                                                runat="server" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                        <ContentTemplate>

                            <asp:Timer ID="timerresendotp" runat="server" Enabled="false" Interval="15000" OnTick="timerresendotp_Tick">
                            </asp:Timer>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="timerresendotp" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>
 
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>


    </form>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="css/bootstrap.min.js" type="text/javascript"></script>
    <script src="plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
    <script type="text/javascript" src='https://unitegallery.net/unitegallery/js/unitegallery.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/unitegallery/1.7.31/themes/default/ug-theme-default.min.js'></script>

    <script src="logincss/script.js"></script>
</body>
</html>
