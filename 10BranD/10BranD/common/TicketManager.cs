using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Timers;
using Model;
using Dos.ORM;

namespace BranD10
{
    public class TicketManager
    {
        private Dictionary<int, Timer> AllTicketMakers = new Dictionary<int, Timer>();
        private static TicketManager _instance;

        public static TicketManager Instance
        {
            get { return _instance; }
            set { _instance = value; }
        }
        static TicketManager()
        {
            _instance = new TicketManager();
        }
        /// <summary>
        /// just to init the instance
        /// </summary>
        public void Start()
        { 
        
        }
        private TicketManager()
        {
            //load all ticket
            var allBrands = DB.Context.From<Model.Brand>().ToList();
            int c = 0;
            foreach (var brand in allBrands)
            {
                if (brand .AutoFrequency>0)
                {
                    AllTicketMakers[brand.Id] = createTimer(brand.Id, brand.AutoFrequency);
                    c++;
                }
            }
            //log
        }
        public void RefreshTime(Brand brand)
        {
            if (AllTicketMakers.ContainsKey(brand.Id))
            {
                if (brand.AutoFrequency > 0)
                {
                    AllTicketMakers[brand.Id].Close();
                    AllTicketMakers[brand.Id] = createTimer(brand.Id, brand.AutoFrequency);
                }
                else
                {
                    AllTicketMakers[brand.Id].Close();
                }
            }
            else
            {
                if (brand.AutoFrequency > 0)
                {

                    AllTicketMakers[brand.Id] = createTimer(brand.Id, brand.AutoFrequency);
                }

            }
        }
        private Timer createTimer(int brandID, int interval)
        {
            var newTimer = new Timer(interval );
            newTimer.Elapsed += new ElapsedEventHandler((s, e) => createTicket(brandID));
            newTimer.Enabled = true;
            return newTimer;

        }
        private void createTicket(int brandID)
        {
            Ticket ticket = new Ticket();
            ticket.CreateTime = DateTime.Now;
            ticket.BrandID = brandID;
            ticket.Type = (int)TicketTypeEnum.Auto;

            var r2 = DB.Context.Insert<Ticket>(ticket);
        }

    }
}