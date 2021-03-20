<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="rstemenu.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="Styles/SASite.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <a href="fonts/glyphicons-halflings-regular.woff"> </a>
    <a href="fonts/glyphicons-halflings-regular.ttf"> </a>
    <a href="fonts/glyphicons-halflings-regular.svg"> </a>
    <a href="fonts/glyphicons-halflings-regular.eot"> </a>
</head>
<body style="margin-left:10%;">
    <form id="form1" runat="server">
   
 

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
      
        <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="First_name" CssClass="form-control"  Placeholder="User first Name"  />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="First_name" ErrorMessage="First Name is Needed" />
              
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Last_name"  CssClass="form-control" Placeholder="User Last Name" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Last_name" ErrorMessage="Last Name is Needed" />
             
            </div>
            </div>
             <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="username"  CssClass="form-control" Placeholder="User Name" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="username" ErrorMessage="User Name is Needed" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
             ErrorMessage="Invalid Email" ControlToValidate="username" CssClass="text-danger" 
             SetFocusOnError="True"
             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
</asp:RegularExpressionValidator>
                <asp:Label ID="LabelUserErrorusername" runat="server" ForeColor="Red" />
     
            </div>
        </div>
             <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">Country  </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="country"  CssClass="form-control" Placeholder="Country Name" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="country" ErrorMessage="Country is Needed" />
              
                
            </div>
                 </div>

        <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">City  </asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="City"  CssClass="form-control" Placeholder="CIty Name" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="City" ErrorMessage="City is Needed" />    
                
            </div>
        </div>
        <asp:Panel runat="server" Visible="false" >
         <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" Placeholder="User Email Name" />
                <asp:RequiredFieldValidator runat="server" ID="email_checking" CssClass="text-danger" ControlToValidate="Email" ErrorMessage="Email is Needed" />
                <asp:Label ID="LabelUserErroremail" runat="server" ForeColor="Red" />
    
            </div>
        </div>
            </asp:Panel>

         <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">Contact No</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="contact_no" CssClass="form-control"  TextMode="Phone" Placeholder="User Phone Number" />
                 <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="contact_no" ErrorMessage="Contact Number  is Needed" />
               
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" Placeholder="Choose Password" />
                <asp:Label runat="server" Text="Password Must be greater than 6 characters" style="font-size:12px;" CssClass="text-right" ></asp:Label>
                 
                
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server"   CssClass="col-md-2 control-label">Confirm Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Confirm_passsword" CssClass="form-control" TextMode="Password" Placeholder="Re Enter Password" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Confirm_passsword" ErrorMessage="password  is Needed" />
               <asp:CompareValidator runat="server" id="cmpNumbers" controltovalidate="Password" controltocompare="Confirm_passsword" operator="Equal"  CssClass="text-danger" ErrorMessage="Password did not match !"  />
                 
                 
            </div>
        </div>
             <div class="col-md-offset-2 col-md-10"  style="margin-left:-5%;margin-bottom:5%;display:none;">   
                <asp:CheckBox runat="server" ID="ch_active_user" Checked="true" />
                 <asp:Label runat="server" >Active User</asp:Label>
                 
                 </div> 
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10" style="margin-top:1%;">
                <asp:Button runat="server" id="register_submit"  Text="Register" CssClass="btn btn-default" OnClick="register" />

                &nbsp;&nbsp;&nbsp;&nbsp;

                <a href="Login.aspx" class="btn btn-default">Cancel</a><br /><br />

            </div>
    
             

    
    </div>
        </div>
      
    </form>
</body>
</html>
