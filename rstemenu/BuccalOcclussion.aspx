<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="BuccalOcclussion.aspx.cs" Inherits="rstemenu.BuccalOcclussion1" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     

        <div class="container " style="padding-top:10%;">
   <div class="col-md-12" style="text-align:center; margin-top:10px;"> 
     
     <asp:Button ID="btn_uper_occlusion" runat="server" Text="Right buccal occlusion" Width="90%"    CssClass="btn btn-primary btn-lg" OnClick="btn_uper_occlusion_Click"  />   
        <asp:LinkButton  Text="Reset" runat="server" style="margin-left:15px; font-size:17px;  margin-top:10px; "  ID="reset_button5" OnClick="reset_button5_Click" ></asp:LinkButton>
      
   </div>
            </div>

 <div class="container ">
   <div class="col-md-12" style="text-align:center; margin-top:10px;"> 
   
     <asp:Button ID="btn_lower_occlusion" runat="server" Text="Left buccal occlusion" Width="90%"   CssClass="btn btn-primary btn-lg" OnClick="btn_lower_occlusion_Click"   /> 
            <asp:LinkButton  Text="Reset" runat="server" style="margin-left:15px;font-size:17px; margin-top:10px; " ID="LinkButton1"  ></asp:LinkButton>
         
   
   </div>
    </div>
</asp:Content>
