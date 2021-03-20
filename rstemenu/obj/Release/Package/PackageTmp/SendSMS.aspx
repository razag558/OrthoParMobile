<%@ Page Title="" Language="C#" MasterPageFile="sadmin.Master" AutoEventWireup="true" CodeBehind="SendSMS.aspx.cs" Inherits="rstemenu.SendSMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
Message <br />
<asp:TextBox ID="txt_message" runat="server" Columns="80" ></asp:TextBox>
<br />
Cell No<br />
<asp:TextBox ID="txt_cellno" runat="server"  Columns="50"></asp:TextBox>


<br /><br />
<asp:Button ID="btn_sendsms" runat="server" text="Send SMS" onclick="btn_sendsms_Click" />


</asp:Content>
