<%@ Page Title="Log In" Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="rstemenu.Account.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title></title>
    <!--<link href="~/Styles/login-style.css" rel="stylesheet" type="text/css" />-->
<style>
body{
    background: #F7F7F7;
}
.login_content{
    position: relative;
    padding-top: 20px;
}
.login-wrapper{
    border: 0px solid #000; 
    width: 25%; 
    display: block; 
    margin: auto; 
    text-align: center;
}
.login_content h1 {
    font: normal 1.3em Helvetica, Arial, sans-serif;
    letter-spacing: -0.05em;
    line-height: 20px;
    margin: 10px 0 30px;
    position: relative;
    text-align: center;
}
.login_content h1:before, .login_content h1:after {
    content: "";
    height: 1px;
    position: absolute;
    top: 10px;
    width: 15%;
}
.login_content h1:after {
    background: #7e7e7e;
    background: linear-gradient(left, #7e7e7e 0%, #fff 100%);
    right: 0;
}
.login_content h1:before {
    background: #7e7e7e;
    background: linear-gradient(right, #7e7e7e 0%, #fff 100%);
    left: 0;
}
.login_content img{
    text-align: center;
    padding: 35px 35px 15px 35px; 
    width: 90px;
    margin: auto;
}

.login_content input[type="text"], .login_content input[type="email"], .login_content input[type="password"] {
    border-radius: 3px;
    -ms-box-shadow: 0 1px 0 #fff,0 -2px 5px rgba(0,0,0,0.08) inset;
    -o-box-shadow: 0 1px 0 #fff,0 -2px 5px rgba(0,0,0,0.08) inset;
    box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
    border: 1px solid #c8c8c8;
    color: #777;
    margin: 0 0 5px;
    width: 100%;
}
.login_content input[type="text"], .login_content input[type="email"], .login_content input[type="password"] {
    border-radius: 0;
    width: 100%;
}
.login_content input[type="text"], .login_content input[type="email"], .login_content input[type="password"] {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.login_content input[type="submit"] {
    color: #fff;
    background-color: #FE6925;/**/#337ab7;*/
    border-color: #2e6da4;
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    width: 100%;
}
.forgotPassword{
    padding-top: 10px;
}
.forgotPassword a {
    font-family: "Helvetica Neue", Roboto, Arial, "Droid Sans", sans-serif;
    color: #5A738E;
    font-size: 12px;
    margin: 10px 0 0 0;
    text-decoration: none;
}
</style>
</head>
<body>

<form id="Form1" runat="server">
<div class="login_content">
    <div class="login-wrapper">
       
        

        
  


        <asp:Login ID="LoginUser"  runat="server" EnableViewState="false" 
        RenderOuterTable="false"  
        FailureText="Invalid Username or Password.">
  <LayoutTemplate>         
      <div class="login-container" style=" border: 0px solid;">
       <img src="images/CarryKaralo-logo.png">
        <h1>Login to Back Office</h2>
              <div class="user_input_field">
                <asp:TextBox ID="username" runat="server" CssClass="textEntry"  required="required"  pattern="^[A-Za-z\0-9.&/_, ]+$"  placeholder="User Name"  title="Invalid Input Special Characters not allowed. e.g. @ # $" ></asp:TextBox> 
               
              </div>
            <div class="pass_input_field">
                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry"  TextMode="Password" placeholder="password" required="required" ></asp:TextBox>
               
            </div>
            <div></div>
            <div class="submitButton">
              <center><asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Login" ValidationGroup="LoginUserValidationGroup"/></center>
          </div>
          
           
         <div id="LoginUser_LoginUserValidationSummary" class="failureNotification" style="display:none;"></div>
          
           <span style="color: #f00; font-size: 12px; font-family: 'Open Sans', sans-serif; font-weight: bold; text-align: left;"></span>
           <div style="clear: both;"></div>
      </div>

      
  </LayoutTemplate>
</asp:Login>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>

   
</script>
    </div>
</div>
</form>


</body>
</html>