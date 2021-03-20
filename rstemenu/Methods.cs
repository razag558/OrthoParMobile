using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;
using WCharts;
using System.Globalization;
using System.Configuration;
using System.Text;
using System.Net.Mail;





namespace rstemenu
{

    public class Methods
    {

        public string connStr = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        public string atr = "@";

        public string userNameforAuthentication(string un, string pwd)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {

                if (un == "arsun" && pwd == "zio@$")
                    return connStr.ToString();
                else
                    return "";
            }
            catch (Exception ex)
            {
                return "Er";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Some error occured!!');", true);
            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }

            return connStr.ToString();
        }



        public void Registeruser(string first, string last, string country_name, string user_name, string city, string email, string password, string phone)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_patient_registeration", con);
                cmd.Parameters.Add(new SqlParameter("@firstname", first));
                cmd.Parameters.Add(new SqlParameter("@lastname", last));
                cmd.Parameters.Add(new SqlParameter("@country", country_name));
                cmd.Parameters.Add(new SqlParameter("@city", city));
                cmd.Parameters.Add(new SqlParameter("@email", email));
                cmd.Parameters.Add(new SqlParameter("@username", user_name));
                cmd.Parameters.Add(new SqlParameter("@userpassword", password));
                cmd.Parameters.Add(new SqlParameter("@phone_number", phone));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                

                da.Fill(dt);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
        }


        public void submitting_record(string preorposttreatment, float cvalue, float fvalue, float ivalue, float lvalue, float nvalue, string username, DateTime pars_datetime, string patient_id)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {

                cmd = new SqlCommand("SP_Patient_ParsRecord", con);
                cmd.Parameters.Add(new SqlParameter("@preorposttreatment", preorposttreatment));
                cmd.Parameters.Add(new SqlParameter("@cvalue", cvalue));
                cmd.Parameters.Add(new SqlParameter("@fvalue", fvalue));
                cmd.Parameters.Add(new SqlParameter("@ivalue", ivalue));
                cmd.Parameters.Add(new SqlParameter("@lvalue", lvalue));
                cmd.Parameters.Add(new SqlParameter("@nvalue", nvalue));
                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.Parameters.Add(new SqlParameter("@pars_datetime", pars_datetime));
                cmd.Parameters.Add(new SqlParameter("@patient_id", patient_id));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;

                da.Fill(dt);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }

        }



        public DataTable Fetching_all_data()
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_patient_record_fetching", con);
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;
        }




        public DataTable Fetching_data_for_updating(int id)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_patient_fetching_for_id", con);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;
        }


        public void Updating_record(int id, string first, string last, string country_name, string user_name, string city, string email, string password, string phone)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_Record_ofuser_Updating", con);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.Parameters.Add(new SqlParameter("@firstname", first));
                cmd.Parameters.Add(new SqlParameter("@lastname", last));
                cmd.Parameters.Add(new SqlParameter("@country", country_name));
                cmd.Parameters.Add(new SqlParameter("@city", city));
                cmd.Parameters.Add(new SqlParameter("@email", email));
                cmd.Parameters.Add(new SqlParameter("@username", user_name));
                cmd.Parameters.Add(new SqlParameter("@userpassword", password));
                cmd.Parameters.Add(new SqlParameter("@phone_number", phone));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }



        }

        public void deleteUserByID(string id)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_Record_ofuser_Deleting", con);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }


        }


        public DataTable CheckNewUserEmail(string emailaddress)
        {

            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_user_email_validation", con);
                cmd.Parameters.Add(new SqlParameter("@email", emailaddress));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;
        }



        public DataTable GetUserValidUser(string UserName)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_user_username_validation", con);
                cmd.Parameters.Add(new SqlParameter("@username", UserName));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;


        }




        public DataTable FetchingDataofspecificUser(string username)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_patient_Values_fetching", con);
                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;
        }



        public int submittion_of_Patient_info(string doc_name, string pat_id, string pat_name, string gender, string impact_teeth, string missing_teeth, string extracted, string replacement, string restorative, DateTime date, string username)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            int patientid = 0;
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_patient_info_submition", con);
                cmd.Parameters.Add(new SqlParameter("@doc_name", doc_name));
                cmd.Parameters.Add(new SqlParameter("@pat_id", pat_id));
                cmd.Parameters.Add(new SqlParameter("@pat_name", pat_name));
                cmd.Parameters.Add(new SqlParameter("@pat_gender", gender));
                cmd.Parameters.Add(new SqlParameter("@impact_teeth", impact_teeth));
                cmd.Parameters.Add(new SqlParameter("@missing_teeth", missing_teeth));
                cmd.Parameters.Add(new SqlParameter("@extracted", extracted));
                cmd.Parameters.Add(new SqlParameter("@replacement", replacement));
                cmd.Parameters.Add(new SqlParameter("@restorative", restorative));
                cmd.Parameters.Add(new SqlParameter("@entry_date", date));
                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.Parameters.Add("@return_id", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                patientid = Convert.ToInt32(cmd.Parameters["@return_id"].Value);
                return patientid;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return patientid;
        }

        public DataTable fetching_patient_info(string doc_username)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {

                cmd = new SqlCommand("SP_fetching_patient_info", con);
                cmd.Parameters.Add(new SqlParameter("@doc_username", doc_username));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;
        }


        public void detetingrecordbyid(string id)
        {


            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {

                cmd = new SqlCommand("SP_deleting_record_row", con);
                cmd.Parameters.Add(new SqlParameter("@record_id", id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);

            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }


        }


        public DataTable fetching_patient_info_for_update(int id)
        {

            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {

                cmd = new SqlCommand("SP_fetching_patient_info_by_id", con);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;

        }


        public void submittion_of_Patient_info_update(int id, string doc_name, string pat_id, string pat_name, string gender, string impact_teeth, string missing_teeth, string extracted, string replacement, string restorative, DateTime date, string username)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_patient_info_update", con);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.Parameters.Add(new SqlParameter("@doc_name", doc_name));
                cmd.Parameters.Add(new SqlParameter("@pat_id", pat_id));
                cmd.Parameters.Add(new SqlParameter("@pat_name", pat_name));
                cmd.Parameters.Add(new SqlParameter("@pat_gender", gender));
                cmd.Parameters.Add(new SqlParameter("@impact_teeth", impact_teeth));
                cmd.Parameters.Add(new SqlParameter("@missing_teeth", missing_teeth));
                cmd.Parameters.Add(new SqlParameter("@extracted", extracted));
                cmd.Parameters.Add(new SqlParameter("@replacement", replacement));
                cmd.Parameters.Add(new SqlParameter("@restorative", restorative));
                cmd.Parameters.Add(new SqlParameter("@entry_date", date));
                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }

        }

        public void Pars_Result_submit(int prevalue, int postvalue, int point_value, double percentage, int pat_id)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_Pars_Results_submittion", con);
                cmd.Parameters.Add(new SqlParameter("@pre_value", prevalue));
                cmd.Parameters.Add(new SqlParameter("@post_value", postvalue));
                cmd.Parameters.Add(new SqlParameter("@point_value", point_value));
                cmd.Parameters.Add(new SqlParameter("@per_value", percentage));
                cmd.Parameters.Add(new SqlParameter("@pat_id", pat_id));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
        }


        public DataTable fetching_Pars_values_by_id(int  id)
        {

            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {

                cmd = new SqlCommand("SP_fetching_Pars_Results", con);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;

        }

        public DataTable GetPatinetData(int id)
        {

            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {

                cmd = new SqlCommand("SP_GetPatientInfo", con);
                cmd.Parameters.Add(new SqlParameter("@id", id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;

        }




        public string SendEmail(string emailto,string pre_value, string post_value , int point_value, double percentage)
        {
            try
            {
                 string bodycontent = "<b>Dear M/S</b> <br> Here your Accessment :<br><p> Pretreatment Value =" + pre_value + "<br>  Posttreatment value = " +post_value + " <br> Point Value = " +point_value+ " <br> Percentage Value = " + percentage ;

                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(emailto));
                message.From = new MailAddress("EasyPars@gmail.com");
                
                message.Subject = "Pars Result Report";
              
                message.Body = bodycontent;
                SmtpClient client = new SmtpClient();

                client.UseDefaultCredentials = false;
                client.EnableSsl = true;
                message.IsBodyHtml = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(message);
                message.To.Clear();

                return "";
                 
            }

            catch (Exception ex)
            {
                return Convert.ToString(ex);
                
            }

           

        }

        public DataTable fetching_complete_Parsvalues_pre(int patient_id)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_fetching_complete_patient_value_pre", con);
                cmd.Parameters.Add(new SqlParameter("@patient_id", patient_id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;
        }

        public DataTable fetching_complete_Parsvalues(int patient_id)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_fetching_complete_patient_value", con);
                cmd.Parameters.Add(new SqlParameter("@patient_id", patient_id));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;


        }

        public void Updating_Patient_values_results(string crowding, string buccal, string overjet, string overbite, string midline, string crowding2, string buccal2, string overjet2, string overbite2, string midline2, int id, string p1, string p2, string percentage, string point, string username_active)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_Updating_Result_Values", con);
                cmd.Parameters.Add(new SqlParameter("@patient_id", id));
                cmd.Parameters.Add(new SqlParameter("@precrowding", crowding));
                cmd.Parameters.Add(new SqlParameter("@prebuccal", buccal));
                cmd.Parameters.Add(new SqlParameter("@preoverjet", overjet));
                cmd.Parameters.Add(new SqlParameter("@preoverbite", overbite));
                cmd.Parameters.Add(new SqlParameter("@premidline", midline));
                cmd.Parameters.Add(new SqlParameter("@poscrowding", crowding2));
                cmd.Parameters.Add(new SqlParameter("@posbuccal", buccal2));
                cmd.Parameters.Add(new SqlParameter("@posoverjet", overjet2));
                cmd.Parameters.Add(new SqlParameter("@posoverbite", overbite2));
                cmd.Parameters.Add(new SqlParameter("@posmidline", midline2));
                cmd.Parameters.Add(new SqlParameter("@prevalue", p1));
                cmd.Parameters.Add(new SqlParameter("@postvalue", p2));
                cmd.Parameters.Add(new SqlParameter("@percentage", percentage));
                cmd.Parameters.Add(new SqlParameter("@point", point));
                cmd.Parameters.Add(new SqlParameter("@username", username_active));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
        }

        public string getting_userpassword(string email)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            string password = "";
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_forgetPassword", con);
                cmd.Parameters.Add(new SqlParameter("@email", email));
            
                cmd.Parameters.Add("@password", SqlDbType.NVarChar,250).Direction = ParameterDirection.Output;
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                password = Convert.ToString(cmd.Parameters["@password"].Value);
                return password;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return password;
        }

        //public void Updating_paitent_Values_record(string preorposttreatment, float cvalue, float fvalue, float ivalue, float lvalue, float nvalue, string username, DateTime pars_datetime, int unique_pat_id)
        //{
        //    SqlConnection con = new SqlConnection(connStr);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    DataTable dt = new DataTable();
        //    try
        //    {

        //        cmd = new SqlCommand("SP_Updating_Patient_pars_Record", con);
        //        cmd.Parameters.Add(new SqlParameter("@preorposttreatment", preorposttreatment));
        //        cmd.Parameters.Add(new SqlParameter("@cvalue", cvalue));
        //        cmd.Parameters.Add(new SqlParameter("@fvalue", fvalue));
        //        cmd.Parameters.Add(new SqlParameter("@ivalue", ivalue));
        //        cmd.Parameters.Add(new SqlParameter("@lvalue", lvalue));
        //        cmd.Parameters.Add(new SqlParameter("@nvalue", nvalue));
        //        cmd.Parameters.Add(new SqlParameter("@username", username));
        //        cmd.Parameters.Add(new SqlParameter("@pars_datetime", pars_datetime));
        //        cmd.Parameters.Add(new SqlParameter("@ID", unique_pat_id));

        //        cmd.CommandType = CommandType.StoredProcedure;
        //        da.SelectCommand = cmd;

        //        da.Fill(dt);

        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.ToString());

        //    }
        //    finally
        //    {
        //        cmd.Dispose();
        //        con.Close();
        //    }

        //}

        //public void Pars_Result_updating_for_id(int prevalue, int postvalue, int point_value, double percentage, int pat_id)
        //{
        //    SqlConnection con = new SqlConnection(connStr);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    DataTable dt = new DataTable();
        //    try
        //    {
        //        cmd = new SqlCommand("SP_PAR_RESULT_UPDATE", con);
        //        cmd.Parameters.Add(new SqlParameter("@pre_value", prevalue));
        //        cmd.Parameters.Add(new SqlParameter("@post_value", postvalue));
        //        cmd.Parameters.Add(new SqlParameter("@point_value", point_value));
        //        cmd.Parameters.Add(new SqlParameter("@per_value", percentage));
        //        cmd.Parameters.Add(new SqlParameter("@pat_id", pat_id));

        //        cmd.CommandType = CommandType.StoredProcedure;
        //        da.SelectCommand = cmd;
        //        da.Fill(dt);

        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.ToString());

        //    }
        //    finally
        //    {
        //        cmd.Dispose();
        //        con.Close();
        //    }
        //}


        public void Inserting_Pre_Patient_Value(string Pat_ID, string pre_uper_ur2_ur3, string pre_uper_ur1_ur2, string pre_uper_ul1_ur1, string pre_uper_ul2_ul1,
      string pre_uper_ul3_ul2, string pre_uper_type_definer, string pre_lower_ur2_ur3, string pre_lower_ur1_ur2, string pre_lower_ul1_ur1, string pre_lower_ul2_ul1, string pre_lower_ul3_ul2, string pre_lower_type_definer,
      string pre_right_buccal_anterior, string pre_right_buccal_vertical, string pre_left_buccal_anterior, string pre_right_buccal_transverse,
      string pre_left_buccal_vertical, string pre_left_buccal_transverse, string pre_positive_overjet,
         string pre_negative_overjet, string pre_overjet_type, string pre_positive_overbite, string pre_negative_overbite, string pre_overbite_type, string pre_midline)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_Inserting_Pre_Patient_Value", con);
                cmd.Parameters.Add(new SqlParameter("@Pat_ID", Pat_ID));
                cmd.Parameters.Add(new SqlParameter("@pre_uper_ur2_ur3", pre_uper_ur2_ur3));
                cmd.Parameters.Add(new SqlParameter("@pre_uper_ur1_ur2", pre_uper_ur1_ur2));
                cmd.Parameters.Add(new SqlParameter("@pre_uper_ul1_ur1", pre_uper_ul1_ur1));
                cmd.Parameters.Add(new SqlParameter("@pre_uper_ul2_ul1", pre_uper_ul2_ul1));
                cmd.Parameters.Add(new SqlParameter("@pre_uper_ul3_ul2", pre_uper_ul3_ul2));

                cmd.Parameters.Add(new SqlParameter("@pre_uper_type_definer", pre_uper_type_definer));
                cmd.Parameters.Add(new SqlParameter("@pre_lower_ur2_ur3", pre_lower_ur2_ur3));
                cmd.Parameters.Add(new SqlParameter("@pre_lower_ur1_ur2", pre_lower_ur1_ur2));
                cmd.Parameters.Add(new SqlParameter("@pre_lower_ul1_ur1", pre_lower_ul1_ur1));
                cmd.Parameters.Add(new SqlParameter("@pre_lower_ul2_ul1", pre_lower_ul2_ul1));
                cmd.Parameters.Add(new SqlParameter("@pre_lower_ul3_ul2", pre_lower_ul3_ul2));

                cmd.Parameters.Add(new SqlParameter("@pre_lower_type_definer", pre_lower_type_definer));
                cmd.Parameters.Add(new SqlParameter("@pre_right_buccal_anterior", pre_right_buccal_anterior));
                cmd.Parameters.Add(new SqlParameter("@pre_right_buccal_vertical", pre_right_buccal_vertical));
                cmd.Parameters.Add(new SqlParameter("@pre_right_buccal_transverse", pre_right_buccal_transverse));


                cmd.Parameters.Add(new SqlParameter("@pre_left_buccal_anterior", pre_left_buccal_anterior));
                cmd.Parameters.Add(new SqlParameter("@pre_left_buccal_vertical", pre_left_buccal_vertical));
                cmd.Parameters.Add(new SqlParameter("@pre_left_buccal_transverse", pre_left_buccal_transverse));
                cmd.Parameters.Add(new SqlParameter("@pre_positive_overjet", pre_positive_overjet));
                cmd.Parameters.Add(new SqlParameter("@pre_negative_overjet", pre_negative_overjet));
                cmd.Parameters.Add(new SqlParameter("@pre_overjet_type", pre_overjet_type));

                cmd.Parameters.Add(new SqlParameter("@pre_positive_overbite", pre_positive_overbite));
                cmd.Parameters.Add(new SqlParameter("@pre_negative_overbite", pre_negative_overbite));
                cmd.Parameters.Add(new SqlParameter("@pre_overbite_type", pre_overbite_type));
                cmd.Parameters.Add(new SqlParameter("@pre_midline", pre_midline));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
        }


        public void Inserting_Post_Patient_Value(string Pat_ID, string post_uper_ur2_ur3, string post_uper_ur1_ur2, string post_uper_ul1_ur1, string post_uper_ul2_ul1,
        string post_uper_ul3_ul2, string post_uper_type_definer, string post_lower_ur2_ur3, string post_lower_ur1_ur2, string post_lower_ul1_ur1, string post_lower_ul2_ul1, string post_lower_ul3_ul2, string post_lower_type_definer,
        string post_right_buccal_anterior, string post_right_buccal_vertical, string post_left_buccal_anterior, string post_right_buccal_transverse,
        string post_left_buccal_vertical, string post_left_buccal_transverse, string post_positive_overjet,
           string post_negative_overjet, string post_overjet_type, string post_positive_overbite, string post_negative_overbite, string post_overbite_type, string post_midline)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_Inserting_post_Patient_Value", con);
                cmd.Parameters.Add(new SqlParameter("@Pat_ID", Pat_ID));
                cmd.Parameters.Add(new SqlParameter("@post_uper_ur2_ur3", post_uper_ur2_ur3));
                cmd.Parameters.Add(new SqlParameter("@post_uper_ur1_ur2", post_uper_ur1_ur2));
                cmd.Parameters.Add(new SqlParameter("@post_uper_ul1_ur1", post_uper_ul1_ur1));
                cmd.Parameters.Add(new SqlParameter("@post_uper_ul2_ul1", post_uper_ul2_ul1));
                cmd.Parameters.Add(new SqlParameter("@post_uper_ul3_ul2", post_uper_ul3_ul2));

                cmd.Parameters.Add(new SqlParameter("@post_uper_type_definer", post_uper_type_definer));
                cmd.Parameters.Add(new SqlParameter("@post_lower_ur2_ur3", post_lower_ur2_ur3));
                cmd.Parameters.Add(new SqlParameter("@post_lower_ur1_ur2", post_lower_ur1_ur2));
                cmd.Parameters.Add(new SqlParameter("@post_lower_ul1_ur1", post_lower_ul1_ur1));
                cmd.Parameters.Add(new SqlParameter("@post_lower_ul2_ul1", post_lower_ul2_ul1));
                cmd.Parameters.Add(new SqlParameter("@post_lower_ul3_ul2", post_lower_ul3_ul2));

                cmd.Parameters.Add(new SqlParameter("@post_lower_type_definer", post_lower_type_definer));
                cmd.Parameters.Add(new SqlParameter("@post_right_buccal_anterior", post_right_buccal_anterior));
                cmd.Parameters.Add(new SqlParameter("@post_right_buccal_vertical", post_right_buccal_vertical));
                cmd.Parameters.Add(new SqlParameter("@post_right_buccal_transverse", post_right_buccal_transverse));


                cmd.Parameters.Add(new SqlParameter("@post_left_buccal_anterior", post_left_buccal_anterior));
                cmd.Parameters.Add(new SqlParameter("@post_left_buccal_vertical", post_left_buccal_vertical));
                cmd.Parameters.Add(new SqlParameter("@post_left_buccal_transverse", post_left_buccal_transverse));
                cmd.Parameters.Add(new SqlParameter("@post_positive_overjet", post_positive_overjet));
                cmd.Parameters.Add(new SqlParameter("@post_negative_overjet", post_negative_overjet));
                cmd.Parameters.Add(new SqlParameter("@post_overjet_type", post_overjet_type));

                cmd.Parameters.Add(new SqlParameter("@post_positive_overbite", post_positive_overbite));
                cmd.Parameters.Add(new SqlParameter("@post_negative_overbite", post_negative_overbite));
                cmd.Parameters.Add(new SqlParameter("@post_overbite_type", post_overbite_type));
                cmd.Parameters.Add(new SqlParameter("@post_midline", post_midline));

                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
        }

        public DataTable Fetching_data_of_pre_Values(string patientID)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_fetching_data_of_pre_Values", con);
                cmd.Parameters.Add(new SqlParameter("@patient_id", patientID));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;


        }

        public DataTable Fetching_data_of_post_Values(string patientID)
        {
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                cmd = new SqlCommand("SP_fetching_data_of_post_Values", con);
                cmd.Parameters.Add(new SqlParameter("@patient_id", patientID));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }
            return dt;


        }



    }
}