<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSelectionModifiers.aspx.cs" Inherits="rstemenu.AddSelectionModifiers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    $("[id*=chkHeader]").live("click", function () {
        var chkHeader = $(this);
        var grid = $(this).closest("table");
        $("input[type=checkbox]", grid).each(function () {
            if (chkHeader.is(":checked")) {
                $(this).attr("checked", "checked");
                $("td", $(this).closest("tr")).addClass("selected");
            } else {
                $(this).removeAttr("checked");
                $("td", $(this).closest("tr")).removeClass("selected");
            }
        });
    });
    $("[id*=chkRow]").live("click", function () {
        var grid = $(this).closest("table");
        var chkHeader = $("[id*=chkHeader]", grid);
        if (!$(this).is(":checked")) {
            $("td", $(this).closest("tr")).removeClass("selected");
            chkHeader.removeAttr("checked");
        } else {
            $("td", $(this).closest("tr")).addClass("selected");
            if ($("[id*=chkRow]", grid).length == $("[id*=chkRow]:checked", grid).length) {
                chkHeader.attr("checked", "checked");
            }
        }
    });
</script>
<style type="text/css">
    .grid th {
        padding: 5px 4px 5px 8px;
        }
    .selected
    {
        background-color: #A1DCF2;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script src="https://use.fontawesome.com/ea53e1672b.js"></script>

<div class="StartPage">
<div class="box">

<div class="heading" >
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr ><td style="width:80%;" valign="middle">
<h1>
<span>
Add Selection Modifiers
<%if (Request.QueryString["item"] != null) { %>
    - <%=Request.QueryString["item"]%>
<%}%>
</span></h1>
</td>
<td class="right_links" style="width:20%; padding-top: 5px;">
<%if (Request.QueryString["id"] != null)
  { %>
<a href="ManageSelection.aspx" class="bar-btn" title="Manage Selection">Manage Selection</a>
<%}%>
  
</td>
</tr>
</table>
</div>

<div class="content">
<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UP_PanelGV" runat="server">
                    <ContentTemplate>

<table width="100%">
<tr>
<!-- Column First -->
<td width="45%" valign="top" >
<div class="heading" style="height:30px;">
  <h2 style="margin-top:0px;color:#fff;font-size:1.3em;font-weight:normal;padding-top: 3px;">
  Modifiers List 
  <asp:Button ID="btn_Apply" runat="server" Text="Apply" CssClass="bar-btn" onclick="btn_Apply_Click" style="padding: 4px 8px 4px 8px;float: right;margin: 0px 0;" />
</h2>
</div>
<table width="100%">

<tr>
<td width="100%" style="border:1px solid #ccc;">
<div style="text-align:center">

  <asp:DropDownList ID="ddl_ModifierGroupList" runat="server" DataTextField="MC_Name" DataValueField="ID" onselectedindexchanged="ddl_ModifierGroupList_SelectedIndexChanged" AutoPostBack="true" CssClass="textbox" style="width: 300px; height: 30px;"></asp:DropDownList>

</div>
<h2><asp:Label ID="lbl_selmod" runat="server" Text="Select Modifier for this Item" Visible="false"></asp:Label></h2>

<asp:GridView ID="GV_ModifierList" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None"  Width="100%"
      AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow"  DataKeyNames="MenuItem_ID" onrowcommand="GV_ModifierList_RowCommand" onrowdatabound="GV_ModifierList_RowDataBound"   onrowdeleting="GV_ModifierList_RowDeleting" HeaderStyle-CssClass="" CssClass="grid">
        <Columns>
            <asp:TemplateField ControlStyle-Width="16px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate>
               <asp:CheckBox ID="chkHeader" runat="server" />
                </HeaderTemplate>

               <ItemTemplate>
               <asp:checkbox Visible="true" ID="chkRow" CssClass="gridCB" runat="server" ></asp:checkbox>               
                  
                </ItemTemplate>
            </asp:TemplateField>            


            <asp:TemplateField HeaderText="Name" ControlStyle-Width="150px"   HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
               <ItemTemplate>
                    <asp:Label ID="lbl_MenuItemID" runat="server" Text='<%# Eval("MenuItem_ID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MenuItem_Name") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            

            <asp:TemplateField HeaderText="Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_Price" runat="server" Text='<%#priceformat(Eval("MenuItem_Price")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="Delivery Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_DPrice" runat="server" Text='<%#priceformat(Eval("MenuItem_DeliveryPrice")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Online Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_OPrice" runat="server" Text='<%#priceformat(Eval("MenuItem_OnlinePrice")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>

             <asp:TemplateField HeaderText="Type" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
                    <asp:Label ID="lbl_modtype" runat="server" Text='<%# Bind("MenuItem_ModifierType") %>' ToolTip='<%#ToolTipType(Eval("MenuItem_ModifierType")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

           

            
            <asp:CheckBoxField Visible="false"
             DataField="MenuItem_Publish" HeaderText="Publish" ItemStyle-HorizontalAlign="center" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center"/>
            
            
            <asp:TemplateField  Visible="false"
             ControlStyle-Width="70px" ItemStyle-HorizontalAlign="right"   HeaderStyle-HorizontalAlign="right">
                 <ItemTemplate >
                 <a href='AddItemModifier.aspx?id=<%# Eval("MenuItem_ID") %>'>
                 <img src="/images/icons/edit_icon.png" border="0" /></a>
                  &nbsp;|&nbsp;

                    <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" 
                         CommandName="Delete"  CommandArgument='<%# Eval("MenuItem_ID") %>' CssClass="delbutton" Width="19px" Height="22px" ></asp:LinkButton>
                 </ItemTemplate>
             </asp:TemplateField>
            
        </Columns>
       <FooterStyle BackColor="#745C52" Font-Bold="True" ForeColor="White" />
          <RowStyle CssClass="rowstyle" />
            
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
       
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#354D6F" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#354D6F" />
    </asp:GridView>

</td>
</tr>

</table>
</td>


<td width="10%" >&nbsp;</td>

<!--2nd Column -->
<td width="45%" valign="top" >
<div class="heading" style="height:30px;">
  <h2 style="margin-top:0px;color:#fff;font-size:1.3em;font-weight:normal;padding-top: 3px;">Selected Modifiers</h2>
</div>

<table width="100%">

<tr>
<td width="100%" style="border:1px solid #ccc;">
<asp:Label ID="lbl_ModifierGroupName" runat="server" Text=""  Font-Underline="true" Visible="false"></asp:Label>
<asp:GridView ID="GV_ItemModifierList" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None"  Width="100%"
      AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow"  DataKeyNames="MenuItem_ID" onrowcommand="GV_ItemModifierList_RowCommand" onrowdatabound="GV_ItemModifierList_RowDataBound"   onrowdeleting="GV_ItemModifierList_RowDeleting"  HeaderStyle-CssClass="" CssClass="grid">
        <Columns>
            
            <asp:TemplateField HeaderText="Name" ControlStyle-Width="150px"   HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
               <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MenuItem_Name") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
           
             <asp:TemplateField HeaderText="Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
                <asp:Label ID="lbl_MenuItemID2" runat="server" Text='<%# Eval("MenuItem_ID") %>' Visible="false"></asp:Label>
               <asp:Label ID="lbl_Price" runat="server" Text='<%#priceformat(Eval("MenuItem_Price")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>
                 <asp:TemplateField HeaderText="Delivery Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_DPrice" runat="server" Text='<%#priceformat(Eval("MenuItem_DeliveryPrice")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Online Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_OPrice" runat="server" Text='<%#priceformat(Eval("MenuItem_OnlinePrice")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>
             <asp:TemplateField HeaderText="Type" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
                    <asp:Label ID="lbl_modtype" runat="server" Text='<%# Bind("MenuItem_ModifierType") %>' ToolTip='<%#ToolTipType(Eval("MenuItem_ModifierType")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Action" ControlStyle-Width="20px" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center">
                 <ItemTemplate >
                 
                    <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" CommandName="Delete" CommandArgument='<%# Eval("MenuItem_ID") %>' CssClass="delbutton"  Height="22px" ></asp:LinkButton>
                 </ItemTemplate>
             </asp:TemplateField>
            
        </Columns>
       <FooterStyle BackColor="#745C52" Font-Bold="True" ForeColor="White" />
          <RowStyle CssClass="gridRow" />
            
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
       
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#354D6F" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#354D6F" />
    </asp:GridView>


</td>
</tr>

</table>




</td>
</tr>


</table>









  </ContentTemplate>
    </asp:UpdatePanel>









</div>

</div>
</div>



    <asp:Label ID="lbl_RestaurantTimeZone" runat="server"  visible="false" ></asp:Label>


</asp:Content>
