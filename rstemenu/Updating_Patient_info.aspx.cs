using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class Updating_Patient_info : System.Web.UI.Page
    {

        string st_restortive, st_replaced, st_extracted, st_missing, st_impact, st_gender, st_pat_name, st_pat_id, st_doc_name, st_entrydate, doc_id;
        int id;
        protected void btn_update_Click(object sender, EventArgs e)
        {
            string gender = "";
            string impact_teeth = "";
            string missing_teeth = "";
            string extracted = "";
            string replacement = "";
            string restorative = "";
            // GENDER
            if (gen_male.Checked)
            {
                gender = "Male";
            }
            else if (gen_female.Checked)
            {
                gender = "Female";
            }


            // IMPACT
            if (impct_yes.Checked)
            {
                impact_teeth = "Yes";
            }
            else if (impct_no.Checked)
            {
                impact_teeth = "No";
            }

            // MISSING
            if (missing_yes.Checked)
            {
                missing_teeth = "Yes";
            }
            else if (missing_no.Checked)
            {
                missing_teeth = "No";
            }

            // EXTRACTED
            if (extracted_yes.Checked)
            {
                extracted = "Yes";
            }
            else if (extracted_no.Checked)
            {
                extracted = "No";
            }

            // REPLACEMENT
            if (replacement_yes.Checked)
            {
                replacement = "Yes";
            }
            else if (replacement_no.Checked)
            {
                replacement = "No";
            }
            //  RESTORTIVE
            if (restorative_yes.Checked)
            {
                restorative = "Yes";
            }
            else if (restorative_no.Checked)
            {
                restorative = "No";
            }

            if (doctor_name.Text.Length > 0 && pat_id.Text.Length > 0 && pat_name.Text.Length > 0 && entry_date.Text.Length > 0 && gender.Length > 0 && impact_teeth.Length > 0 && missing_teeth.Length > 0 && extracted.Length > 0 && replacement.Length > 0 && restorative.Length > 0)
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
                String username = User.Identity.Name;
                obj.submittion_of_Patient_info_update(id, doctor_name.Text, pat_id.Text, pat_name.Text, gender, impact_teeth, missing_teeth, extracted, replacement, restorative,Convert.ToDateTime(entry_date.Text), username);
                Response.Redirect("~/all_patients_record.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alert..!", "alert('Please Fill all categories')", true);

            }
        }

       
        Methods obj = new Methods();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    DataTable fetcheddata;
                    id = Convert.ToInt32(Request.QueryString["id"]);
                    fetcheddata = obj.fetching_patient_info_for_update(id);
                    foreach (DataRow row in fetcheddata.Rows)
                    {
                        doc_id = row["id"].ToString();
                        st_doc_name = row["doc_name"].ToString();
                        st_pat_id = row["pat_id"].ToString();
                        st_pat_name = row["pat_name"].ToString();
                        st_gender = row["pat_gender"].ToString().Trim();
                        st_impact = row["impact_teeth"].ToString().Trim();
                        st_missing = row["missing_teeth"].ToString().Trim();
                        st_extracted = row["extracted_teeth"].ToString().Trim();
                        st_replaced = row["replacement_teeth"].ToString().Trim();
                        st_restortive = row["restorative"].ToString().Trim();
                        st_entrydate = row["entry_date"].ToString();
                    }

                    doctor_name.Text = st_doc_name;
                    pat_id.Text = st_pat_id;
                    pat_name.Text = st_pat_name;
                    entry_date.Text = st_entrydate;

                    if (st_gender.Equals("Male"))
                    {
                        gen_male.Checked = true;

                    }
                    else if (st_gender.Equals("Female"))
                    {
                        gen_female.Checked = true;

                    }

                    // impact......

                    if (st_impact == "Yes")
                    {
                        impct_yes.Checked = true;

                    }
                    else if (st_impact == "No")
                    {
                        impct_no.Checked = true;

                    }

                    //   missing


                    if (st_missing == "Yes")
                    {
                        missing_yes.Checked = true;

                    }
                    else if (st_impact == "No")
                    {
                        missing_no.Checked = true;
                    }

                    //   extracted


                    if (st_extracted == "Yes")
                    {
                        extracted_yes.Checked = true;

                    }
                    else if (st_extracted == "No")
                    {
                        extracted_no.Checked = true;

                    }

                    //   replacement


                    if (st_replaced == "Yes")
                    {
                        replacement_yes.Checked = true;

                    }
                    else if (st_replaced == "No")
                    {
                        replacement_no.Checked = true;

                    }

                    //   restorative


                    if (st_restortive == "Yes")
                    {
                        restorative_yes.Checked = true;

                    }
                    else if (st_restortive == "No")
                    {
                        restorative_no.Checked = true;

                    }

                }
            }   }      }
}