<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" validateRequest="false" AutoEventWireup="true" CodeBehind="PNotification.aspx.cs" Inherits="rstemenu.PNotification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>


<script type="text/javascript" src="fancybox/jquery.mousewheel-3.0.2.pack.js"></script>
<script type="text/javascript" src="fancybox/jquery.fancybox-1.3.1.js"></script>
<link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-1.3.1.css" media="screen" />

    
<script type="text/javascript">
    $(document).ready(function () {
        $(".MMSGPopup").fancybox({
            'width': '60%',
            'height': '85%',
            'autoScale': false,
            'transitionIn': 'none',
            'transitionOut': 'none',
            'openEffect': 'elastic',
            'closeEffect': 'elastic',
            'type': 'iframe'
        });

       
    });
  
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <div class="jumbotron">
        <h2>JeM POS Push Notifications</h2>
         </div>

    <div class="row">
        <div class="col-md-4">
        <!--    Device Token<br />
             <asp:TextBox ID="txtDeviceToken" runat="server" Width="550px" ></asp:TextBox><br />-->
            Message <br />
     <asp:TextBox ID="txtMessage" runat="server" Width="550px" TextMode="MultiLine" Rows="5" placeholder="Write message here"></asp:TextBox>
            
             <br />
            <asp:RadioButton ID="rb_temp" runat="server" GroupName="MessageType"  Text="Temporarny Message" Checked="true" /><br />
            <asp:RadioButton ID="rb_Permanent" runat="server" GroupName="MessageType"  Text="Permanent Message (Gerneral)" /><br />
            <asp:RadioButton ID="rb_permanentver" runat="server" GroupName="MessageType"  Text="Permanent Message (App new ver update)" /><br /><br />
            
            <asp:Button ID="btn_clearallnotifications" runat="server" CssClass="submitButtona" Text="Clear All Notifications" OnClick="btn_clearallnotifications_Click"/>
           
     <br />
    <asp:Button ID="btn_Save" Text="Send Mesage" runat="server" onclick="btn_Save_Click"  Visible="false"/>
  

        </div>
    </div>


    <div>
     <asp:Label ID="lblStatus" runat="server" ></asp:Label>
           <div style="float:right;margin-right:20px; padding-bottom:5px;">
            <asp:Button ID="btn_submit" runat="server" Text="Send Notification"  CssClass="submitButtona" OnClick="btn_submite_Click" />

        </div>
<asp:GridView ID="Gv_TokenList"   Runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CellPadding="4" ForeColor="#333333" GridLines="None" onrowcommand="Gv_TokenList_RowCommand" 
                     
        onrowdatabound="Gv_TokenList_RowDataBound" 
            onprerender="Gv_TokenList_PreRender" onrowdeleting="Gv_TokenList_RowDeleting" Width="100%">
           <AlternatingRowStyle BackColor="#CACACA" />
        <Columns>
        <asp:TemplateField  HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center"   ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
          <ItemTemplate>
           
           <asp:CheckBox ID="cb_Checked"  runat="server" Checked="false" />

             
                    </ItemTemplate>
                    </asp:TemplateField>
          
            <asp:TemplateField HeaderText="Token ID" HeaderStyle-HorizontalAlign="Left" >
                  
                    <ItemTemplate>
                        <asp:Label ID="lbl_TokenID" runat="server" Text='<%# Eval("ID")%>' Visible="true"></asp:Label>
                   
                    
                    </ItemTemplate>
                </asp:TemplateField>
                     
          <asp:TemplateField HeaderText="Device Token" HeaderStyle-HorizontalAlign="Left" >
                  
                    <ItemTemplate>
                        
                   <asp:Label ID="DeviceToken" runat="server" Text='<%# Eval("DeviceToken")%>'></asp:Label>
                    
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Created Date" HeaderStyle-HorizontalAlign="Left" >
                   
                    <ItemTemplate>
                        <%# Eval("UDateTime")%>
                    </ItemTemplate>
                </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Device Name" HeaderStyle-HorizontalAlign="Left" >
                   
                    <ItemTemplate>
                        <%# Eval("DeviceName")%> 
                        
                    </ItemTemplate>
                </asp:TemplateField>
            
            
                
            <asp:TemplateField HeaderText="Business Name" HeaderStyle-HorizontalAlign="Left" >
                   
                    <ItemTemplate>
                        <%# Eval("Compid")%> -
                        <%#BusinessName(Eval("Compid"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                
            <asp:TemplateField  HeaderStyle-HorizontalAlign="Left" >
                   
                    <ItemTemplate>
                        
                        <a class="MMSGPopup" href='NotificationMsgDetail.aspx?tid=<%# Eval("ID")%>&token=<%# Eval("DeviceToken")%>' ><img src="images/icons/msgicon.png" /></a>
                    
                        &nbsp;|&nbsp;
                    <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" 
                         CommandName="Delete"  CommandArgument='<%# Eval("ID") %>' CssClass="delbutton" Width="25px" Height="21" ></asp:LinkButton>
                     
                    
                    
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



    </div>



</asp:Content>
