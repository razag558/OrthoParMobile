 <%@ Page Title="Manage Business Profile" Language="C#" AutoEventWireup="true" CodeBehind="manageprofile.aspx.cs" Inherits="rstemenu.ManageProfile" MasterPageFile="~/Site.master"%>

 <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
      h2 {
          border: 1px solid #479BD5;
          border-radius: 3px;
          font-size: 1.2em;
          font-weight: 400;
          margin-bottom: 12px;
          padding: 4px 6px;
          background: #479BD5;
          color: #fff;
      }
    .modal{
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
    .titlebar{
        width:403pt;
        background: #d8dce3 none repeat scroll 0 0;
        border: medium none;
        color: #3b4354;
        font-size: 13px;
        font-weight: 800;
        margin: 0;
        padding: 8px 5px;
        text-transform: uppercase;
    }

    div.StartPage .ddl {
        margin-top: 10px;
        padding: 6px;
        width: 410pt;
        border-color: #cccccc;
        border-style: solid;
        border-width: 1px;
    }
</style>

<!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>-->
<script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("modal");
            $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 200);
    }
    $('form').live("submit", function () {
        ShowProgress();
    });
</script>
 
 
 </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


<!--
<link rel="stylesheet" href="../DatePicker/themes/base/jquery.ui.all.css">
<script src="../DatePicker/jquery-1.7.1.js"></script>
<script src="../DatePicker/ui/jquery.ui.core.js"></script>
<script src="../DatePicker/ui/jquery.ui.widget.js"></script>
<script src="../DatePicker/ui/jquery.ui.datepicker.js"></script>

<link href="../DatePicker/demos.css" rel="stylesheet" type="text/css" />


<script>
    $(function () {
        $("#MainContent_ctrl_addnewcompany_txt_CompExpireDate").datepicker();
    });
</script>

-->


<div class="StartPage">
<div class="box">
<div class="heading">
<h1><span>
Manage Business Profile
</span></h1></div>
<asp:Label ID="lbl_test" runat="server"></asp:Label>

<asp:Panel ID="pn_profileupdate" runat="server" EnableViewState="true" >

 
<div class="content">
 <div class="upspace"></div>
 <div class="titlebar">
<asp:Label ID="lbl_CompName" runat="server" Text="Business Name*" ></asp:Label>
     </div>
    
<asp:TextBox ID="txt_CompName" runat="server" CssClass="textbox" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RFD_CompName" runat="server" ControlToValidate="txt_CompName" ErrorMessage="Plesae fill Resturant Name" CssClass="errormsg">*</asp:RequiredFieldValidator>

<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompEmail" runat="server" Text="Email Address*"></asp:Label>
</div>
<asp:TextBox ID="txt_CompEmail" runat="server" CssClass="textbox"></asp:TextBox>
<asp:RequiredFieldValidator ID="RFV_CompEmail" runat="server" ControlToValidate="txt_CompEmail" ErrorMessage="Plesae fill Email" CssClass="errormsg">*</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="REV_CompEmail" runat="server" 
         ControlToValidate="txt_CompEmail" 
         ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errormsg" ErrorMessage="Invalid Email!"></asp:RegularExpressionValidator>


<div class="upspace">

</div>
<!--
<div class="titlebar">
<asp:Label ID="lbl_CompType" runat="server" Text="Your Selected Cuisine " ></asp:Label>&nbsp;&nbsp;&nbsp; 
<a href="AddCuisines.aspx" id="addcusion" style="float: right; margin-right: 10px; display: inline;">Add/update...</a>
</div>

<div class="upspace"></div>

<asp:DataList ID="DL_CuisineList" runat="server" Visible="false" CellPadding="4" ForeColor="#333333" RepeatColumns="5" ShowFooter="False" ShowHeader="False">
<ItemStyle CssClass="itembackground2" />
<SeparatorStyle Width="5px" BackColor="#ffffff" />
<ItemTemplate>
<asp:Label ID="lbl_RestType_Name" runat="server" Text='<%#Eval("RestType_Name") %>' ></asp:Label>
</ItemTemplate>
</asp:DataList>
-->
<!--
<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompCoverAreas" runat="server" Text="Your Covered Areas" ></asp:Label> &nbsp;&nbsp;&nbsp; 
<a href="UpdateCoverAreas.aspx" id="addareas" >Add/update...</a>
&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
<a href="ManageMinOrderbyArea.aspx" id="addareasr" >Update minimum order by Area...</a>



</div>

<div class="upspace"></div>

<asp:DataList ID="DL_SelectedAreaList" runat="server" CellPadding="4" ForeColor="#333333" RepeatColumns="5" ShowFooter="False" ShowHeader="False">
<ItemStyle CssClass="itembackground2" />
<SeparatorStyle Width="5px" BackColor="#ffffff" />
<ItemTemplate>
<asp:Label ID="lbl_RestType_Name" runat="server" Text='<%#Eval("LA_Title") %>' ></asp:Label>
</ItemTemplate>
</asp:DataList>



<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_BusinessDays" runat="server" Text="Business Days Timing" ></asp:Label> &nbsp;&nbsp;&nbsp; 
<a href="ManageBusinessDays.aspx" id="BDays" >Add/update...</a>
</div>
<div class="upspace"></div>
-->

<!--
<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_DTimeEstimate" runat="server" Text="Estimate Time of Order Delievery (in minutes i.e. 40)" ></asp:Label>
</div>
<asp:TextBox ID="txt_DelieverdEstimateTime" runat="server" CssClass="textbox"></asp:TextBox>
<asp:RequiredFieldValidator ID="RFV_DTimeEstimate" runat="server" ControlToValidate="txt_DelieverdEstimateTime" ErrorMessage=" * " CssClass="errormsg"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="regularExpressionValidator" runat="server" ControlToValidate="txt_DelieverdEstimateTime" ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"  CssClass="errormsg"></asp:RegularExpressionValidator>


<br />
-->
<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompDetail" runat="server" Text="Description" ></asp:Label>
</div>
<asp:TextBox ID="txt_CompDetail" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="7" Height="50px"></asp:TextBox><br />




<div class="upspace" ></div>
<div class="titlebar">
<asp:Label ID="lbl_RestIcon" runat="server" Text="Logo" ></asp:Label> 
</div>
<asp:FileUpload ID="fu_CompIcon" runat="server" /> <!--(Recommended Resolution 100px x 100px)-->

<img src='images/CLogo/<%=iimage%>' border="0" style="width:80px; height: auto;"  />
<!--
<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompHeaderLogo" runat="server" Text="Header Logo"></asp:Label> (Recommended Resolution 300px x 80px)
</div>
 <asp:FileUpload ID="fu_CompHeaderLogo" runat="server" Width="330px" /> 
 <img src='images/CLogo/<%=limage%>' border="0" style="width:300px; height: auto;"  />
 -->
<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompAddress" runat="server" Text="Address*"></asp:Label>

</div>
<asp:TextBox ID="txt_CompAddress" runat="server" CssClass="textbox" 
         TextMode="MultiLine" Rows="2" Height="50px" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RFV_Address" runat="server" ControlToValidate="txt_CompAddress" ErrorMessage=" * " CssClass="errormsg"></asp:RequiredFieldValidator>


<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompCountry" runat="server" Text="Country*"></asp:Label>
</div>
<asp:DropDownList ID="ddl_countrylist" runat="server" DataTextField="Name" 
        DataValueField="Code" CssClass="textbox" 
        onselectedindexchanged="ddl_countrylist_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>


<!--
<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompCity" runat="server" Text="City"></asp:Label>
</div>
<asp:DropDownList ID="ddl_CityList" runat="server" DataTextField="Name" DataValueField="id" CssClass="textbox" ></asp:DropDownList>
-->
<div class="upspace"></div>
<!--<table border="0" cellpadding="0" cellspacing="0" width="600px">-->
<div class="titlebar">
<!--<asp:Label ID="lbl_CCCode" runat="server" Text="Country Code"   ></asp:Label> &nbsp;-&nbsp;-->

<asp:Label ID="lbl_PhoneNo" runat="server" Text="Contact No." ></asp:Label>

</div>
<asp:TextBox ID="txt_CountryCode" runat="server" CssClass="textbox" Width="53pt" ReadOnly="true"  BackColor="#ffffff" Visible="false" ></asp:TextBox>

<asp:TextBox ID="txt_CompPhone" runat="server" CssClass="textbox" width="400pt"></asp:TextBox>

<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_LicenseExpireDate" runat="server" Text="Account Expiry Date" ></asp:Label>
</div>
<asp:TextBox ID="txt_LicenseExpireDate" runat="server" CssClass="textbox" width="400pt" Enabled="false"></asp:TextBox>

<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_TvApp" runat="server" Text="TV App License" ></asp:Label>
</div>
<br />
<asp:CheckBox ID="chk_tvoption" runat="server" Checked="false"  Enabled="false" CssClass=""/> <b>TV App License Status</b>
<br />
<!--
<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="Label1" runat="server" Text="Country Code"></asp:Label>
&nbsp;-&nbsp;
<asp:Label ID="lbl_CompFax" runat="server" Text="Fax No."></asp:Label>
</div>
<asp:TextBox ID="txt_CountryCodeF" runat="server" CssClass="textbox" Width="53pt" ReadOnly="true"  BackColor="#ffffff" ></asp:TextBox>
&nbsp;-&nbsp;
<asp:TextBox ID="txt_CompFax" runat="server" CssClass="textbox" width="322pt"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_CompFax" ValidationExpression="^\(?([0-9]{2})\)?[-. ]?([0-9]{7})$" ErrorMessage="Formate should be like this xx-xxxxxxx"  CssClass="errormsg" ></asp:RegularExpressionValidator>
-->



<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompCurrency" runat="server" Text="Select Currency"></asp:Label>
</div>
<asp:DropDownList ID="ddl_CompCurrency" runat="server" CssClass="textbox">
<asp:ListItem Value="£" Selected="True" >Pound (£) </asp:ListItem>
<asp:ListItem Value="$" >Dollar ($)</asp:ListItem>
<asp:ListItem Value="€" >Euro (€)</asp:ListItem>
<asp:ListItem Value="Rs" >Rupees(Rs)</asp:ListItem>
<asp:ListItem Value="¥" >Yen (¥)</asp:ListItem>
<asp:ListItem Value="AED" >United Arab Emirates (AED)</asp:ListItem>
<asp:ListItem Value="SAR">Saudi Arabia Riyal(SAR)</asp:ListItem>
<asp:ListItem Value="kr" >Swedish Krona (kr)</asp:ListItem>
<asp:ListItem Value="SYP" >Syrian Pound (SYP)</asp:ListItem>




</asp:DropDownList>

<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_TimeZone" runat="server" Text="Select TimeZone"></asp:Label><br />
</div>
<asp:DropDownList ID="DDL_TimeZone" runat="server" CssClass="ddl" DataValueField="id" DataTextField="DisplayName">
</asp:DropDownList>



<div class="upspace"></div>
<div class="titlebar">
<asp:Label ID="lbl_CompWebsite" runat="server" Text="Website"></asp:Label><br />
</div>
<asp:TextBox ID="txt_CompWebsite" runat="server" CssClass="textbox"></asp:TextBox><br />
<asp:RegularExpressionValidator ID="REV_CompWebsite" runat="server" 
         ControlToValidate="txt_CompWebsite" 
        CssClass="errormsg" ErrorMessage="Invalid URL!" 
        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
        <br />

<br />

<asp:Button ID="btn_update" runat="server" Text="Update" onclick="btn_update_Click" CssClass="submitButton" />

        <div class="loading" align="center">
    Saving. Please wait.<br />
    <br />
    <img src="loader.gif" alt="" />
</div>

&nbsp;
         <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" 
         CausesValidation="False" onclick="btn_Cancel_Click" Visible="false" />

    </asp:Panel>

<div class="upspace"></div><br />
<asp:Label ID="lbl_AddnewCompanyNotification" runat="server" Text="Update Done <br>" Visible="false"></asp:Label>

</div>
</div>
</div>


</asp:Content>