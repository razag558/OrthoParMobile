<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNewAccount.ascx.cs" Inherits="rstemenu.Modules.AddNewAccount" %>

<div class="useraccountform">



 <table cellpadding="5px" cellspacing="0px">



 

            <tr>
            <td align="left">
            <asp:Label ID="lbl_Fname" runat="server" Text="First Name: *"></asp:Label>
            </td>
            <td>
           <asp:TextBox ID="txt_firstname" CssClass="textbox" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator id="RequiredFieldValidator2"  ControlToValidate="txt_firstname" CssClass="failureNotification" Display="Static"  ErrorMessage="*" runat="server"/> 
          <asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_firstname" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 @#+*_-]+$" > </asp:RegularExpressionValidator>
            </td>
            </tr>


            <tr>
            <td align="left">
             <asp:Label ID="lbl_lname" runat="server" Text="Last Name:"></asp:Label>
             
            </td>
            <td>
            <asp:TextBox ID="txt_lastname" CssClass="textbox" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_lastname" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 @#+*_-]+$" > </asp:RegularExpressionValidator>
            </td>
            </tr>


            <tr>
            <td align="left">
             <asp:Label ID="lbl_position" runat="server" Text="Title/Position:"></asp:Label>
             
            </td>
            <td>
            <asp:TextBox ID="txt_title" CssClass="textbox" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_title" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 @#+*_-]+$" > </asp:RegularExpressionValidator>
            </td>
            </tr>


            <tr>
            <td align="left">
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txt_UserName">User Name:*</asp:Label>
           

            </td>
            <td>
            <asp:TextBox ID="txt_UserName" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:Label ID="lbl_chkuservalidity" runat="server" CssClass="errormsg"></asp:Label> 
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
            ControlToValidate="txt_UserName" ErrorMessage="User Name is required." 
            ToolTip="User Name is required." CssClass="errormsg" >*</asp:RequiredFieldValidator>
           
            <asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_UserName" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 @#+*_-]+$" > </asp:RegularExpressionValidator>
           
            </td>
            </tr>
            <tr>
            <td align="left">
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="txt_Password">Password:*</asp:Label>
            </td>
            <td>
            <% if (Request.QueryString["un"] != null)
               { %>
            <asp:TextBox ID="txt_Passwordu" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <%}
               else
               { %>
            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
            ControlToValidate="txt_Password" ErrorMessage="Password is required." 
            ToolTip="Password is required." CssClass="errormsg" >*</asp:RequiredFieldValidator>
            <%} %>
            </td>
            </tr>
            <tr>
            <td align="left">
            <asp:Label ID="ConfirmPasswordLabel" runat="server" 
            AssociatedControlID="txt_ConfirmPassword" >Confirm Password:*</asp:Label>
            </td>
            <td>
            <% if (Request.QueryString["un"] != null)
               { %>
            <asp:TextBox ID="txt_ConfirmPasswordu" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <%}
               else
             { %>

            <asp:TextBox ID="txt_ConfirmPassword" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
            ControlToValidate="txt_ConfirmPassword" 
            ErrorMessage="Confirm Password is required." 
            ToolTip="Confirm Password is required." CssClass="errormsg" >*</asp:RequiredFieldValidator>
            <%} %>
            </td>
            </tr>


             <tr>
            <td align="left">
            <asp:Label ID="lbl_PassCode" runat="server" >PassCode:*</asp:Label>
                
            </td>
            <td>
             <asp:TextBox ID="txt_PassCode" CssClass="textbox" runat="server"></asp:TextBox>
             
              <asp:RequiredFieldValidator ID="RFV_Passcode" runat="server" CssClass="failureNotification" ControlToValidate="txt_PassCode" Display="Dynamic">*</asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txt_PassCode" CssClass="errormsg" Display="Dynamic" ErrorMessage="Allow Only numbers" ValidationExpression="^\d+$" > </asp:RegularExpressionValidator>  
                     </td>
            </tr>
                       
           


            <tr>
            <td align="left">
            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="txt_Email">E-mail:*</asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txt_Email" runat="server" AutoCompleteType="Email" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
            ControlToValidate="txt_Email" ErrorMessage="E-mail is required." 
            ToolTip="E-mail is required." CssClass="errormsg">*</asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="REV_Email" runat="server" 
         ControlToValidate="txt_Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errormsg" ErrorMessage="Invalid Email!"></asp:RegularExpressionValidator>

         <asp:Label ID="lbl_chkemailvalidity" runat="server" Text="Email address alreday exist!" Visible="false"></asp:Label>
                     </td>
            </tr>
                       
           



            <tr>
            <td align="left">
            <asp:Label ID="Label1" runat="server" >Restaurant Name:*</asp:Label>
            

            </td>
            <td>
           <asp:DropDownList ID="DDL_CompanyList" runat="server" DataTextField="CompName" 
                    DataValueField="CompID" CssClass="ddl" 
                    onselectedindexchanged="DDL_CompanyList_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFV_Companyname" runat="server" 
            ControlToValidate="DDL_CompanyList" ErrorMessage="Restaurant Name required." InitialValue="0" CssClass="errormsg"  >*</asp:RequiredFieldValidator>
            </td>
            </tr>

            <tr>
            <td align="left">
            <asp:Label ID="Label2" runat="server" >Role Name:*</asp:Label>
            </td>
            <td>
           <asp:DropDownList ID="DDL_Rolelist" runat="server" CssClass="ddl" >
           <asp:ListItem Value="0" Text="Select Role"></asp:ListItem>
           <asp:ListItem Value="Admin" Text="Admin"></asp:ListItem>
           <asp:ListItem Value="Cashier" Text="Cashier"></asp:ListItem>
           <asp:ListItem Value="Customer" Text="Customer"></asp:ListItem>
           <asp:ListItem Value="Demo" Text="Demo"></asp:ListItem>
           <asp:ListItem Value="Kitchen" Text="Kitchen"></asp:ListItem>
           <asp:ListItem Value="Manager" Text="Manager"></asp:ListItem>
           <asp:ListItem Value="TVApp" Text="TVApp"></asp:ListItem>
               <asp:ListItem Value="Support" Text="Support"></asp:ListItem>
           
           </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="DDL_RoleList" ErrorMessage="Role Name required." InitialValue="0" CssClass="errormsg" >*</asp:RequiredFieldValidator>
            </td>
            </tr>


            <tr>
            <td align="left">
            <asp:Label ID="Label3" runat="server" >Active?:</asp:Label>
            </td>
            <td><br />
             <asp:RadioButton ID="rd_yes" GroupName="Enable"   Text="Yes" runat="server" Checked="true" /> &nbsp;|&nbsp;
             <asp:RadioButton ID="rd_no" GroupName="Enable"   Text="No" runat="server" />
            </td>
            </tr>


              
        
            
            
            
            
            
            <tr>
            <td></td>
            
            <td align="left" >

            <br /><br />
             <asp:Button ID="btn_CreateAccount" runat="server"
             Text="Submit" onclick="btn_CreateAccount_Click" />


             <asp:Button ID="btn_UpdateAccount" runat="server"
             Text="Update" onclick="btn_UpdateAccount_Click" Visible="false" />


             <br />

              <asp:CompareValidator ID="PasswordCompare" runat="server" 
            ControlToCompare="txt_Password" ControlToValidate="txt_ConfirmPassword" 
            Display="Dynamic" 
            ErrorMessage="The Password and Confirmation Password must match.<br>" CssClass="errormsg"     ></asp:CompareValidator>

            <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txt_Passwordu" ControlToValidate="txt_ConfirmPasswordu" 
            Display="Dynamic" 
            ErrorMessage="The Password and Confirmation Password must match.<br>" CssClass="errormsg"     ></asp:CompareValidator>

            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"  ></asp:Literal>

             <asp:Label ID="lbl_testmsg" runat="server" CssClass="errormsg"></asp:Label>
            </td>
            </tr>
                </table>

        
        </div>