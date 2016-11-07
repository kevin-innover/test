using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Dos.ORM;
namespace BranD10.Pages
{
    public partial class VoteAudit : System.Web.UI.Page
    {
        private int CategoryID = 0;
        private int timeZone = 0;
        private int ispc;
        private bool search = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            var a = DB.Context.From<Model.Users>(" Id=2");

            //if (Session["UserName"] == null)
            //{
            //    Response.Redirect("Default.aspx");
            //}
            if (!IsPostBack)
            {

            }
            else
            {

            }
            int id = 0;

            if (!string.IsNullOrEmpty(Request["action"]))
            {
                if (Request["action"] == "search")
                {
                    search = true;
                    CategoryID = int.Parse(Request["catid"]);

                    if (!string.IsNullOrEmpty(Request["time"]))
                    {
                        timeZone = int.Parse(Request["time"]);
                    }
                    ispc = int.Parse(Request["ispc"]);
                }
                else if (Request["action"] == "clear")
                {
                    ClearData();
                }

            }
            else
            {
                //if (!string.IsNullOrEmpty(Request["ID"]))
                //{
                //    id = int.Parse(Request["ID"]);
                //}
                //if (!string.IsNullOrEmpty(Request["CategoryID"]))
                //{
                //    CategoryID = int.Parse(Request["CategoryID"]);
                //}

            }

            BindData();
        }

        private void ClearData()
        {
            DB.Context.DeleteAll<Model.Ticketcache>();
        }

        /// <summary>
        ///刷新GridView数据
        /// </summary>
        private void BindData()
        {
            var source = DB.Context.From<Model.Ticketcache>();
            if (timeZone > 0)
            {
                source = source.Where(p => p.CreateTime >= DateTime.Now.AddSeconds(-timeZone));
            }

            //1 phone,2 pc,3 app,4 member,5auto
            if (ispc > 0)
            {
                source = source.Where(p => p.Type == ispc);
            }

            if (CategoryID > 0)
            {

                source = source.Where(p => p.IndustryID == CategoryID);
            }
            var caches = from t in source.ToList()
                         group t by t.BrandID into newGroup
                         orderby newGroup.Count() descending
                         select newGroup;
            var s = "";
            foreach (var nameGroup in caches)
            {
                s += string.Format("Key: {0} {1}\r\n", nameGroup.Key, nameGroup.Count());
            }

            List<TicketCacheAcount> data = new List<TicketCacheAcount>() { };
            foreach (var item in caches)
            {
                data.Add(new TicketCacheAcount() { BrandID = item.Key.Value, TotalTickets = item.Count() });
            }
            this.GridView1.DataSource = data;

            this.GridView1.DataBind();
        }
    }
}