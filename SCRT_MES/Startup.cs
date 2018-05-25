using Microsoft.Owin;
using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[assembly: OwinStartupAttribute(typeof(App.Startup), "Configuration")]

namespace App
{
    public class Startup
    {
        public static void ConfigureSignalR(IAppBuilder app)
        {
            app.MapSignalR();
        }

        public static void Configuration(IAppBuilder app)
        {
            App.Startup.ConfigureSignalR(app);
        }
    }
}