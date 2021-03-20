using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class getPassword : System.Web.UI.Page
    {

        Methods obj = new Methods();
        string st_email;
        string password = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_submit_Click(object sender, EventArgs e)
        {
           
            st_email = txt_Email.Text.Trim();

            password = obj.getting_userpassword(st_email);

            if(password.Length > 0 )
            {
                sendpassword(st_email,password);
                label_response.Text = "Password has sent to your Email";


            }
            else
            {
                label_response.Text = "Email not found in System";
            }


        }

        public void sendpassword(string email,string password)
        {
            try
            {
                string Header = "<br><p><img src=" + "'http://orthopar.org/images/parslogo.png'/>" + "</p><p><hr></p><p style=" + "'text-align:right'" + "><a href='" + "http://orthopar.org'" + " target='" + "_blank'" + ">http://orthopar.org</a><br><br>";


                


                //patient_id = Convert.ToString(Session["patient_id"]);
                // pat_name = Convert.ToString(Session["patient_name"]);

                //string bodycontent = "<h2>PAR COMPLETE RESULT</h2><br><b>Dear PatientName" + pat_name + "</b> <br><br> Here your Accessment<br><p>Patient Name: PatientName" + pat_name+"</p><p>Patient ID: 54689"+ patient_id + "</p><p> 1.Pretreatment Value of PAR (P1) : " + pre_value + "</p><p> 2.Posttreatment Value of PAR (P2): " + post_value + "</p><p>3. PAR Point-base treatment change (P1 - P2): " + result_value + " points </p><p>( Point based treatment changes: P1-P2. Change is less than 22 point indicates no improvement)</p><p>4. PAR Percentage-based Treatment Change {(P2-P1/P1) * 100} : " + percentage;
                string bodycontent = Header + "<h2>PAR Forget Password</h2><br><b>Dear User <br> Your Password is : '" + password + "'";

                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(email));
                message.From = new MailAddress("info@orthopar.org");

                message.Subject = "Ortho PAR Forget Password";

                message.Body = bodycontent;
                message.IsBodyHtml = true;

                //  SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
                SmtpClient smtp = new SmtpClient("smtpout.asia.secureserver.net", 80);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                smtp.EnableSsl = false;

                NetworkCredential nc = new NetworkCredential("info@orthopar.org", "Ayesha-22");
                smtp.Credentials = nc;
                smtp.Send(message);
                message.To.Clear();
              //  Page.Response.Redirect(Page.Request.Url.ToString(), true);

               
                //SmtpClient smtp = new SmtpClient();

                // smtp.Host = "smtp.gmail.com";
                /*client.UseDefaultCredentials = false;
                client.EnableSsl = false;
                message.IsBodyHtml = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(message);
                message.To.Clear();*/

                //We have sent your password on your email   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert..!", "alert('We have sent your password on your email')", true);
               
            }

            catch (Exception ex)
            {

                if (ex != null)
                {
                    label_response.Text = "Email not Send";
                }
                

            }
            


        }

         
    }
}