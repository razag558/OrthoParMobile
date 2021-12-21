using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace rstemenu
{
    public partial class Patient_info : System.Web.UI.Page
    {
        Methods obj = new Methods();
        int data;
        DateTime pars_datetime;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                ReSetting_Session_values();
        }

        protected void btn_next_Click(object sender, EventArgs e)
        {
            string gender = "";
            string impact_teeth = "";
            string missing_teeth = "";
            string extracted = "";
            string replacement = "";
            string restorative = "";
            // GENDER
            if (gen_male.Checked)
                gender = "Male";
            else if (gen_female.Checked)
                gender = "Female";
            // IMPACT
            if (impct_yes.Checked)
                impact_teeth = "Yes";
            else if (impct_no.Checked)
                impact_teeth = "No";

            // MISSING
            if (missing_yes.Checked)
                missing_teeth = "Yes";
            else if (missing_no.Checked)
                missing_teeth = "No";

            // EXTRACTED
            if (extracted_yes.Checked)
                extracted = "Yes";
            else if (extracted_no.Checked)
                extracted = "No";

            // REPLACEMENT
            if (replacement_yes.Checked)
                replacement = "Yes";
            else if (replacement_no.Checked)
                replacement = "No";
            //  RESTORTIVE
            if (restorative_yes.Checked)
                restorative = "Yes";
            else if (restorative_no.Checked)
                restorative = "No";

            string selecteddatetime = patientcheckdate.Value;
            String username = User.Identity.Name;

            if (selecteddatetime.ToString().Length > 0)
            {
                DateTime date2 = Convert.ToDateTime(selecteddatetime, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

                data = obj.submittion_of_Patient_info(doctor_name.Text, pat_id.Text, pat_name.Text, gender, impact_teeth, missing_teeth, extracted, replacement, restorative, date2, username);
                Response.Redirect("~/Treatment_type.aspx?pat_id=" + data + "&pat_name=" + pat_name.Text);
            }
            else
                Response.Write("<script> alert('Please Choose Date First');</script>");

        }

        public void ReSetting_Session_values()
        {
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

            //Post Sessions

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

            Session["Posttreatment_value"] = "-1";
            Session["Pretreatment_value"] = "-1";
        }

    }
}