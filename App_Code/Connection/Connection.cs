using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Configuration;
/// <summary>
/// Summary description for Connection
/// </summary>

namespace NIT.RealTime.DBConnection
{
    public class Connection
    {
        public Connection()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static Database GetDefaultDBConnection()
        {
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            Database defaultDb = factory.CreateDefault();
            return defaultDb;

        }
    }
}