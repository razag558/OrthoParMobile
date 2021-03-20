<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Midline.aspx.cs" Inherits="rstemenu.Midline" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div  class="container "  style="width:100%;    padding-top:10%;    "  >
         <div   class="well" style="text-align:center;">
   
          <asp:Label  Text="MIDLINE"   runat="server"  Style=" width:100%;   " CssClass="Labelhh" />
       
      </div>

        
    <div class="container" >

        <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="midline_s0" Text="Score 0" runat="server" GroupName="midline_1" /> 
                                                  
                                                                  <a href="helppage.aspx?id=46&heading=mid0"> <span  style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="midline_s1" Text="Score 1" runat="server"  GroupName="midline_1"/> 

                                                  
                                                           <a href="helppage.aspx?id=47&heading=mid1" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="midline_s2" Text="Score 2" runat="server" GroupName="midline_1" /> 

                                                  
                                                           <a href="helppage.aspx?id=48&heading=mid2" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
             </div>

            
         

         
         


        </div>

        <div class="container" style="text-align:end; margin-top:15px; width:92%;" > 
             <div class="row">
                    <asp:Label runat="server" Width="100%" CssClass="text-danger text-right" ID="showing_error" Text="Please Complete all domains to Continue" Visible="false" ></asp:Label>

                </div>
            <asp:Button class="btn btn-primary" Text="SUBMIT" ID="submit_lower_right" runat="server" OnClick="submit_lower_right_Click"   />
         </div>

         </div>

</asp:Content>
