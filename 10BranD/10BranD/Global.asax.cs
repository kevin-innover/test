using System;
using System.Collections.Generic;
using System.Linq;
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
