<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="AddNewTempCustomer.aspx.cs" Inherits="rstemenu.AddNewTempCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="useraccountform">

<div class="upspace"></div>

<asp:Label ID="lbl_FName" runat="server" Text="First Name"></asp:Label><br />   
<asp:TextBox ID="txt_FName" runat="server" CssClass="textbox" ></asp:TextBox>
<div class="upspace"></div>
<asp:Label ID="lbl_LName" runat="server" Text="Last Name"></asp:Label><br />   
<asp:TextBox ID="txt_LName" runat="server" CssClass="textbox" ></asp:TextBox>

<div class="upspace"></div>
<asp:Label ID="lbl_Email" runat="server" Text="Email"></asp:Label><br />
<asp:TextBox ID="txt_Email" runat="server" CssClass="textbox"> </asp:TextBox>
<asp:RegularExpressionValidator ID="REV_CompEmail" runat="server" 
         ControlToValidate="txt_Email" 
         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errormsg" ErrorMessage="Invalid Email!"></asp:RegularExpressionValidator>

<div class="upspace"></div>
<asp:Label ID="lbl_MobileNo" runat="server" Text="Contact No."></asp:Label><br />
<asp:TextBox ID="txt_MobileNo" runat="server" CssClass="textbox"> </asp:TextBox>


<div class="upspace"></div>
<asp:Label ID="lbl_BusinessName" runat="server" Text="Business Name"></asp:Label><br />
<asp:TextBox ID="txt_BusinessName" runat="server" CssClass="textbox"> </asp:TextBox>

<div class="upspace"></div>
<asp:Label ID="lbl_Country" runat="server" Text="Country"></asp:Label><br />
<asp:DropDownList ID="ddl_countrylist" runat="server" DataTextField="Name" DataValueField="Code" CssClass="ddl" ></asp:DropDownList>

<div class="upspace"></div>
<asp:Label ID="lbl_Address" runat="server" Text="Address"></asp:Label><br />
<asp:TextBox ID="txt_Address" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="4" Height="50px"></asp:TextBox><br />


<div class="upspace"></div>
<asp:Label ID="lbl_Remarks" runat="server" Text="Remarks"></asp:Label><br />
<asp:TextBox ID="txt_Remarks" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="4" Height="50px"></asp:TextBox><br />
<br /><br />
<asp:Button ID="btn_Save" runat="server" Text="Save" onclick="btn_Save_Click" />
</div>

</asp:Content>
