using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class LowerCrowding_Types : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Checking_Type();
        }

        protected void btn_uper_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LowerCrowding.aspx");
        }

        protected void btn_lower_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Lower_Crowding_Mixed.aspx");
        }
        public void Checking_Type()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                if (Convert.ToString(Session["pre_lower_anter_segment_type_definer"]) == "Mixed")
                    btn_lower.Text = "Mixed Dentition (" + Session["pre_lower_crowding_Sum_Value"].ToString() + ")";
                else if (Convert.ToString(Session["pre_lower_anter_segment_type_definer"]) == "Permanent")
                    btn_uper.Text = "Permanent Dentition (" + Session["pre_lower_crowding_Sum_Value"].ToString() + ")";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                if (Convert.ToString(Session["post_lower_anter_segment_type_definer"]) == "Mixed")
                    btn_lower.Text = "Mixed Dentition (" + Session["post_lower_crowding_Sum_Value"].ToString() + ")";
                else if (Convert.ToString(Session["post_lower_anter_segment_type_definer"]) == "Permanent")
                    btn_uper.Text = "Permanent Dentition (" + Session["post_lower_crowding_Sum_Value"].ToString() + ")";
            }
        }
    }
}