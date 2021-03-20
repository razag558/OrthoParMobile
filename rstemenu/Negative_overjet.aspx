<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="Negative_overjet.aspx.cs" Inherits="rstemenu.Negative_overjet" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
      <div  class="container "  style="width:92%;    margin-top:80px;   "  >
         <div   class="well" style="text-align:center;">
   
          <asp:Label  Text="Negative Overjet"   runat="server"  Style=" width:100%;    "  CssClass="Labelhh"/>
       
      </div>
              </div>
     
       <div class="container" >

        <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="overjet_negative_s0" Text="Score 0" runat="server" GroupName="overjet_2" /> 
                                                  
                                                                  <a href="helppage.aspx?id=28&heading=overjetneg0"> <span class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="overjet_negative_s1" Text="Score 1" runat="server"  GroupName="overjet_2"/> 

                                                  
                                                           <a href="helppage.aspx?id=29&heading=overjetneg1" > <span class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
              <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="overjet_negative_s2" Text="Score 2" runat="server" GroupName="overjet_2" /> 

                                                  
                                                           <a href="helppage.aspx?id=30&heading=overjetneg2" > <span class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            
             </div>

             <div class="row   " >

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="overjet_negative_s3" Text="Score 3" runat="server" GroupName="overjet_2" /> 

                                                  
                                                           <a href="helppage.aspx?id=31&heading=overjetneg3" > <span class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
            

                 <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="overjet_negative_s4" Text="Score 4" runat="server" GroupName="overjet_2" /> 

                                                  
                                                           <a href="helppage.aspx?id=32&heading=overjetneg4" > <span class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>





                                            </div>
         


        </div>
   

           <div class="container" style="text-align:end; width:92%; margin-top:15px;" > 
                <div class="row">
                    <asp:Label runat="server" Width="100%" CssClass="text-danger text-right" ID="showing_error" Text="Please Complete all domains to Continue" Visible="false" ></asp:Label>

                </div>
            <asp:Button class="btn btn-primary" Text="SUBMIT" ID="submit_lower_right" runat="server" OnClick="submit_lower_right_Click"    />
         </div>
</asp:Content>
