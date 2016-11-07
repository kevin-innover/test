using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using Model;

namespace BranD10.Ajax
{
    /// <summary>
    /// Brand 的摘要说明
    /// </summary>
    public class BrandHandler : IHttpHandler
    {
  JavaScriptSerializer serializer = new JavaScriptSerializer();
        public void ProcessRequest(HttpContext context)
        { 
          
            if (context.Request.QueryString["type"] == "get")
            {//get data
                // string id = context.Request.QueryString["ID"];
                var id = Int32.Parse(context.Request.QueryString["ID"]);
                var brand = DB.Context.From<Model.Brand>().Where(p => p.Id == id).First();
               
                var json = serializer.Serialize(brand);
                context.Response.Write(json);
             
            }
            else
            {//post new data
                string json = context.Request.Form[0].ToString();
                var brand = serializer.Deserialize<Brand>(json);
                //check
                //??

                //save
                int r = DB.Context.Update<Brand>(brand);

              
                context.Response.Write("[{'result':'ok'}]"); 
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