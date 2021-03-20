<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="rstemenu.Default" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style>
* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 33.33%;
  padding: 5px;
  
  flex: 33.33%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  
  display: table;
}
.row {
  display: flex;
}

 @media screen and (max-width: 500px) {
  .column {
    width: 100%;
  }
}
</style>
     <div class="container" >

        <div class="row">
  <div class="column text-center">
 <a href="Doctor_muhammad_bio.aspx">   <img src="images/Doctor_Muhammad.jpeg" class="img-circle" alt="muhammad" style="width:60%; "> </a>
  </div>
  <div class="column text-center">
   <a href="Doctor_Haris_bio.aspx">  <img src="images/doctor_haris.png" alt="Haris" class="img-circle" style="width:60%;  "> </a>
  </div>
 
</div>

     </div>
     <div class="container" >

        <div class="row">
  <div class="column text-center">
    <asp:LinkButton Text="DR. MOHAMMED ALMUZIAN"  style="font-size:larger;  " runat="server" ID="doc_muhammad_btn" OnClick="doc_muhammad_btn_Click" />
  </div>
  <div class="column text-center">
      <asp:LinkButton Text="DR. HARIS KHAN" style="font-size:larger; " runat="server" ID="LinkButton1" OnClick="doc_haris_khan_Click" />
  </div>
 
</div>

     </div>

    <div class="text-center" runat="server"   style="  margin-top:10%; " >

       <div class="container">
     <asp:Button ID="new_treatment" runat="server" Text="New Patient" Width="80%"    CssClass="btn btn-primary btn-lg" OnClick="new_treatment_Click"   />      
   </div>
        <br />
    
    <div class="container ">
     <asp:Button ID="old_patient_record" runat="server" Text="Registered Patients" Width="80%"  CssClass="btn btn-primary btn-lg" OnClick="old_patient_record_Click"   /> 
   </div>

         <br />
        <% if (Page.User.IsInRole("Admin"))
            {%>
     <div class="container " >
         <asp:Button ID="btn_RegisteredDoctors" runat="server" Text="Registered Doctors" Width="60%"  CssClass="btn btn-primary btn-lg" OnClick="RegisteredDoctors_record_Click"  /> 

     
         
    </div>
    <%} %>
  


       </div>

    
</asp:Content>
