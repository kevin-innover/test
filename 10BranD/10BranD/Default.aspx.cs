using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Dos.ORM;
using BranD10;
namespace BranD10
{
    public class DB { public static readonly DbSession Context = new DbSession("DosConn");}
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //for (int i = 0; i < 10; i++)
            //{
            //    Ticketcache t = new Ticketcache();
            //    t.Id = i;
            //    t.BrandID = i;
            //    t.Note = (i / 3).ToString();
            //    var caches = DB.Context.Insert(t);
            //}

            Label1.Text = Request.Browser.Browser;
            var v = Request.Browser.MajorVersion;
            var v2 = Request.Browser.MinorVersion;
            var v3 = BrowserInfo.GetNetIP();

            //   AddtestData();

            // var allUser = DB.Context.From<Model.Users>().Select().ToList();

            //var u1= allUser.First();
            // u1.Name="ddd";
            // u1.Attach();
            // DB.Context.Update(u1);
            // DB.Context.Delete<Users>(p => p.Name == "test");
        }
 
        public void AddtestData()
        {
            //add role

            int r = 0;
            //  r = DB.Context.Insert<Model.Role>(new Role()
            //  {
            //      CName = "系统管理员"
            //  });
            //  //add user

            //  r = DB.Context.Insert<Model.Users>(new Users()
            //{
            //    CName = "系统管理员",
            //    RoleID = 1,
            //    CreateTime = DateTime.Now
            //});

            //  //add industry
            //  for (int i = 0; i < 10; i++)
            //  {
            //      r = DB.Context.Insert<Model.Industry>(new Industry
            //    ()
            //    {
            //        Name = "行业 " + i,

            //        CreateTime = DateTime.Now,
            //        CreatorId = 1,
            //        Status=(Int32)IndustryStatusEnum.Waiting,
            //    }
            //    );
            //  }



            // company
            //List<Company> entites = new List<Company>();
            //for (int j = 0; j < 100; j++)
            //{
            //    entites.Add(
            //        new Company()
            //        {

            //            Name = "company " + j
            //        }
            //        );
            //}

            //r = DB.Context.Insert<Company>(entites);

            //  add brand
            //List<Brand> entites = new List<Brand>();
            //for (int i = 0; i < 100; i++)
            //{
            //    entites.Add(
            //        new Brand()
            //        {
            //            CompanyID = i + 1,
            //            Name = "品牌 " + i,

            //            CreateTime = DateTime.Now,
            //            CreatorUserID = 1,
            //            AdminUserID = 1
            //        }
            //        );

            //}
            //r = DB.Context.Insert<Brand>(entites);

            //   票
            //List<Ticket> entites = new List<Ticket>();
            //for (int j = 0; j < 100; j++)
            //{

            //    for (int i = 0; i < 100; i++)
            //    {
            //        entites.Add(
            //            new Ticket()
            //      {

            //          CreateTime = DateTime.Now,
            //          BrandID = j + 1,
            //          Type = (int)TicketTypeEnum.Web
            //      }
            //            );

            //    }
            //}

            //r = DB.Context.Insert<Ticket>(entites);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
