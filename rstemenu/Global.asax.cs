using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Globalization;


namespace rstemenu
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {

        }

        void Application_End(object sender, EventArgs e)
        {

        }

        void Application_Error(object sender, EventArgs e)
        {

        }

        void Session_Start(object sender, EventArgs e)
        {
            //****************************************Pre Session Variable**************************************************

            Session["Patient_ID"] = 0;
            Session["Patient_customID"] = 0;
            Session["Patient_Name"] = "";
            Session["pre_uper_anter_segment_UR2_UR3"] = "";
            Session["pre_uper_anter_segment_UR1_UR2"] = "";
            Session["pre_uper_anter_segment_UL1_UR1"] = "";
            Session["pre_uper_anter_segment_UL2_UL1"] = "";
            Session["pre_uper_anter_segment_UL3_UL2"] = "";
            Session["pre_uper_anter_segment_type_definer"] = "";
            Session["pre_lower_anter_segment_UR2_UR3"] = "";
            Session["pre_lower_anter_segment_UR1_UR2"] = "";
            Session["pre_lower_anter_segment_UL1_UR1"] = "";
            Session["pre_lower_anter_segment_UL2_UL1"] = "";
            Session["pre_lower_anter_segment_UL3_UL2"] = "";
            Session["pre_lower_anter_segment_type_definer"] = "";
            Session["pre_right_buccol_Occlusion_anterior"] = "";
            Session["pre_right_buccol_Occlusion_vertical"] = "";
            Session["pre_right_buccol_Occlusion_transverse"] = "";
            Session["pre_left_buccol_Occlusion_anterior"] = "";
            Session["pre_left_buccol_Occlusion_vertical"] = "";
            Session["pre_left_buccol_Occlusion_transverse"] = "";
            Session["pre_Postive_overjet"] = "";
            Session["pre_Negative_overjet"] = "";
            Session["pre_Overjet_type"] = "";
            Session["pre_Positive_overbite"] = "";
            Session["pre_Negative_overbite"] = "";
            Session["pre_Overbite_type"] = "";
            Session["pre_Midline"] = "";

            //************************************Post Sessions************************************

            Session["post_uper_anter_segment_UR2_UR3"] = "";
            Session["post_uper_anter_segment_UR1_UR2"] = "";
            Session["post_uper_anter_segment_UL1_UR1"] = "";
            Session["post_uper_anter_segment_UL2_UL1"] = "";
            Session["post_uper_anter_segment_UL3_UL2"] = "";
            Session["post_uper_anter_segment_type_definer"] = "";
            Session["post_lower_anter_segment_UR2_UR3"] = "";
            Session["post_lower_anter_segment_UR1_UR2"] = "";
            Session["post_lower_anter_segment_UL1_UR1"] = "";
            Session["post_lower_anter_segment_UL1_UR1"] = "";
            Session["post_lower_anter_segment_UL2_UL1"] = "";
            Session["post_lower_anter_segment_UL3_UL2"] = "";
            Session["post_lower_anter_segment_type_definer"] = "";
            Session["post_right_buccol_Occlusion_anterior"] = "";
            Session["post_right_buccol_Occlusion_vertical"] = "";
            Session["post_right_buccol_Occlusion_transverse"] = "";
            Session["post_left_buccol_Occlusion_anterior"] = "";
            Session["post_left_buccol_Occlusion_vertical"] = "";
            Session["post_left_buccol_Occlusion_transverse"] = "";
            Session["post_Postive_overjet"] = "";
            Session["post_Negative_overjet"] = "";
            Session["post_Overjet_type"] = "";
            Session["post_Positive_overbite"] = "";
            Session["post_Negative_overbite"] = "";
            Session["post_Overbite_type"] = "";
            Session["post_Midline"] = "";

            // ************************************Additon Work*********************************
            //pre values
            Session["pre_lower_crowding_Sum_Value"] = 0;
            Session["pre_uper_crowding_Sum_Value"] = 0;
            Session["pre_left_Buccal_Sum_Value"] = 0;
            Session["pre_right_Buccal_Sum_Value"] = 0;
            Session["pre_overjet_Sum_Value"] = 0;
            Session["pre_Overbite_Sum_Value"] = 0;
            Session["pre_midline_Value"] = 0;

            //post values
            Session["post_lower_crowding_Sum_Value"] = 0;
            Session["post_uper_crowding_Sum_Value"] = 0;
            Session["post_left_Buccal_Sum_Value"] = 0;
            Session["post_right_Buccal_Sum_Value"] = 0;
            Session["post_overjet_Sum_Value"] = 0;
            Session["post_Overbite_Sum_Value"] = 0;
            Session["post_midline_Value"] = 0;

//**********************************************************************************************************************************
            // Old Session Variable
            Session["a_value"] = "0";
            Session["b_value"] = "0";
            Session["c_value"] = "0";
            Session["d_value"] = "0";
            Session["e_value"] = "0";
            Session["f_value"] = "0";
            Session["i_value"] = "0";
            Session["L_value"] = "0";
            Session["n_value"] = "0";
            Session["old_password"] = "";
            Session["btn_anterior_crowding"] = "0";
            Session["btn_anterior_crowding_uper"] = "0";
            Session["btn_left_buccalocclusion"] = "0";
            Session["btn_buccalocclusion"] = "0";
            Session["overbite"] = "0";
            Session["overjet"] = "0";
            Session["midline"] = "0";
            Session["Preorposttreatment"] = "";
            Session["Posttreatment_value"] = "-1";
            Session["Pretreatment_value"] = "-1";
            Session["patient_id"] = "0";
            Session["patient_name"] = "";
            Session["doctor_name"] = "";
            Session["entry_date"] = "";
            Session["gender"] = "";
        }

        void Session_End(object sender, EventArgs e)
        {


        }


        public static class MyGlobals
        {
        }





    }
}
