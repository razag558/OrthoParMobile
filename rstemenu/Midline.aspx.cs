using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Midline : System.Web.UI.Page
    {
        int step1 = 6;
        protected void Page_Load(object sender, EventArgs e)
        {
            Populating_Data();
        }
        protected void submit_lower_right_Click(object sender, EventArgs e)
        {
            Calculator();
        }

        public void Populating_Data()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                if (Session["pre_Midline"].ToString() == "0")
                    midline_s0.Checked = true;
                else if (Session["pre_Midline"].ToString() == "1")
                    midline_s1.Checked = true;
                else if (Session["pre_Midline"].ToString() == "2")
                    midline_s2.Checked = true;

            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                if (Session["post_Midline"].ToString() == "0")
                    midline_s0.Checked = true;
                else if (Session["post_Midline"].ToString() == "1")
                    midline_s1.Checked = true;
                else if (Session["post_Midline"].ToString() == "2")
                    midline_s2.Checked = true;
            }

        }

        public void Calculator()
        {
            if (midline_s0.Checked)
                step1 = 0;
            else if (midline_s1.Checked)
                step1 = 1;
            else if (midline_s2.Checked)
                step1 = 2;

            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                Session["pre_Midline"] = step1;
                Session["pre_midline_Value"] = step1 * 4;
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                Session["post_Midline"] = step1;
                Session["post_midline_Value"] = step1 * 4;
            }
            if (step1 != 6)
            {
                Session["n_value"] = step1 * 4;
                Session["midline"] = "1";
                Response.Redirect("alloptions.aspx");
            }
            else
                showing_error.Visible = true;
        }

    }
}