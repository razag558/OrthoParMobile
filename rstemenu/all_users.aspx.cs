using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class all_users : System.Web.UI.Page
    {
        Methods obj = new Methods();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.IsInRole("Admin"))
                   Response.Redirect("Default.aspx");

            if (!Page.IsPostBack)
            {
                GetWareHouse();
            }
        }
        public void GetWareHouse()
        {
            gv_all_user.DataSource = obj.Fetching_all_data();
            gv_all_user.DataBind();
        }
        protected void datatable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            GetWareHouse();
        }

        protected void datatable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (((LinkButton)e.CommandSource).CommandName)
                {

                    case "Delete":

                        string[] arg = new string[2];
                        arg = e.CommandArgument.ToString().Split(';');

                        obj.deleteUserByID(arg[0]);
                        Membership.DeleteUser(arg[1]);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('User Deleted Successfully');", true);
                        break;

                }
            }
            catch (Exception ex)
            {
                Response.Write("" + ex);
            }
        }

        protected void datatable_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton l = (LinkButton)e.Row.FindControl("btn_Delete");
                if (l != null && l.CommandName == "Delete")
                    l.OnClientClick = "return confirm('Are you sure want to delete this record?');";
            }
        }

        protected void datatable_PreRender(object sender, EventArgs e)
        {
            if (gv_all_user.Rows.Count > 0)
            {
                gv_all_user.UseAccessibleHeader = true;
                gv_all_user.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


    }
}