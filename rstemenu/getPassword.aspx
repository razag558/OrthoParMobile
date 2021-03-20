<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getPassword.aspx.cs" Inherits="rstemenu.getPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
        <link href="Styles/SASite.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <a href="fonts/glyphicons-halflings-regular.woff"> </a>
    <a href="fonts/glyphicons-halflings-regular.ttf"> </a>
    <a href="fonts/glyphicons-halflings-regular.svg"> </a>
    <a href="fonts/glyphicons-halflings-regular.eot"> </a>
    <link href="fontawesome-free-5.12.1-web/css/all.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/all.min.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/brands.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/brands.min.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/fontawesome.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/fontawesome.min.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/regular.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/regular.min.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/solid.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/solid.min.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/svg-with-js.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/svg-with-js.min.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/v4-shims.css" rel="stylesheet" />
    <link href="fontawesome-free-5.12.1-web/css/v4-shims.min.css" rel="stylesheet" />
    <script src="Scripts/verifynotify.js"></script>
    <script src="Scripts/respond.min.js"></script>
    <script src="Scripts/respond.js"></script>
    <script src="Scripts/modernizr-2.6.2.js"></script>
    <script src="Scripts/jquery.quicksearch.js"></script>
    <script src="Scripts/jquery-1.4.1.min.js"></script>
    <script src="Scripts/jquery-1.4.1.js"></script>
    <script src="Scripts/jquery-1.4.1-vsdoc.js"></script>
    
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/jquery-1.10.2.intellisense.js"></script>
    <script src="Scripts/formValidations.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/_references.js"></script>

</head>
<body>


    <form  runat="server" class="text-center" >
        <div class=" jumbotron text-info " style="margin-top:20px;  text-decoration-style:solid;">Forget Password</div>
        <hr />
          <asp:Label ID="label_response" runat="server" CssClass="text-center"   ForeColor="Red" /> 
  <div class="form-group">
    <label for="email">Email address</label>
  <center>  <asp:TextBox runat="server" TextMode="Email" class="form-control " id="txt_Email" Placeholder="Please Enter Email Address" /> </center>
      <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="text-danger" ControlToValidate="txt_Email" ErrorMessage="Please Enter Email" />
                <asp:Label ID="Label1" runat="server" ForeColor="Red" />
  </div>
        <div class="form-group">
    
      <div  class="control-label">
        <asp:HyperLink runat="server" Font-Size="small" CssClass="text-primary" ID="ForgetPasswodlink"   ViewStateMode="Disabled" NavigateUrl="~/Login.aspx">Back To Login Page</asp:HyperLink>
      
    </div>
  </div>
        
        <asp:Button runat="server" Text="Submit" CssClass="btn btn-default submitButton " OnClick="register_submit_Click"   />
  

</form>












     
      

    
   
</body>
</html>
