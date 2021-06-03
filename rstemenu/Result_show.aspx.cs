using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Data;
using System.Net.Mail;
using System.Drawing;
using System.Drawing.Imaging;

namespace rstemenu
{
    public partial class Result_show : System.Web.UI.Page
    {
        string pre_value, post_value;
        Methods obj = new Methods();
        int result_value;
        double percentage;
        string patient_id;
        string pat_name;
        string doctor_name;
        string entry_date;
        string gender;

        string impact_teeth = "NO";
        string missing_teeth = "NO";
        string extracted_teeth = "NO";
        string replacement_teeth = "NO";
        string restorative = "NO";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["pre"] != null)
                {
                    pre_value = Request.QueryString["pre"];
                    lbl_prvalue.Text = pre_value;
                    pretreatment.Text = pre_value;
                }
                if (Request.QueryString["post"] != null)
                {
                    post_value = Request.QueryString["post"];
                    lbl_povalue.Text = post_value;
                    posttreatment.Text = post_value;
                }
                Session["Posttreatment_value"] = "-1";
                Session["Pretreatment_value"] = "-1";
                Session["btn_pre_treatemnt"] = "0";
                Session["btn_post_treatment"] = "0";
                BindPatientVlaues();
                result_value = Convert.ToInt32(pre_value) - Convert.ToInt32(post_value);
                pretreatment_value.Text = "1. Pretreatment value of PAR (P1) : " + pre_value + " Points";
                Label1.Text = "2.  Posttreatment value of PAR  (P2) : " + post_value + "  Points";
                Label2.Text = "3.  PAR point-base treatment change (P1 - P2): " + Convert.ToString(result_value) + "  Points";
                if (result_value > 22)
                    point_result.Text = "(Point based treatment changes (P1-P2): As the change is more than 22 points, this indicates a great improvement secondary to the treatment)";
                if (result_value < 22)
                    point_result.Text = "(Point based treatment changes (P1-P2): As the change is less than 22 points, this indicates no improvement  secondary to the treatment) ";
                percentage = Math.Round(((Convert.ToDouble(pre_value) - Convert.ToDouble(post_value)) * 100) / Convert.ToDouble(pre_value), 2);
                Label3.Text = "4. PAR percentage-based treatment change {(P1-P2/P1) * 100} : " + percentage + "%";
                if (percentage > 30 && percentage < 70)
                    Label4.Text = " (PAR percentage result for this case is in between 30-70% which indicates improvement)";
                else if (percentage < 30)
                    Label4.Text = " (PAR percentage result for this case is lesser than 30%   which indicates there is no improvement)";
                else if (percentage > 70)
                    Label4.Text = " (PAR percentage result for this case is greater than 70% which indicates Great improvement)";
            }
        }
        public void BindPatientVlaues()
        {
            DataTable dt = new DataTable();
            dt = obj.GetPatinetData(Int32.Parse((Session["patient_id"].ToString())));
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    patient_id = row["pat_id"].ToString();
                    pat_name = row["pat_name"].ToString();
                    doctor_name = row["doc_name"].ToString();
                    gender = row["pat_gender"].ToString();
                    entry_date = row["entry_date"].ToString();
                    impact_teeth = row["impact_teeth"].ToString();
                    missing_teeth = row["missing_teeth"].ToString();
                    extracted_teeth = row["extracted_teeth"].ToString();
                    replacement_teeth = row["replacement_teeth"].ToString();
                    restorative = row["restorative"].ToString();
                }
            }
        }

      

        [Obsolete]
        protected void download_pdf_Click(object sender, EventArgs e)
        {
            try
            {
                string filePath = Path.Combine(Server.MapPath("~/canvasimages/"), SavingImage());
                BindPatientVlaues();
                StringBuilder columnbind = new StringBuilder();
                columnbind.Append("<table Width='100%' border='0'><tr><td style='text-align:left'> <img width='50px' src =" + "'http://orthopar.org/images/parslogo.png'> </td>");
                columnbind.Append("<td style='text-align:right'> https://orthopar.org </td></tr></table>");
                columnbind.Append("<br><h2> PAR COMPLETE RESULT </h2> ");
                columnbind.Append("Patient ID: <t/> " + patient_id + "<br/> ");
                columnbind.Append("Patient Name: <t/> " + pat_name + "<br/> ");
                columnbind.Append("Doctor Name: <t/> " + doctor_name + "<br/> ");
                columnbind.Append("<div>Entry Date: " + entry_date + "</div>");
                if (gender.Length > 0)
                    columnbind.Append("<div>Gender: " + gender.Trim() + "</div>");
                else
                    columnbind.Append("<div>Gender: </div>");
                if (impact_teeth.Length > 0)
                    columnbind.Append("<div>Any impacted teeth? " + impact_teeth.Trim() + "</div>");
                else
                    columnbind.Append("<div>Any impacted teeth?  </div>");
                //3
                if (missing_teeth.Length > 0)
                    columnbind.Append("<div>Any missing teeth? " + missing_teeth.Trim() + "</div>");
                else
                    columnbind.Append("<div>Any missing teeth?  </div>");
                //4
                if (extracted_teeth.Length > 0)
                    columnbind.Append("<div>Any teeth extracted?? " + extracted_teeth.Trim() + "</div>");
                else
                    columnbind.Append("<div>Any teeth extracted??  </div>");
                //5
                if (extracted_teeth.Length > 0)
                    columnbind.Append("<div>Prosthetic replacement for any of the spaces? " + replacement_teeth.Trim() + "</div>");
                else
                    columnbind.Append("<div>Prosthetic replacement for any of the spaces? </div>");
                //6
                if (extracted_teeth.Length > 0)
                    columnbind.Append("<div>Any restorative treatment affecting the malocclusion? " + restorative.Trim() + "</div>");
                else
                    columnbind.Append("<div>Any restorative treatment affecting the malocclusion?  </div>");

                if (Request.QueryString["pre"] != null)
                    pre_value = Request.QueryString["pre"];
                if (Request.QueryString["post"] != null)
                    post_value = Request.QueryString["post"];
                result_value = Convert.ToInt32(pre_value) - Convert.ToInt32(post_value);
                percentage = Math.Round(((Convert.ToDouble(pre_value) - Convert.ToDouble(post_value)) * 100) / Convert.ToDouble(pre_value), 2);
                columnbind.Append("--------------------------------------------------------------------------------");
                columnbind.Append("<div>");
                columnbind.Append("1. Pretreatment Value of PAR (P1) : " + pre_value + "Points   <br/>");
                columnbind.Append("2. Posttreatment Value of PAR (P2) : " + post_value + "Points   <br/>");
                columnbind.Append("3. PAR Point-base treatment change (P1 - P2): " + result_value + "Points   <br/>");
                columnbind.Append(point_result.Text + "  <br/>");
                columnbind.Append("4. PAR Percentage-based Treatment Change{(P1-P2/P1) * 100} : " + percentage + "%   <br/>");
                columnbind.Append(Label4.Text + "  <br/>");
                columnbind.Append("</div>");
                columnbind.Append("<div>");
                columnbind.Append("<br/> <br/> <div> <img width='500px' height='300px' src=" + "'" + filePath + "'> </div>");
                columnbind.Append("</div>");
                StringReader sr = new StringReader(columnbind.ToString());
                Document pdfDoc = new Document(PageSize.LEGAL_LANDSCAPE, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                byte[] bytes;
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    bytes = memoryStream.ToArray();
                    memoryStream.Close();
                }

              
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/";
                Response.AddHeader("content-disposition", "attachment;filename=PAR-" + patient_id + ".pdf");
                Response.Charset = "";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding(1252);
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
                Response.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        protected void download_csv_Click(object sender, EventArgs e)
        {
            patient_id = Convert.ToString(Session["patient_id"]);
            pat_name = Convert.ToString(Session["patient_name"]);
            doctor_name = Convert.ToString(Session["doctor_name"]);
            entry_date = Convert.ToString(Session["entry_date"]);
            gender = Convert.ToString(Session["gender"]);
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=PAR-" + patient_id + ".csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding(1252);
            StringBuilder columnbind = new StringBuilder();
            columnbind.Append("P A R S  R E S U L T ");
            columnbind.Append("\r\n");
            columnbind.Append("Patient ID," + patient_id);
            columnbind.Append("\r\n");
            columnbind.Append("Patient Name," + pat_name.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("Doctor Name," + doctor_name.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("Entry Date, " + entry_date);
            columnbind.Append("\r\n");
            columnbind.Append("Gender, " + gender.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("Any impacted teeth?, " + impact_teeth.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("Any missing teeth?, " + missing_teeth.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("Any teeth extracted, " + extracted_teeth.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("Prosthetic replacement for any of the spaces?, " + replacement_teeth.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("Any restorative treatment affecting the malocclusion?, " + restorative.Trim());
            columnbind.Append("\r\n");
            columnbind.Append("\r\n");
            columnbind.Append("\r\n");
            columnbind.Append("ID");
            columnbind.Append(",");
            columnbind.Append("Pre Treatment Value");
            columnbind.Append(",");
            columnbind.Append("Post Treatment Value");
            columnbind.Append(",");
            columnbind.Append("Point Value");
            columnbind.Append(",");
            columnbind.Append("Percentage");
            columnbind.Append(",");
            columnbind.Append("\r\n");
            columnbind.Append(patient_id + ",");
            columnbind.Append(pre_value + ",");
            columnbind.Append(post_value + ",");
            columnbind.Append(result_value + ",");
            columnbind.Append(percentage + ",");
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btn_send_email_Click(object sender, EventArgs e)
        {


            string filePath = Path.Combine(Server.MapPath("~/canvasimages/"), SavingImage());
            string emailto = txb_email.Text;
            try
            {
                BindPatientVlaues();
                string Header = "<br><p><img src=" + "'https://orthopar.org/images/parslogo.png'/>" + "</p><p><hr></p><p style=" + "'text-align:right'" + "><a href='" + "https://orthopar.org'" + " target='" + "_blank'" + ">https://orthopar.org</a><br><br>";
                string chartdata = "<p> <img  width='400px' height='500px' src =" + "'" + filePath + "'" + "/> </p>";
                string PatientOtherDetail = "";
                PatientOtherDetail = "<p>Doctor Name: " + doctor_name + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Entry Date: " + entry_date + "</p>";
                ///1
                if (gender.Length > 0)
                    PatientOtherDetail = PatientOtherDetail + "<p>Gender: " + gender.Trim() + "</p>";
                else
                    PatientOtherDetail = PatientOtherDetail + "<p>Gender:  </p>";
                //2
                if (impact_teeth.Length > 0)
                    PatientOtherDetail = PatientOtherDetail + "<p>Any impacted teeth? " + impact_teeth.Trim() + "</p>";
                else
                    PatientOtherDetail = PatientOtherDetail + "<p>Any impacted teeth?  </p>";
                //3
                if (missing_teeth.Length > 0)
                    PatientOtherDetail = PatientOtherDetail + "<p>Any missing teeth? " + missing_teeth.Trim() + "</p>";
                else
                    PatientOtherDetail = PatientOtherDetail + "<p>Any missing teeth? </p>";
                //4
                if (extracted_teeth.Length > 0)
                    PatientOtherDetail = PatientOtherDetail + "<p>Any teeth extracted? " + extracted_teeth.Trim() + "</p>";
                else
                    PatientOtherDetail = PatientOtherDetail + "<p>Any teeth extracted?  </p>";
                //5
                if (extracted_teeth.Length > 0)
                    PatientOtherDetail = PatientOtherDetail + "<p>Prosthetic replacement for any of the spaces? " + replacement_teeth.Trim() + "</p>";
                else
                    PatientOtherDetail = PatientOtherDetail + "<p>Prosthetic replacement for any of the spaces?  </p>";
                //6
                if (extracted_teeth.Length > 0)
                    PatientOtherDetail = PatientOtherDetail + "<p>Any restorative treatment affecting the malocclusion? " + restorative.Trim() + "</p>";
                else
                    PatientOtherDetail = PatientOtherDetail + "<p>Any restorative treatment affecting the malocclusion?  </p>";
                string result = "";
                if (Request.QueryString["pre"] != null)
                    pre_value = Request.QueryString["pre"];
                if (Request.QueryString["post"] != null)
                    post_value = Request.QueryString["post"];
                result_value = Convert.ToInt32(pre_value) - Convert.ToInt32(post_value);
                percentage = Math.Round(((Convert.ToDouble(pre_value) - Convert.ToDouble(post_value)) * 100) / Convert.ToDouble(pre_value), 2);
                if (result_value > 22)
                    result = "(Point based treatment changes (P1-P2): As the change is more than 22 points, this indicates a great improvement secondary to the treatment)";
                if (result_value < 22)
                    result = "(Point based treatment changes (P1-P2): As the change is less than 22 points, this indicates no improvement secondary to the treatment) ";
                string st_percentage = "";
                if (percentage > 30 && percentage < 70)
                    st_percentage = " (PAR percentage result for this case is in between 30-70% which indicates improvement)";
                else if (percentage < 30)
                    st_percentage = " (PAR percentage result for this case is lesser than 30%   which indicates there is no improvement)";
                else if (percentage > 70)
                    st_percentage = " (PAR percentage result for this case is greater than 70% which indicates Great improvement)";
                string bodycontent = Header + "<h2>PAR COMPLETE RESULT</h2><br><b>Dear " + doctor_name + "</b> <br><br> Here your Assessment<br><p>Patient Name: " + pat_name + "</p><p>Patient ID: " + patient_id.ToString() + "</p>" + PatientOtherDetail + "<p> 1.Pretreatment Value of PAR (P1) : " + pre_value + "</p><p> 2.Posttreatment Value of PAR (P2): " + post_value + "</p><p>3. PAR Point-base treatment change (P1 - P2): " + result_value + " points </p><p>" + result + "</p><p>4. PAR Percentage-based Treatment Change {(P1-P2/P1) * 100} : " + percentage + "% </p><br><br><p>" + st_percentage + "</p><br><br>" + chartdata + "<br><br><b>ORTHO PAR</b>";
                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(emailto));
                message.From = new MailAddress("info@orthopar.org");
                message.Subject = "Par Result Report";
                message.Body = bodycontent;
                message.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient("smtpout.asia.secureserver.net", 3535);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = false;
                NetworkCredential nc = new NetworkCredential("info@orthopar.org", "Ayesha-22");
                smtp.Credentials = nc;
                smtp.Send(message);
                message.To.Clear();
                email_response_show.Text = "Email Send";
            }
            catch (Exception ex)
            {
                if (ex != null)
                    email_response_show.Text = ex.ToString();
            }
        }
        public string SavingImage()
        {
            string ItemImg = "m" + DateTime.Now.Month.ToString() + "d" + DateTime.Now.Day.ToString() + "y" + DateTime.Now.Year.ToString() + "h" + DateTime.Now.Hour.ToString() + "m" + DateTime.Now.Minute.ToString() + "ml" + DateTime.Now.Millisecond.ToString() + "_Item.jpg";
            string uniqueid = Request.Form[hdnImageData.UniqueID].ToString();
            string base64 = "";
            base64 = Request.Form[hdnImageData.UniqueID].Split(',')[1];
            byte[] IMGbytes = Convert.FromBase64String(base64);
            string filePath = "";
            using (MemoryStream msImage = new MemoryStream(IMGbytes, 0, IMGbytes.Length))
            {
                System.Drawing.Image patternImage;
                patternImage = new Bitmap(msImage);
                filePath = Path.Combine(Server.MapPath("~/canvasimages/"), ItemImg);
                patternImage.Save(filePath, ImageFormat.Jpeg);
                return ItemImg;
            }
        }


    }
}