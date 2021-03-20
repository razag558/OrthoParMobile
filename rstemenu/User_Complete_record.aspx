<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="User_Complete_record.aspx.cs" Inherits="rstemenu.User_Complete_record" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <div  style="text-align:center;" >
        <h2>Complete Value Information </h2>
     <center>
          <asp:GridView id="gv_user_complete_record" Width="90%"     CssClass="table table-striped jambo_table table-bordered grid-table sorted_table department-grid"   runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333"  GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"    />
                <Columns>
       
                    <asp:TemplateField HeaderText="ID" HeaderStyle-ForeColor="Maroon" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("id")%> 
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Pre OR Post"     HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                          <%# Eval("preorposttreatment")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Crowding (C Value)" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("c_value")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="Buccal(F Value)" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("f_value")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="I Value" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("i_value")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:TemplateField HeaderText="L Value" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("l_value")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="N Value" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("n_value")%>
                        </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" HeaderStyle-ForeColor="Maroon"  ControlStyle-Width="20px">
                        <ItemTemplate>
                         <%# Eval("pars_datetime")%>
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
             </center>        
</div>

</asp:Content>
