using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class LeftBuccalOcclusion : System.Web.UI.Page
    {
        int step1 = 6;
        int step2 = 6;
        int step3 = 6;
        int leftbuccalvalue;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                populating_data();
        }

        protected void backback12_Click(object sender, EventArgs e)
        {
            Response.Redirect("buccalocclusion");
        }


        protected void submit_buccal_right_Click(object sender, EventArgs e)
        {
            Calculation();
        }

        public void Calculation()
        {
            ////////////////////////////////////////// step 1
            if (buccal_left_1_s0.Checked)
                step1 = 0;
            else if (buccal_left_1_s1.Checked)
                step1 = 1;
            else if (buccal_left_1_s2.Checked)
                step1 = 2;

            //  step 2 in process
            if (buccal_left_2_s0.Checked)
                step2 = 0;
            else if (buccal_left_2_s1.Checked)
                step2 = 1;

            // step 3 in process

            if (buccal_left_3_s0.Checked)
                step3 = 0;
            else if (buccal_left_3_s1.Checked)
                step3 = 1;
            else if (buccal_left_3_s2.Checked)
                step3 = 2;
            else if (buccal_left_3_s3.Checked)
                step3 = 3;
            else if (buccal_left_3_s4.Checked)
                step3 = 4;

            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                Session["pre_left_buccol_Occlusion_anterior"] = step1;
                Session["pre_left_buccol_Occlusion_vertical"] = step2;
                Session["pre_left_buccol_Occlusion_transverse"] = step3;
                leftbuccalvalue = step1 + step2 + step3;

                Session["pre_left_Buccal_Sum_Value"] = leftbuccalvalue;
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                Session["post_left_buccol_Occlusion_anterior"] = step1;
                Session["post_left_buccol_Occlusion_vertical"] = step2;
                Session["post_left_buccol_Occlusion_transverse"] = step3;
                leftbuccalvalue = step1 + step2 + step3;

                Session["post_left_Buccal_Sum_Value"] = leftbuccalvalue;
            }

            leftbuccalvalue = step1 + step2 + step3;
            if (step1 != 6 && step2 != 6 && step3 != 6)
            {
                Session["btn_buccalocclusion"] = "1";
                if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
                {
                    Session["pre_left_Buccal_Sum_Value"] = Convert.ToInt32(Session["pre_left_buccol_Occlusion_anterior"]) +
                      Convert.ToInt32(Session["pre_left_buccol_Occlusion_vertical"]) + Convert.ToInt32(Session["pre_left_buccol_Occlusion_transverse"]);
                }
                else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
                {
                    Session["post_left_Buccal_Sum_Value"] = Convert.ToInt32(Session["post_left_buccol_Occlusion_anterior"]) +
                  Convert.ToInt32(Session["post_left_buccol_Occlusion_vertical"]) + Convert.ToInt32(Session["post_left_buccol_Occlusion_transverse"]);

                }

                Response.Redirect("alloptions.aspx");
            }
            else
                showing_error.Visible = true;
        }
        public void populating_data()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                //step1
                if (Session["pre_left_buccol_Occlusion_anterior"].ToString() == "0")
                    buccal_left_1_s0.Checked = true;
                else if (Session["pre_left_buccol_Occlusion_anterior"].ToString() == "1")
                    buccal_left_1_s1.Checked = true;
                else if (Session["pre_left_buccol_Occlusion_anterior"].ToString() == "2")
                    buccal_left_1_s2.Checked = true;

                //step2
                if (Session["pre_left_buccol_Occlusion_vertical"].ToString() == "0")
                    buccal_left_2_s0.Checked = true;
                else if (Session["pre_left_buccol_Occlusion_vertical"].ToString() == "1")
                    buccal_left_2_s1.Checked = true;

                //step3
                if (Session["pre_left_buccol_Occlusion_transverse"].ToString() == "0")
                    buccal_left_3_s0.Checked = true;
                else if (Session["pre_left_buccol_Occlusion_transverse"].ToString() == "1")
                    buccal_left_3_s1.Checked = true;
                else if (Session["pre_left_buccol_Occlusion_transverse"].ToString() == "2")
                    buccal_left_3_s2.Checked = true;
                else if (Session["pre_left_buccol_Occlusion_transverse"].ToString() == "3")
                    buccal_left_3_s3.Checked = true;
                else if (Session["pre_left_buccol_Occlusion_transverse"].ToString() == "4")
                    buccal_left_3_s4.Checked = true;


            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                //step1
                if (Session["post_left_buccol_Occlusion_anterior"].ToString() == "0")
                    buccal_left_1_s0.Checked = true;
                else if (Session["post_left_buccol_Occlusion_anterior"].ToString() == "1")
                    buccal_left_1_s1.Checked = true;
                else if (Session["post_left_buccol_Occlusion_anterior"].ToString() == "2")
                    buccal_left_1_s2.Checked = true;

                //step2
                if (Session["post_left_buccol_Occlusion_vertical"].ToString() == "0")
                    buccal_left_2_s0.Checked = true;
                else if (Session["post_left_buccol_Occlusion_vertical"].ToString() == "1")
                    buccal_left_2_s1.Checked = true;

                //step3
                if (Session["post_left_buccol_Occlusion_transverse"].ToString() == "0")
                    buccal_left_3_s0.Checked = true;
                else if (Session["post_left_buccol_Occlusion_transverse"].ToString() == "1")
                    buccal_left_3_s1.Checked = true;
                else if (Session["post_left_buccol_Occlusion_transverse"].ToString() == "2")
                    buccal_left_3_s2.Checked = true;
                else if (Session["post_left_buccol_Occlusion_transverse"].ToString() == "3")
                    buccal_left_3_s3.Checked = true;
                else if (Session["post_left_buccol_Occlusion_transverse"].ToString() == "4")
                    buccal_left_3_s4.Checked = true;
            }
        }
    }
}