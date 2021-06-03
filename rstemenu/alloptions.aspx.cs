using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class alloptions : System.Web.UI.Page
    {
        Methods obj = new Methods();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Request.QueryString["status"] != null)
                {
                    if (Request.QueryString["status"] == "1")
                        Session["Preorposttreatment"] = "Pretreatment";
                    if (Request.QueryString["status"] == "2")
                        Session["Preorposttreatment"] = "Posttreatment";
                }
                Crowding();
                BuccalOcclussion();
                OverJet();
                OverBite();
                Midline();
                Main_Scoring_setting();

                if (Convert.ToString(Session["btn_anterior_crowding"]) == "1")
                    btn_crowding.Enabled = false;
                if (Convert.ToString(Session["btn_buccalocclusion"]) == "1")
                    btn_occlusion.Enabled = false;
                if (Convert.ToString(Session["overbite"]) == "1")
                    btn_boccusion.Enabled = false;
                if (Convert.ToString(Session["overjet"]) == "1")
                    btn_aoccusion.Enabled = false;
                if (Convert.ToString(Session["midline"]) == "1")
                    btn_miding.Enabled = false;
            }
           
        }

        protected void btn_crowding_Click(object sender, EventArgs e)
        {
            Response.Redirect("Crowding.aspx");
        }

        protected void btn_occlusion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BuccalOcclussion.aspx");
        }
        protected void btn_aoccusion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/overJet_main.aspx");
        }

        protected void btn_boccusion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OverBite_main.aspx");
        }

        protected void btn_miding_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Midline.aspx");
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            DateTime pars_datetime = DateTime.Now;
            string username = User.Identity.Name;
            BuccalOcclussion();
            Crowding();
            OverJet();
            OverBite();
            Midline();
            Main_Scoring_setting();

            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                if (Session["pre_lower_crowding_Sum_Value"].ToString().Length > 0 &&
                         Session["pre_uper_crowding_Sum_Value"].ToString().Length > 0 &&
                         Session["pre_right_Buccal_Sum_Value"].ToString().Length > 0 &&
                         Session["pre_left_Buccal_Sum_Value"].ToString().Length > 0 &&
                         Session["pre_overjet_Sum_Value"].ToString().Length > 0 &&
                         Session["pre_Overbite_Sum_Value"].ToString().Length > 0 &&
                         Session["pre_midline_Value"].ToString().Length > 0)
                {

                    Session["btn_pre_treatemnt"] = "1";
                    Response.Redirect("~/Treatment_type.aspx");
                }
                else
                    error_show.Visible = true;
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                if (Session["post_lower_crowding_Sum_Value"].ToString().Length > 0 &&
                                Session["post_uper_crowding_Sum_Value"].ToString().Length > 0 &&
                                Session["post_right_Buccal_Sum_Value"].ToString().Length > 0 &&
                                Session["post_left_Buccal_Sum_Value"].ToString().Length > 0 &&
                                Session["post_overjet_Sum_Value"].ToString().Length > 0 &&
                                Session["post_Overbite_Sum_Value"].ToString().Length > 0 &&
                                Session["post_midline_Value"].ToString().Length > 0)
                {
                    Session["btn_post_treatment"] = "1";
                    Response.Redirect("~/Treatment_type.aspx");
                }
                else
                    error_show.Visible = true;
            }
        }

        protected void reset_button_Click(object sender, EventArgs e)
        {
            Session["btn_anterior_crowding_uper"] = "0"; 
            Session["a_value"] = "0";
            Session["b_value"] = "0";
            btn_crowding.Enabled = true;
        }

        protected void reset_button2_Click(object sender, EventArgs e)
        {
            Session["btn_buccalocclusion"] = "0";
            Session["d_value"] = "0";
            Session["e_value"] = "0";
            Response.Redirect("alloptions.aspx");
        }

        protected void reset_button3_Click(object sender, EventArgs e)
        {
            Session["overjet"] = "0";
            Session["i_value"] = "0";
            Response.Redirect("alloptions.aspx");
        }

        protected void reset_button4_Click(object sender, EventArgs e)
        {
            Session["overbite"] = "0";
            Session["L_value"] = "0";
            Response.Redirect("alloptions.aspx");
        }

        protected void reset_button5_Click(object sender, EventArgs e)
        {
            Session["midline"] = "0";
            Session["n_value"] = "0";
            Response.Redirect("alloptions.aspx");
        }

        public void BuccalOcclussion()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                int left_result_value = 0;
                if (Session["pre_right_buccol_Occlusion_anterior"].ToString().Length > 0)
                    left_result_value = left_result_value + Convert.ToInt32(Session["pre_right_buccol_Occlusion_anterior"]);
                if (Session["pre_right_buccol_Occlusion_vertical"].ToString().Length > 0)
                    left_result_value = left_result_value + Convert.ToInt32(Session["pre_right_buccol_Occlusion_vertical"]);
                if (Session["pre_right_buccol_Occlusion_transverse"].ToString().Length > 0)
                    left_result_value = left_result_value + Convert.ToInt32(Session["pre_right_buccol_Occlusion_transverse"]);

                Session["pre_right_Buccal_Sum_Value"] = left_result_value.ToString();
                int right_result_value = 0;

                if (Session["pre_left_buccol_Occlusion_anterior"].ToString().Length > 0)
                    right_result_value = right_result_value + Convert.ToInt32(Session["pre_left_buccol_Occlusion_anterior"]);
                if (Session["pre_left_buccol_Occlusion_vertical"].ToString().Length > 0)
                    right_result_value = right_result_value + Convert.ToInt32(Session["pre_left_buccol_Occlusion_vertical"]);
                if (Session["pre_left_buccol_Occlusion_transverse"].ToString().Length > 0)
                    right_result_value = right_result_value + Convert.ToInt32(Session["pre_left_buccol_Occlusion_transverse"]);

                Session["pre_left_Buccal_Sum_Value"] = right_result_value.ToString();
                int result = left_result_value + right_result_value;
                btn_occlusion.Text = " Buccal occlusion (" + result + ")";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                int left_result_value = 0;
                if (Session["post_right_buccol_Occlusion_anterior"].ToString().Length > 0)
                    left_result_value = left_result_value + Convert.ToInt32(Session["post_right_buccol_Occlusion_anterior"]);
                if (Session["post_right_buccol_Occlusion_vertical"].ToString().Length > 0)
                    left_result_value = left_result_value + Convert.ToInt32(Session["post_right_buccol_Occlusion_vertical"]);
                if (Session["post_right_buccol_Occlusion_transverse"].ToString().Length > 0)
                    left_result_value = left_result_value + Convert.ToInt32(Session["post_right_buccol_Occlusion_transverse"]);

                Session["post_right_Buccal_Sum_Value"] = left_result_value.ToString();
                int right_result_value = 0;
                if (Session["post_left_buccol_Occlusion_anterior"].ToString().Length > 0)
                    right_result_value = right_result_value + Convert.ToInt32(Session["post_left_buccol_Occlusion_anterior"]);
                if (Session["post_left_buccol_Occlusion_vertical"].ToString().Length > 0)
                    right_result_value = right_result_value + Convert.ToInt32(Session["post_left_buccol_Occlusion_vertical"]);
                if (Session["post_left_buccol_Occlusion_transverse"].ToString().Length > 0)
                    right_result_value = right_result_value + Convert.ToInt32(Session["post_left_buccol_Occlusion_transverse"]);

                int result = left_result_value + right_result_value;
                Session["post_left_Buccal_Sum_Value"] = right_result_value.ToString();
                btn_occlusion.Text = " Buccal occlusion (" + result + ")";

            }
        }

        public void Crowding()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
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

                Session["pre_uper_crowding_Sum_Value"] = Convert.ToString("" + uper_result_value);
                int result = lower_result_value + uper_result_value;
                btn_crowding.Text = "Anterior segment (" + result + ")";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {

                int lower_result_value = 0;
                if (Session["post_lower_anter_segment_UR2_UR3"].ToString().Length > 0)
                    lower_result_value = lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UR2_UR3"]);
                if (Session["post_lower_anter_segment_UR1_UR2"].ToString().Length > 0)
                    lower_result_value = lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UR1_UR2"]);
                if (Session["post_lower_anter_segment_UL1_UR1"].ToString().Length > 0)
                    lower_result_value = lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL1_UR1"]);
                if (Session["post_lower_anter_segment_UL2_UL1"].ToString().Length > 0)
                    lower_result_value = lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL2_UL1"]);
                if (Session["post_lower_anter_segment_UL3_UL2"].ToString().Length > 0)
                    lower_result_value = lower_result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL3_UL2"]);

                Session["post_lower_crowding_Sum_Value"] = lower_result_value.ToString();

                int uper_result_value = 0;
                if (Session["post_uper_anter_segment_UR2_UR3"].ToString().Length > 0)
                    uper_result_value = uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UR2_UR3"]);
                if (Session["post_uper_anter_segment_UR1_UR2"].ToString().Length > 0)
                    uper_result_value = uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UR1_UR2"]);
                if (Session["post_uper_anter_segment_UL1_UR1"].ToString().Length > 0)
                    uper_result_value = uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL1_UR1"]);
                if (Session["post_uper_anter_segment_UL2_UL1"].ToString().Length > 0)
                    uper_result_value = uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL2_UL1"]);
                if (Session["post_uper_anter_segment_UL3_UL2"].ToString().Length > 0)
                    uper_result_value = uper_result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL3_UL2"]);
                int result = uper_result_value + lower_result_value;
                Session["post_uper_crowding_Sum_Value"] = uper_result_value.ToString();
                btn_crowding.Text = "Anterior segment (" + result + ")";
            }

        }

        public void OverJet()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                int overjet_sum = 0;
                if (Session["pre_Postive_overjet"].ToString().Length > 0)
                    overjet_sum = overjet_sum + Convert.ToInt32(Session["pre_Postive_overjet"]);
                if (Session["pre_Negative_overjet"].ToString().Length > 0)
                    overjet_sum = overjet_sum + Convert.ToInt32(Session["pre_Negative_overjet"]);
                Session["pre_overjet_Sum_Value"] = overjet_sum * 6;
                btn_aoccusion.Text = " Anterior occlusion (Overjet) (" + overjet_sum * 6 + ")";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                int overjet_sum = 0;
                if (Session["post_Postive_overjet"].ToString().Length > 0)
                    overjet_sum = overjet_sum + Convert.ToInt32(Session["post_Postive_overjet"]);
                if (Session["post_Negative_overjet"].ToString().Length > 0)
                    overjet_sum = overjet_sum + Convert.ToInt32(Session["post_Negative_overjet"]);
                Session["post_overjet_Sum_Value"] = overjet_sum * 6;
                btn_aoccusion.Text = " Anterior occlusion (Overjet) (" + overjet_sum * 6 + ")";

            }
        }

        public void OverBite()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                int overbite_sum = 0;
                if (Session["pre_Positive_overbite"].ToString().Length > 0)
                    overbite_sum = overbite_sum + Convert.ToInt32(Session["pre_Positive_overbite"]);
                if (Session["pre_Negative_overbite"].ToString().Length > 0)
                    overbite_sum = overbite_sum + Convert.ToInt32(Session["pre_Negative_overbite"]);
                btn_boccusion.Text = " Anterior occlusion (overbite) (" + overbite_sum * 2 + ")";
                Session["pre_Overbite_Sum_Value"] = overbite_sum * 2;
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                int overbite_sum = 0;
                if (Session["post_Positive_overbite"].ToString().Length > 0)
                    overbite_sum = overbite_sum + Convert.ToInt32(Session["post_Positive_overbite"]);
                if (Session["post_Negative_overbite"].ToString().Length > 0)
                    overbite_sum = overbite_sum + Convert.ToInt32(Session["post_Negative_overbite"]);
                btn_boccusion.Text = " Anterior occlusion (overbite) (" + overbite_sum * 2 + ")";
                Session["post_Overbite_Sum_Value"] = overbite_sum * 2;
            }
        }

        public void Midline()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                int midline = 0;
                if (Session["pre_Midline"].ToString().Length > 0)
                    midline = midline + Convert.ToInt32(Session["pre_Midline"]);
                btn_miding.Text = " Midline (" + midline * 4 + ")";
                Session["pre_midline_Value"] = midline * 4;
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                int midline = 0;

                if (Session["post_Midline"].ToString().Length > 0)
                    midline = midline + Convert.ToInt32(Session["post_Midline"]);
                btn_miding.Text = " Midline (" + midline * 4 + ")";
                Session["post_midline_Value"] = midline * 4;

            }
        }

        public void Main_Scoring_setting()
        {
            int total = 0;
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                if (Session["pre_lower_crowding_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["pre_lower_crowding_Sum_Value"]);
                if (Session["pre_uper_crowding_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["pre_uper_crowding_Sum_Value"]);


                if (Session["pre_right_Buccal_Sum_Value"].ToString().Length > 0)
                {
                    total = total + Convert.ToInt32(Session["pre_right_Buccal_Sum_Value"]);

                }
                if (Session["pre_left_Buccal_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["pre_left_Buccal_Sum_Value"]);


                if (Session["pre_overjet_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["pre_overjet_Sum_Value"]);
                if (Session["pre_Overbite_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["pre_Overbite_Sum_Value"]);


                if (Session["pre_midline_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["pre_midline_Value"]);


                label_home_option.Text = "Total Score :" + total;
                Session["Pretreatment_value"] = total;


            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {

                if (Session["post_lower_crowding_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["post_lower_crowding_Sum_Value"]);
                if (Session["post_uper_crowding_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["post_uper_crowding_Sum_Value"]);

                if (Session["post_right_Buccal_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["post_right_Buccal_Sum_Value"]);
                if (Session["post_left_Buccal_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["post_left_Buccal_Sum_Value"]);

                if (Session["post_overjet_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["post_overjet_Sum_Value"]);
                if (Session["post_Overbite_Sum_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["post_Overbite_Sum_Value"]);


                if (Session["post_midline_Value"].ToString().Length > 0)
                    total = total + Convert.ToInt32(Session["post_midline_Value"]);

                label_home_option.Text = "Total Score :" + total;
                Session["Posttreatment_value"] = total;
            }
        }
    }
}
