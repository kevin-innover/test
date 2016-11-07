using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
namespace BranD10
{
    public static class ExtensionMethods
    {
        public static int WordCount(this String str)
        {
            return str.Split(new char[] { ' ', '.', '?' },
                             StringSplitOptions.RemoveEmptyEntries).Length;
        }

        public static bool CreateRank(this Model.Industry industry)
        {
            string where = string.Format("IndustryID={0} and year={1}",industry.Id,DateTime.Now.Year);
            if (DB.Context.Count<Model.Ranking>(where) > 0)
            {
                return true;
            }
            var brands = DB.Context.From<Model.Brand>().Where(p => p.IndustryID == industry.Id).Top(10).ToList().OrderByDescending(p => (p.AutoTicket+p.RealTicket)).ToList();
            Ranking newRank = new Ranking();

            newRank.IndustryID = industry.Id;
            newRank.CreateDate = DateTime.Now;
            newRank.Title = string.Format(CommonMethod.RankTitleFormate, DateTime.Now.Year, industry.Name);
            newRank.Year = DateTime.Now.Year;
            string ids = "";
            brands.ForEach(p => ids += p.Id + ",");
            newRank.RankingList = ids;
            var r = DB.Context.Insert<Model.Ranking>(newRank);
            if (r > 0)
            {
              var  rank = 1;

                var brandrankingList = new List<Brandranking>();
                foreach (var brand in brands)
                {
                    brandrankingList.Add(createBrandRank(brand, industry.Id, rank++, newRank.Year));
                }
                r = DB.Context.Insert<Model.Brandranking>(brandrankingList);
                if (r == 10)
                {
                    // sucess
                }
                else
                {
                    //faild
                }
            }
            else
            {
                //log
                return false;
            }
            return true;
        }

        public static  Ticketcache ToTicketcache(this Model.Ticket t)
        {
            var newTicket=new Ticketcache();
            newTicket.BrandID = t.BrandID;
            newTicket.CreateTime = t.CreateTime;
            newTicket.Area = t.Area;
            newTicket.IP = t.IP;
            newTicket.PhoneInfo = t.PhoneInfo;
            newTicket.PhoneHash = t.PhoneInfo.GetHashCode();
            newTicket.Type = t.Type;
            newTicket.Weibo = t.Weibo;
            newTicket.Weixin = t.Weixin;
            newTicket.Qq = t.Qq;
            newTicket.PhoneNumber = t.PhoneNumber;

            return newTicket;
        }

        public static Brandranking createBrandRank(Brand brand, int industryID, int rank, int year)
        {
            Brandranking bk = new Brandranking();
            bk.BrandID = brand.Id;
            bk.BrandName = brand.Name;
            bk.CompanyName = brand.CompanyName;
            bk.UpdateTime = DateTime.Now;
            bk.Year = year;
            bk.Rank = rank;
            bk.Addr = brand.Addr;
            bk.IndustryID = industryID;
            bk.Websit = brand.Websit;

            bk.Status = (int)BrandRandStatusEnum.不显示;
            return bk;

        }
    }
}