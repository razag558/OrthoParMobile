<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddModifiers.aspx.cs" Inherits="rstemenu.AddModifiers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="StartPage">

<div class="box">
<script src="https://use.fontawesome.com/ea53e1672b.js"></script>

<style>
  .grid th {
      padding: 5px 4px 5px 8px;
      }
  tr.rowstyle {
      background-color: #f0f1f4 !important;
      vertical-align: middle;
  }
  tr.gridAltRow {
      background-color: #fff !important;
  }
  .grid321 {
      background-color: #d8dce3;
      border-color: #989898;
      border-style: solid;
      border-width: 1px;
      color: #3b4354;
      font-size: 12px;
      padding: 8px 4px 8px 8px;
      text-transform: uppercase;
      vertical-align: middle;
  }
  .cancelButton{
      font-size: 12px;
  }
  .content h2{
      margin-top: 0;
  }
  div.StartPage .textbox240 {
      width: 244pt;
  }
  div.StartPage .ddl2 {
      width: 255pt;
  }
  </style>
  <style>
  @media all and (-webkit-min-device-pixel-ratio:0) and (min-resolution: .001dpcm) { 
    .delbutton {
      top: 0px;
    }
  }
</style>
<div class="heading">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr><td width="75%" valign="middle">
<h1>
<span>
<a href="ManageModifierGroup.aspx" style="color:#fff !important;">Manage Groups</a><i class="fa fa-angle-right" aria-hidden="true" style="color:#fff !important;font-size:19px !important;"></i>Add New Modifiers
</span></h1>
</td>
<td class="right_links">

</td>
</tr>
</table>
</div>

<div class="content">
<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
<asp:UpdatePanel ID="UP_PanelGV" runat="server">
                    <ContentTemplate>
<div class="PanelBlock">

<table>

<tr>
<td>
<asp:Label ID="lbl_selectedid" Text="0" runat="server" Visible="false"></asp:Label>
<div  style="text-align:right;width:200px;margin-bottom:-7px;"><a href="ManageModifierGroup.aspx" class="submitButton111" title="Add New Group" >+ Add New Group</a></div>

<asp:DropDownList ID="ddl_ModifierGroupList" runat="server" DataTextField="MC_Name" DataValueField="ID" onselectedindexchanged="ddl_ModifierGroupList_SelectedIndexChanged" AutoPostBack="true" CssClass="textbox" style="width: 200px; height: 30px;border: 1px solid #cccccc;" ></asp:DropDownList>&nbsp;&nbsp;
 </td>
 <td>    
 <div  style="text-align:right;width:150px;margin-bottom:-7px;">&nbsp;</div>
 <asp:TextBox ID="txt_ModifierName" runat="server"  CssClass="textbox150" placeholder="Modifier Name" ></asp:TextBox>&nbsp;&nbsp;
     </td>       
     <td>
<div  style="text-align:right;width:200px;margin-bottom:-7px;">
&nbsp;
</div>
<asp:TextBox ID="txt_ModifierPrice" runat="server" CssClass="textbox150" Placeholder="Price"></asp:TextBox>
 &nbsp;&nbsp;

<asp:TextBox ID="txt_DeliveryPrice" runat="server" CssClass="textbox150" Placeholder="Delivery Price"></asp:TextBox>
&nbsp;&nbsp;
<asp:TextBox ID="txt_OnlinePrice" runat="server" CssClass="textbox150" Placeholder="Online Price"></asp:TextBox>



 </td>
 <td>
 <!--<div style="text-align:left;width:80pt;margin-top:1px;">&nbsp;</div>--><br>
  <asp:RadioButton ID="rb_Signle" runat="server" Checked="true"  Text="Single Option" GroupName="ItemType" /><br />
<asp:RadioButton ID="rb_Multi" runat="server"  Text="Multi Option" GroupName="ItemType" /> 
</td>
<td width="80" align="right">
<div  style="text-align:right;margin-bottom:-5px;">&nbsp;</div>
<asp:CheckBox ID="cb_MenuItem_Publish" runat="server" />
<asp:Label ID="lbl_MenuItem_Publish" runat="server" Text="ACTIVE" ></asp:Label>
</td>
<td  width="80" align="right">
<div  style="margin-bottom:-5px;">&nbsp;</div>
<asp:Button ID="btn_Save" runat="server" Text="Save" onclick="btn_Save_Click" CausesValidation="false" CssClass="submitButton" /> 
  <asp:Button ID="btn_update" runat="server" Text="Update" onclick="btn_update_Click" Visible="false"  class="submitButton" />
  &nbsp;&nbsp;
 <asp:Button ID="btn_cancel" runat="server" Text="Cancel" onclick="btn_cancel_Click" CausesValidation="false" class="submitButton" Visible="false" />
 
</td>

</tr>
<tr>
<td  align="left" ></td>
<td colspan="6"><asp:Label ID="lbl_checknamenoti" runat="server" Visible="false" Text="Please fill in a modifier name" CssClass="errormsg"></asp:Label>
<asp:RegularExpressionValidator Visible="true" ID="RegularExpressionValidator003" runat="server" ControlToValidate="txt_ModifierName" CssClass="errormsg" Display="Dynamic" ErrorMessage="Special Characters are not allowed(e.g @ ^ & > < / \ ,  )" ValidationExpression="^[a-zA-Z0-9 @#+*_-]+$" > </asp:RegularExpressionValidator>
<asp:RegularExpressionValidator ID="regularExpressionValidator" runat="server" ControlToValidate="txt_ModifierPrice" ValidationExpression="^\d*\.?\d*$" ErrorMessage="Invalid Price Value!"  CssClass="errormsg" Display="Dynamic"></asp:RegularExpressionValidator>
<asp:RegularExpressionValidator ID="regularExpressionValidator1" runat="server" ControlToValidate="txt_DeliveryPrice" ValidationExpression="^\d*\.?\d*$" ErrorMessage="Invalid Price Value!"  CssClass="errormsg" Display="Dynamic"></asp:RegularExpressionValidator>
<asp:RegularExpressionValidator ID="regularExpressionValidator2" runat="server" ControlToValidate="txt_OnlinePrice" ValidationExpression="^\d*\.?\d*$" ErrorMessage="Invalid Price Value!"  CssClass="errormsg" Display="Dynamic"></asp:RegularExpressionValidator>

</td>

</tr>

</table>

</div>

<table width="100%" border="0">

<!--<asp:TextBox ID="txt_ModifierGroupName" runat="server"  CssClass="textbox240" style="width:100px;" ></asp:TextBox>&nbsp; 
<asp:LinkButton ID="btn_AddNewmGroup" Text="Add New" runat="server" 
        onclick="btn_AddNewmGroup_Click" CausesValidation="false"></asp:LinkButton>
        <asp:Label ID="lbl_checkgname" runat="server" Visible="false" Text="Please fill group name" CssClass="errormsg"></asp:Label>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_ModifierGroupList"  InitialValue="0" Display="Dynamic" CssClass="errormsg">Please select modifier group</asp:RequiredFieldValidator>
-->

<!--
 <div class="titlebar" style="width:330px;">
 <asp:Label ID="Label1" runat="server" Text="Sorting Order" ></asp:Label>
 </div>
 <asp:TextBox ID="txt_Sortingby" runat="server" CssClass="textbox240" Text="5000"></asp:TextBox>
 -->

<td width="100%" valign="top" style="background-color:#ffffff;padding-left:5px;">

<h2>
<asp:Label ID="lbl_ModifierGroupName" runat="server" Text=""></asp:Label>
</h2><div class="upspace">

</div>
<asp:GridView ID="GV_ModifierList" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None"  Width="100%"
      AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow"  onrowcommand="GV_ModifierList_RowCommand" onrowdatabound="GV_ModifierList_RowDataBound" onrowdeleting="GV_ModifierList_RowDeleting"  HeaderStyle-CssClass=""
      onrowediting="GV_ModifierList_RowEditing" CssClass="grid">
        
        <Columns>
            
            <asp:TemplateField HeaderText="Name" ControlStyle-Width="150px"   HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
               <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MenuItem_Name") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_Price" runat="server" Text='<%#priceformat(Eval("MenuItem_Price")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>


               <asp:TemplateField HeaderText="Delivery Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_DPrice" runat="server" Text='<%#priceformat(Eval("MenuItem_DeliveryPrice")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Online Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_OPrice" runat="server" Text='<%#priceformat(Eval("MenuItem_OnlinePrice")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>



             <asp:TemplateField HeaderText="Type" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
                    <asp:Label ID="lbl_modtype" runat="server" Text='<%# Bind("MenuItem_ModifierType") %>' ToolTip='<%#ToolTipType(Eval("MenuItem_ModifierType")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CheckBoxField DataField="MenuItem_Publish" HeaderText="Active" ReadOnly="true" ItemStyle-HorizontalAlign="center" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center"/>
            
            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center">
                 <ItemTemplate >
                
                <asp:LinkButton ID="btn_edit" runat="server" CausesValidation="false" 
                         CommandName="Edit"  CommandArgument='<%# Eval("MenuItem_ID") %>'  Width="19px" Height="22px" ><i class="fa fa-pencil-square" aria-hidden="true"></i></asp:LinkButton>
                  &nbsp;
                    <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" 
                         CommandName="Delete"  CommandArgument='<%# Eval("MenuItem_ID") %>' CssClass="delbutton" ></asp:LinkButton>
                 </ItemTemplate>
             </asp:TemplateField>
            
        </Columns>
       <FooterStyle BackColor="#745C52" Font-Bold="True" ForeColor="White" />
          <RowStyle CssClass="rowstyle" />
            
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
       
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#354D6F" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#354D6F" />
    </asp:GridView>

</td>

</tr>

</table>

</ContentTemplate>
    </asp:UpdatePanel>

</div>

</div>
</div>

 <asp:Label ID="lbl_RestaurantTimeZone" runat="server"  visible="false" ></asp:Label>



</asp:Content>