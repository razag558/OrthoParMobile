using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class all_patients_record : System.Web.UI.Page
    {
        Methods obj = new Methods();
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {

            ReSetting_Session_values();

            Get_patients_record();

        }
        protected void Get_patients_record()
        {
            username = User.Identity.Name;

            gv_patient_info.DataSource = obj.fetching_patient_info(username);
            gv_patient_info.DataBind();
        }

        protected void datatable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Get_patients_record();
        }

        protected void datatable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (((LinkButton)e.CommandSource).CommandName)
                {
                    case "Delete":
                        obj.detetingrecordbyid((e.CommandArgument).ToString());
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('User Deleted Successfully');", true);
                        break;
                }
            }
            catch (Exception ex)
            {
                Response.Write("" + ex);
            }
        }

        protected void download_csv_Click(object sender, EventArgs e)
        {
            username = User.Identity.Name;
            DataTable datatable = obj.fetching_patient_info(username);


            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=All_Patients" + ".csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding(1252);

            StringBuilder columnbind = new StringBuilder();


            if (datatable.Rows.Count > 0)
            {
                columnbind.Append("," + "," + "," + " ," + " ," + "P A T I E N T S " + "," + " R E C O R D ");


                columnbind.Append("\r\n");
                columnbind.Append("ID");
                columnbind.Append(",");

                columnbind.Append("Doctor Name");
                columnbind.Append(",");

                columnbind.Append("Patient Name");
                columnbind.Append(",");


                columnbind.Append("Patient ID");
                columnbind.Append(",");


                columnbind.Append("Patient Gender");
                columnbind.Append(",");


                columnbind.Append("Impact Teeth ");
                columnbind.Append(",");


                columnbind.Append("Missing Teeth");
                columnbind.Append(",");


                columnbind.Append("Extracted Teeth");
                columnbind.Append(",");


                columnbind.Append("replacement_teeth");
                columnbind.Append(",");


                columnbind.Append("restorative");
                columnbind.Append(",");


                columnbind.Append("entry_date");
                columnbind.Append(",");


                for (int i = 0; i < datatable.Rows.Count; i++)
                {

                    columnbind.Append("\r\n");
                    columnbind.Append(datatable.Rows[i]["id"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["doc_name"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["pat_name"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["pat_id"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["pat_gender"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["impact_teeth"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["missing_teeth"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["extracted_teeth"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["replacement_teeth"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["restorative"].ToString() + ",");
                    columnbind.Append(datatable.Rows[i]["entry_date"].ToString() + ",");


                }
            }


            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }

        protected void download_pdf_Click(object sender, EventArgs e)
        {

            username = User.Identity.Name;

            DataTable datatable = obj.fetching_patient_info(username);




            StringBuilder columnbind = new StringBuilder();

            columnbind.Append("<div>");
            columnbind.Append("<h1>PATIENTS RECORD</h1>  ");
            columnbind.Append("</div>");

            columnbind.Append("<table width='100%' border='1' >");
            if (datatable.Rows.Count > 0)
            {

                columnbind.Append("<tr><td> ID </td><td>Doctor Name</td><td>Patient Name</td><td>Patient ID </td><td>Gender</td><td>Impact Teeth</td><td>Missing Teeth</td><td>Extracted Teeth</td><td>Replacement Teeth</td><td>Restorative Teeth</td><td>Entry Date</td></tr>  ");

                for (int i = 0; i < datatable.Rows.Count; i++)
                {

                    columnbind.Append("<tr><td>" + datatable.Rows[i]["id"].ToString() + "</td><td>" + datatable.Rows[i]["doc_name"].ToString() + "</td><td>" + datatable.Rows[i]["pat_name"].ToString() + "</td><td>" + datatable.Rows[i]["pat_id"].ToString() + "</td><td>" + datatable.Rows[i]["pat_gender"].ToString() + "</td><td>" + datatable.Rows[i]["impact_teeth"].ToString() + "</td><td>" + datatable.Rows[i]["missing_teeth"].ToString() + "</td><td>" + datatable.Rows[i]["extracted_teeth"].ToString() + "</td><td>" + datatable.Rows[i]["replacement_teeth"].ToString() + "</td><td>" + datatable.Rows[i]["restorative"].ToString() + "</td><td>" + datatable.Rows[i]["entry_date"].ToString() + "</td></tr>");
                }

            }
            columnbind.Append("</table>");

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
            Response.AddHeader("content-disposition", "attachment;filename=All_Patients" + ".pdf");
            Response.Charset = "";
            Response.ContentType = "application/text";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding(1252);
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
            Response.Close();
        }

        public void ReSetting_Session_values()
        {
            Session["Patient_ID"] = 0;
            Session["Patient_customID"] = 0;
            Session["Patient_Name"] = "";

            Session["pre_uper_anter_segment_UR2_UR3"] = "";
            Session["pre_uper_anter_segment_UR1_UR2"] = "";
            Session["pre_uper_anter_segment_UL1_UR1"] = "";
            Session["pre_uper_anter_segment_UL2_UL1"] = "";
            Session["pre_uper_anter_segment_UL3_UL2"] = "";

            Session["pre_uper_anter_segment_type_definer"] = "";

            Session["pre_lower_anter_segment_UR2_UR3"] = "";
            Session["pre_lower_anter_segment_UR1_UR2"] = "";
            Session["pre_lower_anter_segment_UL1_UR1"] = "";
            Session["pre_lower_anter_segment_UL2_UL1"] = "";
            Session["pre_lower_anter_segment_UL3_UL2"] = "";

            Session["pre_lower_anter_segment_type_definer"] = "";

            Session["pre_right_buccol_Occlusion_anterior"] = "";
            Session["pre_right_buccol_Occlusion_vertical"] = "";
            Session["pre_right_buccol_Occlusion_transverse"] = "";

            Session["pre_left_buccol_Occlusion_anterior"] = "";
            Session["pre_left_buccol_Occlusion_vertical"] = "";
            Session["pre_left_buccol_Occlusion_transverse"] = "";


            Session["pre_Postive_overjet"] = "";
            Session["pre_Negative_overjet"] = "";
            Session["pre_Overjet_type"] = "";

            Session["pre_Positive_overbite"] = "";
            Session["pre_Negative_overbite"] = "";
            Session["pre_Overbite_type"] = "";

            Session["pre_Midline"] = "";

            //Post Sessions

            Session["post_uper_anter_segment_UR2_UR3"] = "";
            Session["post_uper_anter_segment_UR1_UR2"] = "";
            Session["post_uper_anter_segment_UL1_UR1"] = "";
            Session["post_uper_anter_segment_UL2_UL1"] = "";
            Session["post_uper_anter_segment_UL3_UL2"] = "";

            Session["post_uper_anter_segment_type_definer"] = "";

            Session["post_lower_anter_segment_UR2_UR3"] = "";
            Session["post_lower_anter_segment_UR1_UR2"] = "";
            Session["post_lower_anter_segment_UL1_UR1"] = "";
            Session["post_lower_anter_segment_UL1_UR1"] = "";
            Session["post_lower_anter_segment_UL2_UL1"] = "";
            Session["post_lower_anter_segment_UL3_UL2"] = "";

            Session["post_lower_anter_segment_type_definer"] = "";

            Session["post_right_buccol_Occlusion_anterior"] = "";
            Session["post_right_buccol_Occlusion_vertical"] = "";
            Session["post_right_buccol_Occlusion_transverse"] = "";

            Session["post_left_buccol_Occlusion_anterior"] = "";
            Session["post_left_buccol_Occlusion_vertical"] = "";
            Session["post_left_buccol_Occlusion_transverse"] = "";

            Session["post_Postive_overjet"] = "";
            Session["post_Negative_overjet"] = "";

            Session["post_Overjet_type"] = "";

            Session["post_Positive_overbite"] = "";
            Session["post_Negative_overbite"] = "";

            Session["post_Overbite_type"] = "";

            Session["post_Midline"] = "";

            // ************************************Additon Work*********************************
            //pre values
            Session["pre_lower_crowding_Sum_Value"] = 0;
            Session["pre_uper_crowding_Sum_Value"] = 0;
            Session["pre_left_Buccal_Sum_Value"] = 0;
            Session["pre_right_Buccal_Sum_Value"] = 0;

            Session["pre_overjet_Sum_Value"] = 0;
            Session["pre_Overbite_Sum_Value"] = 0;
            Session["pre_midline_Value"] = 0;
            //post values
            Session["post_lower_crowding_Sum_Value"] = 0;
            Session["post_uper_crowding_Sum_Value"] = 0;
            Session["post_left_Buccal_Sum_Value"] = 0;
            Session["post_right_Buccal_Sum_Value"] = 0;

            Session["post_overjet_Sum_Value"] = 0;
            Session["post_Overbite_Sum_Value"] = 0;
            Session["post_midline_Value"] = 0;

            Session["Posttreatment_value"] = "-1";
            Session["Pretreatment_value"] = "-1";

            Session["btn_pre_treatemnt"] = "0";
            Session["btn_post_treatment"] = "0";

        }
    }
}