using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BranD10
{
    public class CommonMethod
    {
        #region Session 字段
        public static string S_UserID = "UserID";
        public static string S_User = "User";
        public static string S_UserName = "UserName";
        public static string S_Domain = "http://localhost:3002/";
        
        #endregion

        public static string TempFileFolder = "../upload/Temp";
        public static string UploadFolder = "../upload";
        public static string DefaultImage = "../upload";
        public static string Domain = "http://www.10brandchina.com";
        public static string RankTitleFormate = "{0}年度中国{1}行业十大品牌";
        public static Int32 MobileCodeLen = 4;
        /// <summary>
        /// 图片验证码过期时间 单位 秒
        /// </summary>
        public static Int32 CheckCodeTimeOut = 60;
        /// <summary>
        /// 手机验证码发送最小间隔
        /// </summary>
        public static double MobileCodeMinInterval = 60;
        /// <summary>
        /// 手机验证码 过期时间 单位 秒
        /// </summary>
        public static double MobileCodeTimeout = 60;

         /// <summary>
        /// 手机验证码 过期时间 单位 分钟
        /// </summary>
        public static double MobileCodeErrorClearInterval = 10;
       

        public static string UploadFolder_QR
        {
            get
            {
                return UploadFolder + @"/QR/";
            }
        }
        public static string CategoryDomain
        {
            get
            {
                return Domain + @"/vote/entry.html?id=";
            }
        }
        public static List<String> GetSelectedIDs(GridView gridview)
        {
            List<string> ids = new List<string>();
            foreach (GridViewRow row in gridview.Rows)
            {
                CheckBox CheckBox = (CheckBox)row.FindControl("CheckBox1");//找到CheckBox
                if (CheckBox == null)
                {
                    return null;
                }
                if (CheckBox.Checked == true)//判断是否选中
                {
                    var id = gridview.DataKeys[row.RowIndex].Value.ToString();
                    ids.Add(id);
                }
            }
            return ids;
        }

        public static void CheckFileName(string fileName, bool deleteIfExist = true)
        {
            try
            {
                string dir = Path.GetDirectoryName(fileName);
                if (!Directory.Exists(dir))
                {
                    Directory.CreateDirectory(dir);
                }
                if (File.Exists(fileName))
                {
                    File.Delete(fileName);
                }

            }
            catch (Exception)
            {

                throw;
            }

        }

        public static int GetPageCount(int entityCount, int pageSize)
        {
            var pageCount = entityCount / pageSize;
            if (entityCount % pageSize > 0)
            {
                pageCount += 1;
            }
            return pageCount;
        }

        /// <summary>
        /// 保存上传文件到本地
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static bool UploadFile(string destFileName, System.Web.UI.WebControls.FileUpload fileUpload)
        {
            try
            {
                File.WriteAllBytes(destFileName, fileUpload.FileBytes);
                if (destFileName.Contains(".zip"))
                {

                }
                return true;
            }
            catch (Exception ex)
            {
                //  logger.Error(ex);
                //   //File.AppendAllText("E:\\Philisense.MeetingService.UI\\debug3.txt", DateTime.Now.ToString() + ex.Message + "\r\n" + ex.Source + "\r\n" + ex.StackTrace);

                return false;
            }
        }
        /// <summary>
        /// 弹出消息提示 
        /// </summary>
        /// <param name="page"></param>
        /// <param name="msg"></param>
        /// <param name="type">类型  0 成功，1 失败 </param>
        public static void ShowMassage(Page page, string msg, int type)
        {
            if (type == 0)
            {
                page.ClientScript.RegisterClientScriptBlock(page.GetType(), "", string.Format("showSucceed(\"{0}\")", msg), true);   //弹出提示
            }
            // else if (type == 1)
            else  
            {
                page.ClientScript.RegisterClientScriptBlock(page.GetType(), "", string.Format("showErrorMsg(\"{0}\")", msg), true);   //弹出提示
            }

        }

        public static void ShowWin(Page page, string id)
        {
            page.ClientScript.RegisterClientScriptBlock(page.GetType(), "", string.Format("showWin(\"{0}\")", id), true);      //后台调用页面showWin()方法
        }


        public static string PageFormate
        {
            get
            {
                return "共 {0} 条 <a  href='?pageIndex=1{1}' >首页</a> <a href='?pageIndex={2}{1}'>上一页</a> <a href='?pageIndex={3}{1}'>下一页</a>  <a href='?pageIndex={4}{1}'>尾页</a> 当前第  {5} 页/共 {6} 页"; ;
            }
        }

        public static bool SendCode(string mobile, ref string code)
        {
            try
            {
                System.Random random = new Random();
                string str = "1234567890";
                code = "";
                for (int i = 1; i <= CommonMethod.MobileCodeLen; i++)
                {
                    code = code + str[random.Next(0, str.Length - 1)];
                }

                //send 

                return true;
            }
            catch (Exception ex)
            {
                // 
                return false;
            }
        }



    }
}