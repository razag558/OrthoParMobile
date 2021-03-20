using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class EditparsValues : System.Web.UI.Page
    {
        Methods obj = new Methods();
        int id;
        int prevalue = 0;
        int  postvalue = 0;
        double percentage;
        float result_value;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    DataTable fetcheddata;
                    id = Convert.ToInt32(Request.QueryString["id"]);
                    fetcheddata = obj.fetching_complete_Parsvalues_pre(id);
                    foreach (DataRow row in fetcheddata.Rows)
                    {
                        txt_crowding_a.Text = fetcheddata.Rows[0]["c_value"].ToString();
                        txt_buccal_f.Text = fetcheddata.Rows[0]["f_value"].ToString();
                        txt_overbite_i.Text = fetcheddata.Rows[0]["i_value"].ToString();
                        txt_overjet_l.Text = fetcheddata.Rows[0]["l_value"].ToString();
                        txt_midline_n.Text = fetcheddata.Rows[0]["n_value"].ToString();


                    }

                    fetcheddata = obj.fetching_complete_Parsvalues(id);
                    foreach (DataRow row in fetcheddata.Rows)
                    {
                        txt_crowding_c_2.Text = fetcheddata.Rows[0]["c_value"].ToString();
                        txt_buccal_f_2.Text = fetcheddata.Rows[0]["f_value"].ToString();
                        txt_oberbite_i_2.Text = fetcheddata.Rows[0]["i_value"].ToString();
                        txt_ovejet_l_2.Text = fetcheddata.Rows[0]["l_value"].ToString();
                        txt_midline_m_2.Text = fetcheddata.Rows[0]["n_value"].ToString();
                        
                        txt_p1_value.Text = fetcheddata.Rows[0]["pretreatment_value"].ToString();
                        txt_p2.Text = fetcheddata.Rows[0]["posttreatment_value"].ToString();

                        txt_percentage.Text = fetcheddata.Rows[0]["percentage_value"].ToString();
                        txt_point.Text = fetcheddata.Rows[0]["point_value"].ToString();
                    }

                   
                }

            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string crowding1 = "0";
                string buccal1 = "0";
                string overjet1  = "0";
            string overbite1 = "0";
            string midline1 = "0";

            string crowding2 = "0";
            string buccal2 = "0";
            string overjet2 = "0";
            string overbite2 = "0";
            string midline2 = "0";

            crowding1 = txt_crowding_a.Text;
            buccal1 = txt_buccal_f.Text;
            overjet1 = txt_overjet_l.Text;
            overbite1 = txt_overbite_i.Text;
            midline1 = txt_midline_n.Text;

            crowding2 = txt_crowding_c_2.Text;
            buccal2 = txt_buccal_f_2.Text;
            overjet2 = txt_ovejet_l_2.Text;
            overbite2 = txt_oberbite_i_2.Text;
            midline2 = txt_midline_m_2.Text;
            if(crowding1.Length>0 && buccal1.Length > 0 && overjet1.Length > 0 && overbite1.Length > 0 && midline1.Length > 0)
            {
                prevalue = Convert.ToInt32(crowding1) + Convert.ToInt32(buccal1) + Convert.ToInt32(overjet1) + Convert.ToInt32(overbite1) + Convert.ToInt32(midline1);
            }

            if(crowding2.Length > 0 && buccal2.Length > 0 && overjet2.Length > 0 && overbite2.Length > 0 && midline2.Length > 0)
            {
                postvalue = Convert.ToInt32(crowding2) + Convert.ToInt32(buccal2) + Convert.ToInt32(overjet2) + Convert.ToInt32(overbite2) + Convert.ToInt32(midline2);
            }
          
            percentage = Math.Round(((Convert.ToDouble(prevalue) - Convert.ToDouble(postvalue)) * 100) / Convert.ToDouble(prevalue), 2);
            result_value = Convert.ToInt32(prevalue) - Convert.ToInt32(postvalue);
            id = Convert.ToInt32(Request.QueryString["id"]);
            string username_active = User.Identity.Name.ToString();
            obj.Updating_Patient_values_results(txt_crowding_a.Text, txt_buccal_f.Text, txt_overjet_l.Text, txt_overbite_i.Text, txt_midline_n.Text, txt_crowding_c_2.Text, txt_buccal_f_2.Text, txt_ovejet_l_2.Text, txt_oberbite_i_2.Text, txt_midline_m_2.Text, id,txt_p1_value.Text,txt_p2.Text,txt_percentage.Text,txt_point.Text, username_active);
            Response.Redirect("~/all_patients_record.aspx");
        }

        protected void Calculate_Click(object sender, EventArgs e)
        {
            string crowding1 = "0";
            string buccal1 = "0";
            string overjet1 = "0";
            string overbite1 = "0";
            string midline1 = "0";

            string crowding2 = "0";
            string buccal2 = "0";
            string overjet2 = "0";
            string overbite2 = "0";
            string midline2 = "0";

            crowding1 = txt_crowding_a.Text;
            buccal1 = txt_buccal_f.Text;
            overjet1 = txt_overjet_l.Text;
            overbite1 = txt_overbite_i.Text;
            midline1 = txt_midline_n.Text;

            crowding2 = txt_crowding_c_2.Text;
            buccal2 = txt_buccal_f_2.Text;
            overjet2 = txt_ovejet_l_2.Text;
            overbite2 = txt_oberbite_i_2.Text;
            midline2 = txt_midline_m_2.Text;

            if (crowding1.Length > 0 && buccal1.Length > 0 && overjet1.Length > 0 && overbite1.Length > 0 && midline1.Length > 0)
            {
                prevalue = Convert.ToInt32(txt_crowding_a.Text) + Convert.ToInt32(txt_buccal_f.Text) + Convert.ToInt32(txt_overjet_l.Text) + Convert.ToInt32(txt_overbite_i.Text) + Convert.ToInt32(txt_midline_n.Text);
            }

            if (crowding2.Length > 0 && buccal2.Length > 0 && overjet2.Length > 0 && overbite2.Length > 0 && midline2.Length > 0)
            {
                postvalue = Convert.ToInt32(txt_crowding_c_2.Text) + Convert.ToInt32(txt_buccal_f_2.Text) + Convert.ToInt32(txt_ovejet_l_2.Text) + Convert.ToInt32(txt_oberbite_i_2.Text) + Convert.ToInt32(txt_midline_m_2.Text);
            }

               
            percentage = Math.Round(((Convert.ToDouble(prevalue) - Convert.ToDouble(postvalue)) * 100) / Convert.ToDouble(prevalue), 2);
            result_value = Convert.ToInt32(prevalue) - Convert.ToInt32(postvalue);
            txt_p1_value.Text = Convert.ToString(prevalue);
            txt_p2.Text = Convert.ToString(postvalue);
            txt_percentage.Text = Convert.ToString(percentage);
            txt_point.Text = Convert.ToString(result_value);
        }
    }
}