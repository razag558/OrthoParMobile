<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotificationMsgDetail.aspx.cs" Inherits="rstemenu.NotificationMsgDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
 
  </td>
  <td  align="right" >
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
   

    <b>
  Device Token: 
 <asp:Label ID="lbl_Notfication" runat="server"></asp:Label> 
 
  </b>
  


  </td>
  </tr>
  </table>


</div>
<table width="100%">
<tr>
<td valign="top" align="left">
<asp:Panel ID="pn_Messageslist" runat="server" Height="320px" ScrollBars="Auto">
<asp:GridView ID="Gv_MessageList"   Runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333" GridLines="None"
     onrowcommand="Gv_MessageList_RowCommand"   onrowdatabound="Gv_MessageList_RowDataBound" 
            onprerender="Gv_MessageList_PreRender"  Width="100%">
           <AlternatingRowStyle BackColor="#CACACA" />
        <Columns>
                     
          <asp:TemplateField HeaderText="Message" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="240px" HeaderStyle-Width="150px">
                   
                   
                    <ItemTemplate>
                   <asp:Label ID="lbl_Message" runat="server" Text='<%# Eval("Message")%>'></asp:Label>
                    
                   
                        
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Message Type" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px" HeaderStyle-Width="100px">
                   
                    <ItemTemplate>
                        <%#ManageMSgType(Eval("MsgType"))%>
                    </ItemTemplate>
                </asp:TemplateField>


                  <asp:TemplateField HeaderText="Date Time" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="150px" HeaderStyle-Width="150px">
                   
                    <ItemTemplate>
                    <asp:Label ID="lbl_datetime" runat="server" Text='<%# Eval("SendDateTime")%>'></asp:Label>
                        
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
    










</td>
</tr>
</table>







</div>








</div>
</div>




    </form>
</body>
</html>
