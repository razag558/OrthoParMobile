<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="RestaurantDataDetail.aspx.cs" Inherits="rstemenu.RestaurantDataDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Restaurant Data Detail </h2>
<hr />

<br />
<table width="100%" cellspacing="5px">
<tr>
<td align="left" width="20%">Total Products</td>
<td align="left"><asp:Label ID="lbl_TotalProducts" runat="server" Text="0"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Categories</td>
<td align="left"><asp:Label ID="lbl_TotalCategories" runat="server" Text="0"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Selections</td>
<td align="left"><asp:Label ID="lbl_TotalSelections" runat="server" Text="0"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Products with Selections</td>
<td align="left"><asp:Label ID="lbl_TotalProductsSelections" runat="server" Text="0"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Modifiers Assigned to Selections</td>
<td align="left"><asp:Label ID="lbl_TotalModifiersAssignedtoSelections" runat="server" Text="0"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Tables</td>
<td align="left"><asp:Label ID="lbl_TotalTables" runat="server" Text="0"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Users</td>
<td align="left"><asp:Label ID="lbl_TotalUsers" runat="server" Text="290"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Customers</td>
<td align="left"><asp:Label ID="lbl_TotalCustomers" runat="server" Text="290"></asp:Label></td>
</tr>

<tr>
<td align="left" width="20%">Total Coupon Codes</td>
<td align="left"><asp:Label ID="lbl_TotalCoponCodes" runat="server" Text="290"></asp:Label></td>
</tr>

</table>



</asp:Content>
