using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Positive_overjet : System.Web.UI.Page
    {
        int step1 = 6;
        int i_value;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Populating_Data();
        }

        protected void submit_lower_right_Click(object sender, EventArgs e)
        {
            Calculation();
        }

        public void Calculation()
        {
            if (overjet_positive_s0.Checked)
                step1 = 0;
            else if (overjet_positive_s1.Checked)
                step1 = 1;
            else if (overjet_positive_s2.Checked)
                step1 = 2;
            else if (overjet_positive_s3.Checked)
                step1 = 3;
            else if (overjet_positive_s4.Checked)
                step1 = 4;
            i_value = step1 * 6;
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                Session["pre_Postive_overjet"] = step1;
                Session["pre_overjet_Sum_Value"] = step1 * 6;
                Session["pre_Negative_overjet"] = "";
                Session["pre_Overjet_type"] = "Positive";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                Session["post_Postive_overjet"] = step1;
                Session["post_overjet_Sum_Value"] = step1 * 6;
                Session["post_Negative_overjet"] = "";
                Session["post_Overjet_type"] = "Positive";
            }
            if (step1 != 6)
            {
                Session["overjet"] = "1";
                Response.Redirect("alloptions.aspx");
            }
            else
            {
                showing_error.Visible = true;
            }
        }

        public void Populating_Data()
        {
            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment" &&
              Convert.ToString(Session["pre_Overjet_type"]) == "Positive")
            {
                if (Session["pre_Postive_overjet"].ToString() == "0")
                    overjet_positive_s0.Checked = true;
                else if (Session["pre_Postive_overjet"].ToString() == "1")
                    overjet_positive_s1.Checked = true;
                else if (Session["pre_Postive_overjet"].ToString() == "2")
                    overjet_positive_s2.Checked = true;
                else if (Session["pre_Postive_overjet"].ToString() == "3")
                    overjet_positive_s3.Checked = true;
            }
            else
            if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment" &&
              Convert.ToString(Session["post_Overjet_type"]) == "Positive")
            {
                if (Session["post_Postive_overjet"].ToString() == "0")
                    overjet_positive_s0.Checked = true;
                else if (Session["post_Postive_overjet"].ToString() == "1")
                    overjet_positive_s1.Checked = true;
                else if (Session["post_Postive_overjet"].ToString() == "2")
                    overjet_positive_s2.Checked = true;
                else if (Session["post_Postive_overjet"].ToString() == "3")
                    overjet_positive_s3.Checked = true;

            }

        }
    }
}