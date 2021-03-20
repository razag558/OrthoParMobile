<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Crowding.aspx.cs" Inherits="rstemenu.Crowding" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container " style="padding-top:10%;">
    <div class="col-md-12 col-sm-12 col-xm-12"  style="margin-top:10px;" > 
     <asp:Button ID="btn_uper" runat="server" Text="Upper Anterior Segment" Width="90%"    CssClass="btn btn-primary btn-lg" OnClick="btn_uper_Click" />   
           <div class="text-center" style="margin-top:10px;">   
         <a href="helppage.aspx?id=2" class="col-sm-5 col-xm-5" > <span style="margin-left:15px; font-size:17px;" class="glyphicon glyphicon-info-sign"></span> </a>
           <asp:LinkButton  Text="Reset" runat="server" class="col-sm-5 col-xm-5" style="margin-left:15px; font-size:17px;" ID="reset_button5" OnClick="reset_button5_Click" ></asp:LinkButton>
     </div>
   </div>
 
    <div class="col-md-12 col-sm-12 col-xm-12"  style="margin-top:10px;" > 
     <asp:Button ID="btn_lower" runat="server" Text="Lower Anterior Segment" Width="90%"   CssClass="btn btn-primary btn-lg" OnClick="btn_lower_Click" /> 
         <div class="text-center" style="margin-top:10px;">     
           <a href="helppage.aspx?id=2" class="col-sm-5 col-xm-5" > <span style="margin-left:15px; font-size:17px; " class="glyphicon glyphicon-info-sign"></span> </a>
            <asp:LinkButton  Text="Reset" class="col-sm-5 col-xm-5" runat="server" style="margin-left:15px; font-size:17px; "   ></asp:LinkButton>
     
   </div>
        </div>
            </div>
</asp:Content>
