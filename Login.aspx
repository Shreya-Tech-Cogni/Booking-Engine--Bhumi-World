<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="bramhacorp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BramhaCorp</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=0.5, width=device-width, viewport-fit=cover" />
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" sizes="48x48 32x32 16x16" href="favicon.ico">
    <link rel="apple-touch-icon" type="image/png" sizes="180x180" href="misc/icon180.png">
    <link rel="icon" type="image/png" sizes="16x16" href="misc/icon16.png">
    <link rel="icon" type="image/png" sizes="32x32" href="misc/icon32.png">
    <link rel="icon" type="image/png" sizes="192x192" href="misc/icon192.png">
    <link rel="manifest" href="manifest.json">
       <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  
     
     
    <style type="text/css">
        html, body
        {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            padding: env(safe-area-inset-top) env(safe-area-inset-right) env(safe-area-inset-bottom) env(safe-area-inset-left);
        }
        
        #viewer
        {
            background-color: #000000;
            z-index: 1;
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
        }
        #preloadContainer
        {
            z-index: 2;
            position: relative;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 0.5s;
            -webkit-transition: opacity 0.5s;
            -moz-transition: opacity 0.5s;
            -o-transition: opacity 0.5s;
        }
    </style> 
    <style type="text/css"> 
        
    @import url(https://fonts.googleapis.com/css?family=Cookie|Raleway:300,700,400);
*{
	box-sizing: border-box;
	font-size: 1em;
	margin: 0;
	padding: 0;
}
::placeholder
{
    color:#c5c5c5 !important;
    text-transform:capitalize !important;
    font-weight:400 !important;
}
body{
	 	color:#9b95b8 !important;
	font-size: 13px;
	font-family:  'Montserrat', sans-serif;
	letter-spacing:0.2px;
}
.container{      
   border-radius: 5px;
    box-shadow: 0 0 1em 0 rgba(51,51,51,0.25);
    display: block;
    width: 340px;  
    padding: 15px;
    background:white;
    position: absolute;
     height:auto; 
     top: 45px;
		right: 45px;
    z-index: 999; 
} 
.submit{
	background: rgba(255,255,255,0.25);
	border: 1px solid #333;
	line-height: 1em;
	padding: 0.5em 0.5em;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
}
.submit:hover,
.submit:focus,
.submit:active,
.submit.loading{
	background: #333;
	color: #fff;
	outline: none;
}
.submit.success{
	background: #27ae60;
	border-color: #27ae60; 
	color: #fff;
}
@-webkit-keyframes spin{
	from{ transform: rotate(0deg); }
	to{ transform: rotate(360deg); }
}
@keyframes spin{
	from{ transform: rotate(0deg); }
	to{ transform: rotate(360deg); }
}
submit span.loading-spinner{
	-webkit-animation: spin 0.5s linear infinite;
	animation: spin 0.5s linear infinite;
	border: 2px solid #fff;
	border-top-color: transparent;
	border-radius: 50%;
	display: inline-block;
	height: 1em;
	width: 1em;
}

form label{
	
    border-bottom: 0.1px solid #dedede;
    display: block;
	font-size: 1.25em;
	margin-bottom: 0.5em;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
}
form label.col-one-half{
	float: left;
	width: 50%;
}
form label.col-one-half:nth-of-type(even){
	border-left: 1px solid #333;
	padding-left: 0.25em;
}
form label input{
	background: none;
	border: none;
	line-height: 1em;
	font-weight: 300;
	padding: 0.125em 0.25em; 
	font-family: 'Montserrat Bold', arial !Important;
}
form label input:focus{
	outline: none;
}
form label input:-webkit-autofill{
	background-color: transparent !important;
}
form label span.label-text{
	display: block;
	font-size: 0.5em;
	font-weight: bold;
	padding-left: 0.5em;
	text-transform: uppercase;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
}
form label.checkbox{
	border-bottom: 0;
	text-align: center;
}
form label.checkbox input{
	display: none;
}
form label.checkbox span{
	font-size: 0.5em;
}
form label.checkbox span:before{
	content: '\e157';
	display: inline-block;
	font-family: 'Glyphicons Halflings';
	font-size: 1.125em;
	padding-right: 0.25em;
	position: relative;
		top: 1px;
}
form label.checkbox input:checked + span:before{content: '\e067';}
form label.invalid{border-color: #c0392b !important;}
form label.invalid span.label-text{color: #c0392b;}
form label.password{position: relative;}
form label.password button.toggle-visibility{
	background: none;
	border: none;
	cursor: pointer;
	font-size: 0.75em;
	line-height: 1em;
	position: absolute;
		top: 50%;
		right: 0.5em;
	text-align: center;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
}
form label.password button.toggle-visibility:hover,
form label.password button.toggle-visibility:focus,
form label.password button.toggle-visibility:active{
	color: #000;
	outline: none;
}
form label.password button.toggle-visibility span{vertical-align: middle;}

h1{
	font-size: 3em;
	margin: 0 0 0.5em 0;
	text-align: center;
	font-family: 'Cookie', cursive;
}
h1 img{
	height: auto;
	margin: 0 auto;
	max-width: 240px;
	width: 100%;
}
html{
	font-size: 18px;
	height: 100%;
}

.text-center{
	text-align: center;
}
/* @media (min-width: 769px) {
   
   #divright
   {
       display:none;
   }
   #divcontainer
   {
       display:block;
   }
}
    
    @media (max-width: 768px) {
   
   #divright
   {
       display:block;
   }
   
   #divcontainer
   {
       display:none;
       
   }
    
}
    */
    </style>
</head>
<body onload="onLoad()">
    
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div id="divright" runat="server" style="position: fixed; bottom: 34px; width: 100%;
                height: 100%; width: 100%; left: 0; top: 0; text-align: center; z-index: 999;display:none">
                <asp:UpdatePanel ID="UpdatePanel5" style="height: 100%; width: 100%; left: 0; top: 0;"
                    runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:LinkButton ID="lnkdisplay" OnClick="showRegister_Click" Style="text-transform: uppercase;
                            opacity: 0.8; color: white; text-decoration: none; background: transparent; letter-spacing: 0.5px;
                            height: 100%; width: 100%; position: fixed; left: 0; top: 0; display: block;
                            padding-top: 30px;" runat="server">
    Tap Anywhere to continue
                        </asp:LinkButton>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="lnkdisplay" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div style="    display: none;
    width: 100%;">   
            <div class="container" style="border-radius: 5px;
    box-shadow: 0 0 1em 0 rgba(51,51,51,0.25);
    display: none;
    width: 340px;
    padding: 15px;
    background: white;
    position: relative;
    height: auto;
    top: 45px; 
    right:0px;
    z-index: 999;" id="divcontainer" runat="server">
                <div style="padding: 30px 20px; display: block;">
                    <div style="font-size: 22px; color: #9b95b8 !important; margin-bottom: 20px; font-weight: 600;">
                        Hey, there!
                    </div>
                    <div style="font-size: 13px; color: #9b95b8 !important; margin-bottom: 20px; font-weight: 400;
                        letter-spacing: 0.5px; line-height: 18px;">
                        Welcome, login with your registered mobile number and password for proceding further.
                        offerings.
                    </div>
                    <div style="font-size: 13px; color: #9b95b8 !important; margin-bottom: 20px; font-weight: 400;
                        letter-spacing: 0.5px; line-height: 18px;">
                        This will ensure you get the most customized experience from our team!
                    </div>
                    <div style="font-size: 13px; color: #9b95b8 !important; margin-bottom: 35px; font-weight: 600;
                        line-height: 18px; text-transform: uppercase">
                        <asp:Label ID="lbllogin" runat="server"> Login</asp:Label>
                    </div>
                    <form class="registration-form">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                           
                            <asp:Panel runat="server" ID="pnllogin">
                                <label id="Label4" runat="server" style="margin-top: 20px">
                                    <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px;
                                        font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white;
                                        vertical-align: sub;">person_outline</span>
                                    <asp:TextBox class="input" placeholder="Enter Mobile No." Style="display: inline-block;
                                        font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                        ID="txtloginname" runat="server"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers"
                                        TargetControlID="txtloginname" />
                                </label>
                                <label id="Label5" runat="server" style="margin-top: 20px">
                                    <span class="material-icons-outlined" style="display: inline-block; margin-right: 5px;
                                        font-size: 20px; color: #c5c5c5 !important; -webkit-text-stroke: 0.5px white;
                                        vertical-align: sub;">lock</span>
                                    <asp:TextBox class="input" placeholder="Enter Password" TextMode="Password" Style="display: inline-block;
                                        font-size: 13px; color: #9b95b8 !important; font-weight: 400; line-height: 20px;"
                                        ID="txtloginpass" runat="server" MaxLength="15"></asp:TextBox>
                                </label>
                            </asp:Panel>
                           
                            <asp:Label ID="lblmesg" runat="server" Style="margin-top: 20px; color: Red;"></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="text-center">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Button ID="btnlogin" Style="width: 270px; background: #43a4f1; color: white;
                                    border: none; line-height: 26px; cursor: pointer; margin-top: 25px; text-transform: uppercase;
                                    border-radius: 5px; font-weight: 600; font-size: 15px;" class="submit" runat="server"
                                    OnClick="btnlogin_Click" Text="Login" />
                             
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnlogin" EventName="Click" />
                       
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div style="font-size: 11px; color: #c7c7c7 !important; margin-top: 15px; font-weight: 400;
                        letter-spacing: 0.5px; line-height: 18px;">
                        By clicking continue, you are agreeing to our privacy policy and terms of use.
                    </div>
                    </form>
                </div>
            </div>
   
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

   </form>
   <%-- <script type="text/javascript">

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
    
    
    </script>--%>
</body>
</html>

