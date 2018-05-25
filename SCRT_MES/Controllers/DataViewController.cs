using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Microsoft.AspNet.SignalR;
using Model;
using App;

namespace App.Controllers
{
    public class DataViewController : Controller
    {
        //
        // GET: /DataView/
        private DataView_BLL bll = new DataView_BLL();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetBinMatrnRecordData()
        {
            var data = bll.GetBinMatrnRecordData();
            return Content("");
        }
    }
}