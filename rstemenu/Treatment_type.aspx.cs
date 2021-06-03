using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Treatment_type : System.Web.UI.Page
    {
        int posttreatment, pretreatment;
        Methods obj = new Methods();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["pat_id"] != null)
                {
                    ReSetting_Session_values();
                    Session["Patient_ID"] = Request.QueryString["pat_id"].ToString();
                    Populating_Patient_data(Session["Patient_ID"].ToString());
                }
                if (Request.QueryString["id"] != null)
                {
                    ReSetting_Session_values();
                    Session["Patient_ID"] = Request.QueryString["id"].ToString();
                }
                Session["btn_anterior_crowding"] = "0";
                Session["btn_anterior_crowding_uper"] = "0";
                Session["btn_left_buccalocclusion"] = "0";
                Session["btn_buccalocclusion"] = "0";
                Session["overbite"] = "0";
                Session["overjet"] = "0";
                Session["midline"] = "0";
                Crowding();
                BuccalOcclussion();
                OverJet();
                OverBite();
                Midline();
                Main_Scoring_setting();
                posttreatment = Convert.ToInt32(Session["Posttreatment_value"]);
                pretreatment = Convert.ToInt32(Session["Pretreatment_value"]);
                if (pretreatment == -1)
                    lbl_pre_value_p1.Text = "Pre-Treatment  Value (P1) = no value";
                else
                    lbl_pre_value_p1.Text = "Pre-Treatment  Value (P1) = " + pretreatment;
                if (posttreatment == -1)
                    lbl_pre_value_p2.Text = "Post-Treatment Value (P2) =  no value";
                else
                    lbl_pre_value_p2.Text = "Post-Treatment Value (P2) = " + posttreatment;
                if (Convert.ToInt32(Session["btn_pre_treatemnt"]) != 0)
                    btn_pretreatment.Enabled = false;
                if (Convert.ToInt32(Session["btn_post_treatment"]) != 0)
                    btn_posttreatment.Enabled = false;
            }
        }

        protected void btn_pretreatment_Click(object sender, EventArgs e)
        {
            Response.Redirect("alloptions.aspx?status=1");
        }

        protected void btn_posttreatment_Click(object sender, EventArgs e)
        {
            Response.Redirect("alloptions.aspx?status=2");
        }

        protected void reset_button_Click(object sender, EventArgs e)
        {
            btn_pretreatment.Enabled = true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            btn_posttreatment.Enabled = true;
        }

        protected void result_show_Click(object sender, EventArgs e)
        {
            Main_Scoring_setting();

            posttreatment = Convert.ToInt32(Session["Posttreatment_value"]);
            pretreatment = Convert.ToInt32(Session["Pretreatment_value"]);

            if (posttreatment != -1 && pretreatment != -1)
            {
                int result_value = pretreatment - posttreatment;
                double percentage = Math.Round(((Convert.ToDouble(posttreatment) / Convert.ToDouble(pretreatment)) * 100), 2);

                Submittion_Pars_Values();
                obj.Pars_Result_submit(pretreatment, posttreatment, result_value, percentage, Convert.ToInt32(Session["Patient_ID"]));
                Response.Redirect("~/Result_show.aspx?pre=" + pretreatment + "&post=" + posttreatment);
            }
            else
                show_error.Visible = true;

        }

        public void Submittion_Pars_Values()
        {
            string patient_id = Session["Patient_ID"].ToString();
            string patient_name = Session["Patient_Name"].ToString();
            string pre_uper_ur2_ur3 = Session["pre_uper_anter_segment_UR2_UR3"].ToString();
            string pre_uper_ur1_ur2 = Session["pre_uper_anter_segment_UR1_UR2"].ToString();
            string pre_uper_ul1_ur1 = Session["pre_uper_anter_segment_UL1_UR1"].ToString();
            string pre_uper_ul2_ul1 = Session["pre_uper_anter_segment_UL2_UL1"].ToString();
            string pre_uper_ul3_ul2 = Session["pre_uper_anter_segment_UL3_UL2"].ToString();
            string pre_uper_type_definer = Session["pre_uper_anter_segment_type_definer"].ToString();
            string pre_lower_ur2_ur3 = Session["pre_lower_anter_segment_UR2_UR3"].ToString();
            string pre_lower_ur1_ur2 = Session["pre_lower_anter_segment_UR1_UR2"].ToString();
            string pre_lower_ul1_ur1 = Session["pre_lower_anter_segment_UL1_UR1"].ToString();
            string pre_lower_ul2_ul1 = Session["pre_lower_anter_segment_UL2_UL1"].ToString();
            string pre_lower_ul3_ul2 = Session["pre_lower_anter_segment_UL3_UL2"].ToString();
            string pre_lower_type_definer = Session["pre_lower_anter_segment_type_definer"].ToString();
            string pre_right_buccal_anterior = Session["pre_right_buccol_Occlusion_anterior"].ToString();
            string pre_right_buccal_vertical = Session["pre_right_buccol_Occlusion_vertical"].ToString();
            string pre_right_buccal_transverse = Session["pre_right_buccol_Occlusion_transverse"].ToString();
            string pre_left_buccal_anterior = Session["pre_left_buccol_Occlusion_anterior"].ToString();
            string pre_left_buccal_vertical = Session["pre_left_buccol_Occlusion_vertical"].ToString();
            string pre_left_buccal_transverse = Session["pre_left_buccol_Occlusion_transverse"].ToString();
            string pre_positive_overjet = Session["pre_Postive_overjet"].ToString();
            string pre_negative_overjet = Session["pre_Negative_overjet"].ToString();
            string pre_overjet_type = Session["pre_Overjet_type"].ToString();
            string pre_positive_overbite = Session["pre_Positive_overbite"].ToString();
            string pre_negative_overbite = Session["pre_Negative_overbite"].ToString();
            string pre_overbite_type = Session["pre_Overbite_type"].ToString();
            string pre_midline = Session["pre_Midline"].ToString();

            //Post Sessions

            string post_uper_ur2_ur3 = Session["post_uper_anter_segment_UR2_UR3"].ToString();
            string post_uper_ur1_ur2 = Session["post_uper_anter_segment_UR1_UR2"].ToString();
            string post_uper_ul1_ur1 = Session["post_uper_anter_segment_UL1_UR1"].ToString();
            string post_uper_ul2_ul1 = Session["post_uper_anter_segment_UL2_UL1"].ToString();
            string post_uper_ul3_ul2 = Session["post_uper_anter_segment_UL3_UL2"].ToString();
            string post_uper_type_definer = Session["post_uper_anter_segment_type_definer"].ToString();
            string post_lower_ur2_ur3 = Session["post_lower_anter_segment_UR2_UR3"].ToString();
            string post_lower_ur1_ur2 = Session["post_lower_anter_segment_UR1_UR2"].ToString();
            string post_lower_ul1_ur1 = Session["post_lower_anter_segment_UL1_UR1"].ToString();
            string post_lower_ul2_ul1 = Session["post_lower_anter_segment_UL2_UL1"].ToString();
            string post_lower_ul3_ul2 = Session["post_lower_anter_segment_UL3_UL2"].ToString();
            string post_lower_type_definer = Session["post_lower_anter_segment_type_definer"].ToString();
            string post_right_buccal_anterior = Session["post_right_buccol_Occlusion_anterior"].ToString();
            string post_right_buccal_vertical = Session["post_right_buccol_Occlusion_vertical"].ToString();
            string post_right_buccal_transverse = Session["post_right_buccol_Occlusion_transverse"].ToString();
            string post_left_buccal_anterior = Session["post_left_buccol_Occlusion_anterior"].ToString();
            string post_left_buccal_vertical = Session["post_left_buccol_Occlusion_vertical"].ToString();
            string post_left_buccal_transverse = Session["post_left_buccol_Occlusion_transverse"].ToString();
            string post_positive_overjet = Session["post_Postive_overjet"].ToString();
            string post_negative_overjet = Session["post_Negative_overjet"].ToString();
            string post_overjet_type = Session["post_Overjet_type"].ToString();
            string post_positive_overbite = Session["post_Positive_overbite"].ToString();
            string post_negative_overbite = Session["post_Negative_overbite"].ToString();
            string post_overbite_type = Session["post_Overbite_type"].ToString();
            string post_midline = Session["post_Midline"].ToString();

            if (pre_uper_ur2_ur3.Length > 0 && pre_lower_ul3_ul2.Length > 0 && pre_lower_type_definer.Length > 0)
            {

                obj.Inserting_Pre_Patient_Value(Session["Patient_ID"].ToString(), pre_uper_ur2_ur3, pre_uper_ur1_ur2, pre_uper_ul1_ur1, pre_uper_ul2_ul1, pre_uper_ul3_ul2, pre_uper_type_definer, pre_lower_ur2_ur3,
                    pre_lower_ur1_ur2, pre_lower_ul1_ur1, pre_lower_ul2_ul1, pre_lower_ul3_ul2, pre_lower_type_definer, pre_right_buccal_anterior, pre_right_buccal_vertical, pre_right_buccal_transverse, pre_left_buccal_anterior,
                    pre_left_buccal_vertical, pre_left_buccal_transverse, pre_positive_overjet, pre_negative_overjet, pre_overjet_type, pre_positive_overbite, pre_negative_overbite, pre_overbite_type, pre_midline);
            }
            if (post_uper_ur2_ur3.Length > 0 && post_lower_ul3_ul2.Length > 0 && post_lower_type_definer.Length > 0)
            {
                obj.Inserting_Post_Patient_Value(Session["Patient_ID"].ToString(), post_uper_ur2_ur3, post_uper_ur1_ur2, post_uper_ul1_ur1, post_uper_ul2_ul1, post_uper_ul3_ul2, post_uper_type_definer, post_lower_ur2_ur3,
               post_lower_ur1_ur2, post_lower_ul1_ur1, post_lower_ul2_ul1, post_lower_ul3_ul2, post_lower_type_definer, post_right_buccal_anterior, post_right_buccal_vertical, post_right_buccal_transverse, post_left_buccal_anterior,
               post_left_buccal_vertical, post_left_buccal_transverse, post_positive_overjet, post_negative_overjet, post_overjet_type, post_positive_overbite, post_negative_overbite, post_overbite_type, post_midline);
            }
        }

        public void Populating_Patient_data(string patient_id_for_fetching)
        {
            DataTable pre_dt = obj.Fetching_data_of_pre_Values(patient_id_for_fetching);
            foreach (DataRow row in pre_dt.Rows)
            {
                Session["Patient_ID"] = row[0].ToString();
                Session["Patient_customID"] = row[1].ToString();
                Session["pre_uper_anter_segment_UR2_UR3"] = row[2].ToString();
                Session["pre_uper_anter_segment_UR1_UR2"] = row[3].ToString();
                Session["pre_uper_anter_segment_UL1_UR1"] = row[4].ToString();
                Session["pre_uper_anter_segment_UL2_UL1"] = row[5].ToString();
                Session["pre_uper_anter_segment_UL3_UL2"] = row[6].ToString();
                Session["pre_uper_anter_segment_type_definer"] = row[7].ToString();
                Session["pre_lower_anter_segment_UR2_UR3"] = row[8].ToString();
                Session["pre_lower_anter_segment_UR1_UR2"] = row[9].ToString();
                Session["pre_lower_anter_segment_UL1_UR1"] = row[10].ToString();
                Session["pre_lower_anter_segment_UL2_UL1"] = row[11].ToString();
                Session["pre_lower_anter_segment_UL3_UL2"] = row[12].ToString();
                Session["pre_lower_anter_segment_type_definer"] = row[13].ToString();
                Session["pre_right_buccol_Occlusion_anterior"] = row[14].ToString();
                Session["pre_right_buccol_Occlusion_vertical"] = row[15].ToString();
                Session["pre_right_buccol_Occlusion_transverse"] = row[16].ToString();
                Session["pre_left_buccol_Occlusion_anterior"] = row[17].ToString();
                Session["pre_left_buccol_Occlusion_vertical"] = row[18].ToString();
                Session["pre_left_buccol_Occlusion_transverse"] = row[19].ToString();
                Session["pre_Postive_overjet"] = row[20].ToString();
                Session["pre_Negative_overjet"] = row[21].ToString();
                Session["pre_Overjet_type"] = row[22].ToString();
                Session["pre_Positive_overbite"] = row[23].ToString();
                Session["pre_Negative_overbite"] = row[24].ToString();
                Session["pre_Overbite_type"] = row[25].ToString();
                Session["pre_Midline"] = row[26].ToString();
            }
            DataTable post_dt = obj.Fetching_data_of_post_Values(patient_id_for_fetching);

            foreach (DataRow row in post_dt.Rows)
            {
                Session["Patient_ID"] = row[1].ToString();
                Session["ID"] = row[0].ToString();
                Session["post_uper_anter_segment_UR2_UR3"] = row[2].ToString();
                Session["post_uper_anter_segment_UR1_UR2"] = row[3].ToString();
                Session["post_uper_anter_segment_UL1_UR1"] = row[4].ToString();
                Session["post_uper_anter_segment_UL2_UL1"] = row[5].ToString();
                Session["post_uper_anter_segment_UL3_UL2"] = row[6].ToString();
                Session["post_uper_anter_segment_type_definer"] = row[7].ToString();
                Session["post_lower_anter_segment_UR2_UR3"] = row[8].ToString();
                Session["post_lower_anter_segment_UR1_UR2"] = row[9].ToString();
                Session["post_lower_anter_segment_UL1_UR1"] = row[10].ToString();
                Session["post_lower_anter_segment_UL2_UL1"] = row[11].ToString();
                Session["post_lower_anter_segment_UL3_UL2"] = row[12].ToString();
                Session["post_lower_anter_segment_type_definer"] = row[13].ToString();
                Session["post_right_buccol_Occlusion_anterior"] = row[14].ToString();
                Session["post_right_buccol_Occlusion_vertical"] = row[15].ToString();
                Session["post_right_buccol_Occlusion_transverse"] = row[16].ToString();
                Session["post_left_buccol_Occlusion_anterior"] = row[17].ToString();
                Session["post_left_buccol_Occlusion_vertical"] = row[18].ToString();
                Session["post_left_buccol_Occlusion_transverse"] = row[19].ToString();
                Session["post_Postive_overjet"] = row[20].ToString();
                Session["post_Negative_overjet"] = row[21].ToString();
                Session["post_Overjet_type"] = row[22].ToString();
                Session["post_Positive_overbite"] = row[23].ToString();
                Session["post_Negative_overbite"] = row[24].ToString();
                Session["post_Overbite_type"] = row[25].ToString();
                Session["post_Midline"] = row[26].ToString();
            }
        }

        public void Main_Scoring_setting()
        {
            int total = 0;
            if (Session["pre_lower_crowding_Sum_Value"].ToString().Length > 0)
                total = total + Convert.ToInt32(Session["pre_lower_crowding_Sum_Value"]);
            if (Session["pre_uper_crowding_Sum_Value"].ToString().Length > 0)
                total = total + Convert.ToInt32(Session["pre_uper_crowding_Sum_Value"]);

            if (Session["pre_right_Buccal_Sum_Value"].ToString().Length > 0)
                total = total + Convert.ToInt32(Session["pre_right_Buccal_Sum_Value"]);
            if (Session["pre_left_Buccal_Sum_Value"].ToString().Length > 0)
                total = total + Convert.ToInt32(Session["pre_left_Buccal_Sum_Value"]);


            if (Session["pre_overjet_Sum_Value"].ToString().Length > 0)
                total = total + Convert.ToInt32(Session["pre_overjet_Sum_Value"]);
            if (Session["pre_Overbite_Sum_Value"].ToString().Length > 0)
                total = total + Convert.ToInt32(Session["pre_Overbite_Sum_Value"]);


            if (Session["pre_midline_Value"].ToString().Length > 0)
                total = total + Convert.ToInt32(Session["pre_midline_Value"]);

            Session["Pretreatment_value"] = total;
            int post_total = 0;

            if (Session["post_lower_crowding_Sum_Value"].ToString().Length > 0)
                post_total = post_total + Convert.ToInt32(Session["post_lower_crowding_Sum_Value"]);
            if (Session["post_uper_crowding_Sum_Value"].ToString().Length > 0)
                post_total = post_total + Convert.ToInt32(Session["post_uper_crowding_Sum_Value"]);
            if (Session["post_right_Buccal_Sum_Value"].ToString().Length > 0)
                post_total = post_total + Convert.ToInt32(Session["post_right_Buccal_Sum_Value"]);
            if (Session["post_left_Buccal_Sum_Value"].ToString().Length > 0)
                post_total = post_total + Convert.ToInt32(Session["post_left_Buccal_Sum_Value"]);
            if (Session["post_overjet_Sum_Value"].ToString().Length > 0)
                post_total = post_total + Convert.ToInt32(Session["post_overjet_Sum_Value"]);
            if (Session["post_Overbite_Sum_Value"].ToString().Length > 0)
                post_total = post_total + Convert.ToInt32(Session["post_Overbite_Sum_Value"]);

            if (Session["post_midline_Value"].ToString().Length > 0)
                post_total = post_total + Convert.ToInt32(Session["post_midline_Value"]);
            Session["Posttreatment_value"] = post_total;
        }


        public void BuccalOcclussion()
        {
            int right_result_value = 0;
            if (Session["pre_right_buccol_Occlusion_anterior"].ToString().Length > 0)
                right_result_value = right_result_value + Convert.ToInt32(Session["pre_right_buccol_Occlusion_anterior"]);
            if (Session["pre_right_buccol_Occlusion_vertical"].ToString().Length > 0)
                right_result_value = right_result_value + Convert.ToInt32(Session["pre_right_buccol_Occlusion_vertical"]);
            if (Session["pre_right_buccol_Occlusion_transverse"].ToString().Length > 0)
                right_result_value = right_result_value + Convert.ToInt32(Session["pre_right_buccol_Occlusion_transverse"]);
            Session["pre_right_Buccal_Sum_Value"] = right_result_value.ToString();
            int left_result_value = 0;
            if (Session["pre_left_buccol_Occlusion_anterior"].ToString().Length > 0)
                left_result_value = left_result_value + Convert.ToInt32(Session["pre_left_buccol_Occlusion_anterior"]);
            if (Session["pre_left_buccol_Occlusion_vertical"].ToString().Length > 0)
                left_result_value = left_result_value + Convert.ToInt32(Session["pre_left_buccol_Occlusion_vertical"]);
            if (Session["pre_left_buccol_Occlusion_transverse"].ToString().Length > 0)
                left_result_value = left_result_value + Convert.ToInt32(Session["pre_left_buccol_Occlusion_transverse"]);
            Session["pre_left_Buccal_Sum_Value"] = left_result_value.ToString();
            int post_right_result_value = 0;
            if (Session["post_right_buccol_Occlusion_anterior"].ToString().Length > 0)
                post_right_result_value = post_right_result_value + Convert.ToInt32(Session["post_right_buccol_Occlusion_anterior"]);
            if (Session["post_right_buccol_Occlusion_vertical"].ToString().Length > 0)
                post_right_result_value = post_right_result_value + Convert.ToInt32(Session["post_right_buccol_Occlusion_vertical"]);
            if (Session["post_right_buccol_Occlusion_transverse"].ToString().Length > 0)
                post_right_result_value = post_right_result_value + Convert.ToInt32(Session["post_right_buccol_Occlusion_transverse"]);
            Session["post_right_Buccal_Sum_Value"] = post_right_result_value.ToString();
            int post_left_result_value = 0;
            if (Session["post_left_buccol_Occlusion_anterior"].ToString().Length > 0)
                post_left_result_value = post_left_result_value + Convert.ToInt32(Session["post_left_buccol_Occlusion_anterior"]);
            if (Session["post_left_buccol_Occlusion_vertical"].ToString().Length > 0)
                post_left_result_value = post_left_result_value + Convert.ToInt32(Session["post_left_buccol_Occlusion_vertical"]);
            if (Session["post_left_buccol_Occlusion_transverse"].ToString().Length > 0)
                post_left_result_value = post_left_result_value + Convert.ToInt32(Session["post_left_buccol_Occlusion_transverse"]);
            Session["post_left_Buccal_Sum_Value"] = post_left_result_value.ToString();
        }

        public void Crowding()
        {
            int lower_result_value = 0;
            if (Session["pre_lower_anter_segment_UR2_UR3"].ToString().Length > 0)
                lower_result_value = lower_result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UR2_UR3"]);
            if (Session["pre_lower_anter_segment_UR1_UR2"].ToString().Length > 0)
                lower_result_value = lower_result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UR1_UR2"]);
            if (Session["pre_lower_anter_segment_UL1_UR1"].ToString().Length > 0)
                lower_result_value = lower_result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UL1_UR1"]);
            if (Session["pre_lower_anter_segment_UL2_UL1"].ToString().Length > 0)
                lower_result_value = lower_result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UL2_UL1"]);
            if (Session["pre_lower_anter_segment_UL3_UL2"].ToString().Length > 0)
                lower_result_value = lower_result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UL3_UL2"]);
            Session["pre_lower_crowding_Sum_Value"] = Convert.ToString(lower_result_value);
            int uper_result_value = 0;
            if (Session["pre_uper_anter_segment_UR2_UR3"].ToString().Length > 0)
                uper_result_value = uper_result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UR2_UR3"]);
            if (Session["pre_uper_anter_segment_UR1_UR2"].ToString().Length > 0)
                uper_result_value = uper_result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UR1_UR2"]);
            if (Session["pre_uper_anter_segment_UL1_UR1"].ToString().Length > 0)
                uper_result_value = uper_result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UL1_UR1"]);
            if (Session["pre_uper_anter_segment_UL2_UL1"].ToString().Length > 0)
                uper_result_value = uper_result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UL2_UL1"]);
            if (Session["pre_uper_anter_segment_UL3_UL2"].ToString().Length > 0)
                uper_result_value = uper_result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UL3_UL2"]);
            Session["pre_uper_crowding_Sum_Value"] = uper_result_value;
            int post_lower_result_value = 0;
            if (Session["post_lower_anter_segment_UR2_UR3"].ToString().Length > 0)
                post_lower_result_value = post_lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UR2_UR3"]);
            if (Session["post_lower_anter_segment_UR1_UR2"].ToString().Length > 0)
                post_lower_result_value = post_lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UR1_UR2"]);
            if (Session["post_lower_anter_segment_UL1_UR1"].ToString().Length > 0)
                post_lower_result_value = post_lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL1_UR1"]);
            if (Session["post_lower_anter_segment_UL2_UL1"].ToString().Length > 0)
                post_lower_result_value = post_lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL2_UL1"]);
            if (Session["post_lower_anter_segment_UL3_UL2"].ToString().Length > 0)
                post_lower_result_value = post_lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL3_UL2"]);
            Session["post_lower_crowding_Sum_Value"] = post_lower_result_value.ToString();
            int post_uper_result_value = 0;
            if (Session["post_uper_anter_segment_UR2_UR3"].ToString().Length > 0)
                post_uper_result_value = post_uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UR2_UR3"]);
            if (Session["post_uper_anter_segment_UR1_UR2"].ToString().Length > 0)
                post_uper_result_value = post_uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UR1_UR2"]);
            if (Session["post_uper_anter_segment_UL1_UR1"].ToString().Length > 0)
                post_uper_result_value = post_uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL1_UR1"]);
            if (Session["post_uper_anter_segment_UL2_UL1"].ToString().Length > 0)
                post_uper_result_value = post_uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL2_UL1"]);
            if (Session["post_uper_anter_segment_UL3_UL2"].ToString().Length > 0)
                post_uper_result_value = post_uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL3_UL2"]);
            int post_result = post_uper_result_value + post_lower_result_value;
            Session["post_uper_crowding_Sum_Value"] = post_uper_result_value;
        }

        public void OverJet()
        {

            int overjet_sum = 0;
            if (Session["pre_Postive_overjet"].ToString().Length > 0)
                overjet_sum = overjet_sum + Convert.ToInt32(Session["pre_Postive_overjet"]);
            if (Session["pre_Negative_overjet"].ToString().Length > 0)
                overjet_sum = overjet_sum + Convert.ToInt32(Session["pre_Negative_overjet"]);
            Session["pre_overjet_Sum_Value"] = overjet_sum * 6;
            int post_overjet_sum = 0;
            if (Session["post_Postive_overjet"].ToString().Length > 0)
                post_overjet_sum = post_overjet_sum + Convert.ToInt32(Session["post_Postive_overjet"]);
            if (Session["post_Negative_overjet"].ToString().Length > 0)
                post_overjet_sum = post_overjet_sum + Convert.ToInt32(Session["post_Negative_overjet"]);
            Session["post_overjet_Sum_Value"] = post_overjet_sum * 6;
        }

        public void OverBite()
        {
            int overbite_sum = 0;
            if (Session["pre_Positive_overbite"].ToString().Length > 0)
                overbite_sum = overbite_sum + Convert.ToInt32(Session["pre_Positive_overbite"]);
            if (Session["pre_Negative_overbite"].ToString().Length > 0)
                overbite_sum = overbite_sum + Convert.ToInt32(Session["pre_Negative_overbite"]);
            Session["pre_Overbite_Sum_Value"] = overbite_sum * 2;
            int post_overbite_sum = 0;
            if (Session["post_Positive_overbite"].ToString().Length > 0)
                post_overbite_sum = post_overbite_sum + Convert.ToInt32(Session["post_Positive_overbite"]);
            if (Session["post_Negative_overbite"].ToString().Length > 0)
                post_overbite_sum = post_overbite_sum + Convert.ToInt32(Session["post_Negative_overbite"]);
            Session["post_Overbite_Sum_Value"] = post_overbite_sum * 2;
        }

        public void Midline()
        {

            int midline = 0;

            if (Session["pre_Midline"].ToString().Length > 0)
                midline = midline + Convert.ToInt32(Session["pre_Midline"]);
            Session["pre_midline_Value"] = midline * 4;
            int post_midline = 0;
            if (Session["post_Midline"].ToString().Length > 0)
                post_midline = post_midline + Convert.ToInt32(Session["post_Midline"]);
            Session["post_midline_Value"] = post_midline * 4;
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