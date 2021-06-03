using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Crowding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                Button_text_with_Value();
                if (Convert.ToString(Session["btn_anterior_crowding_uper"]) == "1")
                    btn_uper.Enabled = false;
            }
        }

        protected void btn_uper_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Uper_Crowding_types.aspx");
        }

        protected void btn_lower_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LowerCrowding_Types.aspx");

        }

        protected void movingbackword_Click(object sender, EventArgs e)
        {
            Response.Redirect("alloptions.aspx");
        }
        protected void reset_button5_Click(object sender, EventArgs e)
        {
            Session["btn_anterior_crowding_uper"] = "0";
            btn_uper.Enabled = true;
            Session["a_value"] = "0";


        }

        public void Button_text_with_Value()
        {
            //Lower Button Text Setting
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                int result_value = 0;
                if (Session["pre_lower_anter_segment_UR2_UR3"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UR2_UR3"]);
                if (Session["pre_lower_anter_segment_UR1_UR2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UR1_UR2"]);
                if (Session["pre_lower_anter_segment_UL1_UR1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UL1_UR1"]);
                if (Session["pre_lower_anter_segment_UL2_UL1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UL2_UL1"]);
                if (Session["pre_lower_anter_segment_UL3_UL2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_lower_anter_segment_UL3_UL2"]);

                Session["pre_lower_crowding_Sum_Value"] = Convert.ToString("" + result_value);
                btn_lower.Text = "Lower Anterior segment (" + Convert.ToInt32(Session["pre_lower_crowding_Sum_Value"]) + ")";
            }

            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                int result_value = 0;
                if (Session["post_lower_anter_segment_UR2_UR3"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_lower_anter_segment_UR2_UR3"]);
                if (Session["post_lower_anter_segment_UR1_UR2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_lower_anter_segment_UR1_UR2"]);
                if (Session["post_lower_anter_segment_UL1_UR1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL1_UR1"]);
                if (Session["post_lower_anter_segment_UL2_UL1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL2_UL1"]);
                if (Session["post_lower_anter_segment_UL3_UL2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_lower_anter_segment_UL3_UL2"]);

                Session["post_lower_crowding_Sum_Value"] = result_value.ToString();
                btn_lower.Text = "Lower Anterior segment (" + result_value + ")";
            }
            // Uper Button Text Setting
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                int result_value = 0;
                if (Session["pre_uper_anter_segment_UR2_UR3"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UR2_UR3"]);
                if (Session["pre_uper_anter_segment_UR1_UR2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UR1_UR2"]);
                if (Session["pre_uper_anter_segment_UL1_UR1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UL1_UR1"]);
                if (Session["pre_uper_anter_segment_UL2_UL1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UL2_UL1"]);
                if (Session["pre_uper_anter_segment_UL3_UL2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["pre_uper_anter_segment_UL3_UL2"]);

                Session["pre_uper_crowding_Sum_Value"] = Convert.ToString("" + result_value);
                btn_uper.Text = "Upper Anterior segment (" + Convert.ToInt32(Session["pre_uper_crowding_Sum_Value"]) + ")";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                int result_value = 0;
                if (Session["post_uper_anter_segment_UR2_UR3"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_uper_anter_segment_UR2_UR3"]);
                if (Session["post_uper_anter_segment_UR1_UR2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_uper_anter_segment_UR1_UR2"]);
                if (Session["post_uper_anter_segment_UL1_UR1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL1_UR1"]);
                if (Session["post_uper_anter_segment_UL2_UL1"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL2_UL1"]);
                if (Session["post_uper_anter_segment_UL3_UL2"].ToString().Length > 0)
                    result_value = result_value + Convert.ToInt32(Session["post_uper_anter_segment_UL3_UL2"]);

                Session["post_uper_crowding_Sum_Value"] = result_value.ToString();
                btn_uper.Text = "Upper Anterior segment (" + result_value + ")";
            }
        }
    }
}