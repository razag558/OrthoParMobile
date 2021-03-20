using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class BuccalOcclussion1 : System.Web.UI.Page
    {
        string dvaluee;
        protected void Page_Load(object sender, EventArgs e)
        {
            dvaluee = Request.QueryString["dvalue"];
            if (Convert.ToString(Session["btn_left_buccalocclusion"]) == "1")
            {
                btn_uper_occlusion.Enabled = false;
                btn_uper_occlusion.Text = "Right buccal occlusion (" + Convert.ToInt32(Session["pre_right_Buccal_Sum_Value"]) + ")";
            }
            Checking_Type();
        }

        protected void btn_lower_occlusion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LeftBuccalOcclusion.aspx");
        }

        protected void btn_uper_occlusion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RightBuccalOcclusion.aspx");
        }

        protected void reset_button5_Click(object sender, EventArgs e)
        {
            Session["btn_left_buccalocclusion"] = "0";
            Session["d_value"] = "0";
            Response.Redirect("~/BuccalOcclussion.aspx");

        }

        public void Checking_Type()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                btn_uper_occlusion.Text = "Right buccal occlusion (" + Session["pre_right_Buccal_Sum_Value"].ToString() + ")";
                btn_lower_occlusion.Text = "Left buccal occlusion (" + Session["pre_left_Buccal_Sum_Value"].ToString() + ")";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                btn_uper_occlusion.Text = "Right buccal occlusion (" + Session["post_right_Buccal_Sum_Value"].ToString() + ")";
                btn_lower_occlusion.Text = "Left buccal occlusion (" + Session["post_left_Buccal_Sum_Value"].ToString() + ")";
            }
        }
    }
}