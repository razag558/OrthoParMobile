<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="CompOrderDetail.aspx.cs" Inherits="rstemenu.CompOrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script language="Javascript" type="text/javascript">
    function OpenWindow(id) {
        var querystring = "id=" + id;
        //window.open("OrderDetail.aspx", "Order Detail","menubar=0,resizable=0,width=500px,height=600px,top=20 0, left=350");

        window.open('../OrderDetail.aspx?' + querystring, 'winpop', 'location=0,fullscreen=0,left=450,top=150,ScrollBars=1,statusbar=0,titlebar=no,toolbar=no,menubar=no,resizable=0,width=600,height=500');


    }
</script>


<h2>
<a href="javascript:history.go(-1)">
<%if (Request.QueryString["s"] != null)
  { %>
All Restaurant Sales
<%} 
  else
  { %>
Orders Status
<%} %>
</a>
> Orders Detail</h2>


   <asp:Panel ID="pn_CompanyAccounts" runat="server" ScrollBars="Both" CssClass="complistpanel">


        <asp:GridView ID="gvEG" runat="server" AutoGenerateColumns="False" CssClass="grid"
            AlternatingRowStyle-CssClass="#FFFFFF" RowStyle-CssClass="gridRow" ShowFooter="false"
            EditRowStyle-CssClass="gridEditRow" FooterStyle-CssClass="gridFooterRow" 
            DataKeyNames="Recvorder_ID">
            <Columns>

             


                <asp:TemplateField HeaderText="Order ID" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="40px">
                    <ItemTemplate>
                    <!--<a class="fancybox" rel="group1" href='OrderDetail.aspx?id=<%#Eval("Recvorder_ID")%>'>
                        <%# Eval("Recvorder_ID")%></a>-->
                    
                    
                    <a href="javascript: OpenWindow(<%# Eval("Recvorder_ID")%>)"><%# Eval("Recvorder_ID")%></a>

                    <!--
                    '_blank', 'height=500,width=800,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no,titlebar=no'-->

                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Customer Email" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="125px">
                    <ItemTemplate>
                        <%# Eval("Customer_ID")%>
                    </ItemTemplate>
               </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Time" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="90px">
                    <ItemTemplate>
                        <%#dtformate(Eval("Recvorder_datetime"))%>
                    </ItemTemplate>
                </asp:TemplateField>
             
               
                <asp:TemplateField HeaderText="Total Amount" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="90px">
                    <ItemTemplate>
                        <%=GetCompanyCurrency()%>
                        <%# Eval("Recvorder_Totalamount")%>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Payment Status" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <%# Eval("Recvorder_Paymentrecvstatus")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlpayemntstatus" runat="server" SelectedValue='<%# Eval("Recvorder_Paymentrecvstatus") %>'>
                            <asp:ListItem Text="Recieved" Value="Recieved"></asp:ListItem>
                            <asp:ListItem Text="Not Recieved" Selected="True" Value="Not Recieved"></asp:ListItem>
                     </asp:DropDownList>
                    </EditItemTemplate>
                 </asp:TemplateField>
                   
                   <asp:TemplateField HeaderText="Payment Method" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                      <asp:Label ID="lbl_paymentmethod" runat="server" Text='<%# Eval("Recvorder_Paymentmethod")%>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Order Status" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                        <%#ChKStatus(Eval("Recvorder_status"))%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlorderstatus" runat="server" SelectedValue='<%# Eval("Recvorder_status") %>'>
                            <asp:ListItem Text="Open" selected="True" Value="Open"></asp:ListItem>
                            <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                           <asp:ListItem Text="Out of Delivery" Value="Out of Delivery"></asp:ListItem>
                           <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                

                 <asp:TemplateField HeaderText="Order From" HeaderStyle-HorizontalAlign="Left"
                    ControlStyle-Width="80px">
                    
                    <ItemTemplate>
                        <%# Eval("Recvorder_ReceivedFrom")%>
                    </ItemTemplate>
                    </asp:TemplateField>





                 <asp:TemplateField HeaderText="Ack. Comments" HeaderStyle-HorizontalAlign="Left"
                    ControlStyle-Width="80px">
                    
                    <ItemTemplate>
                        <%# Eval("Recorder_Ackcomments")%>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <asp:TextBox ID="txtcomments" runat="server" Text='<%# Bind("Recorder_Ackcomments") %>'  TextMode="MultiLine" Width="60px"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="rfvcomments" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtcomments" ErrorMessage="Please Enter Comments" ToolTip="Please Enter Comments"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                    </EditItemTemplate>
                    
                </asp:TemplateField>

                   
                  
               
            </Columns>
            <EmptyDataTemplate>
                <table class="grid" cellspacing="0" rules="all" border="1" id="gvEG" style="border-collapse: collapse;">
                    <tr>
                        <th align="left" scope="col">
                           Recvorder ID
                        </th>
                        <th align="left" scope="col">
                            Time
                        </th>
                        <th align="left" scope="col">
                            Customer
                        </th>
                        <th align="left" scope="col">
                            Total
                        </th>
                        <th align="left" scope="col">
                            Order Status
                        </th>
                        <th scope="col">
                            Payment Method
                        </th>
                          <th scope="col">
                            Payment Status
                        </th>
                         <th align="left" scope="col">
                            View Detail
                        </th>
                        <th align="left" scope="col">
                            Edit
                        </th>
                        <th scope="col">
                            Delete
                        </th>
                    </tr>
                    <tr class="gridRow">
                        <td colspan="8">
                            No Records found...
                        </td>
                    </tr>
                   
                </table>
            </EmptyDataTemplate>
        </asp:GridView>

      

   </asp:Panel>
  
    
   

</asp:Content>
