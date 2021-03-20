 
<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="~/all_users.aspx.cs" Inherits="rstemenu.all_users" EnableEventValidation = "false" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div  style="text-align:center;" >
        <h1>Registered Doctor List</h1>
      <asp:Panel ID="panelid1" runat="server" ScrollBars="Auto">
          <asp:GridView id="gv_all_user" Width="90%" OnRowDeleting="datatable_RowDeleting"     OnRowCommand="datatable_RowCommand"   CssClass="table table-striped jambo_table table-bordered grid-table sorted_table department-grid"   runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333"  GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"    />
                <Columns>
       
                    <asp:TemplateField  HeaderText="UserName" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate >
                            <%#Eval("username")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                   
                    <asp:TemplateField Visible="false" HeaderText="ID" HeaderStyle-ForeColor="Maroon" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("id")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="First Name" SortExpression="suburb, street"   HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                          <%# Eval("first_name")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Last Name" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("last_name")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Email" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("email")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                    
                    
                    <asp:TemplateField HeaderText="City" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("city")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                    
                    <asp:TemplateField HeaderText="Country" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("country")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                      
                    <asp:TemplateField HeaderText="Phone Number" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("phone_number")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                   
                    <asp:TemplateField Visible="true" HeaderText="Edit" HeaderStyle-ForeColor="Maroon">
                        <ItemTemplate>
                            <a href="Updating_user_record.aspx?id=<%# Eval("id")%>" ><i class="fa fa-pencil" ></i> </a> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" HeaderStyle-ForeColor="Maroon" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate> 
                          <asp:LinkButton ID="btn_Delete"  CommandName="Delete" CommandArgument='<%# Eval("id") +";"+Eval("username")%> ' runat="server" CausesValidation="false"  ><i class="glyphicon glyphicon-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
              
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#53565D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#2A3F54" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E4E4E4" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
             </asp:Panel>       
</div>
</asp:Content>
