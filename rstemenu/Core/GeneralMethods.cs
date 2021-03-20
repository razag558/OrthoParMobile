using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace rstemenu.Core
{
    public class GeneralMethods
    {

   

    
    public static string CheckCompanyName(string args)
    {
	 
                string returnValue = string.Empty;

                string conString = ConfigurationManager.ConnectionStrings["rstmenuconnectionstring"].ConnectionString;
	 
                SqlConnection sqlConn = new SqlConnection(conString);
	 
                try
                {

                SqlCommand sqlCmd = new SqlCommand("SA_CheckCompName", sqlConn);
	 
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@CompName", args.Trim());
	 
                sqlConn.Open();
	 
                int success = int.Parse((sqlCmd.ExecuteScalar().ToString()));
	 
                if(success == 1) // User Name Not Available
                {
                //returnValue = "<img src='Images/n.png'><font color='#cc0000'><b>'" + args + "'</b> is already in use.</font></img>";
                returnValue = "No";
	   
                }
                else if(success == 0)//User_Name is available
                {
                returnValue = "Yes";
                }
	 
                }
                catch
                {
                //Handle Error
                }
                finally
                {
                sqlConn.Close();
                }
	   
                return returnValue;
        }


    public static string CheckCompanyEmail(string args)
    {

        string returnValue = string.Empty;

        string conString = ConfigurationManager.ConnectionStrings["rstmenuconnectionstring"].ConnectionString;

        SqlConnection sqlConn = new SqlConnection(conString);

        try
        {

            SqlCommand sqlCmd = new SqlCommand("SA_CheckCompEmail", sqlConn);

            sqlCmd.CommandType = CommandType.StoredProcedure;

            sqlCmd.Parameters.AddWithValue("@CompEmail", args.Trim());

            sqlConn.Open();

            int success = int.Parse((sqlCmd.ExecuteScalar().ToString()));

            if (success == 1) // User Name Not Available
            {
                //returnValue = "<img src='Images/n.png'><font color='#cc0000'><b>'" + args + "'</b> is already in use.</font></img>";
                returnValue = "No";

            }
            else if (success == 0)//User_Name is available
            {
                returnValue = "Yes";
            }

        }
        catch
        {
            //Handle Error
        }
        finally
        {
            sqlConn.Close();
        }

        return returnValue;
    }



    public static string CheckNewUserEmailValidity(string args)
    {

        string returnValue = string.Empty;

        string conString = ConfigurationManager.ConnectionStrings["rstmenuconnectionstring"].ConnectionString;

        SqlConnection sqlConn = new SqlConnection(conString);

        try
        {

            SqlCommand sqlCmd = new SqlCommand("SA_CheckNewUserEmailVaidity", sqlConn);

            sqlCmd.CommandType = CommandType.StoredProcedure;

            sqlCmd.Parameters.AddWithValue("@Email", args.Trim());

            sqlConn.Open();

            int success = int.Parse((sqlCmd.ExecuteScalar().ToString()));

            if (success == 1) // User Name Not Available
            {
                //returnValue = "<img src='Images/n.png'><font color='#cc0000'><b>'" + args + "'</b> is already in use.</font></img>";
                returnValue = "No";

            }
            else if (success == 0)//User_Name is available
            {
                returnValue = "Yes";
            }

        }
        catch
        {
            //Handle Error
        }
        finally
        {
            sqlConn.Close();
        }

        return returnValue;
    }
    


    
    
    
    
    }
}