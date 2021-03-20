using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class User_Complete_record : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username="";
            DataTable data;
            Methods obj = new Methods();
            if(Request.QueryString["username"] != null)
            {
                username = Request.QueryString["username"];
            }

            if(!Page.IsPostBack)
            {
            data = obj.FetchingDataofspecificUser(username);
                gv_user_complete_record.DataSource = data;
                gv_user_complete_record.DataBind();
            }

        }
    }
}