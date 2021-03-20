<%@ Page Title="" Language="C#" MasterPageFile="~/sadmin.Master" AutoEventWireup="true" CodeBehind="RightBuccalOcclusion.aspx.cs" Inherits="rstemenu.RightBuccalOcclusion" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    	<div  class="container"  style="width:92%;   padding-top:10%;   "  >
		 <div   class="well" style="text-align:center;">
   
		  <asp:Label  Text="Antero-Posterior Relationship"   runat="server"  Style=" width:100%;  " CssClass="Labelhh" />
	   
	  </div>

        <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="buccal_right_1_s0" Text="Score 0" runat="server" GroupName="buccal_right_1" /> 
                                                  
                                                                  <a href="helppage.aspx?id=12&heading=rightap0"> <span  style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_right_1_s1" Text="Score 1" runat="server"  GroupName="buccal_right_1"/> 

                                                  
                                                           <a href="helppage.aspx?id=13&heading=rightap1" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_right_1_s2" Text="Score 2" runat="server" GroupName="buccal_right_1" /> 

                                                  
                                                           <a href="helppage.aspx?id=14&heading=rightap2" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
             </div>



       

		 </div>



    <div  class="container"  style="width:92%;   margin-top:10px;   "  >
		 <div   class="well" style="text-align:center;">
   
		  <asp:Label  Text="Vertical Relationship"   runat="server"  Style=" width:100%;  " CssClass="Labelhh" />
	   
	  </div>


         <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="buccal_right_2_s0" Text="Score 0" runat="server" GroupName="buccal_right_2" /> 
                                                  
                                                                  <a href="helppage.aspx?id=15&heading=rightver0"> <span  style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_right_2_s1" Text="Score 1" runat="server"  GroupName="buccal_right_2"/> 

                                                  
                                                           <a href="helppage.aspx?id=16&heading=rightver1" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           </div>
		 </div>



    <div  class="container"  style="width:92%;   margin-top:10px;   "  >
		 <div   class="well" style="text-align:center;">
   
		  <asp:Label  Text="Transverse Relationship"   runat="server"  Style=" width:100%;  " CssClass="Labelhh" />
	   
	  </div>

        <div class="row  " >
                             <div class="col-sm-4  " >
                                             
                                                                  <asp:RadioButton ID="buccal_right_3_s0" Text="Score 0" runat="server" GroupName="buccal_right_3" /> 
                                                  
                                                                  <a href="helppage.aspx?id=17&heading=righttran0"> <span  style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                          </div>
                                  

                             <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_right_3_s1" Text="Score 1" runat="server"  GroupName="buccal_right_3"/> 

                                                  
                                                           <a href="helppage.aspx?id=18&heading=righttran1" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_right_3_s2" Text="Score 2" runat="server" GroupName="buccal_right_3" /> 

                                                  
                                                           <a href="helppage.aspx?id=19&heading=righttran2" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
             

              <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_right_3_s3" Text="Score 3" runat="server"  GroupName="buccal_right_3"/> 

                                                  
                                                           <a href="helppage.aspx?id=20&heading=righttran3" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
           

            <div class="col-sm-4   " >
                                          
                                                         <asp:RadioButton ID="buccal_right_3_s4" Text="Score 4" runat="server" GroupName="buccal_right_3" /> 

                                                  
                                                           <a href="helppage.aspx?id=21&heading=righttran4" > <span style="margin-left:15px;" class="glyphicon glyphicon-info-sign"></span> </a>
                                                     </div>
             </div>

        <div class="container" style="text-align:end; margin-top:15px;" > 
             <div class="row">
                    <asp:Label runat="server" Width="100%" CssClass="text-danger text-right" ID="showing_error" Text="Please Complete all domains to Continue" Visible="false" ></asp:Label>

                </div>
            <asp:Button class="btn btn-primary" Text="SUBMIT" ID="submit_lower_right" runat="server" OnClick="submit_lower_right_Click" />
         </div>


    </div>
    <br />
    <br />
    <br />
    <br />


</asp:Content>
