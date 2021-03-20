using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Doctor_Haris_bio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void backbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}