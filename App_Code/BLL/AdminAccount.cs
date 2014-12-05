using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;
using NIT.RealTime.DBConnection;
using NIT.RealTime.BusinessCommon;
/// <summary>
/// Summary description for AdminAccount
/// </summary>

namespace NIT.RealTime.BLL
{
    public class AdminAccount : Common
    {
        #region private class Fields
        string userName;
        string password;
        string createdDate;
        DateTime lastAccessedDateTime;
        #endregion
        #region public class Properties
        public string UserName
        {
            get { return this.userName; }
            set { this.userName = value; }
        }
        public string Password
        {
            get { return this.password; }
            set { this.password = value; }
        }
        public string CreatedDate
        {
            get { return this.createdDate; }
            set { this.createdDate = value; }

        }
        public DateTime LastAccessedDateTime
        {
            get { return this.lastAccessedDateTime; }
            set { this.lastAccessedDateTime = value; }
        }
        #endregion
        public AdminAccount()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #region public class methods
        public DataSet GetAdminAccountByUserName()
        {
            Database defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "sp_checkAdminLogin";
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "UserName", DbType.String, this.userName);
            defaultDb.AddInParameter(dbCommand, "Password", DbType.String, this.password);
            return defaultDb.ExecuteDataSet(dbCommand);
        }

        public int UpdateAdminAccountLastAccessedDateTimeByUserName()
        {
            Database defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_UpdateAdminAccountLastAccessedDateTimeByUserName";
            DbCommand dbComand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbComand, "UserName", DbType.String, this.userName);
            defaultDb.AddInParameter(dbComand, "LastAccessedDateTime", DbType.DateTime, this.lastAccessedDateTime);

            return defaultDb.ExecuteNonQuery(dbComand);
        }

        public IDataReader CheckOldPassword(string oldPassword)
        {
            sqlCommand = "select * from tblAdminAccount where Password='" + oldPassword + "'";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetSqlStringCommand(sqlCommand);
            return defaultDb.ExecuteReader(dbCommand);

        }
        public int ChangeAdminPassword(string userName,string oldPassword,string newPassword)
        {
            sqlCommand = "SP_AdminChangePassword";
            Database defaultDb = Connection.GetDefaultDBConnection();
            DbCommand dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "UserName", DbType.String, userName);
            defaultDb.AddInParameter(dbCommand, "OldPassword", DbType.String, oldPassword);
            defaultDb.AddInParameter(dbCommand, "NewPassword", DbType.String, newPassword);
            return defaultDb.ExecuteNonQuery(dbCommand);

        }
        #endregion
    }
}