<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="LeftBuccalOcclusion.aspx.cs" Inherits="rstemenu.LeftBuccalOcclusion" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div  class="container"  style="width:92%;   padding-top:10%;   "  >
		 <div   class="well" style="text-align:center;">
   
		  <asp:Label  Text="Antero-Posterior Relationship"   runat="server"  Style=" width:100%;  "  CssClass="Labelhh"/>
	   
	  </div>

        <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="buccal_left_1_s0" Text="Score 0" runat="server" GroupName="buccal_left_1" /> 
                                                  
                                                                  <a href="helppage.aspx?id=12&heading=leftap0"> <span  style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_left_1_s1" Text="Score 1" runat="server"  GroupName="buccal_left_1"/> 

                                                  
                                                           <a href="helppage.aspx?id=13&heading=leftap1" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_left_1_s2" Text="Score 2" runat="server" GroupName="buccal_left_1" /> 

                                                  
                                                           <a href="helppage.aspx?id=14&heading=leftap2" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
             </div>



       

		 </div>



    <div  class="container"  style="width:92%;   margin-top:10px;   "  >
		 <div   class="well" style="text-align:center;">
   
		  <asp:Label  Text="Vertical Relationship"   runat="server"  Style=" width:100%; " CssClass="Labelhh"/>
	   
	  </div>


         <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="buccal_left_2_s0" Text="Score 0" runat="server" GroupName="buccal_left_2" /> 
                                                  
                                                                  <a href="helppage.aspx?id=15&heading=leftver0"> <span  style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_left_2_s1" Text="Score 1" runat="server"  GroupName="buccal_left_2"/> 

                                                  
                                                           <a href="helppage.aspx?id=16&heading=leftver1" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           </div>
		 </div>



    <div  class="container"  style="width:92%;   margin-top:10px;   "  >
		 <div   class="well" style="text-align:center;">
   
		  <asp:Label  Text="Transverse Relationship"   runat="server"  Style=" width:100%;  "  CssClass="Labelhh"/>
	   
	  </div>

        <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="buccal_left_3_s0" Text="Score 0" runat="server" GroupName="buccal_left_3" /> 
                                                  
                                                                  <a href="helppage.aspx?id=17&heading=lefttran0"> <span  style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_left_3_s1" Text="Score 1" runat="server"  GroupName="buccal_left_3"/> 

                                                  
                                                           <a href="helppage.aspx?id=18&heading=lefttran1" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_left_3_s2" Text="Score 2" runat="server" GroupName="buccal_left_3" /> 

                                                  
                                                           <a href="helppage.aspx?id=19&heading=lefttran2" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
             

              <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_left_3_s3" Text="Score 3" runat="server"  GroupName="buccal_left_3"/> 

                                                  
                                                           <a href="helppage.aspx?id=20&heading=lefttran3" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_left_3_s4" Text="Score 4" runat="server" GroupName="buccal_left_3" /> 

                                                  
                                                           <a href="helppage.aspx?id=21&heading=lefttran4" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
             </div>


         <div class="container" style="text-align:end; margin-top:15px;" > 
              <div class="row">
                    <asp:Label runat="server" Width="100%" CssClass="text-danger text-right" ID="showing_error" Text="Please Complete all domains to Continue" Visible="false" ></asp:Label>

                </div>

            <asp:Button class="btn btn-primary" Text="SUBMIT" ID="submit_buccal_right" runat="server" OnClick="submit_buccal_right_Click"   />
         </div>


    </div>

    <br />
    <br />
    <br />
    <br />

</asp:Content>
