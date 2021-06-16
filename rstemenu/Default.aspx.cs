using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nexmo.Api.ClientMethods;
using Nexmo.Api.Helpers;
using Nexmo.Api.Logging;
using Nexmo.Api.Request;
using System.Net;


namespace rstemenu
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["btn_anterior_crowding_uper"] = "0";
            Session["btn_anterior_crowding"] = "0";
            Session["btn_buccalocclusion"] = "0";
            Session["btn_left_buccalocclusion"] = "0";
            Session["overbite"] = "0";
            Session["overjet"] = "0";
            Session["midline"] = "0";
            Session["a_value"] = "0";
            Session["b_value"] = "0";
            Session["c_value"] = "0";
            Session["d_value"] = "0";
            Session["e_value"] = "0";
            Session["f_value"] = "0";
            Session["i_value"] = "0";
            Session["L_value"] = "0";
            Session["n_value"] = "0";
        }

        protected void new_treatment_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Patient_info.aspx");
        }
        protected void old_patient_record_Click(object sender, EventArgs e)
        {
             Response.Redirect("~/all_patients_record.aspx");
        }
        protected void RegisteredDoctors_record_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/all_users.aspx");
        }
        protected void doc_muhammad_btn_Click(object sender, EventArgs e)
        {
            
                 Response.Redirect("~/Doctor_muhammad_bio.aspx");
        }
        protected void doc_haris_khan_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Doctor_Haris_bio.aspx");
        }
        protected void MoveToPromotion(object sender, EventArgs e)
        {
            Response.Redirect("~/PromoImages.aspx");

        }
    }
}