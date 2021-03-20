<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/sadmin.Master"  CodeBehind="Doctor_Haris_bio.aspx.cs" Inherits="rstemenu.Doctor_Haris_bio" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
         <div class="container"   >
 
        <div class="text-left" >
         <asp:Button runat="server" ID="backbutton" CssClass="btn- btn-default btn-lg" Text="Back" OnClick="backbutton_Click" Visible="false" /> 
            </div>
      
        



    </div>
        
   <center>  <asp:Image runat="server" ImageUrl="images/doctor_haris.png" alt="Haris" width="80%" CssClass="img-circle" /> </center>
   <center>    <h2 style="color:#386072;"  >Doctor Haris Khan</h2> </center>
    <center>    <h4 style="color:#414445;  "> Associate Professor Orthodontics </h4> </center>
    <div style="width:90%;  height:300px; margin-top:10%;" >
     <h4 style="color:#414445;""> Achievements </h4>  
    
        
    
      
             <ul style="margin-top:2%;">
                 <li> BDS </li>
                  <li>FCPS</li>
                  <li>FFDRCSI</li>


             </ul>     
        <!-- first one  -->
        <p class="text-left" style="width:90%; " >

            Dr. Haris khan graduated in dentistry from Nishtar medical college in 2004 and acquired fellowship in orthodontics from College 
            of Physician and Surgeons Pakistan in 2010 and Royal College of Surgeons, Ireland in 2015. Since 2010, he is teaching at various
             positions and is presently working as Associate professor of orthodontics in Institute of dentistry CMH Lahore medical college. 
            Dr.Haris Khan has worked on many research projects in orthodontics and has authored a book on orthodontic brackets.


        </p>

      
    </div>
 </asp:Content>