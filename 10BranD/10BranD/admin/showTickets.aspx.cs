using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BranD10.vote
{
    public partial class showTickets : System.Web.UI.Page
    {
        private int NoteHash=0;
        private string agent;
        private string ip;
        private int id;
        private int psize;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            else
            {

            }
            id = int.Parse(Request["ID"]);

            if (!string.IsNullOrEmpty(Request["NoteHash"]))
            {
                NoteHash =int.Parse( Request["NoteHash"]);
            }
            if (!string.IsNullOrEmpty(Request["numip"]))
            {
                ip = Request["numip"];
            }
             if (!string.IsNullOrEmpty(Request["agent"]))
            {
                agent = Request["agent"];
            }
              if (!string.IsNullOrEmpty(Request["psize"]))
            {
                psize =int.Parse( Request["psize"]);
            }
           
            BindData();
        }

        private void BindData()
        {
            var caches = DB.Context.From<Model.Ticketcache>().Where(p => p.BrandID ==id);

            if (NoteHash != 0)
            {
                caches = caches.Where(p => p.NoteHash == NoteHash);
            }
            if (ip != null)
            {
                caches = caches.Where(p => p.IP == ip);
            }
           
            if (psize >0)
            {
                caches = caches.Page(psize,0);
            }
            
            this.GridView1.DataSource = caches.ToList();

            this.GridView1.DataBind();
        }
    }
}