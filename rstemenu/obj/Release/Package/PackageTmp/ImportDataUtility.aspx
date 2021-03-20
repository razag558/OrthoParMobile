<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="ImportDataUtility.aspx.cs" Inherits="rstemenu.ImportDataUtility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript" language="javascript">
    function ConfirmOnImport() {

        var item = document.getElementById("<%=DDL_CompanyList.ClientID%>").options[document.getElementById("<%=DDL_CompanyList.ClientID%>").selectedIndex].text

        if (confirm("Are you sure to delete: " + item + "?") == true)
            return true;
        else
            return false;
    }

    
    



    </script>
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<asp:Panel ID="pn_CompaniesList" runat="server" ScrollBars="Both" 
        CssClass="complistpanel" Height="1143px">
<h2>Import Data Utility </h2>
<hr />
<div>
           
           <asp:DropDownList ID="DDL_CompanyList" runat="server" DataTextField="CompName" DataValueField="CompID" CssClass="ddl"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFV_Companyname" runat="server" 
            ControlToValidate="DDL_CompanyList" ErrorMessage="Restaurant Name required." InitialValue="0" CssClass="errormsg"  >*</asp:RequiredFieldValidator>
           
<br /><br />
</div>


            <div id="divMessage" onclick="this.visible='false';">
                <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="StartPage">
                <asp:FileUpload ID="fupExcel" runat="server" Width="629px" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                <br />
                <!--<asp:Label ID="Label1" runat="server" Text="Has Header ?" />
                <asp:RadioButtonList ID="rbHDR" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>-->
                <br />
                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label2" runat="server" Text="Categories" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportCategory" runat="server" Text="Import Categories..." OnClick="btnImportCategory_Click2"
                                 OnClientClick="return confirm('This will import bulk data into Categories. Do you want to proceed?')"  />
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
                <hr />
                <br />

                <div style="width: 100%; overflow: auto; vertical-align:middle;">
                    <asp:GridView ID="gvCategory" runat="server" OnPageIndexChanging="gvCategory_PageIndexChanging"
                        AllowPaging="false" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>

<br />


                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="lbl_Suppliers" runat="server" Text="Suppliers" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportSuppliers" runat="server" Text="Import Suppliers..." OnClick="btnImportSuppliers_Click2"
                                 OnClientClick="return confirm('This will import bulk data into Suppliers. Do you want to proceed?')"  />
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
                    <asp:GridView ID="gv_Suppliers" runat="server" OnPageIndexChanging="gv_Suppliers_PageIndexChanging"
                        AllowPaging="false" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>


                <br />
                <hr />
                <br />


                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="lbl_Brands" runat="server" Text="Brands" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImortBrands" runat="server" Text="Import Brands..." OnClick="btnImortBrands_Click2"
                                 OnClientClick="return confirm('This will import bulk data into Brands. Do you want to proceed?')"  />
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
                    <asp:GridView ID="gv_Brands" runat="server" OnPageIndexChanging="gv_Brands_PageIndexChanging"
                        AllowPaging="false" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>


                <br />
                <hr />
                <br />


                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label4" runat="server" Text="Products" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportItems" runat="server" Text="Import Products..." OnClick="btnImportItems_Click2"
                                OnClientClick="return confirm('This will import bulk data into Products table. Do you want to proceed?')" />
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
                        AllowPaging="false" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>
               <br />
                <hr />
                <br />


                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="lbl_SelectionsTitle" runat="server" Text="Selections" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportSelection" runat="server" Text="Import Selections..." OnClick="btnImportSelection_Click2"
                                OnClientClick="return confirm('This will import bulk data into Selections table. Do you want to proceed?')" />
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
                    <asp:GridView ID="gvSelections" runat="server" OnPageIndexChanging="gvSelections_PageIndexChanging"
                        AllowPaging="false" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>

                <br />
                <hr />
                <br />

            
                <table class="style1">
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label5" runat="server" Text="Selection Modifiers" Font-Bold="True" Font-Size="Larger"
                                Font-Underline="True"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Button ID="btnImportItemModifiers" runat="server" 
                                Text="Import Selection Modifiers..." OnClick="btnImportItemModifiers_Click2"
                                
                                OnClientClick="return confirm('This will import bulk data into Selection Modifiers table. Do you want to proceed?')" />
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
                        AllowPaging="False" BackColor="White" BorderColor="#E7E7FF" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                        AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" >
                    </asp:GridView>
                </div>
                <br />


             


            </div>

             <asp:Label ID="lbl_RestaurantTimeZone" runat="server"  visible="false" ></asp:Label>
</asp:Panel>
</asp:Content>
