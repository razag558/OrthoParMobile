<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="ManageRestaurant.aspx.cs" Inherits="rstemenu.ManageCompanies" %>
<%@ Register TagPrefix="uc1" TagName="AddNewCompany" Src="Modules/AddNewCompany.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<style type="text/css">
.complistpanel td,th{
    font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
    font-size: 14px;
  }


</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>


<script type="text/javascript" src="fancybox/jquery.mousewheel-3.0.2.pack.js"></script>
<script type="text/javascript" src="fancybox/jquery.fancybox-1.3.1.js"></script>
<link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-1.3.1.css" media="screen" />

    
<script type="text/javascript">
    $(document).ready(function () {
        $(".MEmailPopup").fancybox({
            'width': '50%',
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





<script type="text/javascript" language="javascript">
    function ConfirmOnDelete(item) {
        if (confirm("Are you sure to delete: " + item + "?") == true)
            return true;
        else
            return false;
    }
    </script>

   
<div >


<asp:Button ID="btn_back" runat="server" Text="Back"  Visible="false"   
        CausesValidation="false" onclick="btn_back_Click"  />
        <asp:Button ID="btn_AddNewCompany" runat="server" Text="Add New Restaurant"  
          CausesValidation="false" onclick="btn_AddNewCompany_Click"  />

        </div>

        <div>
 <asp:Panel ID="pn_CompaniesList" runat="server" ScrollBars="Both" CssClass="complistpanel">
<h2>Manage Restaurants </h2>
<hr />


    
     <asp:GridView ID="GV_CompaniesList" runat="server" CellPadding="4" Width="100%"
         ForeColor="#000000" GridLines="None" AutoGenerateColumns="False" 
          onrowdeleting="GV_CompaniesList_RowDeleting" 
         OnRowCommand="GV_CompaniesList_RowCommand" 
         onrowdatabound="GV_CompaniesList_RowDataBound" onrowupdating="GV_CompaniesList_RowUpdating" 
          >
         <AlternatingRowStyle BackColor="#CACACA" />
         <Columns>
             <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                     <asp:Label ID="lbl_CompID" runat="server" Text='<%# Bind("CompID") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField DataField="CompName" HeaderText="Restaurant Name" />
             <asp:BoundField DataField="CompEmail" HeaderText="Email" />
             <asp:BoundField DataField="CompPhone" HeaderText="Phone No." />
            
             <asp:BoundField DataField="CompCountry" HeaderText="Country" />
             <asp:BoundField DataField="CompCurrency" HeaderText="Currency" />
             <asp:BoundField DataField="CompExpireDate" HeaderText="Expire Date" />

             <asp:CheckBoxField DataField="CompPublish" HeaderText="Publish" ItemStyle-HorizontalAlign="Center"/>
             <asp:TemplateField HeaderText="TV App" ItemStyle-HorizontalAlign="Center">
                  <ItemTemplate>
                  <asp:CheckBox  runat="server" ID="chk_istvapp" Enabled="false" Checked='<%#cbool(Eval("IsTVApp"))%>' />
                     
                 </ItemTemplate>
             </asp:TemplateField>
             
             <asp:TemplateField ShowHeader="False"></asp:TemplateField>

             <asp:TemplateField ShowHeader="False">
                 <ItemTemplate>
                 <a href='RestaurantDataDetail.aspx?id=<%# Eval("CompID")%>'>Data</a>
                  &nbsp;|&nbsp;
                 <a href='EditRestaurant.aspx?id=<%# Eval("CompID") %>'>
                 <img src="images/icons/EditIco.png" border="0" /></a>
                  &nbsp;|&nbsp;

                    <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" 
                         CommandName="Delete"  CommandArgument='<%# Eval("CompID") %>' CssClass="delbutton" Width="25px" Height="21" ></asp:LinkButton>
                         &nbsp;|&nbsp;
                          
                         <a  class="MEmailPopup" href='EmailCrdentials.aspx?rid=<%# Eval("CompID") %>'><img src="images/emailcredential.png" border="0" /></a>
                        
                         &nbsp;|&nbsp; 

                         <asp:LinkButton ID="btn_UpdateBusinessData" runat="server" CausesValidation="false" 
                         CommandName="UpdateData"  CommandArgument='<%# Eval("CompID") %>' CssClass="updatebutton" Width="25px" Height="21" ></asp:LinkButton>


                     </ItemTemplate>
             </asp:TemplateField>

             

         </Columns>        <EditRowStyle BackColor="#2461BF" />
         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="Black" />
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
</div>

    <asp:Panel ID="pn_AddNewCompany" runat="server"  Visible="false">
   
    <uc1:AddNewCompany ID="ctrl_addnewcompany" runat="server" />

    </asp:Panel>
   
</asp:Content>
