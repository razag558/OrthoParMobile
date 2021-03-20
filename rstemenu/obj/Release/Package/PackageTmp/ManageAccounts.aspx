<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="ManageAccounts.aspx.cs" Inherits="rstemenu.ManageAccounts" %>
<%@ Register TagPrefix="uc1" TagName="AddNewCAccount" Src="Modules/AddNewAccount.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">





<div >
<asp:Button ID="btn_AddNewAccount" runat="server" Text="Add New Account" 
        onclick="btn_AddNewAccount_Click"  CausesValidation="false" />



        </div>


<asp:Panel ID="pn_CompanyAccounts" runat="server" ScrollBars="Both" CssClass="complistpanel">




<h2>Manage Restaurant Accounts</h2><hr style="border: 1px solid #CCC;"  />

 <asp:GridView ID="GV_CompaniesList" runat="server" CellPadding="4" ForeColor="#000000" GridLines="both" AutoGenerateColumns="False" Width="100%" >
         <AlternatingRowStyle BackColor="#CACACA" />
         <Columns>
             <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">
                  <ItemTemplate>
                     <asp:Label ID="lbl_CompID" runat="server" Text='<%# Bind("CompID") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             

                       
             
             <asp:TemplateField ShowHeader="False" HeaderText="Resturant Name" HeaderStyle-HorizontalAlign="Left">
                 <ItemTemplate>
                 <a href='AccountbyRestaurant.aspx?rid=<%# Eval("CompID") %>' >
                 <asp:Label ID="lbl_ResturantName" Text='<%# Eval("CompName") %>' runat="server"></asp:Label>
                 </a>
                 </ItemTemplate>
             </asp:TemplateField>
                       
             <asp:TemplateField HeaderText="Total User Accounts" ItemStyle-HorizontalAlign="center">
             <ItemTemplate>
             <asp:Label ID="lbl_TotalAccounts" runat="server" Text='<%# Eval("CompMaxUserLicense") %>'></asp:Label>
             </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Created Accounts" ItemStyle-HorizontalAlign="center">
             <ItemTemplate>
             <%#CountCreatedAccounts(Eval("CompID"))%>
             

             </ItemTemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="IPad Devices" ItemStyle-HorizontalAlign="Center">
             <ItemTemplate>
             <asp:Label ID="lbl_TotalIPadDevices" runat="server" Text='<%# Eval("CompMaxIPadLicense") %>' ></asp:Label>
             </ItemTemplate>
             </asp:TemplateField>



         </Columns>        <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#2880A3" Font-Bold="True" ForeColor="White"  Height="30px"  HorizontalAlign="Center"/>
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#ACACAC" Height="25" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />
     </asp:GridView>












    <br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

    
    
    </asp:Panel>
    <asp:Panel ID="pn_AddNewAccount" runat="server" ScrollBars="Both" CssClass="complistpanel" Visible="false">
    <span class="heading2a"><a href="ManageAccounts.aspx" >Manage Restaurant Accounts</a> > Add New User Account    </span> <hr  style="border: 1px solid #CCC; "  />
 <br />

    <uc1:AddNewCAccount ID="ctrl_addnewaccount" runat="server" />
    </asp:Panel>









</asp:Content>






