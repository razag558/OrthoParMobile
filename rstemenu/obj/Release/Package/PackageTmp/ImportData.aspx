<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="ImportData.aspx.cs" Inherits="rstemenu.ImportData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center>
<h2>Import Data Utility </h2>
<hr />

<div>
           <br />
           <asp:RequiredFieldValidator ID="RFV_Companyname" runat="server" 
            ControlToValidate="DDL_CompanyList" ErrorMessage="Business Name Required" InitialValue="0" CssClass="errormsg"  Display="Dynamic" ></asp:RequiredFieldValidator><br />
           <asp:DropDownList ID="DDL_CompanyList" runat="server" DataTextField="CompName" DataValueField="CompID" CssClass="textbox2"></asp:DropDownList>
            
            <br /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_PasscodeUtility" ErrorMessage="Passcode Required<br>"  CssClass="errormsg"  Display="Dynamic" ></asp:RequiredFieldValidator>
            <asp:Label ID="lbl_notification" runat="server" Text="Invalid Passcode!<br>" Visible="false" CssClass="errormsg"></asp:Label>
            <asp:TextBox ID="txt_PasscodeUtility" runat="server" placeholder="Enter Passcode" CssClass="textbox2" TextMode="Password" style="width:197pt;height:27px;"></asp:TextBox><br /><br />
             <asp:Button ID="btnUpload" runat="server" Text="Next"  class="submitButtona" OnClick="btnNext_Click" />
            
            </div>


</center>
            


</asp:Content>
