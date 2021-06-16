using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rstemenu
{
    public partial class PromoImages : System.Web.UI.Page
    {
        Methods obj = new Methods();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                BindPromotionImages();

        }

        private void BindPromotionImages()
        {
            DataTable dt = obj.GetPromotionImages();
            datatable.DataSource = dt;
            datatable.DataBind();
            int i = 0;
            foreach (GridViewRow row in datatable.Rows)
            {

                String Chk = dt.Rows[i]["using"].ToString();
                Label chkSelected = (Label)row.FindControl("chk_use");
                if (Chk == "1" || Chk.ToLower() == "true")
                {
                    chkSelected.Text = "Using this Image";
                }
                i++;
            }
        }

        protected void datatable_PreRender(object sender, EventArgs e)
        {
            if (datatable.Rows.Count > 0)
            {
                datatable.UseAccessibleHeader = true;
                datatable.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void datatable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton l = (LinkButton)e.Row.FindControl("btn_Delete");
                LinkButton btn_use = (LinkButton)e.Row.FindControl("btn_use");

                if (l != null && l.CommandName == "Delete")
                    l.OnClientClick = "return confirm('Are you sure to delete this Image?');";

                if (btn_use != null && btn_use.CommandName == "Use")
                    btn_use.OnClientClick = "return confirm('Are you sure to use this Image?');";
            }
        }


        protected void datatable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            BindPromotionImages();
        }

        protected void datatable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (((LinkButton)e.CommandSource).CommandName)
                {
                    case "Delete":
                        {
                            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                            string ImageName = commandArgs[1];
                            string ID = commandArgs[0];
                            DeleteImagefromPath(ImageName.ToString());
                            obj.DeletePhotoRecord(ID.ToString());
                            BindPromotionImages();
                            break;
                        }

                    case "Use":
                        {
                            obj.UPdatePhotoImage(Convert.ToInt32(e.CommandArgument.ToString()));
                            BindPromotionImages();
                            break;
                        }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }


        public void DeleteImagefromPath(string ImageName)
        {
            var filePath = "http://orthopar.org/images/" + ImageName ;
            if (File.Exists(filePath))
                File.Delete(filePath);

        }

        //protected void UploadImage(object sender, EventArgs e)
        //{
        //    string ItemImg = "";

        //    if (flupImage.HasFile)
        //    {
        //        int filesnubmer = flupImage.PostedFiles.Count;
        //        for (int i = 0; i < filesnubmer; i++)
        //        {
        //            if (CheckImageFileType(i))
        //            {
        //                string imgtype = Path.GetExtension(flupImage.PostedFiles[i].FileName);
        //                ItemImg = "m" + DateTime.Now.Month.ToString() + "d" + DateTime.Now.Day.ToString() + "y" + DateTime.Now.Year.ToString() + "h" + DateTime.Now.Hour.ToString() + "m" + DateTime.Now.Minute.ToString() + "ml" + DateTime.Now.Millisecond.ToString() + "_Item" + imgtype;

        //                try
        //                {
        //                    string filename = ItemImg;
        //                    string targetPath = "http://orthopar.org/images/" + filename;
        //                    Stream strm = flupImage.PostedFiles[i].InputStream;
        //                    var targetFile = targetPath;

        //                    using (var imgToResize = System.Drawing.Image.FromStream(strm))
        //                    {
        //                        int width = 1200;
        //                        int height = 1200;
        //                        int sourceWidth = imgToResize.Width;
        //                        int sourceHeight = imgToResize.Height;

        //                        float nPercent = 0;
        //                        float nPercentW = 0;
        //                        float nPercentH = 0;

        //                        nPercentW = ((float)width / (float)sourceWidth);
        //                        nPercentH = ((float)height / (float)sourceHeight);

        //                        if (nPercentH < nPercentW)

        //                            nPercent = nPercentH;
        //                        else
        //                            nPercent = nPercentW;

        //                        int destWidth = (int)(sourceWidth * nPercent);
        //                        int destHeight = (int)(sourceHeight * nPercent);

        //                        Bitmap b = new Bitmap(destWidth, destHeight);

        //                        Graphics g = Graphics.FromImage((System.Drawing.Image)b);
        //                        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        //                        b.SetResolution(72, 72);
        //                        g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);
        //                        g.Save();
        //                        b.Save(targetPath, imgToResize.RawFormat);
        //                        g.Dispose();
        //                        string imageExttype = imgtype.Replace(".", "");
        //                        flupImage.Dispose();

        //                        obj.SaveImageInformation(filename, imgtype, User.Identity.Name);
        //                        BindPromotionImages();
        //                    }
        //                }

        //                catch (Exception ex)
        //                {
        //                    Response.Write(ex.ToString());
        //                }
        //            }
        //            else
        //            {
        //                Response.Write("<script> alert('Image Format is not Valid !'); </script>");
        //            }

        //        }
        //    }




        //}

        //public bool CheckImageFileType(int j)
        //{
        //    string imgtype = Path.GetExtension(flupImage.PostedFiles[j].FileName);
        //    string[] validFileTypes = { "bmp", "jpg", "png", "gif", "jpeg" };
        //    bool isValidType = false;
        //    for (int i = 0; i < validFileTypes.Length; i++)
        //    {
        //        if (imgtype == "." + validFileTypes[i])
        //        {
        //            isValidType = true;
        //            break;
        //        }
        //    }

        //    if (!isValidType)
        //    {
        //        return false;

        //    }
        //    else
        //        return true;


        //}
    }
}