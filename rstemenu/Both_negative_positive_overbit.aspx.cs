using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Both_negative_positivee_overbit : System.Web.UI.Page
    {
        int step1 = 6;
        int step2 = 6;
        int L_value;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Populating_Data();
        }
        protected void submit_lower_right_Click(object sender, EventArgs e)
        {
            Calculator();
        }

        private void Calculator()
        {
            if (overbite_positive_s0.Checked)
            {
                step1 = 0;
            }
            else if (overbite_positive_s1.Checked)
            {
                step1 = 1;
            }
            else if (overbite_positive_s2.Checked)
            {
                step1 = 2;
            }
            else if (overbite_positive_s3.Checked)
            {
                step1 = 3;
            }

            //  step 2 in process

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
                Session["pre_Positive_overbite"] = step1;
                Session["pre_Overbite_Sum_Value"] = (Convert.ToInt32(step1) + Convert.ToInt32(step2)) * 2;

                Session["pre_Overbite_type"] = "Both";
            }

            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                Session["post_Positive_overbite"] = step1;
                Session["post_Negative_overbite"] = step2;
                Session["post_Overbite_Sum_Value"] = (Convert.ToInt32(step1) + Convert.ToInt32(step2)) * 2;

                Session["pre_Overbite_type"] = "Both";
            }

            if (step1 != 6 && step2 != 6)
            {

                Session["overbite"] = "1";
                //////////////////////////////////

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
              Convert.ToString(Session["pre_Overbite_type"]) == "Both")
            {
                //Positive
                if (Session["pre_positive_overbite"].ToString() == "0")
                {
                    overbite_positive_s0.Checked = true;
                }
                else if (Session["pre_positive_overbite"].ToString() == "1")
                {
                    overbite_positive_s1.Checked = true;
                }
                else if (Session["pre_positive_overbite"].ToString() == "2")
                {
                    overbite_positive_s2.Checked = true;
                }
                else if (Session["pre_positive_overbite"].ToString() == "3")
                {
                    overbite_positive_s3.Checked = true;
                }

                //Negative
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
              Convert.ToString(Session["post_Overbite_type"]) == "Both")
            {
                //Positive
                if (Session["post_positive_overbite"].ToString() == "0")
                {
                    overbite_positive_s0.Checked = true;
                }
                else if (Session["post_positive_overbite"].ToString() == "1")
                {
                    overbite_positive_s1.Checked = true;
                }
                else if (Session["post_positive_overbite"].ToString() == "2")
                {
                    overbite_positive_s2.Checked = true;
                }
                else if (Session["post_positive_overbite"].ToString() == "3")
                {
                    overbite_positive_s3.Checked = true;
                }
                //Negative
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