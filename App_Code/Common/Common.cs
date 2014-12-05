using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using NIT.RealTime.DBConnection;
using System.Web.UI.WebControls;
/// <summary>
/// Summary description for Common
/// </summary>

namespace NIT.RealTime.BusinessCommon
{
    public class Common
    {
        #region protected class fields
        protected string sqlCommand;
        protected Database defaultDb = null;
        protected DbCommand dbCommand = null;
        public string SortOn
        {
            get;
            set;
        }
        public string SortBy
        {
            get;
            set;
        }
        #endregion
        public Common()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #region public class static methods
        public static void BindCountryDDL(DropDownList ddl)
        {
            Database defaultDB = Connection.GetDefaultDBConnection();
            Common cmn = new Common();
            cmn.sqlCommand = "select * from tblCountry";
            DbCommand dbCommand = defaultDB.GetSqlStringCommand(cmn.sqlCommand);
            DataSet ds = defaultDB.ExecuteDataSet(dbCommand);
            ddl.DataSource = ds.Tables[0];
            ddl.DataTextField = "CountryName";
            ddl.DataValueField = "CountryId";           
            ddl.DataBind();            
        }
        public static void BindStateDDL(DropDownList ddl)
        {
            Database defaultDB = Connection.GetDefaultDBConnection();
            Common cmn = new Common();
            cmn.sqlCommand = "select * from tblState";
            DbCommand dbCommand = defaultDB.GetSqlStringCommand(cmn.sqlCommand);
            DataSet ds = defaultDB.ExecuteDataSet(dbCommand);
            ddl.DataSource = ds.Tables[0];
            ddl.DataTextField = "StateName";
            ddl.DataValueField = "StateId";
            ddl.DataBind();
        }
        #endregion
    }
}