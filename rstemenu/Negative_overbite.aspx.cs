using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Negative_overbite : System.Web.UI.Page
    {
        int step2 = 6;
        int L_value;
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
            if (overbite_negative_s0.Checked)
            {
                step2 = 0;
            }
            else if (overbite_negative_s1.Checked)
            {
                step2 = 1;
            }
            else if (overbite_negative_s2.Checked)
            {
                step2 = 2;
            }
            else if (overbite_negative_s3.Checked)
            {
                step2 = 3;
            }
            else if (overbite_negative_s4.Checked)
            {
                step2 = 4;
            }

            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {
                Session["pre_Negative_overbite"] = step2;
                Session["pre_Overbite_Sum_Value"] = step2 * 2;
                Session["pre_Positive_overbite"] = "";
                Session["pre_Overbite_type"] = "Negative";
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                Session["post_Negative_overbite"] = step2;
                Session["post_Overbite_Sum_Value"] = step2 * 2;
                Session["post_Positive_overbite"] = "";
                Session["post_Overbite_type"] = "Negative";
            }

            if (step2 != 6)
            {
                L_value = step2;
                Session["L_value"] = L_value * 2;
                Session["overbite"] = "1";

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
              Convert.ToString(Session["pre_Overbite_type"]) == "Negative")
            {
                if (Session["pre_Negative_overbite"].ToString() == "0")
                {
                    overbite_negative_s0.Checked = true;
                }
                else if (Session["pre_Negative_overbite"].ToString() == "1")
                {
                    overbite_negative_s1.Checked = true;
                }
                else if (Session["pre_Negative_overbite"].ToString() == "2")
                {
                    overbite_negative_s2.Checked = true;
                }
                else if (Session["pre_Negative_overbite"].ToString() == "3")
                {
                    overbite_negative_s3.Checked = true;
                }
                else if (Session["pre_Negative_overbite"].ToString() == "4")
                {
                    overbite_negative_s4.Checked = true;
                }
            }
            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment" &&
              Convert.ToString(Session["post_Overbite_type"]) == "Negative")
            {
                if (Session["post_Negative_overbite"].ToString() == "0")
                {
                    overbite_negative_s0.Checked = true;
                }
                else if (Session["post_Negative_overbite"].ToString() == "1")
                {
                    overbite_negative_s1.Checked = true;
                }
                else if (Session["post_Negative_overbite"].ToString() == "2")
                {
                    overbite_negative_s2.Checked = true;
                }
                else if (Session["post_Negative_overbite"].ToString() == "3")
                {
                    overbite_negative_s3.Checked = true;
                }
                else if (Session["post_Negative_overbite"].ToString() == "4")
                {
                    overbite_negative_s4.Checked = true;
                }
            }

        }
    }
}