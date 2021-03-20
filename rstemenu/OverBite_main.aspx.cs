using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class OverBite_main : System.Web.UI.Page
    {
      

        protected void positive_overjet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Positive_overbite.aspx");
        }

        protected void negative_overjet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Negative_overbite.aspx");
        }

        protected void both_overjet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Both_negative_positive_overbit.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
    }
}