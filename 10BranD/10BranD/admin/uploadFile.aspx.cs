using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace BranD10.Pages
{
    public partial class uploadFile : System.Web.UI.Page
    {
        //  static string tempFileName = tempFileName;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_view_Click(object sender, EventArgs e)
        {
            saveImage();
        }

        private void saveImage()
        {
            string tempFileName = Path.Combine(CommonMethod.TempFileFolder, Guid.NewGuid() + ".jpg");
            string filePath = Server.MapPath(tempFileName);

            string dir = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }


            if (CommonMethod.UploadFile(filePath, this.FileUpload1))
            {
                Image1.ImageUrl = tempFileName;
            }
            this.HiddenField1.Value = tempFileName;
        }

        protected void btn_save_Click22(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Image1.ImageUrl))
            {
                string imageFile = Server.MapPath(Image1.ImageUrl);

                //  FileType ft = (FileType)(Int32.Parse(context.Session["FileType"].ToString()));
                string subPath = DateTime.Now.ToString("yyyy-MM-dd");
                string uploadPath = Path.Combine(CommonMethod.UploadFolder, subPath);

                uploadPath = HttpContext.Current.Server.MapPath(uploadPath);

                if (!Directory.Exists(uploadPath))
                {
                    Directory.CreateDirectory(uploadPath);
                }
                string fileName = DateTime.Now.ToString("HH-mm-ss-fff.PNG");
                string localPath = "../upload/" + subPath + "/" + fileName;
                string destFileName = Path.Combine(uploadPath, fileName);

                File.Copy(imageFile, destFileName);

                var brandid = Request["brandID"];

                int r = BranD10.DB.Context.Update<Model.Brand>(new Dos.ORM.Field("ImagePath"), localPath, "id=" + brandid);

                //下面这句代码缺少的话，上传成功后上传队列的显示不会自动消失
                if (r > 0)
                {
                    Image1.ImageUrl = "";
                }
                else
                {
                    //
                }
            }
        }


        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (FileUpload1.FileBytes.Length == 0)
            {
                return;
            }
            var fileType = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf('.'));

            string tempFileName = Path.Combine(CommonMethod.TempFileFolder, Guid.NewGuid() + fileType);
            string filePath = Server.MapPath(tempFileName);

            string dir = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }
            if (!CommonMethod.UploadFile(filePath, this.FileUpload1))
            {
                //log
                return;
            }

            string imageFile = filePath;

            string subPath = DateTime.Now.ToString("yyyy-MM-dd");
            string uploadPath = Path.Combine(CommonMethod.UploadFolder, subPath);

            uploadPath = HttpContext.Current.Server.MapPath(uploadPath);

            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            string fileName = DateTime.Now.ToString("HH-mm-ss-fff") + fileType;
            string localPath = "../upload/" + subPath + "/" + fileName;
            string destFileName = Path.Combine(uploadPath, fileName);

            File.Move(imageFile, destFileName);

            var id = int.Parse(Request["ID"]);
            var field = Request["field"];
            var table = Request["table"];
            var type = Request["type"];

            int r = 0;

            if (table == "Brand" && id > 0)
            {
                r = BranD10.DB.Context.Update<Model.Brand>(new Dos.ORM.Field(field), localPath, "id=" + id);
            }
            else if (table == "User" && id > 0)
            {
                r = BranD10.DB.Context.Update<Model.Users>(new Dos.ORM.Field(field), localPath, "id=" + id);

            }

            else if (table == "contract" && id > 0)
            {
                r = BranD10.DB.Context.Update<Model.Contract>(new Dos.ORM.Field(field), localPath, "id=" + id);
            }

            bool show = false;

            if (id > 0)
            {
                if (r > 0)
                {
                    show = true;
                }
                else
                {
                    CommonMethod.ShowMassage(this, "上传失败，请稍后重试！", 1);
                }
            }
            else
            {
                show = true;
            }

            if (show)
            {
                if (type == "img")
                {
                    Image1.ImageUrl = localPath;
                }
                HiddenField1.Value = localPath;
            }
            //下面这句代码缺少的话，上传成功后上传队列的显示不会自动消失
        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {

        }

        protected void FileUpload1_DataBinding(object sender, EventArgs e)
        {

        }
    }
}