using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Net;
using System.Configuration;
using System.Net.Mail;


namespace rstemenu.Account
{
    public partial class Login : System.Web.UI.Page
    {
        Methods obj = new Methods();
        protected void Page_Load(object sender, EventArgs e)
        {

            UserAuthentication();
           if( Request.QueryString["forget"] !=null )
            {
                Response.Write("<script>alert('We have sent your password on your email')</script>");
            }
           //nn RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }



        public string UserAuthentication()
        {
            
            if (Request.QueryString["un"] != null && Request.QueryString["p"]!=null)
            {
                string username = obj.userNameforAuthentication(Request.QueryString["un"].ToString(), Request.QueryString["p"].ToString());
         
            }

            return "";
        }

        

        protected void LoginUser_LoginError(object sender, EventArgs e)
        {
            // Determine why the user could not login...
            LoginUser.FailureText = "Your login attempt was not successful. Please try again.";

            // Does there exist a User account for this user?
            MembershipUser usrInfo = Membership.GetUser(LoginUser.UserName);
            if (usrInfo != null)
            {
                // Is this user locked out?
                if (usrInfo.IsLockedOut)
                {
                    LoginUser.FailureText = "Your account has been locked out because of too many invalid login attempts. Please contact the administrator to have your account unlocked.";
                }
                else if (!usrInfo.IsApproved)
                {
                    LoginUser.FailureText = "Your account has not yet been approved. You cannot login until an administrator has approved your account.";
                }
                else
                    LoginUser.FailureText = "No Permission";
                
            }
        }

     


 public void btn_forget_password_click(object sender, EventArgs e)
        {
            Response.Write("THis is forget password");
        }




    }
}
