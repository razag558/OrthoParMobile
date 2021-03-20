using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using System.Net.Mail;
using System.Net;

namespace rstemenu
{
    public partial class Register : System.Web.UI.Page
    {
        Methods obj = new Methods();
        DataTable dt_username, dt_email;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void register(object sender, EventArgs e)
        {

            if(Password.Text.Length > 6)
            { 
         dt_email =   obj.CheckNewUserEmail(Email.Text);
            
            if(dt_email.Rows.Count>0)
            {
                LabelUserErroremail.Text = "This Email is Already Used";
            }
            else
            {
                LabelUserErroremail.Text = " ";
                dt_username =  obj.GetUserValidUser(username.Text);
                if(dt_username.Rows.Count >0)
                {
               LabelUserErrorusername.Text = "This username is already in used";
                }
                else
                {
                    LabelUserErrorusername.Text = "";
                    MembershipUser us = Membership.CreateUser(username.Text, Password.Text, Email.Text);
                    Roles.AddUserToRole(username.Text, "Users");

                    MembershipUser u = Membership.GetUser(username.Text);

                    if (ch_active_user.Checked)
                    {
                        u.IsApproved = true;
                        Membership.UpdateUser(u);
                    }
                    else
                    {
                        u.IsApproved = false;
                        Membership.UpdateUser(u);
                    }
                    string fname = First_name.Text;
                    string lastname = Last_name.Text;
                    string country_name = country.Text;
                    string user_name = username.Text;
                    string city = City.Text;
                    string email = username.Text;
                        string password = Password.Text;
                    string phonenumber = contact_no.Text;
                        if (password.Length > 6)
                        {
                            obj.Registeruser(fname, lastname, country_name, user_name, city, email, password, phonenumber);
                            send_email_Click(email, fname, lastname, user_name, password);
 
                                Response.Redirect("Login.aspx");
                            
                        }
                        else
                        {
                            Password.Focus();
                        }

                    }

                }
                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert..!", "alert('Password Length must be greater than 6')", true);

            }




        }

        public  void send_email_Click(string emailto,string first,string last,string username,string password)
        {
            
        
            try
            {
                string Header = "<br><p><img src=" + "'http://orthopar.org/images/parslogo.png'/>" + "</p><p><hr></p><p style=" + "'text-align:right'" + "><a href='" + "http://orthopar.org'" + " target='" + "_blank'" + ">http://orthopar.org</a><br><br>";
                

                string PatientOtherDetail = "";
                PatientOtherDetail = "<p> Your have Registerd to the Orthopar <br/> Now you can Use THe services of the This application    </p>";



                //patient_id = Convert.ToString(Session["patient_id"]);
                // pat_name = Convert.ToString(Session["patient_name"]);

                //string bodycontent = "<h2>PAR COMPLETE RESULT</h2><br><b>Dear PatientName" + pat_name + "</b> <br><br> Here your Accessment<br><p>Patient Name: PatientName" + pat_name+"</p><p>Patient ID: 54689"+ patient_id + "</p><p> 1.Pretreatment Value of PAR (P1) : " + pre_value + "</p><p> 2.Posttreatment Value of PAR (P2): " + post_value + "</p><p>3. PAR Point-base treatment change (P1 - P2): " + result_value + " points </p><p>( Point based treatment changes: P1-P2. Change is less than 22 point indicates no improvement)</p><p>4. PAR Percentage-based Treatment Change {(P2-P1/P1) * 100} : " + percentage;
                string bodycontent = Header + "<h2>PAR Registeration</h2><br><b>Dear " + first + "" + last + "<br>" + PatientOtherDetail + "<br>" + "Your User name is '"+ username + "'<br> and Your password is '"+password+"'";

                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(emailto));
                message.From = new MailAddress("info@orthopar.org");

                message.Subject = "Ortho PAR Registeration";

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
             //   Page.Response.Redirect(Page.Request.Url.ToString(), true);
                //SmtpClient smtp = new SmtpClient();

                // smtp.Host = "smtp.gmail.com";
                /*client.UseDefaultCredentials = false;
                client.EnableSsl = false;
                message.IsBodyHtml = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(message);
                message.To.Clear();*/



            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());

            }



        }
    }
}