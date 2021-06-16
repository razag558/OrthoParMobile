using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Net.Mail;
using System.Net;

namespace rstemenu
{
    public partial class Updating_user_record: System.Web.UI.Page
    {
        Methods obj = new Methods();
        int id;
        
      
        string fname, sname, city, ucountry, uusername, uemail, uuserpassword, uphonenumber;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                FetchingDoctorData();
        }

        private void FetchingDoctorData()
        {
            if (Request.QueryString["id"] != null)
            {
                DataTable fetcheddata;
                id = Convert.ToInt32(Request.QueryString["id"]);
                fetcheddata = obj.Fetching_data_for_updating(id);
                foreach (DataRow row in fetcheddata.Rows)
                {
                    fname = row["first_name"].ToString();
                    sname = row["last_name"].ToString();
                    city = row["city"].ToString();
                    ucountry = row["country"].ToString();
                    uusername = row["username"].ToString();
                    uemail = row["email"].ToString();
                    uuserpassword = row["userpassword"].ToString();
                    uphonenumber = row["phone_number"].ToString();
                    Session["old_password"] = row["userpassword"].ToString();
                }
                user_id.Text = Convert.ToString(id);
                user_First_name.Text = fname;
                user_Last_name.Text = sname;
                user_City.Text = city;
                user_country.Text = ucountry;
                username.Text = uusername;
                user_Email.Text = uemail;
                user_Password.Text = uuserpassword;
                contact_no.Text = uphonenumber;
                MembershipUser u = Membership.GetUser(uusername);
                if (u.IsApproved == true)
                    ch_activating_user.Checked = true;
                else
                    ch_activating_user.Checked = false;

                string[] userroles = Roles.GetRolesForUser(uusername);

                for (int i = 0; i < userroles.Length; i++)
                {
                    if (userroles[i].ToString() == "Admin")
                    {
                        chk_MakeAdmin.Checked = true;
                        
                    }
                    if (userroles[i].ToString() == "Premium")
                    {
                        chk_premium.Checked = true;
                        
                    }

                }


            }
        }



        protected void update_record_Click(object sender, EventArgs e)
        {
            string[] UserRoles = Roles.GetRolesForUser(username.Text);
            if (UserRoles.Length > 0)
                Roles.RemoveUserFromRoles(username.Text, UserRoles);

            if (chk_MakeAdmin.Checked)
            {
                Roles.AddUserToRole(username.Text, "users");
                Roles.AddUserToRole(username.Text, "Admin");
            }
            else if (chk_MakeAdmin.Checked == false)
                Roles.AddUserToRole(username.Text, "users");

            if (chk_premium.Checked)
            {
                Roles.AddUserToRole(username.Text, "Premium");
            }
       

            MembershipUser u = Membership.GetUser(username.Text);
            if (ch_activating_user.Checked)
            {
                u.IsApproved = true;
                Membership.UpdateUser(u);
            }
            else
            {
                u.IsApproved = false;
                Membership.UpdateUser(u);
            }

            string[] UserRole = Roles.GetRolesForUser(username.Text);

            DataTable dt = obj.Fetching_data_for_updating(id);
            foreach (DataRow row in dt.Rows)
            {
                Session["old_password"] = row["userpassword"].ToString();
            }

            Membership.UpdateUser(u);
            if (Convert.ToString(Session["old_password"]).Trim() != user_Password.Text.Trim())
            {
                u.ChangePassword(u.ResetPassword(), user_Password.Text.Trim());
                send_email(user_Password.Text.Trim(), user_First_name.Text, user_Email.Text);

            }

            obj.Updating_record(Convert.ToInt32(Request.QueryString["id"]), user_First_name.Text, user_Last_name.Text, user_country.Text, username.Text, user_City.Text, username.Text, user_Password.Text, contact_no.Text);


            Response.Redirect("~/all_users.aspx");
        }

        private void send_email(string password, string name, string email)
        {

            try
            {
                string Header = "<br><p><img src=" + "'http://orthopar.org/images/parslogo.png'/>" + "</p><p><hr></p><p style=" + "'text-align:right'" + "><a href='" + "http://orthopar.org'" + " target='" + "_blank'" + ">http://orthopar.org</a><br><br>";
                string bodycontent = Header + "<h2>PAR Password Change </h2><br><b>Dear " + name + "</b> <br><br> Your new password is '" + password + "'<br><br><b>ORTHO PAR</b>";

                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(email));
                message.From = new MailAddress("info@orthopar.org");
                message.Subject = "Par Result Report";
                message.Body = bodycontent;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Credentials = new NetworkCredential("info@orthopar.org", "Ayesha-22");
                client.Host = "relay-hosting.secureserver.net";
                client.Send(message);
                message.To.Clear();

            }
            catch (Exception ex)
            {
            }
        }

    }
}