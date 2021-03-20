<%@ Page Title="Log In" Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="rstemenu.Account.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <title></title>

    <link href="~/Styles/loginsheet.css" rel="stylesheet" type="text/css" />

   
</head>
<!--<body style="margin:120px 400px 100px 400px; background-image:url('images/imagedarknoise.png'); background-repeat:repeat-x;">-->
<body>
<form id="Form1" runat="server">
<center>
<div>
<a href="ark-sol.com">
 <img src="images/logo.png" border="0"/>
 </a>
</div>
</center>
<center>
<div class="Logindiv">
<div style="margin:20px 20px 20px 20px;">

    <br /><br /><br /><br />
   <!-- <p>
        Please enter your username and password.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Register</asp:HyperLink> if you don't have an account.
    </p>
    -->
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" >
        <LayoutTemplate>
           
            
            <div class="accountInfo">
                <fieldset class="login">
                    <legend><font color="#FFFFFF">Account Information</font></legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" ForeColor="#FFFFFF">Username:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" ForeColor="#FFFFFF">Password:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline"><font color="#FFFFFF">Keep me logged in</font></asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"/>
                </p>
                <p>
                 <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
                <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
   
    
     
      </div>
   </div>
   
  
    </center> 
  

    </form>
    </body>
   
    </html>
