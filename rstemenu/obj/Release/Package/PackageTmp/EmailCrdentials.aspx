<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailCrdentials.aspx.cs" Inherits="rstemenu.EmailCrdentials" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant Credentials</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body style="background:transparent !important;overflow:hidden;">
    <form id="form1" runat="server">
   <div class="StartPage" style="width:99.5% !important;background:transparent !important;overflow:hidden; " >
<div class="box">
<div class="heading">

<table width="100%" border="0" >
<tr>
    <td width="1%">&nbsp;</td>
     <td width="80%"  valign="top" align="left">
 <h1>
 <asp:Label ID="lbl_CompName" runat="server"></asp:Label> 
  Users List
  </h1>
  

  </td>
  <td width="10%" align="right" >
  <a  href="javascript: parent.$.fancybox.close();" ><img src="images/icons/close-buttons.png" width="37"  style="margin-top:-3px;"/></a>
   
  
    

  </td>
  </tr>
  </table>
</div>
<div class="PanelBlock">

<div >
<table width="100%" border="0" >
<tr>
    <td width="1%">&nbsp;</td>
     <td width="80%"  valign="top" align="left">
   
[Select one or more users to send password reset link via email]  
    

  </td>
  </tr>
  </table>


</div>
<table width="100%">
<tr>
<td valign="top" align="left">
<asp:Panel ID="pn_userlist" runat="server" Height="320px" ScrollBars="Auto">
<asp:GridView ID="Gv_Userlist"   Runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333" GridLines="None" onrowcommand="Gv_Userlist_RowCommand" 
                     
        onrowdatabound="Gv_Userlist_RowDataBound" 
            onprerender="Gv_Userlist_PreRender"  Width="100%">
           <AlternatingRowStyle BackColor="#CACACA" />
        <Columns>
        <asp:TemplateField  HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
          <ItemTemplate>
           
           <asp:CheckBox ID="cb_Checked"  runat="server" Checked="false" />

             
                    </ItemTemplate>
                    </asp:TemplateField>
                     
          <asp:TemplateField HeaderText="UserName" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="140px" HeaderStyle-Width="150px">
                   
                   
                    <ItemTemplate>
                   <asp:Label ID="UserName" runat="server" Text='<%# Eval("UserName")%>'></asp:Label>
                    <asp:Label ID="lbl_userfirstName" runat="server" Text='<%# Eval("fname")%>' Visible="false"></asp:Label>
                   
                        
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="User Role" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="200px" HeaderStyle-Width="250px">
                   
                    <ItemTemplate>
                        <%# Eval("userrole")%>
                    </ItemTemplate>
                </asp:TemplateField>


                  <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="200px" HeaderStyle-Width="250px">
                   
                    <ItemTemplate>
                    <asp:Label ID="UserEmail" runat="server" Text='<%# Eval("Email")%>'></asp:Label>
                        
                    </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="Designation" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="140px" HeaderStyle-Width="150px">
                   
                    <ItemTemplate>
                        <%# Eval("title")%>
                    </ItemTemplate>
                </asp:TemplateField>
         
        </Columns>
         <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#2880A3" Font-Bold="True" ForeColor="#FFFFFF"  Height="27px"  HorizontalAlign="Left"/>
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#ACACAC" Height="25" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />


    </asp:GridView>

    </asp:Panel>
    <div style="float:right; margin-right:20px;">
    <br /><br />

    <asp:Button ID="btn_submitemail" runat="server" Text="Send Email"  CssClass="submitButton" OnClick="btn_submitemail_Click" />
    <br /><br />
    </div>










</td>
</tr>
</table>







</div>








</div>
</div>




    </form>
</body>
</html>
