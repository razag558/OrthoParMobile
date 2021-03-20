<%@ Page Title="Add Food Item Modifiers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItemModifier.aspx.cs" Inherits="rstemenu.AddItemModifier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<script src="https://use.fontawesome.com/ea53e1672b.js"></script>

<div class="StartPage">
<div class="box">

<div class="heading">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr ><td style="width:80%;" valign="middle">
<h1>
<span>
Add Food Item Modifiers
<%if (Request.QueryString["item"] != null)
  { %>
    [<%=Request.QueryString["item"]%>]
<%}%>
</span></h1>
</td>
<td class="right_links" style="width:20%;">
<!--<a href="ManageFoodItems.aspx" class="bar-btn" title="Manage Products">Manage Products</a>
&nbsp;-->
<%if (Request.QueryString["id"] != null)
  { %>
<a href='AddUpdateMenuItem.aspx?id=<%=Request.QueryString["id"]%>' class="bar-btn" title="Manage Product">Manage Product</a>
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

<table width="100%" border="0">
<tr><td width="40%" valign="top">

<asp:DropDownList ID="ddl_ModifierGroupList" runat="server" DataTextField="MC_Name" 
        DataValueField="ID"  CssClass="ddl2" 
        onselectedindexchanged="ddl_ModifierGroupList_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>&nbsp;

<div class="upspace"></div>
<h2><asp:Label ID="lbl_selmod" runat="server" Text="Select Modifier for this Item" Visible="false"></asp:Label></h2>
<div style="background-color:#FCFCFC;padding-left:5px;">
<asp:GridView ID="GV_ModifierList" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None"  Width="100%"
      AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow"  DataKeyNames="MenuItem_ID" onrowcommand="GV_ModifierList_RowCommand" onrowdatabound="GV_ModifierList_RowDataBound"   onrowdeleting="GV_ModifierList_RowDeleting" HeaderStyle-CssClass="grid321">
        <Columns>
            <asp:TemplateField ControlStyle-Width="10px" HeaderStyle-HorizontalAlign="left" ItemStyle-HorizontalAlign="left">
               <ItemTemplate>
               <asp:checkbox Visible="true" ID="cbSelect" CssClass="gridCB" runat="server" AutoPostBack="true" OnCheckedChanged="cbSelect_CheckedChanged"></asp:checkbox>
               
                 <asp:Button Visible="false"
                  ID="btn_select" runat="server" OnClick="btn_select_Clicked"  CssClass="bar-btn2"  />   
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name" ControlStyle-Width="150px"   HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
               <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MenuItem_Name") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            

            <asp:TemplateField HeaderText="Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_Price" runat="server" Text='<%#priceformat(Eval("MenuItem_Price")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>

             <asp:TemplateField HeaderText="Type" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
                    <asp:Label ID="lbl_modtype" runat="server" Text='<%# Bind("MenuItem_ModifierType") %>' ToolTip='<%#ToolTipType(Eval("MenuItem_ModifierType")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

           

            
            <asp:CheckBoxField Visible="false"
             DataField="MenuItem_Publish" HeaderText="Publish" ItemStyle-HorizontalAlign="center" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center"/>
            
            
            <asp:TemplateField   Visible="false"
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
    </div>
</td>
<td width="5%" >&nbsp;</td>
<td width="50%" valign="top" bgcolor="#FCFCFC" style="padding-left:5px;">
<h2>
<asp:Label ID="lbl_ModifierGroupName" runat="server" Text="" Font-Underline="true"></asp:Label>
</h2><div class="upspace"></div>


<asp:GridView ID="GV_ItemModifierList" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None"  Width="100%"
      AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow"  DataKeyNames="MenuItem_ID" onrowcommand="GV_ItemModifierList_RowCommand" onrowdatabound="GV_ItemModifierList_RowDataBound"   onrowdeleting="GV_ItemModifierList_RowDeleting"  HeaderStyle-CssClass="grid321">
        <Columns>
            
            <asp:TemplateField HeaderText="Name" ControlStyle-Width="150px"   HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
               <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MenuItem_Name") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
           
             <asp:TemplateField HeaderText="Price" HeaderStyle-Width="10%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
               <asp:Label ID="lbl_Price" runat="server" Text='<%#priceformat(Eval("MenuItem_Price")) %>' ></asp:Label>
               </ItemTemplate>
               </asp:TemplateField>

             <asp:TemplateField HeaderText="Type" ControlStyle-Width="5%"  HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="center">
               <ItemTemplate>
                    <asp:Label ID="lbl_modtype" runat="server" Text='<%# Bind("MenuItem_ModifierType") %>' ToolTip='<%#ToolTipType(Eval("MenuItem_ModifierType")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField  
             ControlStyle-Width="70px" ItemStyle-HorizontalAlign="right"   HeaderStyle-HorizontalAlign="right">
                 <ItemTemplate >
                 
                    <asp:LinkButton ID="btn_Delete" runat="server" CausesValidation="false" 
                         CommandName="Delete"  CommandArgument='<%# Eval("MenuItem_ID") %>' CssClass="delbutton" Width="19px" Height="22px" ></asp:LinkButton>
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




  </ContentTemplate>
    </asp:UpdatePanel>









</div>

</div>
</div>
</div>


</asp:Content>
