<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCompanies.ascx.cs" Inherits="rstemenu.Modules.EditCompanies" %>


<link rel="stylesheet" href="../../DatePicker/themes/base/jquery.ui.all.css">
<script src="../../DatePicker/jquery-1.7.1.js"></script>
<script src="../../DatePicker/ui/jquery.ui.core.js"></script>
<script src="../../DatePicker/ui/jquery.ui.widget.js"></script>
<script src="../../DatePicker/ui/jquery.ui.datepicker.js"></script>

<link href="../../DatePicker/demos.css" rel="stylesheet" type="text/css" />


<script>
    $(function () {
        $("#MainContent_ctrl_editcompany_txt_CompExpireDate").datepicker();
        $("#MainContent_ctrl_editcompany_txt_CompMobileExpireDate").datepicker();
        $("#MainContent_ctrl_editcompany_txt_CompWebExpireDate").datepicker();
    });
</script>

<div class="StartPage">

<div style="float:right;margin-right:40px">

<asp:Button ID="btn_back" runat="server" Text="Back"   
        CausesValidation="false" onclick="btn_back_Click"  />

        </div>


 <h2> Manage Restaurant / Add New Restaurant</h2>
  <hr  style="border: 1px solid #CCC; "  />
 <br />

 <div class="upspace"></div>
<asp:Label ID="lbl_CompName" runat="server" Text="Restaurant Name"></asp:Label><br />
<asp:TextBox ID="txt_CompName" runat="server" CssClass="textbox" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RFD_CompName" runat="server" ControlToValidate="txt_CompName" ErrorMessage="Plesae fill Restaurant Name" CssClass="errormsg">*</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator001" runat="server" ControlToValidate="txt_CompName" CssClass="errormsg" Display="Dynamic" ErrorMessage="<br>Special Characters are not allowed(e.g ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 @#+*_-]+$" > </asp:RegularExpressionValidator>
<div class="upspace"></div>
<asp:Label ID="lbl_CompEmail" runat="server" Text="Restaurant Email"></asp:Label>
<asp:Label ID="lbl_emailnoti" runat="server" Text=" Email address already exist in another Restaurant!" CssClass="errormsg" Visible="false"></asp:Label> 
<br />

<asp:TextBox ID="txt_CompEmail" runat="server" CssClass="textbox"></asp:TextBox>
<asp:RequiredFieldValidator ID="RFV_CompEmail" runat="server" ControlToValidate="txt_CompEmail" ErrorMessage="Plesae fill Email" CssClass="errormsg">*</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="REV_CompEmail" runat="server" 
         ControlToValidate="txt_CompEmail" 
         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errormsg" ErrorMessage="Invalid Email!"></asp:RegularExpressionValidator>


<div class="upspace"></div>
<asp:Label ID="lbl_restaurantBindCode" runat="server" Text="Restaurant Code"></asp:Label><br />
<asp:TextBox ID="txt_RestaurantCode" runat="server" CssClass="textbox"  Enabled="false" style="width:287pt !important;"> </asp:TextBox>

<asp:Button ID="btn_CreateRandomCode" runat="server" Text="Create Random Code" 
        onclick="btn_CreateRandomCode_Click" CausesValidation="false" Enabled="false"/>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_RestaurantCode" ErrorMessage="Plesae fill Security Code" CssClass="errormsg">*</asp:RequiredFieldValidator>



<div class="upspace"></div>
<asp:Label ID="lbl_CompCurrency" runat="server" Text="Select Currency"></asp:Label><br />
<asp:DropDownList ID="ddl_CompCurrency" runat="server" CssClass="ddl">
<asp:ListItem Value="£" >Pound (£) </asp:ListItem>
<asp:ListItem Value="$" >Dollar ($)</asp:ListItem>
<asp:ListItem Value="€" >Euro (€)</asp:ListItem>
<asp:ListItem Value="Rs" >Rupees(Rs)</asp:ListItem>
<asp:ListItem Value="¥" >Yen (¥)</asp:ListItem>
<asp:ListItem Value="AED" >United Arab Emirates (AED)</asp:ListItem>
<asp:ListItem Value="SAR">Saudi Arabia Riyal(SAR)</asp:ListItem>
<asp:ListItem Value="kr" >Swedish Krona (kr)</asp:ListItem>
<asp:ListItem Value="SYP" >Syrian Pound (SYP)</asp:ListItem>

</asp:DropDownList>

<br />

<div class="upspace"></div>
<asp:Label ID="lbl_CompDetail" runat="server" Text="Restaurant Description"></asp:Label><br />
<asp:TextBox ID="txt_CompDetail" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="4" Height="50px"></asp:TextBox><br />
<asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator002" runat="server" ControlToValidate="txt_CompDetail" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 \r\n @#+*._]+$" > </asp:RegularExpressionValidator>

<div class="upspace"></div>
<asp:Label ID="lbl_CompExpireDate" runat="server" Text="Expire Date" ></asp:Label><br />

<div class="demo">


<asp:TextBox ID="txt_CompExpireDate" runat="server" CssClass="textbox" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RFV_Expiredate" runat="server" ControlToValidate="txt_CompExpireDate" CssClass="errormsg">*</asp:RequiredFieldValidator>

</div>


<div class="upspace"></div>
<asp:Label ID="lbl_CompAddress" runat="server" Text="Address" ></asp:Label><br />
<asp:TextBox ID="txt_CompAddress" runat="server" CssClass="textbox" 
         TextMode="MultiLine" Rows="2" Height="40px" ></asp:TextBox><br />
         <asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator004" runat="server" ControlToValidate="txt_CompAddress" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 \r\n @#+*._]+$" > </asp:RegularExpressionValidator>

<asp:Label ID="lbl_AddnewCompanyNotification" runat="server" Text="New Company Added Sucessfuly! <br>" Visible="false"></asp:Label>






<div class="upspace"></div>
<asp:Label ID="lbl_CompCountry" runat="server" Text="Country"></asp:Label><br />
<asp:DropDownList ID="ddl_countrylist" runat="server" DataTextField="Name" DataValueField="Code" CssClass="ddl" onselectedindexchanged="ddl_countrylist_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>


<asp:Label ID="lbl_CompCity" runat="server" Text="City" Visible="false"></asp:Label>
<asp:DropDownList ID="ddl_CityList" runat="server" DataTextField="Name" DataValueField="id" CssClass="ddl" Visible="false" ></asp:DropDownList>
<br />


<div class="upspace"></div>
<asp:Label ID="lbl_CompPhone" runat="server" Text="Phone No."></asp:Label><br />
<asp:TextBox ID="txt_CountryCode" runat="server" CssClass="textbox" Width="53pt" ReadOnly="true"  BackColor="#8AA3BB" ></asp:TextBox>
&nbsp;-&nbsp;
<asp:TextBox ID="txt_CompPhone" runat="server" CssClass="textbox" Width="327pt"></asp:TextBox><br />
<asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator003" runat="server" ControlToValidate="txt_CompPhone" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g @ ^ & > < / \ ,  )" ValidationExpression="^[0-9 -]+$" > </asp:RegularExpressionValidator>
<!--
<div class="upspace"></div>
<asp:Label ID="lbl_CompFax" runat="server" Text="Fax No."></asp:Label><br />
<asp:TextBox ID="txt_CountryCodeF" runat="server" CssClass="textbox" Width="53pt" ReadOnly="true"  BackColor="#8AA3BB" ></asp:TextBox>
&nbsp;-&nbsp;
<asp:TextBox ID="txt_CompFax" runat="server" CssClass="textbox" Width="327pt"></asp:TextBox><br />

<div class="upspace"></div>
<asp:Label ID="lbl_CompType" runat="server" Text="Company Type"></asp:Label><br />
<asp:TextBox ID="txt_CompType" runat="server" CssClass="textbox"></asp:TextBox><br />
-->

<div class="upspace"></div>
<asp:Label ID="lbl_CompMaxIpadLicense" runat="server" Text="Maximum IPad Devices License:"></asp:Label>
<asp:RangeValidator ID="RV_CompMaxIpadLicense" runat="server" ControlToValidate="txt_CompMaxIpadLicense" Type="Integer" ErrorMessage="Value should be integer (0-500)" MaximumValue="500" MinimumValue="0" CssClass="errormsg" /> 
<br />
<asp:TextBox ID="txt_CompMaxIpadLicense" runat="server" CssClass="textbox" Text="0"></asp:TextBox><br />
<asp:RegularExpressionValidator Visible="false" ID="RegularExpressionValidator005" runat="server" ControlToValidate="txt_CompMaxIpadLicense" CssClass="errormsg" Display="Dynamic" ErrorMessage="Only number values are allowed" ValidationExpression="^[0-9]+$" > </asp:RegularExpressionValidator>


<div class="upspace"></div>
<asp:Label ID="lbl_CompMaxnumberofUsers" runat="server" Text="Maximum No. of Allow User Accounts:"></asp:Label>
<asp:RangeValidator ID="RV_CompMaxnumberofUsers" runat="server" ControlToValidate="txt_CompMaxnumberofUsers" Type="Integer" ErrorMessage="Value should be integer (1-100)" MaximumValue="100" MinimumValue="1" CssClass="errormsg" /> 

<br />
<asp:TextBox ID="txt_CompMaxnumberofUsers" runat="server" CssClass="textbox" Text="10"></asp:TextBox><br />
<asp:RegularExpressionValidator Visible="false" ID="RegularExpressionValidator006" runat="server" ControlToValidate="txt_CompMaxnumberofUsers" CssClass="errormsg" Display="Dynamic" ErrorMessage="Only number values are allowed" ValidationExpression="^[0-9]+$" > </asp:RegularExpressionValidator>
<!--
<div class="upspace"></div>
<asp:Label ID="lbl_LimitofNotifcations" runat="server" Text="Maximum No. of Push Notification Per Day:"></asp:Label>
<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_CompMaxnumberofUsers" Type="Integer" ErrorMessage="Value should be integer (1-100)" MaximumValue="100" MinimumValue="1" CssClass="errormsg" /> 

<br />
<asp:TextBox ID="txt_CompPNotificationLimit_PerDay" runat="server" CssClass="textbox" Text="1"></asp:TextBox><br />
-->

<div class="upspace"></div>
<asp:Label ID="lbl_CheckExpiryDateafterDays" runat="server" Text="Check Expiry Date by POS:(Number of Days)"></asp:Label>
<asp:RangeValidator ID="RangeValidator12" runat="server" ControlToValidate="txt_NoofDaystoCheckExpiryDate" Type="Integer" ErrorMessage="Value should be integer (1-100)" MaximumValue="100" MinimumValue="1" CssClass="errormsg" /> 
<br />
<asp:TextBox ID="txt_NoofDaystoCheckExpiryDate" runat="server" CssClass="textbox" Text="30"></asp:TextBox><br />
<asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator7" runat="server" ControlToValidate="txt_NoofDaystoCheckExpiryDate" CssClass="errormsg" Display="Dynamic" ErrorMessage="Only number values are allowed" ValidationExpression="^[0-9]+$" > </asp:RegularExpressionValidator>



    <div class="upspace"></div>
    <asp:Label ID="lbl_industry" runat="server" Text="Industry Type" Font-Bold="true">
     </asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="rfv_industrytype" ControlToValidate="ddl_industrytype" InitialValue="0" ErrorMessage="Required" CssClass="errormsg"></asp:RequiredFieldValidator>
    <br />
    <asp:DropDownList ID="ddl_industrytype" runat="server" CssClass="textbox" Height="35px" >
        <asp:ListItem Text="Choose Industry Type" Value="0"></asp:ListItem>
        <asp:ListItem Text="Hospitality" Value="Hospitality"></asp:ListItem>
        <asp:ListItem Text="Retail" Value="Retail"></asp:ListItem>
        <asp:ListItem Text="Salon" Value="Salon"></asp:ListItem>
    </asp:DropDownList>




<div class="upspace"></div>
<div class="upspace"></div>
<asp:CheckBox ID="chk_tvoption" runat="server" Checked="false" />
<asp:Label ID="lbl_TVAppLicense" runat="server" Text="TV App License" Font-Bold="true"></asp:Label><br />
<div class="upspace"></div>

<asp:CheckBox ID="chk_CallerIDOption" runat="server" Checked="false"    CssClass=""/> <b>Caller ID License Status</b>
 <div class="upspace"></div> 

    
<asp:CheckBox ID="chk_isMobileApp" runat="server" Checked="false" />
<asp:Label ID="lbl_MobileAppLicense" runat="server" Text="Mobile App License" Font-Bold="true"></asp:Label>
    
    
    <br />


    <div class="upspace"></div>
<asp:Label ID="lbl_MobileExpireDate" runat="server" Text="Mobile App Expire Date" ></asp:Label><br />
<div class="demo">
    <asp:TextBox ID="txt_CompMobileExpireDate" runat="server" CssClass="textbox"  ></asp:TextBox>
    </div>
    <div class="upspace"></div>

    <asp:CheckBox ID="chk_isWebApp" runat="server" Checked="false" />
<asp:Label ID="lbl_ISWebApp" runat="server" Text="Web App License" Font-Bold="true"></asp:Label>
 <br />

    <div class="upspace"></div>
    <asp:Label ID="Label1" runat="server" Text="Web App Expire Date" ></asp:Label><br />
<div class="demo">
    <asp:TextBox ID="txt_CompWebExpireDate" runat="server" CssClass="textbox"  ></asp:TextBox>

</div>
    <div class="upspace"></div>
    <asp:CheckBox ID="chk_isKitchenApp" runat="server" Checked="false" />
<asp:Label ID="lbl_KitchenDisplayApp" runat="server" Text="Kitchen Display App" Font-Bold="true"></asp:Label><br />
<div class="upspace"></div>

<div class="upspace"></div>
<asp:Label ID="lbl_CompWebsite" runat="server" Text="Website URL"></asp:Label><br />
<asp:TextBox ID="txt_CompWebsite" runat="server" CssClass="textbox"></asp:TextBox><br />
<asp:RegularExpressionValidator ID="REV_CompWebsite" runat="server" 
         ControlToValidate="txt_CompWebsite" 
        CssClass="errormsg" ErrorMessage="Invalid URL!" 
        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>


<div class="upspace"></div>
<asp:CheckBox ID="chk_publish" runat="server" />
<asp:Label ID="lbl_Publish" runat="server" Text="Active"></asp:Label><br />
<asp:Label ID="lbl_RestaurantTimeZone" runat="server"  visible="false" ></asp:Label>

<br />

<br />

<asp:Button ID="btn_update" runat="server" Text="Update"  
         onclick="btn_update_Click"/>
&nbsp;
         <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" 
         CausesValidation="False" onclick="btn_Cancel_Click"/>

         <br /><br />

</div>