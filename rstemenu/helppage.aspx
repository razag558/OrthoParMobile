<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/sadmin.Master" CodeBehind="helppage.aspx.cs" Inherits="rstemenu.helppage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
         <div   style="text-align:start; width:100%; height:5%; margin-left:10%;" >
         <asp:Button Text="Back" runat="server" ID="back" CssClass="btn btn-primary"  OnClientClick="JavaScript:window.history.back(1); return false;"/>
          
         </div>
    <div class="container" style="text-align:center;" >
        <asp:Label runat="server" ID="heading_information"  Font-Size="Large" />  
    </div>

    <div style="width:80%; height:auto; margin-top:30px; margin-left:15%; " class="text-left"  >
                            <!-- help 1 -->
        
         <asp:Label   Text="Anterior segment starts from the mesial anatomical contact point of the canine on one side to the mesial anatomical contact point of the canine on the opposite side."   ID="hp1" runat="server" Visible="false"  Width="90%" Style="text-align:center;"/>
     
        
         <!-- help 2 -->
        <ol>
       <asp:Label  CssClass="text-left" runat="server" Text=" <li>   The features recorded are crowding, spacing and impacted teeth. </li>"  ID="hp2"   Visible="false"  /> 
      <asp:Label CssClass="text-left"  runat="server" Text="  <li>   Displacements are recorded at the shortest distance between contact points mesial to canines and parallel to the occlusal plane. </li>"  ID="hp2a"   Visible="false"   /> 
    <asp:Label  runat="server" Text="  <li>  In case of potential crowding in the mixed dentition, average mesio-distal widths are used to calculate the space deficiency. Impacted teeth are recorded when the space available for the tooth is equal or less than 4 mm. </li>"  ID="hp2b"   Visible="false"   />  
       
         <asp:Label  runat="server" Text="  <li>  Displaced contact points due to poor restoration are not recorded and the same for contact points between deciduous teeth. </li>"  ID="hp2d"   Visible="false"   />  
        <asp:Label  runat="server" Text="  <li>  Orthodontic extraction spaces are not recorded. </li>"  ID="hp2e"  Visible="false"  /> 
         <asp:Label  runat="server" Text="  <li>  Spacings in the anterior segment resulting from extraction, agenesis or avulsion of incisors or canines are recorded only if: </li>"  ID="hp2f"   Visible="false"  />   </ol>
       <ul> 
           <asp:Label  runat="server" Text=" <li>   The treatment planning is to close spaces, or </li> "  ID="hp2g"   Visible="false"  />   
       <asp:Label  runat="server" Text=" <li>   The treatment planning is to open and restore spaces unless the available spaces are less than or equal to 4 mm.  </li>"  ID="hp2h"   Visible="false"  />                   	                
              </ul>                        	   
                                   	         
                            	              
                                             
                            	             
                            	              
                            
              
         <asp:Label Text="Amount of contact points displacement is 0 mm – 1mm"   ID="hp3" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="Amount of contact points displacement is 1.1 mm – 2mm"   ID="hp4" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="Amount of contact points displacement is 2.1 mm – 4mm"    ID="hp5" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="Amount of contact points displacement is 4.1 mm- 8mm"    ID="hp6" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="Amount of contact points displacement is greater than 8mm"    ID="hp7" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="Presence of impacted teeth"    ID="hp8" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="This condition applies only if the canine in unerupted regardless if the premolars are missing or present (Mid or late mixed dentition). You need to measure the distance from the distal contact point of the permanent lateral incisor to the mesial contact point of the first permanent molar, which represents the space available. Assuming that the total mesio-distal dimensions of the permanent canine, first and second premolars is 21mm and 22mm in the upper and lower arches respectively. Therefore, if the space available is more than 18, then this domain should be scored (0) as there is a low chance for impaction and space for the erupting canine might be gained secondary to normal growth changes. "    ID="hp9" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="This condition applies only if the canine in unerupted regardless if the premolars are missing or present (Mid or late mixed dentition). You need to measure the distance from the distal contact point of the permanent lateral incisor to the mesial contact point of the first permanent molar, which represents the space available. Assuming that the total mesio-distal dimensions of the permanent canine, first and second premolars is 21mm and 22mm in the upper and lower arches respectively. Therefore, if the space available is equal or less than 17mm, then this domain should be scored (5) as there is a high chance for impaction. "    ID="hp10" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
 

        <!-- help 11 -->
        <ul>
       <asp:Label  CssClass="text-left" runat="server" Text=" <li> Buccal segments start from the mesial anatomical contact point of the first permanent molar to the distal anatomical contact point of the permanent or primary canines. </li>"  ID="hp11a"   Visible="false"  /> 
      <asp:Label CssClass="text-left"  runat="server" Text="  <li>  If first permanent molar is missing, then the recorded zone will extend to second permanent molar.  </li>"  ID="hp11b"   Visible="false"   /> 
    <asp:Label  runat="server" Text="  <li> If both first and second permanent molars are missing, then the recorded zone will extend to third permanent molar.  </li>"  ID="hp11c"   Visible="false"   />  
       
         <asp:Label  runat="server" Text="  <li>  Recorded both right and left sides in occlusion in three planes of space: anterior-posterior, vertical and transverse.  </li>"  ID="hp11d"   Visible="false"   />  
        <asp:Label  runat="server" Text="  <li>  Temporary developmental stages and submerging deciduous teeth are excluded. </li>"  ID="hp11e"  Visible="false"  /> 
            </ul>






          <asp:Label Text="Good interdigitation (Cl I, Cl II or Cl III)"    ID="hp12" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
          <asp:Label Text="Less than ½ unit discrepancy"    ID="hp13" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
          <asp:Label Text="½ a unit discrepancy (cusp to cusp) or more"    ID="hp14" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
          <asp:Label Text="No vertical discrepancy in intercuspation"    ID="hp15" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
         <asp:Label Text="Lateral open bite on at least 2 teeth greater than 2 mm"    ID="hp16" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="No crossbites is present "    ID="hp17" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Crossbite tendency is present"    ID="hp18" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Single tooth in crossbite is present"    ID="hp19" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="More than 1 tooth in crossbite is present"    ID="hp20" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>

                 <asp:Label Text="More than 1 tooth in scissor bite is present"    ID="hp21" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>



            <!-- help22 -->
 


         <ul>
       <asp:Label  CssClass="text-left" runat="server" Text=" <li>The recording zone starts from the distal anatomical contact point of the lateral incisor on one side to the distal anatomical contact point of the lateral incisor on the other side. </li>"  ID="hp22a"   Visible="false"  /> 
       <asp:Label CssClass="text-left"  runat="server" Text="  <li> The most prominent aspect of any one incisor is recorded with a ruler held parallel to the occlusal plane.  </li>"  ID="hp22b"   Visible="false"   /> 
       <asp:Label  runat="server" Text="  <li> Overjets (positive overjet) and anterior crossbites (termed negative overjet) are recorded.  </li>"  ID="hp22c"   Visible="false"   />  
         <asp:Label  runat="server" Text="  <li> 	The sum of the two scores (positive and negative overjet) is the total score for this component. For example, if there is a positive overjet and incisors or canines in an anterior crossbite the scores should be added together.  </li>"  ID="hp22d"   Visible="false"   />  
        
</ul>




                 <asp:Label Text="Positive overjet is 0-3 mm"    ID="hp23" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Positive overjet is 3.1- 5mm"    ID="hp24" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Positive overjet is 5.1- 7mm"    ID="hp25" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Positive overjet is 7.1- 9mm"    ID="hp26" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Positive overjet is greater than 9mm"    ID="hp27" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="No anterior crossbite discrepancy is present "    ID="hp28" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="One or more teeth is(are) edge to edge"    ID="hp29" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="One single tooth in anterior crossbite"    ID="hp30" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Two teeth are in anterior crossbite"    ID="hp31" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="More than two teeth are in anterior crossbite"    ID="hp32" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
                 <asp:Label Text="Overjets (positive overjet) and anterior crossbites (termed negative overjet) are recorded. "    ID="hp33" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="The sum of the two scores (positive and negative overjet) is the total score for this component. For example, if there is a positive overjet and incisors or canines in an anterior crossbite the scores should be added together."    ID="hp34" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
       
 

        <!--helpl 35 -->

    
        <ul>
       <asp:Label  CssClass="text-left" runat="server" Text=" <li> 	This domain measures the vertical overlap as positive or negative (open) overbite of the anterior teeth on occlusion. </li>"  ID="hp35a"   Visible="false"  /> 
      <asp:Label CssClass="text-left"  runat="server" Text="  <li>  Positive anterior overbite is considered when the upper incisor is covering the lower incisor vertically.  </li>"  ID="hp35b"   Visible="false"   /> 
    <asp:Label  runat="server" Text="  <li> Negative anterior overbite (openbite) is considered when the one or all upper incisors is/ are not covering the lower incisor vertically.  </li>"  ID="hp35c"   Visible="false"   />  
         <asp:Label  runat="server" Text="  <li>  The tooth with the greatest or lowest overlap is recorded. </li>"  ID="hp35d"   Visible="false"   />  
        <asp:Label  runat="server" Text="  <li> If both positive and negative overbite are present, then they should be added. </li>"  ID="hp35e"  Visible="false"  /> 
            </ul>




        <asp:Label Text="Upper incisor is covering less than or equal to 1/3 of the lower incisor."    ID="hp36" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="Upper incisor is covering greater than 1/3 but less than 2/3 of the lower incisor."    ID="hp37" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="Upper incisor is covering greater than 2/3 of the lower incisor."    ID="hp38" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="Upper incisor is covering fully the lower incisor."    ID="hp39" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="No open bite (negative overbite) is present. "    ID="hp40" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="Openbite is equal or less than 1mm."    ID="hp41" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="Openbite between 1.1 mm – 2 mm is present."    ID="hp42" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label Text="Openbite between 2.1 mm- 3 mm is present."    ID="hp43" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
       
        <asp:Label Text="Openbite equal or greater than 4mm is present."    ID="hp44" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
       
        
        <!-- hlep 45 -->
 

          <ul>
       <asp:Label  CssClass="text-left" runat="server" Text=" <li>	Records the upper dental centerline (midline) discrepancy in relation to the lower dental centerline. </li>"  ID="hp45a"   Visible="false"  /> 
      <asp:Label CssClass="text-left"  runat="server" Text="  <li>  If a lower incisor has been extracted, then score this domain as (0).  </li>"  ID="hp45b"   Visible="false"   /> 
              </ul>

        <asp:Label Text="Upper & lower dental centerlines are coincident or non-coincident by less than ¼ lower incisor width."    ID="hp46" runat="server" Visible="false" />
        <asp:Label Text="Upper & lower dental centerlines are non-coincident by ¼ to ½ lower incisor width."    ID="hp47" runat="server" Visible="false"   />
        <asp:Label Text="Upper & lower dental centerlines are non-coincident by more than ½ lower incisor width."    ID="hp48" runat="server" Visible="false"  />
      
        <!-- help 49 -->
        <ul>
          <asp:Label Text="<li>	If both positive and negative overbite are present, then they should be added. </li> "    ID="hp49" runat="server" Visible="false"  />
        </ul>
          <!-- help 50 -->
        <ul>
          <asp:Label Text=" <li>	Positive anterior overbite is measured depending on the maximum vertical coverage of one of upper incisors on lower incisors. </li> "    ID="hp50" runat="server" Visible="false"   />
        </ul>
        
     
         <asp:Label Text=" <ul> <li>	Negative anterior overbite (openbite) is measured depending on the maximum lack of vertical coverage of one of upper incisors on lower incisors. </li> </ul>"    ID="hp51" runat="server" Visible="false"  />
        <asp:Label Text="<ul> <li>	Total pre-treatment PAR value is the sum of the values of domains 1-5, let us call it P1.</li> <li> Total post-treatment PAR value is the sum of the values of domains 1-5, let us call it P2. </li> </ul>"    ID="hp52" runat="server" Visible="false" Width="90%" Style="text-align:center;"/>
        <asp:Label  runat="server" Text="<ul> <li>	The weighted overjet domain (domain No. 1) is equal to the total score of the domain multiplied by 6.  </li>  <li>	The weighted buccal occlusion domain (domain No. 2) is equal to the total score of the domain multiplied by 1.</li>
     <li>	The weighted anterior segment domain (domain No. 3) is equal to the total score of the domain multiplied by 1.</li>      <li>	The weighted centerline domain (domain No. 4) is equal to the total score of the domain multiplied by 4. </li>
     <li>	The weighted overbite domain (domain No. 5) is equal to the total score of the domain multiplied by 2. </li>
     <li>	Point based treatment changes: P1-P2. Change is more than 22 point indicates a great improvement secondary to the treatment. </li> </ul> "    ID="hp53"   Visible="false" />
        <asp:Label Text="	PAR percentage changes: P2-P1/P1 <ul> <br/> <li> A ratio equal or more than 70% indicates a great improvement secondary to the treatment   </li> <li> A ratio is between 30% and 70% indicates an improvement secondary to the treatment </li> <li>A ratio is less than 30% indicates worse/no improvement secondary to the treatment .</li> </ul>  "    ID="hp54" runat="server" Visible="false"  />
        <asp:Label Text="PAR nomogram: P1 and P2 scores is plotted on a PAR nomograph."    ID="hp55" runat="server" Visible="false"    />


            <asp:Label runat="server" Text="<ul>  <li>The weighted overjet domain (domain No. 1) is equal to the total score of the domain multiplied by 6. </li>
<li> The weighted buccal occlusion domain (domain No. 2) is equal to the total score of the domain multiplied by 1. </li>
	 <li> The weighted anterior segment domain (domain No. 3) is equal to the total score of the domain multiplied by 1. </li>
	 <li> The weighted centerline domain (domain No. 4) is equal to the total score of the domain multiplied by 4.  </li>
	<li> The weighted overbite domain (domain No. 5) is equal to the total score of the domain multiplied by 2.  </li>
	</ul>"   ID="hp1new"  Visible="false"    />

                 <asp:Label Text="The sum of the two scores (positive and negative overbite) is the total score for this component. For example, if there is a positive overbite on one central incisor and openbite on the the other, the scores should be added together." runat="server" ID="hp56"  Visible="false"    />

        </div>

    
    </div>
    </asp:Content>