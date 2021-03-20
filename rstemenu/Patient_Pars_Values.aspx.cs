using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Drawing.Imaging;

namespace rstemenu
{
    public partial class Patient_Pars_Values : System.Web.UI.Page
    {

        Methods obj = new Methods();
        DataTable dt;

        string id = "";

        string pre_value = "";
        string post_value = "";
        string st_point_value = "";
        double percentage_value = 0;

        int patient_id = 0;
        string pat_name = "";
        string doctor_name = "";
        string gender = "";
        string entry_date = "";
        string impact_teeth = "NO";
        string missing_teeth = "NO";
        string extracted_teeth = "NO";
        string replacement_teeth = "NO";
        string restorative = "NO";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                BindPatientVlaues(Int32.Parse(Request.QueryString["id"].ToString()));
                BindParsValues(Int32.Parse(Request.QueryString["id"].ToString()));
                id = Request.QueryString["id"].ToString();
            }

        }

        public void BindParsValues(int pid)
        {
            dt = obj.fetching_Pars_values_by_id(pid);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    pre_value = row["pretreatment_value"].ToString();
                    post_value = row["posttreatment_value"].ToString();
                    st_point_value = row["point_value"].ToString();
                    percentage_value = Convert.ToDouble(row["percentage_value"].ToString());
                }
            }
            else
            {
                pre_value = "No Record Found";
                post_value = "No Record Found";
                st_point_value = "0";
                percentage_value = 0;
            }
            pretreatment_value.Text = "1. Pretreatment value of PAR : " + pre_value;
            Label1.Text = "2.  Posttreatment value of PAR: " + post_value;
            pretreatment.Text = pre_value;
            posttreatment.Text = post_value;
            Label2.Text = "3.  Point result of PAR : " + st_point_value;
            if (Convert.ToInt32(st_point_value) >= 22)
            {
                point_result.Text = "(Point based treatment changes (P1-P2): As the change is more than 22 points, this indicates a great improvement secondary to the treatment)";
            }
            if (Convert.ToInt32(st_point_value) < 22)
            {
                point_result.Text = "(Point based treatment changes (P1-P2): As the change is less than 22 points, this indicates no improvement) ";
            }


            Label3.Text = "4. PAR percentage-based treatment change {(P1-P2/P1) * 100}:  " + percentage_value + "%";

            if (percentage_value >= 30 && percentage_value < 70)
            {
                Label4.Text = " (PAR percentage result is in between 30% and 70% which indicates improvement)";
            }
            else if (percentage_value < 30)
            {
                Label4.Text = " (PAR percentage result is lesser than 30%   which indicates there is no improvement)";
            }
            else if (percentage_value >= 70)
            {
                Label4.Text = " (PAR percentage result is greater than 70% which indicates Great improvement)";
            }


        }


        public void BindPatientVlaues(int pid)
        {
            DataTable dt = new DataTable();
            dt = obj.GetPatinetData(pid);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    patient_id = Convert.ToInt32(row["pat_id"].ToString());
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
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/helppage.aspx?id=54&heading=percentage");
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/helppage.aspx?id=hp1new&heading=newhelp");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            sendid.Visible = true;
        }
        protected void download_pdf_Click(object sender, EventArgs e)
        {


            StringBuilder columnbind = new StringBuilder();

            columnbind.Append("<table Width='100%' border='0'><tr><td style='text-align:left'><img width='50px' src =" + "'http://orthopar.org/images/parslogo.png'></td>");
            columnbind.Append("<td style='text-align:right'>http://orthopar.org</td></tr></table>");

            columnbind.Append("<br><h2> PAR COMPLETE RESULT </h2> ");

            columnbind.Append("Patient ID: <t/> " + patient_id + "<br/> ");
            columnbind.Append("Patient Name: <t/> " + pat_name + "<br/> ");
            columnbind.Append("Doctor Name: <t/> " + doctor_name + "<br/> ");
            columnbind.Append("<p>Entry Date: " + entry_date + "</p>");
            columnbind.Append("<p>Gender: " + gender.Trim() + "</p>");
            columnbind.Append("<p>Any impacted teeth? " + impact_teeth.Trim() + "</p>");
            columnbind.Append("<p>Any missing teeth? " + missing_teeth.Trim() + "</p>");
            columnbind.Append("<p>Any teeth extracted?? " + extracted_teeth.Trim() + "</p>");
            columnbind.Append("<p>Prosthetic replacement for any of the spaces? " + replacement_teeth.Trim() + "</p>");
            columnbind.Append("<p>Any restorative treatment affecting the malocclusion? " + restorative.Trim() + "</p>");
            columnbind.Append("----------------------------------------------------------------------------------------------------");
            columnbind.Append("1. Pretreatment value of PAR (P1) : " + pre_value + "Points   <br/>");
            columnbind.Append("2. Posttreatment value of PAR (P2) : " + post_value + "Points   <br/>");
            columnbind.Append("3. PAR point-base treatment change (P1 - P2): " + st_point_value + "Points   <br/>");
            columnbind.Append(point_result.Text + "  <br/>");
            columnbind.Append("4. PAR percentage-based treatment change {(P1-P2/P1) * 100} : " + percentage_value + "%   <br/>");
            columnbind.Append(Label4.Text + "  <br/>");
            columnbind.Append("5.PAR nomogram: Please visually plot P1 score on the X axis and P2 score on the Y axis of the PAR nomograph below to identify the treatment outcome based on the intersection of the visualised x and y point.  <br/> ");
            columnbind.Append("<p>");
            columnbind.Append("<br><br><p><img src =" + "'http://orthopar.org/images/Graph-ParNomogram.jpg'" + " </p>");
            columnbind.Append("</p>");
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
            Response.AddHeader("content-disposition", "attachment;filename=P" + patient_id + ".pdf");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding(1252);
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
            Response.Close();
        }

        protected void download_csv_Click(object sender, EventArgs e)
        {

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=P-" + patient_id + ".csv");
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
            columnbind.Append(st_point_value + ",");
            columnbind.Append(percentage_value + ",");
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }
        
        protected void btn_send_email_Click(object sender, EventArgs e)
        {
            string nameofimage = "";
            string filePath = "";
            nameofimage = SavingImage();
            filePath = "http://m.orthopar.org/canvasimages/" + nameofimage;
            string emailto = txb_email.Text;
            try
            {
                string Header = "<br><p><img src=" + "'http://orthopar.org/images/parslogo.png'/>" + "</p><p><hr></p><p style=" + "'text-align:right;'" + ">http://orthopar.org<br><br>";
                string chartdata = "<p> <img src =" + "'" + filePath + "'" + "/> </p>";
                string PatientOtherDetail = "";
                PatientOtherDetail = "<p>Doctor Name: " + doctor_name + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Entry Date: " + entry_date + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Gender: " + gender.Trim() + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Any impacted teeth? " + impact_teeth.Trim() + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Any missing teeth? " + missing_teeth.Trim() + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Any teeth extracted?? " + extracted_teeth.Trim() + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Prosthetic replacement for any of the spaces? " + replacement_teeth.Trim() + "</p>";
                PatientOtherDetail = PatientOtherDetail + "<p>Any restorative treatment affecting the malocclusion? " + restorative.Trim() + "</p>";
 
                string result = "";
                if (Convert.ToInt32(st_point_value) > 22)
                    result = "(Point-based treatment changes (P1-P2): As the change is more than 22 points, this indicates a great improvement secondary to the treatment)";
                if (Convert.ToInt32(st_point_value) < 22)
                    result = "(Point-based treatment changes (P1-P2): As the change is more than 22 points, this indicates no improvement secondary to the treatment)";
                string st_percentage = "";
                if (percentage_value > 30 && percentage_value < 70)
                    st_percentage = " (PAR percentage result is in between 30% and 70% which indicates improvement)";
                else if (percentage_value < 30)
                    st_percentage = " (PAR percentage result is lesser than 30%   which indicates there is no improvement)";
                else if (percentage_value > 70)
                    st_percentage = " (PAR percentage result is greater than 70% which indicates Great improvement)";
                string bodycontent = Header + "<h2>PAR COMPLETE RESULT</h2><br><b>Dear " + doctor_name + "</b> <br><br> Here your Assessment<br><p>Patient Name: " + pat_name + "</p><p>Patient ID: " + patient_id.ToString() + "</p>" + PatientOtherDetail + "<p> 1.Pretreatment Value of PAR (P1) : " + pre_value + "</p><p> 2.Posttreatment Value of PAR (P2): " + post_value + "</p><p>3. PAR Point-base treatment change (P1 - P2): " + st_point_value + " points </p><p> " + result + "</p><p>4. PAR Percentage-based Treatment Change {(P1-P2/P1) * 100} : " + percentage_value + "%<br><br>" + st_percentage + "<br><br>" + chartdata + "<br><br><b>ORTHO PAR</b>";

                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(emailto));
                message.From = new MailAddress("info@orthopar.org");
                message.Subject = "Par Result Report";
                message.Body = bodycontent;
                message.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient("smtpout.asia.secureserver.net", 80);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = false;
                smtp.UseDefaultCredentials = false;
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
            finally
            {
                email_response_show.Text = "Email Send";
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