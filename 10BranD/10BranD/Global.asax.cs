using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BranD10
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            CommonMethod.ServerPath = Server.MapPath("/");
            // 在应用程序启动时运行的代码
            //BranD10.QRcodecs.CreateCode_Choose("老婆我爱你！", "d:\\test.png");
            //var sss =  BranD10.QRcodecs.CodeDecoder("d:\\test.png");

            //  var ss=  ((IndustryStatusEnum)2).ToString();

            WebServer.Start();
        }

        void Application_End(object sender, EventArgs e)
        {
            //  在应用程序关闭时运行的代码

        }

        void Application_Error(object sender, EventArgs e)
        {
            // 在出现未处理的错误时运行的代码 
            Exception ex = Server.GetLastError().GetBaseException();
            Log.logger.Error("Application_Error", ex);

            StringBuilder str = new StringBuilder();
            if (Session != null && Session[CommonMethod.S_UserName] != null)
            {
                str.Append("\r\n.客户信息：" + Session[CommonMethod.S_UserName].ToString());
            }

            string ip = "";
            if (Request.ServerVariables.Get("HTTP_X_FORWARDED_FOR") != null)
            {
                ip = Request.ServerVariables.Get("HTTP_X_FORWARDED_FOR").ToString().Trim();
            }
            else
            {
                ip = Request.ServerVariables.Get("Remote_Addr").ToString().Trim();
            }
            str.Append("\r\n\tIp:" + ip);
            str.Append("\r\n\t浏览器:" + Request.Browser.Browser.ToString());
            str.Append("\r\n\t浏览器版本:" + Request.Browser.MajorVersion.ToString());
            str.Append("\r\n\t操作系统:" + Request.Browser.Platform.ToString());
            str.Append("\r\n.错误信息：");
            str.Append("\r\n\t页面：" + Request.Url.ToString());
            str.Append("\r\n\t错误信息：" + ex.Message);
            str.Append("\r\n\t错误源：" + ex.Source);
            str.Append("\r\n\t异常方法：" + ex.TargetSite);
            str.Append("\r\n\t堆栈信息：" + ex.StackTrace);
            str.Append("\r\n--------------------------------------------------------------------------------------------------");
            //创建路径 
            string upLoadPath = Server.MapPath("~/log/");
            if (!System.IO.Directory.Exists(upLoadPath))
            {
                System.IO.Directory.CreateDirectory(upLoadPath);
            }
            //创建文件 写入错误 
            System.IO.File.AppendAllText(upLoadPath + DateTime.Now.ToString("yyyy.MM.dd") + ".log", str.ToString(), System.Text.Encoding.UTF8);
            //处理完及时清理异常 
            Server.ClearError();
            //跳转至出错页面 
            //  Response.Redirect("~/error.html");

            Log.ErrorFormat(str .ToString());

        }

        void Session_Start(object sender, EventArgs e)
        {
            Session[CommonMethod.S_UserID] = 1;
            Session[CommonMethod.S_UserName] = "username";
            // Session[CommonMethod.S_User] = DB.Context.From<Model.Brand>().Where(p => p.Id == 3).First();

            // 在新会话启动时运行的代码

        }

        void Session_End(object sender, EventArgs e)
        {
            // 在会话结束时运行的代码。 
            // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
            // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
            // 或 SQLServer，则不会引发该事件。

        }

    }
}
