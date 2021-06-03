using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class UperCrowding : System.Web.UI.Page
    {
        int step1 = 6;
        int step2 = 6;
        int step3 = 6;
        int step4 = 6;
        int step5 = 6;
        int total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Populating_data();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Calculations();
        }

        public void Populating_data()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment" &&
                Convert.ToString(Session["pre_uper_anter_segment_type_definer"]) == "Permanent")
            {
                //step1 

                if (Session["pre_uper_anter_segment_UR2_UR3"].ToString() == "0")
                    crowding_uper_right_1_s0.Checked = true;
                else if (Session["pre_uper_anter_segment_UR2_UR3"].ToString() == "1")
                    crowding_uper_right_1_s1.Checked = true;
                else if (Session["pre_uper_anter_segment_UR2_UR3"].ToString() == "2")
                    crowding_uper_right_1_s2.Checked = true;
                else if (Session["pre_uper_anter_segment_UR2_UR3"].ToString() == "3")
                    crowding_uper_right_1_s3.Checked = true;
                else if (Session["pre_uper_anter_segment_UR2_UR3"].ToString() == "4")
                    crowding_uper_right_1_s4.Checked = true;
                else if (Session["pre_uper_anter_segment_UR2_UR3"].ToString() == "5")
                    crowding_uper_right_1_s5.Checked = true;

                //step2
                if (Session["pre_uper_anter_segment_UR1_UR2"].ToString() == "0")
                    crowding_uper_right_2_s0.Checked = true;
                else if (Session["pre_uper_anter_segment_UR1_UR2"].ToString() == "1")
                    crowding_uper_right_2_s1.Checked = true;
                else if (Session["pre_uper_anter_segment_UR1_UR2"].ToString() == "2")
                    crowding_uper_right_2_s2.Checked = true;
                else if (Session["pre_uper_anter_segment_UR1_UR2"].ToString() == "3")
                    crowding_uper_right_2_s3.Checked = true;
                else if (Session["pre_uper_anter_segment_UR1_UR2"].ToString() == "4")
                    crowding_uper_right_2_s4.Checked = true;
                else if (Session["pre_uper_anter_segment_UR1_UR2"].ToString() == "5")
                    crowding_uper_right_2_s5.Checked = true;

                //step3
                if (Session["pre_uper_anter_segment_UL1_UR1"].ToString() == "0")
                    crowding_uper_right_3_s0.Checked = true;
                else if (Session["pre_uper_anter_segment_UL1_UR1"].ToString() == "1")
                    crowding_uper_right_3_s1.Checked = true;
                else if (Session["pre_uper_anter_segment_UL1_UR1"].ToString() == "2")
                    crowding_uper_right_3_s2.Checked = true;
                else if (Session["pre_uper_anter_segment_UL1_UR1"].ToString() == "3")
                    crowding_uper_right_3_s3.Checked = true;
                else if (Session["pre_uper_anter_segment_UL1_UR1"].ToString() == "4")
                    crowding_uper_right_3_s4.Checked = true;
                else if (Session["pre_uper_anter_segment_UL1_UR1"].ToString() == "5")
                    crowding_uper_right_3_s5.Checked = true;

                //step4
                if (Session["pre_uper_anter_segment_UL2_UL1"].ToString() == "0")
                    crowding_uper_left_1_s0.Checked = true;
                else if (Session["pre_uper_anter_segment_UL2_UL1"].ToString() == "1")
                    crowding_uper_left_1_s1.Checked = true;
                else if (Session["pre_uper_anter_segment_UL2_UL1"].ToString() == "2")
                    crowding_uper_left_1_s2.Checked = true;
                else if (Session["pre_uper_anter_segment_UL2_UL1"].ToString() == "3")
                    crowding_uper_left_1_s3.Checked = true;
                else if (Session["pre_uper_anter_segment_UL2_UL1"].ToString() == "4")
                    crowding_uper_left_1_s4.Checked = true;
                else if (Session["pre_uper_anter_segment_UL2_UL1"].ToString() == "5")
                    crowding_uper_left_1_s5.Checked = true;

                //step5
                if (Session["pre_uper_anter_segment_UL3_UL2"].ToString() == "0")
                    crowding_uper_left_2_s0.Checked = true;
                else if (Session["pre_uper_anter_segment_UL3_UL2"].ToString() == "1")
                    crowding_uper_left_2_s1.Checked = true;
                else if (Session["pre_uper_anter_segment_UL3_UL2"].ToString() == "2")
                    crowding_uper_left_2_s2.Checked = true;
                else if (Session["pre_uper_anter_segment_UL3_UL2"].ToString() == "3")
                    crowding_uper_left_2_s3.Checked = true;
                else if (Session["pre_uper_anter_segment_UL3_UL2"].ToString() == "4")
                    crowding_uper_left_2_s4.Checked = true;
                else if (Session["pre_uper_anter_segment_UL3_UL2"].ToString() == "5")
                    crowding_uper_left_2_s5.Checked = true;

            }
            else
            if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment" &&
                      Convert.ToString(Session["post_uper_anter_segment_type_definer"]) == "Permanent")
            {
                //step1 
                if (Session["post_uper_anter_segment_UR2_UR3"].ToString() == "0")
                    crowding_uper_right_1_s0.Checked = true;
                else if (Session["post_uper_anter_segment_UR2_UR3"].ToString() == "1")
                    crowding_uper_right_1_s1.Checked = true;
                else if (Session["post_uper_anter_segment_UR2_UR3"].ToString() == "2")
                    crowding_uper_right_1_s2.Checked = true;
                else if (Session["post_uper_anter_segment_UR2_UR3"].ToString() == "3")
                    crowding_uper_right_1_s3.Checked = true;
                else if (Session["post_uper_anter_segment_UR2_UR3"].ToString() == "4")
                    crowding_uper_right_1_s4.Checked = true;
                else if (Session["post_uper_anter_segment_UR2_UR3"].ToString() == "5")
                    crowding_uper_right_1_s5.Checked = true;
                //step2
                if (Session["post_uper_anter_segment_UR1_UR2"].ToString() == "0")
                    crowding_uper_right_2_s0.Checked = true;
                else if (Session["post_uper_anter_segment_UR1_UR2"].ToString() == "1")
                    crowding_uper_right_2_s1.Checked = true;
                else if (Session["post_uper_anter_segment_UR1_UR2"].ToString() == "2")
                    crowding_uper_right_2_s2.Checked = true;
                else if (Session["post_uper_anter_segment_UR1_UR2"].ToString() == "3")
                    crowding_uper_right_2_s3.Checked = true;
                else if (Session["post_uper_anter_segment_UR1_UR2"].ToString() == "4")
                    crowding_uper_right_2_s4.Checked = true;
                else if (Session["post_uper_anter_segment_UR1_UR2"].ToString() == "5")
                    crowding_uper_right_2_s5.Checked = true;

                //step3
                if (Session["post_uper_anter_segment_UL1_UR1"].ToString() == "0")
                    crowding_uper_right_3_s0.Checked = true;
                else if (Session["post_uper_anter_segment_UL1_UR1"].ToString() == "1")
                    crowding_uper_right_3_s1.Checked = true;
                else if (Session["post_uper_anter_segment_UL1_UR1"].ToString() == "2")
                    crowding_uper_right_3_s2.Checked = true;
                else if (Session["post_uper_anter_segment_UL1_UR1"].ToString() == "3")
                    crowding_uper_right_3_s3.Checked = true;
                else if (Session["post_uper_anter_segment_UL1_UR1"].ToString() == "4")
                    crowding_uper_right_3_s4.Checked = true;
                else if (Session["post_uper_anter_segment_UL1_UR1"].ToString() == "5")
                    crowding_uper_right_3_s5.Checked = true;

                //step4
                if (Session["post_uper_anter_segment_UL2_UL1"].ToString() == "0")
                    crowding_uper_left_1_s0.Checked = true;
                else if (Session["post_uper_anter_segment_UL2_UL1"].ToString() == "1")
                    crowding_uper_left_1_s1.Checked = true;
                else if (Session["post_uper_anter_segment_UL2_UL1"].ToString() == "2")
                    crowding_uper_left_1_s2.Checked = true;
                else if (Session["post_uper_anter_segment_UL2_UL1"].ToString() == "3")
                    crowding_uper_left_1_s3.Checked = true;
                else if (Session["post_uper_anter_segment_UL2_UL1"].ToString() == "4")
                    crowding_uper_left_1_s4.Checked = true;
                else if (Session["post_uper_anter_segment_UL2_UL1"].ToString() == "5")
                    crowding_uper_left_1_s5.Checked = true;

                //step5
                if (Session["post_uper_anter_segment_UL3_UL2"].ToString() == "0")
                    crowding_uper_left_2_s0.Checked = true;
                else if (Session["post_uper_anter_segment_UL3_UL2"].ToString() == "1")
                    crowding_uper_left_2_s1.Checked = true;
                else if (Session["post_uper_anter_segment_UL3_UL2"].ToString() == "2")
                    crowding_uper_left_2_s2.Checked = true;
                else if (Session["post_uper_anter_segment_UL3_UL2"].ToString() == "3")
                    crowding_uper_left_2_s3.Checked = true;
                else if (Session["post_uper_anter_segment_UL3_UL2"].ToString() == "4")
                    crowding_uper_left_2_s4.Checked = true;

                else if (Session["post_uper_anter_segment_UL3_UL2"].ToString() == "5")
                    crowding_uper_left_2_s5.Checked = true;

            }
        }


        public void Calculations()
        {
            if (crowding_uper_right_1_s0.Checked)
                step1 = 0;
            else if (crowding_uper_right_1_s2.Checked)
                step1 = 2;
            else if (crowding_uper_right_1_s3.Checked)
                step1 = 3;
            else if (crowding_uper_right_1_s4.Checked)
                step1 = 4;
            else if (crowding_uper_right_1_s1.Checked)
                step1 = 1;
            else if (crowding_uper_right_1_s5.Checked)
                step1 = 5;



            //  step 2 in process

            if (crowding_uper_right_2_s0.Checked)
                step2 = 0;
            else if (crowding_uper_right_2_s1.Checked)
                step2 = 1;
            else if (crowding_uper_right_2_s2.Checked)
                step2 = 2;
            else if (crowding_uper_right_2_s3.Checked)
                step2 = 3;
            else if (crowding_uper_right_2_s4.Checked)
                step2 = 4;
            else if (crowding_uper_right_2_s5.Checked)
                step2 = 5;


            // step 3 in process

            if (crowding_uper_right_3_s0.Checked)
                step3 = 0;
            else if (crowding_uper_right_3_s1.Checked)
                step3 = 1;
            else if (crowding_uper_right_3_s2.Checked)
                step3 = 2;
            else if (crowding_uper_right_3_s3.Checked)
                step3 = 3;
            else if (crowding_uper_right_3_s4.Checked)
                step3 = 4;
            else if (crowding_uper_right_3_s5.Checked)
                step3 = 5;


            //  step 4 in process

            if (crowding_uper_left_1_s0.Checked)
                step4 = 0;
            else if (crowding_uper_left_1_s1.Checked)
                step4 = 1;
            else if (crowding_uper_left_1_s2.Checked)
                step4 = 2;
            else if (crowding_uper_left_1_s3.Checked)
                step4 = 3;
            else if (crowding_uper_left_1_s4.Checked)
                step4 = 4;
            else if (crowding_uper_left_1_s5.Checked)
                step4 = 5;

            //  step 5 in process

            if (crowding_uper_left_2_s0.Checked)
                step5 = 0;
            else if (crowding_uper_left_2_s2.Checked)
                step5 = 2;
            else if (crowding_uper_left_2_s3.Checked)
                step5 = 3;
            else if (crowding_uper_left_2_s4.Checked)
                step5 = 4;
            else if (crowding_uper_left_2_s1.Checked)
                step5 = 1;
            else if (crowding_uper_left_2_s5.Checked)
                step5 = 5;


            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                Session["pre_uper_anter_segment_UR2_UR3"] = step1;
                Session["pre_uper_anter_segment_UR1_UR2"] = step2;
                Session["pre_uper_anter_segment_UL1_UR1"] = step3;
                Session["pre_uper_anter_segment_UL2_UL1"] = step4;
                Session["pre_uper_anter_segment_UL3_UL2"] = step5;

                Session["pre_uper_anter_segment_type_definer"] = "Permanent";

            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                Session["post_uper_anter_segment_UR2_UR3"] = step1;
                Session["post_uper_anter_segment_UR1_UR2"] = step2;
                Session["post_uper_anter_segment_UL1_UR1"] = step3;
                Session["post_uper_anter_segment_UL2_UL1"] = step4;
                Session["post_uper_anter_segment_UL3_UL2"] = step5;

                Session["post_uper_anter_segment_type_definer"] = "Permanent";
            }


            total = step1 + step2 + step3 + step4 + step5;

            if (step1 != 6 && step2 != 6 && step3 != 6 && step4 != 6 && step5 != 6)
            {
                Session["a_value"] = total;

                if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
                {
                    Session["pre_uper_crowding_Sum_Value"] = Convert.ToInt32(Session["pre_uper_anter_segment_UR2_UR3"]) +
                      Convert.ToInt32(Session["pre_uper_anter_segment_UR1_UR2"]) + Convert.ToInt32(Session["pre_uper_anter_segment_UL1_UR1"]) +
                      Convert.ToInt32(Session["pre_uper_anter_segment_UL2_UL1"]) + Convert.ToInt32(Session["pre_uper_anter_segment_UL3_UL2"]);
                }
                else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
                {
                    Session["post_uper_crowding_Sum_Value"] = Convert.ToInt32(Session["post_uper_anter_segment_UR2_UR3"]) +
                  Convert.ToInt32(Session["post_uper_anter_segment_UR1_UR2"]) + Convert.ToInt32(Session["post_uper_anter_segment_UL1_UR1"]) +
                  Convert.ToInt32(Session["post_uper_anter_segment_UL2_UL1"]) + Convert.ToInt32(Session["post_uper_anter_segment_UL3_UL2"]);

                }

                Session["btn_anterior_crowding_uper"] = "1";
                Response.Redirect("Crowding.aspx");
            }
            else
                showing_error.Visible = true;
        }


    }
}