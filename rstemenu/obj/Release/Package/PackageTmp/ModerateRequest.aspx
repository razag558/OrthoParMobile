<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="ModerateRequest.aspx.cs" Inherits="rstemenu.ModerateRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <asp:GridView ID="GV_DemoRequestList" runat="server" CellPadding="4" 
         ForeColor="#000000" GridLines="None" AutoGenerateColumns="False" 
          
         OnRowCommand="GV_DemoRequestList_RowCommand" 
         onrowdatabound="GV_DemoRequestList_RowDataBound"  
         onrowdeleting="GV_DemoRequestList_RowDeleting" 
         DataKeyNames="username" Width="100%" >
       <AlternatingRowStyle BackColor="#CACACA"   />
         <Columns>
             <asp:TemplateField  >
                  <ItemTemplate>
                     <asp:Label ID="lbl_username" runat="server" Visible="false" Text='<%# Bind("username") %>'></asp:Label>
                     <asp:Label ID="lbl_restaurantname" runat="server" Visible="false" Text='<%# Bind("RestaurantName") %>'></asp:Label>
                     <asp:Label ID="lbl_firstname" runat="server" Visible="false" Text='<%# Bind("fname") %>'></asp:Label>
                       <asp:Label ID="lbl_email" runat="server" Visible="false" Text='<%# Bind("Email") %>'></asp:Label>
                       
                      
                    
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                     <asp:Label ID="lblData" runat="server" 
                            Text='<%# Bind("fname") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle  CssClass="fwidth200" />
            </asp:TemplateField>

            <asp:BoundField DataField="RestaurantName" HeaderText="Restaurant Name" />
             <asp:BoundField DataField="Email" HeaderText="Email"  Visible="true"/>
             <asp:BoundField DataField="Country" HeaderText="Country"  Visible="true"/>

             
            
             <asp:CheckBoxField  DataField="IsEnable" HeaderText="Is Approved" ItemStyle-HorizontalAlign="Center"/>
             
             
            
             <asp:TemplateField ShowHeader="False"></asp:TemplateField>

             <asp:TemplateField ShowHeader="False">
                 <ItemTemplate>
                
                    <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" 
                         CommandName="Delete"  CommandArgument='<%# Eval("username") %>' CssClass="delbutton" Width="22px" height="22px" visible="true"></asp:LinkButton>
                &nbsp;
                 <asp:LinkButton ID="btn_Approved" runat="server" CausesValidation="false" 
                         CommandName="Approved"  CommandArgument='<%# Eval("username") %>' CssClass="approvebtn" Width="90px" height="30px" ></asp:LinkButton>
                
                
                 </ItemTemplate>
             </asp:TemplateField>

             

         </Columns>        <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#2880A3" Font-Bold="True" ForeColor="#FFFFFF"  Height="30px"  HorizontalAlign="Left"/>
         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#ACACAC" Height="25"  />
         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#F5F7FB" />
         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
         <SortedDescendingCellStyle BackColor="#E9EBEF" />
         <SortedDescendingHeaderStyle BackColor="#4870BE" />
     </asp:GridView>





</asp:Content>
