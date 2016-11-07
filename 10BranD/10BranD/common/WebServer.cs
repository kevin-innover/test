using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BranD10
{
    public class WebServer
    {
        public static void Start()
        {
            //init log4


            TicketManager.Instance.Start();
        }
    }
}