using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class LogHelper
    {
        static LogHelper()
        {
            log4net.Config.XmlConfigurator.Configure();
        }

        private static readonly log4net.ILog loginfo = log4net.LogManager.GetLogger("Logger");
        private static readonly EventLog osEventLog = new EventLog();
        private static readonly log4net.ILog logtrace = log4net.LogManager.GetLogger("LoggerTrace");
        private static readonly log4net.ILog logcallback = log4net.LogManager.GetLogger("LoggerCallback");

        /// <summary>
        /// 跟踪日志记录
        /// </summary>
        public static void TraceLog(string info)
        {
            if (logtrace.IsInfoEnabled)
            {
                logtrace.Info(info);
            }
        }
        /// <summary>
        /// 回调日志记录
        /// </summary>
        public static void CallbackLog(string info)
        {
            if (logcallback.IsInfoEnabled)
            {
                logcallback.Info(info);
            }
        }

        /// <summary>
        /// 操作日志记录
        /// </summary>
        public static void Info(string info)
        {
            if (loginfo.IsInfoEnabled)
            {
                loginfo.Info(info);
            }
        }

        /// <summary>
        /// 错误日志记录
        /// </summary>
        public static void Error(string info, Exception ex = null)
        {
            if (loginfo.IsErrorEnabled)
            {
                loginfo.Error(info, ex);
            }
        }
    }
}
