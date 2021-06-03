using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class overJet_main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Checking_Type();
        }

        protected void positive_overjet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Positive_overjet.aspx");
        }

        protected void negative_overjet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Negative_overjet.aspx");
        }

        protected void both_overjet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Both_negative_positive_overjet.aspx");
        }

        public void Checking_Type()
        {

            if (Convert.ToString(Session["Preorposttreatment"]) == "Pretreatment")
            {

                if (Convert.ToString(Session["pre_Overjet_type"]) == "Positive")
                    positive_overjet.Text = "Only Positive overjet is Present (" + Session["pre_overjet_Sum_Value"].ToString() + ")";
                else if (Convert.ToString(Session["pre_Overjet_type"]) == "Negative")
                    negative_overjet.Text = "Only Negative overjet is Present (" + Session["pre_overjet_Sum_Value"].ToString() + ")";
                else if (Convert.ToString(Session["pre_Overjet_type"]) == "Both")
                    both_overjet.Text = "Both +ve & -ve overjet are Present (" + Session["pre_overjet_Sum_Value"].ToString() + ")";
            }

            else if (Convert.ToString(Session["Preorposttreatment"]) == "Posttreatment")
            {
                if (Convert.ToString(Session["post_Overjet_type"]) == "Positive")
                    positive_overjet.Text = "Only Positive overjet is Present (" + Session["post_overjet_Sum_Value"].ToString() + ")";
                else if (Convert.ToString(Session["post_Overjet_type"]) == "Negative")
                    negative_overjet.Text = "Only Negative overjet is Present (" + Session["post_overjet_Sum_Value"].ToString() + ")";
                else if (Convert.ToString(Session["post_Overjet_type"]) == "Both")
                    both_overjet.Text = "Both +ve & -ve overjet are Present (" + Session["post_overjet_Sum_Value"].ToString() + ")";
            }
        }


    }
}