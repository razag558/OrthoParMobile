using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class helppage : System.Web.UI.Page
    {
        String helpnumber, heading;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["id"] != null)
            {
                helpnumber = Request.QueryString["id"];
                switch (helpnumber)
                {
                    case "1":
                        hp1.Visible = true;
                        break;
                    case "2":
                        hp2.Visible = true;
                        hp2a.Visible = true;
                        hp2b.Visible = true;
                        
                        hp2d.Visible = true;
                        hp2e.Visible = true;
                        hp2f.Visible = true;
                        hp2g.Visible = true;
                        hp2h.Visible = true;

                        break;
                    case "3":
                        hp3.Visible = true;
                        break;
                    case "4":
                        hp4.Visible = true;
                        break;
                    case "5":
                        hp5.Visible = true;
                        break;
                    case "6":
                        hp6.Visible = true;
                        break;
                    case "7":
                        hp7.Visible = true;
                        break;
                    case "8":
                        hp8.Visible = true;
                        break;
                    case "9":
                        hp9.Visible = true;
                        break;
                    case "10":
                        hp10.Visible = true;
                        break;
                    case "11":
                        hp11a.Visible = true;
                        hp11b.Visible = true;
                        hp11c.Visible = true;
                        hp11d.Visible = true;
                        hp11e.Visible = true;
                        break;
                    case "12":
                        hp12.Visible = true;
                        break;
                    case "13":
                        hp13.Visible = true;
                        break;
                    case "14":
                        hp14.Visible = true;
                        break;
                    case "15":
                        hp15.Visible = true;
                        break;
                    case "16":
                        hp16.Visible = true;
                        break;
                    case "17":
                        hp17.Visible = true;
                        break;
                    case "18":
                        hp18.Visible = true;
                        break;
                    case "19":
                        hp19.Visible = true;
                        break;
                    case "20":
                        hp20.Visible = true;
                        break;
                    case "21":
                        hp21.Visible = true;
                        break;
                    case "22":
                        hp22a.Visible = true;
                        hp22b.Visible = true;
                        hp22c.Visible = true;
                        hp22d.Visible = true;
                        break;
                    case "23":
                        hp23.Visible = true;
                        break;
                    case "24":
                        hp24.Visible = true;
                        break;
                    case "25":
                        hp25.Visible = true;
                        break;
                    case "26":
                        hp26.Visible = true;
                        break;
                    case "27":
                        hp27.Visible = true;
                        break;
                    case "28":
                        hp28.Visible = true;
                        break;
                    case "29":
                        hp29.Visible = true;
                        break;
                    case "30":
                        hp30.Visible = true;
                        break;
                    case "31":
                        hp31.Visible = true;
                        break;
                    case "32":
                        hp32.Visible = true;
                        break;
                    case "33":
                        hp33.Visible = true;
                        break;
                    case "34":
                        hp34.Visible = true;
                        break;
                    case "35":
                        hp35a.Visible = true;
                        hp35b.Visible = true;
                        hp35c.Visible = true;
                        hp35d.Visible = true;
                        hp35e.Visible = true;
                        break;
                    case "36":
                        hp36.Visible = true;
                        break;
                    case "37":
                        hp37.Visible = true;
                        break;
                    case "38":
                        hp38.Visible = true;
                        break;
                    case "39":
                        hp39.Visible = true;
                        break;
                    case "40":
                        hp40.Visible = true;
                        break;
                    case "41":
                        hp41.Visible = true;
                        break;
                    case "42":
                        hp42.Visible = true;
                        break;
                    case "43":
                        hp43.Visible = true;
                        break;
                    case "44":
                        hp44.Visible = true;
                        break;
                    case "45":
                        hp45a.Visible = true;
                        hp45b.Visible = true; 
                        break;
                    case "46":
                        hp46.Visible = true;
                        break;
                    case "47":
                        hp47.Visible = true;
                        break;
                    case "48":
                        hp48.Visible = true;
                        break;
                    case "49":
                        hp49.Visible = true;
                        break;
                    case "50":
                        hp50.Visible = true;
                        break;
                    case "51":
                        hp51.Visible = true;
                        break;
                    case "52":
                        hp52.Visible = true;
                        break;
                    case "53":
                        hp53.Visible = true;
                        break;
                    case "54":
                        hp54.Visible = true;
                        break;
                    case "55":
                        hp55.Visible = true;
                        break;
                    case "hp1new":
                        hp1new.Visible = true;
                        break;
                    case "56":
                        hp56.Visible = true;
                        break;



                }
            }

            if (Request.QueryString["heading"] != null)
            {
                heading = Request.QueryString["heading"];
                switch (heading)
                {
                    case "upr3r20":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR3 (0)";
                        break;
                    case "upr3r21":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR3 (1)";
                        break;
                    case "upr3r22":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR3 (2)";
                        break;
                    case "upr3r23":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR3 (3)";
                        break;
                    case "upr3r24":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR3 (4)";
                        break;
                    case "upr3r25":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR3 (5)";
                        break;




                    case "upr2r10":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR1 (0)";
                        break;
                    case "upr2r11":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR1 (1)";
                        break;
                    case "upr2r12":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR1 (2)";
                        break;
                    case "upr2r13":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR1 (3)";
                        break;
                    case "upr2r14":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR1 (4)";
                        break;
                    case "upr2r15":
                        heading_information.Text = "Contact Point Displacement Between UR2 and UR1 (5)";
                        break;




                    case "upr1l10":
                        heading_information.Text = "Contact Point Displacement Between UR1 and UL1 (0)";
                        break;
                    case "upr1l11":
                        heading_information.Text = "Contact Point Displacement Between UR1 and UL1 (1)";
                        break;
                    case "upr1l12":
                        heading_information.Text = "Contact Point Displacement Between UR1 and UL1 (2)";
                        break;
                    case "upr1l13":
                        heading_information.Text = "Contact Point Displacement Between UR1 and UL1 (3)";
                        break;
                    case "upr1l14":
                        heading_information.Text = "Contact Point Displacement Between UR1 and UL1 (4)";
                        break;
                    case "upr1l15":
                        heading_information.Text = "Contact Point Displacement Between UR1 and UL1 (5)";
                        break;




                    case "upl2l10":
                        heading_information.Text = "Contact Point Displacement Between UL2 and UL1 (0)";
                        break;
                    case "upl2l11":
                        heading_information.Text = "Contact Point Displacement Between UL2 and UL1 (1)";
                        break;
                    case "upl2l12":
                        heading_information.Text = "Contact Point Displacement Between UL2 and UL1 (2)";
                        break;
                    case "upl2l13":
                        heading_information.Text = "Contact Point Displacement Between UL2 and UL1 (3)";
                        break;
                    case "upl2l14":
                        heading_information.Text = "Contact Point Displacement Between UL2 and UL1 (4)";
                        break;
                    case "upl2l15":
                        heading_information.Text = "Contact Point Displacement Between UL2 and UL1 (5)";
                        break;



                    case "upl3l20":
                        heading_information.Text = "Contact Point Displacement Between UL3 and UL2 (0)";
                        break;
                    case "upl3l21":
                        heading_information.Text = "Contact Point Displacement Between UL3 and UL2 (1)";
                        break;
                    case "upl3l22":
                        heading_information.Text = "Contact Point Displacement Between UL3 and UL2 (2)";
                        break;
                    case "upl3l23":
                        heading_information.Text = "Contact Point Displacement Between UL3 and UL2 (3)";
                        break;
                    case "upl3l24":
                        heading_information.Text = "Contact Point Displacement Between UL3 and UL2 (4)";
                        break;
                    case "upl3l25":
                        heading_information.Text = "Contact Point Displacement Between UL3 and UL2 (5)";
                        break;





                    //  lowercrowding help


                    case "lowr3r20":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR3 (0)";
                        break;
                    case "lowr3r21":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR3 (1)";
                        break;
                    case "lowr3r22":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR3 (2)";
                        break;
                    case "lowr3r23":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR3 (3)";
                        break;
                    case "lowr3r24":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR3 (4)";
                        break;
                    case "lowr3r25":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR3 (5)";
                        break;




                    case "lowr2r10":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR1 (0)";
                        break;
                    case "lowr2r11":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR1 (1)";
                        break;
                    case "lowr2r12":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR1 (2)";
                        break;
                    case "lowr2r13":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR1 (3)";
                        break;
                    case "lowr2r14":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR1 (4)";
                        break;
                    case "lowr2r15":
                        heading_information.Text = "Contact Point Displacement Between LR2 and LR1 (5)";
                        break;




                    case "lowr1l10":
                        heading_information.Text = "Contact Point Displacement Between LR1 and LL1 (0)";
                        break;
                    case "lowr1l11":
                        heading_information.Text = "Contact Point Displacement Between LR1 and LL1 (1)";
                        break;
                    case "lowr1l12":
                        heading_information.Text = "Contact Point Displacement Between LR1 and LL1 (2)";
                        break;
                    case "lowr1l13":
                        heading_information.Text = "Contact Point Displacement Between LR1 and LL1 (3)";
                        break;
                    case "lowr1l14":
                        heading_information.Text = "Contact Point Displacement Between LR1 and LL1 (4)";
                        break;
                    case "lowr1l15":
                        heading_information.Text = "Contact Point Displacement Between LR1 and LL1 (5)";
                        break;




                    case "lowl2l10":
                        heading_information.Text = "Contact Point Displacement Between LL2 and LL1 (0)";
                        break;
                    case "lowl2l11":
                        heading_information.Text = "Contact Point Displacement Between LL2 and LL1 (1)";
                        break;
                    case "lowl2l12":
                        heading_information.Text = "Contact Point Displacement Between LL2 and LL1 (2)";
                        break;
                    case "lowl2l13":
                        heading_information.Text = "Contact Point Displacement Between LL2 and LL1 (3)";
                        break;
                    case "lowl2l14":
                        heading_information.Text = "Contact Point Displacement Between LL2 and LL1 (4)";
                        break;
                    case "lowl2l15":
                        heading_information.Text = "Contact Point Displacement Between LL2 and LL1 (5)";
                        break;



                    case "lowl3l20":
                        heading_information.Text = "Contact Point Displacement Between LL3 and LL2 (0)";
                        break;
                    case "lowl3l21":
                        heading_information.Text = "Contact Point Displacement Between LL3 and LL2 (1)";
                        break;
                    case "lowl3l22":
                        heading_information.Text = "Contact Point Displacement Between LL3 and LL2 (2)";
                        break;
                    case "lowl3l23":
                        heading_information.Text = "Contact Point Displacement Between LL3 and LL2 (3)";
                        break;
                    case "lowl3l24":
                        heading_information.Text = "Contact Point Displacement Between LL3 and LL2 (4)";
                        break;
                    case "lowl3l25":
                        heading_information.Text = "Contact Point Displacement Between LL3 and LL2 (5)";
                        break;

                    case "mid0":
                        heading_information.Text = "Midline (0)";
                        break;
                    case "mid1":
                        heading_information.Text = "Midline (1)";
                        break;
                    case "mid2":
                        heading_information.Text = "Midline (2)";
                        break;

                    case "overbitpos0":
                        heading_information.Text = "Overbite Positive (0)";
                        break;
                    case "overbitpos1":
                        heading_information.Text = "Overbite Positive (1)";
                        break;
                    case "overbitpos2":
                        heading_information.Text = "Overbite Positive(2)";
                        break;
                    case "overbitpos3":
                        heading_information.Text = "Overbite Positive (3)";
                        break;

                    case "overbitneg0":
                        heading_information.Text = "Overbite Negative (0)";
                        break;
                    case "overbitneg1":
                        heading_information.Text = "Overbite Negative  (1)";
                        break;
                    case "overbitneg2":
                        heading_information.Text = "Overbite Negative  (2)";
                        break;
                    case "overbitneg3":
                        heading_information.Text = "Overbite Negative  (3)";
                        break;

                    case "overbitneg4":
                        heading_information.Text = "Overbite Negative (4)";
                        break;


                    case "overjetpos0":
                        heading_information.Text = "Overjet Positive (0)";
                        break;
                    case "overjetpos1":
                        heading_information.Text = "Overjet Positive  (1)";
                        break;
                    case "overjetpos2":
                        heading_information.Text = "Overjet Positive  (2)";
                        break;
                    case "overjetpos3":
                        heading_information.Text = "Overjet Positive (3)";
                        break;

                    case "overjetpos4":
                        heading_information.Text = "Overjet Positive (4)";
                        break;



                    case "overjetneg0":
                        heading_information.Text = "Overjet Negative  (0)";
                        break;
                    case "overjetneg1":
                        heading_information.Text = "Overjet Negative   (1)";
                        break;
                    case "overjetneg2":
                        heading_information.Text = "Overjet Negative   (2)";
                        break;
                    case "overjetneg3":
                        heading_information.Text = "Overjet Negative  (3)";
                        break;
                    case "overjetneg4":
                        heading_information.Text = "Overjet Negative  (4)";
                        break;




                    case "rightap0":
                        heading_information.Text = "Right Buccal Occlusion  Antero-Posterior   (0)";
                        break;
                    case "rightap1":
                        heading_information.Text = "Right Buccal Occlusion  Antero-Posterior   (1)";
                        break;
                    case "rightap2":
                        heading_information.Text = "Right Buccal Occlusion  Antero-Posterior    (2)";
                        break;
                    case "rightver0":
                        heading_information.Text = "Right Buccal Occlusion Vertical (0)";
                        break;
                    case "rightver1":
                        heading_information.Text = "Right Buccal Occlusion Vertical  (1)";
                        break;

                    case "righttran0":
                        heading_information.Text = "Right Buccal Occlusion Transverse   (0)";
                        break;
                    case "righttran1":
                        heading_information.Text = "Right Buccal Occlusion Transverse   (1)";
                        break;
                    case "righttran2":
                        heading_information.Text = "Right Buccal Occlusion Transverse   (2)";
                        break;
                    case "righttran3":
                        heading_information.Text = "Right Buccal Occlusion Transverse   (3)";
                        break;
                    case "righttran4":
                        heading_information.Text = "Right Buccal Occlusion Transverse   (4)";
                        break;







                    case "leftap0":
                        heading_information.Text = "Left Buccal Occlusion  Antero-Posterior   (0)";
                        break;
                    case "leftap1":
                        heading_information.Text = "Left Buccal Occlusion  Antero-Posterior   (1)";
                        break;
                    case "leftap2":
                        heading_information.Text = "Left Buccal Occlusion  Antero-Posterior    (2)";
                        break;
                    case "leftver0":
                        heading_information.Text = "Left Buccal Occlusion Vertical (0)";
                        break;
                    case "leftver1":
                        heading_information.Text = "Left Buccal Occlusion Vertical  (1)";
                        break;

                    case "lefttran0":
                        heading_information.Text = "Left Buccal Occlusion Transverse   (0)";
                        break;
                    case "lefttran1":
                        heading_information.Text = "Left Buccal Occlusion Transverse   (1)";
                        break;
                    case "lefttran2":
                        heading_information.Text = "Left Buccal Occlusion Transverse   (2)";
                        break;
                    case "lefttran3":
                        heading_information.Text = "Left Buccal Occlusion Transverse   (3)";
                        break;
                    case "lefttran4":
                        heading_information.Text = "Left Buccal Occlusion Transverse   (4)";
                        break;

                    case "firstbutton":
                        heading_information.Text = "Anterior Segments ";
                        break;
                    case "secondbutton":
                        heading_information.Text = "Buccal Occlusion  ";
                        break;
                    case "thirdbutton":
                        heading_information.Text = "Anterior Occlusion (Overjet)  ";
                        break;
                    case "fourthbutton":
                        heading_information.Text = "Anterior Occlusion (Overbite) ";
                        break;
                    case "fifthbutton":
                        heading_information.Text = "Midline ";
                        break;
                    case "percentage":
                        heading_information.Text = "Percentage-based Result of PAR ";
                        break;
                    case "point":
                        heading_information.Text = "Point-based Result of PAR ";
                        break; 
                    case "newhelp":
                        heading_information.Text = "Complete PAR Result ";
                        break;
                    case "uprantbtn":

                        heading_information.Text = "Upper Anterior Segment ";
                        break;
                    case "lowantbtn":

                        heading_information.Text = "Lower Anterior Segment ";
                        break;
                    case "posnegoverbite":

                        heading_information.Text = "Both +ve and -ve Overbite ";
                        break;
                    case "posoverjet":

                        heading_information.Text = "Positive Overjet  ";
                        break;
                    case "negoverjet":

                        heading_information.Text = "Negative Overjet ";
                        break;
                    case "posnegoverjet":

                        heading_information.Text = "Both +ve and -ve Overjet ";
                        break;





                }
            }

        }
    }
}