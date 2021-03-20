<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountbyRestaurant.aspx.cs" Inherits="rstemenu.AccountbyRestaurant" MasterPageFile="sadmin.Master"%>
<%@ Register TagPrefix="uc1" TagName="AddNewCAccount" Src="Modules/AddNewAccount.ascx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<style type="text/css">
   .found {text-decoration: none;color:#FF0000;background:#E07516;}
</style>
<link rel="stylesheet" href="CSS/Main.css" />
 <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery.quicksearch.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(function () {
            $('input#id_search').quicksearch('table#Gv_Userlist tbody tr');
        })
       

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">




      

<asp:Panel ID="pn_CompanyAccounts" runat="server" ScrollBars="Both" CssClass="complistpanel" >
<span class="heading2a"><a href="ManageAccounts.aspx" > Manage Restaurant Accounts</a> > <asp:Label ID="lbl_CompName" runat="server"></asp:Label>     </span><hr />


        <asp:Label ID="lbl_msg" runat="server" Text=""></asp:Label>
    <div id="List">
    <table>
    <tr>
    <td align="left">
       <input id=id_search type=text placeholder="Search">&nbsp;<asp:Button
        ID="btn_Delete" runat="server" Text="Delete" Visible="false" onclick="btn_Delete_Click" />
        </td>
        <td align="right">
            <asp:Button ID="btn_Addnew" runat="server" Text="Add New"  onclick="btn_Addnew_Click" CausesValidation="false" />
           
        </td>
        </tr>
        </table>
        
   <asp:GridView ID="Gv_Userlist"  CssClass="grid" Runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333" GridLines="None" onrowcommand="Gv_Userlist_RowCommand" 
       
          onrowdeleting="Gv_Userlist_RowDeleting"     
        onrowdatabound="Gv_Userlist_RowDataBound" 
            onprerender="Gv_Userlist_PreRender"  Width="100%">
           
        <Columns>
        <asp:TemplateField  HeaderStyle-Width="100px">
          <ItemTemplate>
             <a href="AccountbyRestaurant.aspx?un=<%# Eval("username") %>&rid=<%=Request.QueryString["rid"]%>"> <img src="images/icons/EditIco.png" border="0"  alt="Edit"/></a></a>
             &nbsp;|&nbsp;
             <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" CommandName="Delete" CommandArgument='<%# Eval("username") %>' CssClass="delbutton" Width="25px" Height="21" ToolTip="Delete"></asp:LinkButton>
                     
                    </ItemTemplate>
                    </asp:TemplateField>
                     
          <asp:TemplateField HeaderText="UserName" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="140px" HeaderStyle-Width="150px">
                   
                    <FooterTemplate>
                        <asp:TextBox ID="UserName" runat="server" Width="90px"></asp:TextBox>
                        
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("UserName")%>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="200px" HeaderStyle-Width="250px">
                   
                    <FooterTemplate>
                        <asp:TextBox ID="Email" runat="server" Width="90px"></asp:TextBox>
                        
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("Email")%>
                    </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="Designation" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="140px" HeaderStyle-Width="150px">
                   
                    <FooterTemplate>
                        <asp:TextBox ID="Designation" runat="server" Width="90px"></asp:TextBox>
                        
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("title")%>
                    </ItemTemplate>
                </asp:TemplateField>
           <%-- <asp:BoundField HeaderText="User Name" DataField="UserName" 
                            SortExpression="UserName"></asp:BoundField>
            <asp:BoundField HeaderText="Email" DataField="Email" 
                            SortExpression="Email"></asp:BoundField>--%>
         
        </Columns>
         <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#2880A3" Font-Bold="True" ForeColor="White"  Height="30px"  HorizontalAlign="Left"/>
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#EFF3FB" Height="25" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />


    </asp:GridView>
    </div>
    
    </asp:Panel>


    <asp:Panel ID="pn_AddNewAccount" runat="server" ScrollBars="Both" CssClass="complistpanel" Visible="false">

    <span class="heading2a"><a href="AccountbyRestaurant.aspx?rid=<%=Request.QueryString["rid"]%>" >Manage Restaurant Accounts</a> > Add New User Account    </span> <hr  style="border: 1px solid #CCC; "  />
 <br />
    <uc1:AddNewCAccount ID="ctrl_addnewaccount" runat="server" />
    </asp:Panel>



 

</asp:Content>
