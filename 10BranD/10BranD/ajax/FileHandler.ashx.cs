using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace BranD10
{
    /// <summary>
    /// FileHandler 的摘要说明
    /// </summary>
    public class FileHandler : IHttpHandler
    {

        public void ProcessRequest1(HttpContext context)
        {
            try
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Hello World");
                context.Request.ContentEncoding = System.Text.Encoding.UTF8;
                HttpPostedFile file = context.Request.Files["Filedata"];
                string uploadPath = HttpContext.Current.Server.MapPath("../Upload");

                //  FileType ft = (FileType)(Int32.Parse(context.Session["FileType"].ToString()));
                string subPath = DateTime.Now.ToString("yyyy-MM-dd");
                uploadPath = Path.Combine(uploadPath, subPath);

                if (file != null)
                {

                    if (!Directory.Exists(uploadPath))
                    {
                        Directory.CreateDirectory(uploadPath);
                    }
                    string fileName = DateTime.Now.ToString("HH-mm-ss-fff.PNG");
                  string localPath="../Upload/"+subPath+"/"+fileName;
                    fileName=Path.Combine(uploadPath, fileName);
                    file.SaveAs(fileName);

                    #region 保存数据至数据库
                    var brandid = context.Request.QueryString["brandID"];
                   
                   int r= BranD10.DB.Context.Update<Model.Brand>(new Dos.ORM.Field("ImagePath"),localPath,"id=" + brandid);
                    #endregion
                    //下面这句代码缺少的话，上传成功后上传队列的显示不会自动消失
                   if (r > 0)
                   { context.Response.Write("1"); }
                   else
                   {
                       context.Response.Write("0");
                   }
                }
                else
                {
                    context.Response.Write("0");
                }
            }
            catch (Exception ex)
            {
                //   File.WriteAllText("E:\\Philisense.MeetingService.UI\\debug2.txt", ex.Message+"\r\n"+ex.Source+"\r\n"+ex.StackTrace );

                throw;
                //  SystemConfig.logger.Error(ex.Message);
            }
        }


        public void ProcessRequest(HttpContext context)
        {
            try
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Hello World");
                context.Request.ContentEncoding = System.Text.Encoding.UTF8;
                HttpPostedFile file = context.Request.Files["Filedata"];
                string uploadPath = HttpContext.Current.Server.MapPath("../Upload");

                //  FileType ft = (FileType)(Int32.Parse(context.Session["FileType"].ToString()));
                string subPath = DateTime.Now.ToString("yyyy-MM-dd");
                uploadPath = Path.Combine(uploadPath, subPath);

                if (file != null)
                {
                   
                   
                    if (!Directory.Exists(uploadPath))
                    {
                        Directory.CreateDirectory(uploadPath);
                    }
                  var fileType=  file.FileName.Substring(file.FileName.LastIndexOf('.'));
                  string fileName = DateTime.Now.ToString("HH-mm-ss-fff.PNG") + fileType;
                    string localPath = "../Upload/" + subPath + "/" + fileName;
                    fileName = Path.Combine(uploadPath, fileName);
                    file.SaveAs(fileName);

                    #region 保存数据至数据库
                    var brandid = context.Request.QueryString["brandID"];

                    int r = BranD10.DB.Context.Update<Model.Brand>(new Dos.ORM.Field("ImagePath"), localPath, "id=" + brandid);
                    #endregion
                    //下面这句代码缺少的话，上传成功后上传队列的显示不会自动消失
                    if (r > 0)
                    { context.Response.Write("1"); }
                    else
                    {
                        context.Response.Write("0");
                    }
                }
                else
                {
                    context.Response.Write("0");
                }
            }
            catch (Exception ex)
            {
                //   File.WriteAllText("E:\\Philisense.MeetingService.UI\\debug2.txt", ex.Message+"\r\n"+ex.Source+"\r\n"+ex.StackTrace );

                throw;
                //  SystemConfig.logger.Error(ex.Message);
            }
        }



       

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}