<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sales.aspx.cs" Inherits="bramhacorp.sales" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bhumi World</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, width=device-width, viewport-fit=cover" id="metaViewport" />
    <link rel="shortcut icon" href="images/bhumi.jpg">
    <link rel="icon" sizes="48x48 32x32 16x16" href="images/bhumi.jpg"> 
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="login.css" rel="stylesheet" type="text/css" />

</head>
<body style="background: #3e3e40;">
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-173013305-4"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-190621997-1');
</script>
    <div class="smallloading" style="z-index: 4; position: absolute; background-image: url('images/bg.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center center; overflow: hidden; right: 0%; bottom: 0%; width: 100.00%; height: 100.00%">
    </div>
    <div id="preloader">
        <img src="images/logo.png" class="preloadercss" style="width: 250px; position: fixed; top: 40%; left: 50%; transform: translate(-50%, -50%); z-index: 11111; overflow: visible;" />
    </div>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
            <ProgressTemplate>
                <div class="preloader">
                    <img src="images/logo.png"  class="preloadercss" style="width: 250px; position: fixed; top: 40%; left: 50%; transform: translate(-50%, -50%); z-index: 11111; overflow: visible;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

              <div class="container " id="divcontainer" runat="server">
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
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="LowercaseLetters, UppercaseLetters, Custom"
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
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers"
                                                TargetControlID="txtmob" />
                                        </label>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="pnllogin">
                                        <label id="Label4" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">person_outline</span>
                                            <asp:TextBox class="input" placeholder="Enter Mobile No." MaxLength="10" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtloginname" runat="server"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers"
                                                TargetControlID="txtloginname" />
                                        </label>
                                        <label id="Label5" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Password" TextMode="Password" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtloginpass" runat="server" MaxLength="15"></asp:TextBox>
                                        </label>
                                    </asp:Panel>
                                    <asp:Panel Visible="false" runat="server" ID="pnlotp">
                                        <%--<label id="Label1" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Otp" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtotp" runat="server" MaxLength="6"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers"
                                                TargetControlID="txtotp" />
                                        </label>--%>
                                        <label id="Label2" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Password" TextMode="Password" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtpass" runat="server" MaxLength="15"></asp:TextBox>
                                        </label>
                                        <label id="Label3" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Confirm Password" TextMode="Password"
                                                Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtcmpass" runat="server" MaxLength="20"></asp:TextBox>
                                        </label>
                                           <label id="Label7" runat="server" style="margin-top: 20px;display:none;">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Executive Code (Optional)" 
                                                Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtexecutive" runat="server" MaxLength="10"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers"
                                                TargetControlID="txtexecutive" />
                                        </label>
                                    </asp:Panel>
                                    <asp:Panel Visible="false" runat="server" ID="pnlfor">
                                        <label id="Label6" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">call </span>
                                            <asp:TextBox class="input" placeholder="Phone Number" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtformob" runat="server" MaxLength="10"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers"
                                                TargetControlID="txtformob" />
                                        </label>
                                        <%--<label id="lblforotp" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Otp" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtforotp" runat="server" MaxLength="6"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers"
                                                TargetControlID="txtforotp" />
                                        </label>--%>
                                        <label id="lblforpass" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Password" TextMode="Password" Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtforpass" runat="server" MaxLength="20"></asp:TextBox>
                                        </label>
                                        <label id="lblforcmpass" runat="server" style="margin-top: 20px">
                                            <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px; font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white; vertical-align: sub;">lock</span>
                                            <asp:TextBox class="input" placeholder="Enter Confirm Password" TextMode="Password"
                                                Style="display: inline-block; font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                                ID="txtforcmpass" runat="server" MaxLength="20"></asp:TextBox>
                                        </label>
                                        <asp:Button ID="btnforgot" Style="width: 300px; background: #43a4f1; color: white;border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
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
                                        <asp:Button ID="btnlogin" Style="width: 300px; background: #ba302e; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                            class="submit" runat="server"
                                            OnClick="btnlogin_Click" Text="Login" />
                                        <asp:Button ID="btnregister" Style="width: 300px; background: #ba302e; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                            class="submit" runat="server"
                                            OnClick="Register_Click" Text="Continue" />
                                        <asp:Button ID="Button1" Visible="false" Style="width: 300px; background: #ba302e; color: white; border: none; line-height: 26px; cursor: pointer; margin-top: 10px; text-transform: uppercase; border-radius: 5px; font-weight: 600; font-size: 15px;"
                                            class="submit" runat="server" OnClick="Registerotp_Click" Text="Continue" />

                                       <%-- <div style="margin-top: 8px;">
                                            <asp:LinkButton ID="btnresendotp" Style="color: #43a4f1 !important; text-transform: uppercase;"
                                                Visible="false" runat="server" OnClick="resendotp_Click" Text="Resend OTP"></asp:LinkButton>
                                        </div>--%>
                                        <div style="margin-top: 8px;">
                                            <asp:LinkButton ID="lnkforget" Style="color: #ba302e !important;" runat="server"
                                                OnClick="lnkforget_Click" CommandArgument="0"> Forget Password? </asp:LinkButton>
                                        </div>
                                        <div style="margin-top: 8px;">
                                            <asp:LinkButton ID="lnklogin" Style="color: #ba302e !important;" runat="server" OnClick="lnklogin_Click"
                                                CommandArgument="0"> Don't have an account? Register </asp:LinkButton>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnlogin" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="btnregister" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                                       <%-- <asp:AsyncPostBackTrigger ControlID="btnresendotp" EventName="Click" />--%>
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
                                <a href="policy.aspx" target="_blank"><asp:Label ID="lblagree" Text="By clicking continue, you are agreeing to our privacy policy and terms of use."
                                    runat="server" /></a>
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
         <asp:HiddenField ID="hdnfldVariable" runat="server" />

    </form>
    <script type="text/javascript">

        (function ($) {
            $.fn.extend({
                donetyping: function (callback, timeout) {
                    timeout = timeout || 500;
                    var timeoutReference,
                        doneTyping = function (el) {
                            if (!timeoutReference) return;
                            timeoutReference = null;
                            callback.call(el);
                        };
                    return this.each(function (i, el) {
                        var $el = $(el);
                        $el.is(':input') && $el.on('keyup keypress', function (e) {
                            if (e.type == 'keyup' && e.keyCode != 8) return;
                            if (timeoutReference) clearTimeout(timeoutReference);
                            timeoutReference = setTimeout(function () {
                                doneTyping(el);
                            }, timeout);
                        }).on('blur', function () {
                            doneTyping(el);
                        });
                    });
                }
            });
        })(jQuery);

        formValidation = {
            init: function () {
                this.$form = $('.registration-form');
                this.$firstName = this.$form.find('input[name="firstName"]');
                this.$lastName = this.$form.find('input[name="lastName"]');
                this.$email = this.$form.find('input[name="email"]');
                this.$password = this.$form.find('input[name="password"]');
                this.$passwordToggle = this.$form.find('button.toggle-visibility');
                this.$submitButton = this.$form.find('button.submit');

                this.validatedFields = {
                    firstName: false,
                    lastName: false,
                    email: false,
                    password: false
                };

                this.bindEvents();
            },
            bindEvents: function () {
                this.$firstName.donetyping(this.validateFirstNameHandler.bind(this));
                this.$lastName.donetyping(this.validateLastNameHandler.bind(this));
                this.$email.donetyping(this.validateEmailHandler.bind(this));
                this.$password.donetyping(this.validatePasswordHandler.bind(this));
                this.$passwordToggle.mousedown(this.togglePasswordVisibilityHandler.bind(this));
                this.$passwordToggle.click(function (e) { e.preventDefault() });
                this.$form.submit(this.submitFormHandler.bind(this));
            },
            validateFirstNameHandler: function () {
                this.validatedFields.firstName = this.validateText(this.$firstName);
            },
            validateLastNameHandler: function () {
                this.validatedFields.lastName = this.validateText(this.$lastName);
            },
            validateEmailHandler: function () {
                this.validatedFields.email = this.validateText(this.$email) && this.validateEmail(this.$email);
            },
            validatePasswordHandler: function () {
                this.validatedFields.password = this.validateText(this.$password) && this.validatePassword(this.$password);
            },
            togglePasswordVisibilityHandler: function () {
                var html = '<input type="text" value="' + this.$password.val() + '">';
                var $passwordParent = this.$password.parent()
                var saved$password = this.$password.detach();
                $passwordParent.append(html);
                this.$passwordToggle.find('span').removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
                this.$passwordToggle.one('mouseup mouseleave', (function () {
                    $passwordParent.find('input').remove();
                    $passwordParent.append(saved$password);
                    this.$passwordToggle.find('span').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
                }).bind(this));
            },
            submitFormHandler: function (e) {
                e.preventDefault();
                this.validateFirstNameHandler();
                this.validateLastNameHandler();
                this.validateEmailHandler();
                this.validatePasswordHandler();
                if (this.validatedFields.firstName && this.validatedFields.lastName && this.validatedFields.email && this.validatedFields.password) {
                    // Simulate Ajax loading
                    this.$submitButton.addClass('loading').html('<span class="loading-spinner"></span>')
                    setTimeout((function () {
                        this.$submitButton.removeClass('loading').addClass('success').html('Welcome, ' + this.$firstName.val())
                    }).bind(this), 1500);
                } else {
                    this.$submitButton.text('Please Fix the Errors');
                    setTimeout((function () {
                        if (this.$submitButton.text() == 'Please Fix the Errors') {
                            this.$submitButton.text('Sign Me Up');
                        }
                    }).bind(this), 3000)
                }
            },

            validateText: function ($input) {
                $input.parent().removeClass('invalid');
                $input.parent().find('span.label-text small.error').remove();
                if ($input.val() != '') {
                    return true;
                } else {
                    $input.parent().addClass('invalid');
                    $input.parent().find('span.label-text').append(' <small class="error">(Field is empty)</small>');
                    return false;
                }
            },
            validateEmail: function ($input) {
                var regEx = /\S+@\S+\.\S+/;
                $input.parent().removeClass('invalid');
                $input.parent().find('span.label-text small.error').remove();
                if (regEx.test($input.val())) {
                    return true;
                } else {
                    $input.parent().addClass('invalid');
                    $input.parent().find('span.label-text').append(' <small class="error">(Email is invalid)</small>');
                    return false;
                }
            },
            validatePassword: function ($input) {
                $input.parent().removeClass('invalid');
                $input.parent().find('span.label-text small.error').remove();
                if ($input.val().length >= 8) {
                    return true;
                } else {
                    $input.parent().addClass('invalid');
                    $input.parent().find('span.label-text').append(' <small class="error">(Your password must longer than 7 characters)</small>');
                    return false;
                }
            }
        }.init();

    </script>

   
   <script src="jquery.min.js" type="text/javascript"></script>
  
    <script src="logincss/script.js"></script>

    <script>
        jQuery(document).ready(function ($) {

            $(window).load(function () {
                $('#preloader').fadeOut(500, function () { $(this).remove(); });
            });
        });

    </script>
    <script>
        jQuery(document).ready(function ($) {

            $(window).load(function () {
                $('#preloader').fadeOut(500, function () { $(this).remove(); });
            });
        });

        const queryString = window.location.search;
        console.log(queryString);
        const urlParams = new URLSearchParams(queryString);
        const exec = urlParams.get('exec')
        console.log(exec);
        const finalurl = "/" + exec + ".aspx"
        //http://xandau.cognilements.com/runwalmycity/Barkha-Kapoor.htm
        //window.open(finalurl);
        console.log(finalurl);
        var somefunction = function () {
            var hdnfldVariable = document.getElementById('hdnfldVariable');
            hdnfldVariable.value = finalurl;
        }
    </script>
</body>
</html>