<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomersList.aspx.cs" Inherits="rstemenu.CostomersList"   MasterPageFile="sadmin.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<asp:Panel ID="pn_CompanyAccounts" runat="server" ScrollBars="Both" CssClass="complistpanel">

<h2>Customers List
&nbsp;&nbsp;&nbsp;[<a href="AddNewTempCustomer.aspx">Register New Customer</a>]
</h2><hr style="border: 1px solid #FCFCFC; "  />

 <asp:GridView ID="GV_CustomerList" runat="server" CellPadding="4" Width="100%" ForeColor="#000000" GridLines="None" AutoGenerateColumns="False" >
         <AlternatingRowStyle BackColor="#CACACA" />
         <Columns>
             <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                  <a href="#">
                     <asp:Label ID="lbl_CID" runat="server" Text='<%# Bind("TCust_ID") %>'></asp:Label>
                     </a>
                 </ItemTemplate>
             </asp:TemplateField>
             

                       
             
             <asp:TemplateField HeaderText="Name">
                 <ItemTemplate>
                 
                 &nbsp;&nbsp;<%# Eval("Cust_Fname")%> <%# Eval("Cust_lname")%> 
                 
                 </ItemTemplate>
             </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Mobile No." ItemStyle-HorizontalAlign="left">
             <ItemTemplate>
             &nbsp;&nbsp;
           <%# Eval("Cust_Mobile")%>
           
             </ItemTemplate>
             </asp:TemplateField>
             
               
                     
           <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>&nbsp;&nbsp;
           <%# Eval("Cust_Email")%>
           
             </ItemTemplate>
             </asp:TemplateField>

                       <asp:TemplateField HeaderText="Business Name" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>&nbsp;&nbsp;
           <%# Eval("Cust_BusinessName")%>
           
             </ItemTemplate>
             </asp:TemplateField>

                <asp:TemplateField HeaderText="Website" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>&nbsp;&nbsp;
          
           
             </ItemTemplate>
             </asp:TemplateField>


             <asp:TemplateField HeaderText="Address" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>&nbsp;&nbsp;
           <%# Eval("Cust_Address")%>
           
             </ItemTemplate>
             </asp:TemplateField>
                         
              <asp:TemplateField HeaderText="City" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>&nbsp;&nbsp;
           <%# Eval("Cust_City")%>
           
             </ItemTemplate>
             </asp:TemplateField>
             

             <asp:TemplateField HeaderText="Country" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>&nbsp;&nbsp;
           <%# Eval("Cust_Country")%>
           &nbsp;
             </ItemTemplate>
             </asp:TemplateField>
             
              <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="left">
             <ItemTemplate>&nbsp;&nbsp;
           <%# Eval("Cust_Remarks")%>
           
             </ItemTemplate>
             </asp:TemplateField>

         </Columns>        <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#2880A3" Font-Bold="True" ForeColor="#FFFFFF"  Height="30px"  HorizontalAlign="Left"/>
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#ACACAC" Height="25" />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />
     </asp:GridView>









</asp:Panel>

</asp:Content>