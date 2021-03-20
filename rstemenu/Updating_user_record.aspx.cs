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

        protected void update_record_Click(object sender, EventArgs e)
        {
            
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

            Response.Write(u.IsApproved);
            
                obj.Updating_record(Convert.ToInt32(Request.QueryString["id"]), user_First_name.Text, user_Last_name.Text, user_country.Text, username.Text, user_City.Text, username.Text, user_Password.Text, contact_no.Text);


            bool result = u.ChangePassword(u.ResetPassword(), user_Password.Text.Trim());
            Membership.UpdateUser(u);

            if (Convert.ToString(Session["old_password"]) != user_Password.Text.Trim())
            {
                send_email(user_Password.Text,user_First_name.Text, user_Email.Text);
            }

            Response.Redirect("~/all_users.aspx");
        }

        private void send_email(string password,string name,string email)
        {
             
            try
            {
                string Header = "<br><p><img src=" + "'http://orthopar.org/images/parslogo.png'/>" + "</p><p><hr></p><p style=" + "'text-align:right'" + "><a href='" + "http://orthopar.org'" + " target='" + "_blank'" + ">http://orthopar.org</a><br><br>";
                
                string bodycontent = Header + "<h2>PAR Password Change </h2><br><b>Dear " + name + "</b> <br><br> Your new Password is  '" + password + "'<br><br><b>ORTHO PAR</b>";
                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(email));
                message.From = new MailAddress("info@orthopar.org");
                message.Subject = "Par Result Report";
                message.Body = bodycontent;
                message.IsBodyHtml = true;
                //SmtpClient smtp = new SmtpClient("smtpout.secureserver.net", 25);
                //SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
                SmtpClient smtp = new SmtpClient("smtpout.asia.secureserver.net", 80);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = false;
                NetworkCredential nc = new NetworkCredential("info@orthopar.org", "Ayesha-22");
                smtp.Credentials = nc;
                smtp.Send(message);
                message.To.Clear();
               // Page.Response.Redirect(Page.Request.Url.ToString(), true);     
            }
            catch (Exception ex)
            {
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                        Session["old_password"] = row["userpassword"].ToString();
                        uphonenumber = row["phone_number"].ToString();

                    }

                    MembershipUser u = Membership.GetUser(uusername);
                   if(u.IsApproved == true)
                    {
                        ch_activating_user.Checked = true;
                    }
                   else
                    {
                        ch_activating_user.Checked = false;
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

                   
                    

                }
            }
        }


    }
}