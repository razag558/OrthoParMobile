<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="VisitedCustomers.aspx.cs" Inherits="rstemenu.VisitedCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">




<h2>Customers List</h2><hr class=" style="border: 1px solid #CCC; "  />
<asp:Panel ID="pn_CompanyAccounts" runat="server" ScrollBars="Both" CssClass="complistpanel">
 <asp:GridView ID="GV_CustomerList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" >
         <AlternatingRowStyle BackColor="White" Width="90%" />
         <Columns>
             <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                  <a href="#">
                     <asp:Label ID="lbl_CID" runat="server" Text='<%# Bind("VC_ID") %>'></asp:Label>
                     </a>
                 </ItemTemplate>
             </asp:TemplateField>
             

                       
             
             <asp:TemplateField HeaderText="| Email">
                 <ItemTemplate>
                 
                 &nbsp;&nbsp;<%# Eval("VC_Email")%>
                 
                 </ItemTemplate>
             </asp:TemplateField>
            
             <asp:TemplateField HeaderText="| Total Visits" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>
             &nbsp;&nbsp;
           <%# Eval("VC_Totalvisits")%>
           
             </ItemTemplate>
             </asp:TemplateField>
             


         </Columns>        <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#2880A3" Font-Bold="True" ForeColor="White"  Height="30px"  HorizontalAlign="Left" />
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#EFF3FB" Height="25" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />
     </asp:GridView>









</asp:Panel>
</asp:Content>
