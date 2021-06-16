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
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    BindPatientVlaues(Int32.Parse(Request.QueryString["id"].ToString()));
                    BindParsValues(Int32.Parse(Request.QueryString["id"].ToString()));
                    id = Request.QueryString["id"].ToString();
                }
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


        [Obsolete]
        protected void download_pdf_Click(object sender, EventArgs e)
        {
            BindPatientVlaues(Int32.Parse(Request.QueryString["id"].ToString()));

            DataTable dt = obj.fetching_Pars_values_by_id(Int32.Parse(Request.QueryString["id"].ToString()));
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


            string filePath = "http://m.orthopar.org/canvasimages/" + SavingImage();
            StringBuilder columnbind = new StringBuilder();

            columnbind.Append("<table Width='100%' border='0'><tr><td style='text-align:left'><img width='50px' src =" + "'http://orthopar.org/images/parslogo.png'></td>");
            columnbind.Append("<td style='text-align:right'>http://orthopar.org</td></tr></table>");
            columnbind.Append("<br><h2>PAR COMPLETE RESULT </h2> ");
            columnbind.Append("Patient ID: <t/> " + patient_id + "<br/> ");
            columnbind.Append("Patient Name: <t/> " + pat_name + "<br/> ");
            columnbind.Append("Doctor Name: <t/> " + doctor_name + "<br/> ");

            columnbind.Append("<p>Entry Date: " + entry_date + "</p>");

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



            columnbind.Append("----------------------------------------------------------------------------------------------------");

            columnbind.Append("<div>");
            columnbind.Append("1. Pretreatment Value of PAR (P1) : " + pre_value + "Points   <br/>");
            columnbind.Append("2. Posttreatment Value of PAR (P2) : " + post_value + "Points   <br/>");
            columnbind.Append("3. PAR Point-base treatment change (P1 - P2): " + st_point_value + "Points   <br/>");
            columnbind.Append(point_result.Text + "  <br/>");
            columnbind.Append("4. PAR Percentage-based Treatment Change {(P1-P2/P1) * 100} : " + percentage_value + "%   <br/>");
            columnbind.Append(Label4.Text + "  <br/>");
            columnbind.Append("</div>");

            columnbind.Append("<p>");
            columnbind.Append("<br/> <br/> <div> <img width='500px' height='300px' src=" + "'" + filePath + "'> </div>");
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
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=P" + patient_id + ".pdf");
            Response.Charset = "";   
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

            BindPatientVlaues(Int32.Parse(Request.QueryString["id"].ToString()));

            DataTable dt = obj.fetching_Pars_values_by_id(Int32.Parse(Request.QueryString["id"].ToString()));
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

            string filePath = "http://m.orthopar.org/canvasimages/" + SavingImage();
            string emailto = txb_email.Text;
            try
            {
                string Header = "<br><p><img src=" + "'http://orthopar.org/images/parslogo.png'/>" + "</p><p><hr></p><p style=" + "'text-align:right;'" + ">http://orthopar.org<br><br>";
                string chartdata = "<p> <img src='" + filePath + "'/> </p>";
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
                int Points = st_point_value.Length == 0 ? 0 : Convert.ToInt32(st_point_value);
                if (Points > 22)
                    result = "(Point-based treatment changes (P1-P2): As the change is more than 22 points, this indicates a great improvement secondary to the treatment)";
                if (Points < 22)
                    result = "(Point-based treatment changes (P1-P2): As the change is more than 22 points, this indicates no improvement secondary to the treatment)";
                string st_percentage = "";
                if (percentage_value > 30 && percentage_value < 70)
                    st_percentage = " (PAR percentage result is in between 30% and 70% which indicates improvement)";
                else if (percentage_value < 30)
                    st_percentage = " (PAR percentage result is lesser than 30%   which indicates there is no improvement)";
                else if (percentage_value > 70)
                    st_percentage = " (PAR percentage result is greater than 70% which indicates Great improvement)";
                string bodycontent = Header + "<h2> PAR COMPLETE RESULT </h2><br><b>Dear " + doctor_name + "</b> <br><br> Here your Assessment<br><p>Patient Name: " + pat_name + "</p><p>Patient ID: " + patient_id.ToString() + "</p>" + PatientOtherDetail + "<p> 1.Pretreatment Value of PAR (P1) : " + pre_value + "</p><p> 2.Posttreatment Value of PAR (P2): " + post_value + "</p><p>3. PAR Point-base treatment change (P1 - P2): " + st_point_value + " points </p><p> " + result + "</p><p>4. PAR Percentage-based Treatment Change {(P1-P2/P1) * 100} : " + percentage_value + "%<br><br>" + st_percentage + "<br><br>" + chartdata + "<br><br><b>ORTHO PAR</b>";

                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(emailto));
                message.From = new MailAddress("info@orthopar.org");
                message.Subject = "Par Result Report";
                message.Body = bodycontent;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Credentials = new NetworkCredential("info@orthopar.org", "Ayesha-22");
                client.Host = "relay-hosting.secureserver.net";
                client.Send(message);
                message.To.Clear();
                email_response_show.Text = "Email Send.";
            }
            catch (Exception ex)
            {
                if (ex != null)
                    email_response_show.Text = "Error occurred while sending mail";
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

        //public void GeneratePdf()
        //{
        //    Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
        //    iTextSharp.text.Font NormalFont = FontFactory.GetFont("Arial", 12, iTextSharp.text.Font.NORMAL);
        //    using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
        //    {
        //        PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
        //        Phrase phrase = null;
        //        PdfPCell cell = null;
        //        PdfPTable table = null;


        //        document.Open();

        //        //Header Table
        //        table = new PdfPTable(2);
        //        table.TotalWidth = 500f;
        //        table.LockedWidth = true;
        //        table.SetWidths(new float[] { 0.3f, 0.7f });

        //        //Company Logo
        //        cell = ImageCell("~/images/northwindlogo.gif", 30f, PdfPCell.ALIGN_CENTER);
        //        table.AddCell(cell);

        //        //Company Name and Address
        //        phrase = new Phrase();
        //        phrase.Add(new Chunk("Microsoft Northwind Traders Company\n\n", FontFactory.GetFont("Arial", 16, Font.BOLD, Color.RED)));
        //        phrase.Add(new Chunk("107, Park site,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
        //        phrase.Add(new Chunk("Salt Lake Road,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
        //        phrase.Add(new Chunk("Seattle, USA", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
        //        cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
        //        cell.VerticalAlignment = PdfCell.ALIGN_TOP;
        //        table.AddCell(cell);

        //        //Separater Line
        //     Color   color = new Color(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
        //        DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
        //        DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
        //        document.Add(table);

        //        table = new PdfPTable(2);
        //        table.HorizontalAlignment = Element.ALIGN_LEFT;
        //        table.SetWidths(new float[] { 0.3f, 1f });
        //        table.SpacingBefore = 20f;

        //        //Employee Details
        //        cell = PhraseCell(new Phrase("Employee Record", FontFactory.GetFont("Arial", 12, Font.UNDERLINE, Color.BLACK)), PdfPCell.ALIGN_CENTER);
        //        cell.Colspan = 2;
        //        table.AddCell(cell);
        //        cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //        cell.Colspan = 2;
        //        cell.PaddingBottom = 30f;
        //        table.AddCell(cell);

        //        //Photo
        //        cell = ImageCell(string.Format("~/photos/{0}.jpg", dr["EmployeeId"]), 25f, PdfPCell.ALIGN_CENTER);
        //        table.AddCell(cell);

        //        //Name
        //        phrase = new Phrase();
        //        phrase.Add(new Chunk(dr["TitleOfCourtesy"] + " " + dr["FirstName"] + " " + dr["LastName"] + "\n", FontFactory.GetFont("Arial", 10, Font.BOLD, Color.BLACK)));
        //        phrase.Add(new Chunk("(" + dr["Title"].ToString() + ")", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)));
        //        cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
        //        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
        //        table.AddCell(cell);
        //        document.Add(table);

        //        DrawLine(writer, 160f, 80f, 160f, 690f, Color.BLACK);
        //        DrawLine(writer, 115f, document.Top - 200f, document.PageSize.Width - 100f, document.Top - 200f, Color.BLACK);

        //        table = new PdfPTable(2);
        //        table.SetWidths(new float[] { 0.5f, 2f });
        //        table.TotalWidth = 340f;
        //        table.LockedWidth = true;
        //        table.SpacingBefore = 20f;
        //        table.HorizontalAlignment = Element.ALIGN_RIGHT;

        //        //Employee Id
        //        table.AddCell(PhraseCell(new Phrase("Employee code:", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        table.AddCell(PhraseCell(new Phrase("000" + dr["EmployeeId"], FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //        cell.Colspan = 2;
        //        cell.PaddingBottom = 10f;
        //        table.AddCell(cell);


        //        //Address
        //        table.AddCell(PhraseCell(new Phrase("Address:", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
        //        phrase.Add(new Chunk(dr["City"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
        //        phrase.Add(new Chunk(dr["Region"] + " " + dr["Country"] + " " + dr["PostalCode"], FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)));
        //        table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //        cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //        cell.Colspan = 2;
        //        cell.PaddingBottom = 10f;
        //        table.AddCell(cell);

        //        //Date of Birth
        //        table.AddCell(PhraseCell(new Phrase("Date of Birth:", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        table.AddCell(PhraseCell(new Phrase(Convert.ToDateTime(dr["BirthDate"]).ToString("dd MMMM, yyyy"), FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //        cell.Colspan = 2;
        //        cell.PaddingBottom = 10f;
        //        table.AddCell(cell);

        //        //Phone
        //        table.AddCell(PhraseCell(new Phrase("Phone Number:", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        table.AddCell(PhraseCell(new Phrase(dr["HomePhone"] + " Ext: " + dr["Extension"], FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //        cell.Colspan = 2;
        //        cell.PaddingBottom = 10f;
        //        table.AddCell(cell);

        //        //Addtional Information
        //        table.AddCell(PhraseCell(new Phrase("Addtional Information:", FontFactory.GetFont("Arial", 8, Font.BOLD, Color.BLACK)), PdfPCell.ALIGN_LEFT));
        //        table.AddCell(PhraseCell(new Phrase(dr["Notes"].ToString(), FontFactory.GetFont("Arial", 8, Font.NORMAL, Color.BLACK)), PdfPCell.ALIGN_JUSTIFIED));
        //        document.Add(table);
        //        document.Close();
        //        byte[] bytes = memoryStream.ToArray();
        //        memoryStream.Close();
        //        Response.Clear();
        //        Response.ContentType = "application/pdf";
        //        Response.AddHeader("Content-Disposition", "attachment; filename=Employee.pdf");
        //        Response.ContentType = "application/pdf";
        //        Response.Buffer = true;
        //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //        Response.BinaryWrite(bytes);
        //        Response.End();
        //        Response.Close();
        //    }

        //}
    }
}