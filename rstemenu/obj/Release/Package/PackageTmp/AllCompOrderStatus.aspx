<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="AllCompOrderStatus.aspx.cs" Inherits="rstemenu.AllCompOrderStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<asp:Panel ID="pn_CompanyAccounts" runat="server" ScrollBars="Both" CssClass="complistpanel">




<h2>Orders Status</h2><hr style="border: 1px solid #CCC; "  />

 <asp:GridView ID="GV_CompaniesList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" >
         <AlternatingRowStyle BackColor="White" />
         <Columns>
             <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                     <asp:Label ID="lbl_CompID" runat="server" Text='<%# Bind("CompID") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             

                       
             
             <asp:TemplateField ShowHeader="False" HeaderText="Resturant Name">
                 <ItemTemplate>
                 
                 <asp:Label ID="lbl_ResturantName" Text='<%# Eval("CompName") %>' runat="server"></asp:Label>
                 
                 </ItemTemplate>
             </asp:TemplateField>
                       
             <asp:TemplateField HeaderText="| Total Open Orders " ItemStyle-HorizontalAlign="Center">
             <ItemTemplate>
             <asp:Label ID="lbl_TotalOpenOrders" runat="server" Text='<%#GetTotalOrders(Eval("CompID"),"Open") %>' ></asp:Label>
             </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="| Orders InProgres" ItemStyle-HorizontalAlign="Center">
             <ItemTemplate>
             <asp:Label ID="lbl_TotalOpenOrders" runat="server" Text='<%#GetTotalOrders(Eval("CompID"),"In Pogress") %>' ></asp:Label>
             </ItemTemplate>
             </asp:TemplateField>
             
             <asp:TemplateField HeaderText="| Out For Delivery" ItemStyle-HorizontalAlign="Center">
             <ItemTemplate>
             <asp:Label ID="lbl_TotalOpenOrders" runat="server" Text='<%#GetTotalOrders(Eval("CompID"),"Out of Delivery") %>' ></asp:Label>
             </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="| Completed Orders" ItemStyle-HorizontalAlign="Center">
             <ItemTemplate>
             <asp:Label ID="lbl_TotalOpenOrders" runat="server" Text='<%#GetTotalOrders(Eval("CompID"),"Completed") %>' ></asp:Label>
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












    <br />
    <br /><br />

    
    
    </asp:Panel>
</asp:Content>
