<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditRestaurant.aspx.cs" Inherits="rstemenu.EditCompanies"  MasterPageFile="sadmin.Master" %>
<%@ Register TagPrefix="uc1" TagName="EditCompany" Src="Modules/EditCompanies.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<uc1:EditCompany ID="ctrl_editcompany" runat="server" />
</asp:Content>
