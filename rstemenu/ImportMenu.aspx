<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportMenu.aspx.cs" Inherits="rstemenu.ImportMenu"
    MasterPageFile="~/Site.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <!--<script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery.quicksearch.js" type="text/javascript"></script>-->
    <script type="text/javascript">
        $(function () {
            $('input#id_search').quicksearch('table#Gv_Userlist tbody tr');
        })
       

    </script>
    <div class="box">
        <div class="heading">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left">
                        <h1>
                            <span>Import Menu </span>
                        </h1>
                    </td>
                    <td class="right_links">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" height="10px">
                    </td>
                </tr>
            </table>
        </div>
        <div class="content">
            <div id="divMessage" onclick="this.visible='false';">
                <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="StartPage">
                <asp:FileUpload ID="fupExcel" runat="server" Width="629px" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Has Header ?" />
                <asp:RadioButtonList ID="rbHDR" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label2" runat="server" Text="Categories" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportCategory" runat="server" Text="Import Categories..." OnClick="btnImportCategory_Click2"
                                OnClientClick="return confirm('This will import bulk data into Categories, Modifiers, Items and Item Modifiers into system. Do you want to proceed?')" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <div style="width: 100%; overflow: auto; vertical-align:middle;">
                    <asp:GridView ID="gvCategory" runat="server" OnPageIndexChanging="gvCategory_PageIndexChanging"
                        AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>
                <br />

                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label4" runat="server" Text="Products" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportItems" runat="server" Text="Import Products..." OnClick="btnImportItems_Click2"
                                OnClientClick="return confirm('This will import bulk data into ITEMS table. Do you want to proceed?')" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                    </tr>
                </table>

                 <br />
                <div style="width: 100%; overflow: auto; vertical-align:middle;">
                    <asp:GridView ID="gvItems" runat="server" OnPageIndexChanging="gvItems_PageIndexChanging"
                        AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>
                <br />
                <br />
               
               
                <br />
                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label5" runat="server" Text="Products Modifiers" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportItemModifiers" runat="server" Text="Import Product Modifiers..." OnClick="btnImportItemModifiers_Click2"
                                OnClientClick="return confirm('This will import bulk data into ITEM MODIFIERS table. Do you want to proceed?')" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <div style="width: 100%; overflow: auto; vertical-align:middle;">
                    <asp:GridView ID="gvItemModifiers" runat="server" OnPageIndexChanging="gvItemModifiers_PageIndexChanging"
                        AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>
                <br />


             


            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 90%;
        }
        .style4
        {
            width: 80%px;
        }
        .style5
        {
            width: 80%;
            text-align: right;
        }
    </style>
</asp:Content>

