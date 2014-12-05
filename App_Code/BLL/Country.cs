using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using NIT.RealTime.BusinessCommon;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;
using NIT.RealTime.DBConnection;
using NIT.RealTime.BusinessCommon;
/// <summary>
/// Summary description for Country
/// </summary>
/// 

namespace NIT.RealTime.BLL
{
    public class Country : Common
    {
        #region private class fields
        protected int countryId;
        string countryName;
        protected bool isActive;
        #endregion
        #region public properties
        public int CountryId
        {
            get { return this.countryId; }
            set { this.countryId = value; }
        }
        public string CountryName
        {
            get { return this.countryName; }
            set { this.countryName = value; }
        }
        public bool IsActive
        {
            get { return this.isActive; }
            set { this.isActive = value; }
        }
        #endregion
        public Country()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #region public methods
        public DataSet GetCountries()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_GetCountries";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "CountryName", DbType.String, this.countryName);
            defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
            defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
            return defaultDb.ExecuteDataSet(dbCommand);
        }
        public int InsertCountry()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_AddCountry";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "@CountryName", DbType.String, this.CountryName);
            defaultDb.AddInParameter(dbCommand, "@IsActive", DbType.Boolean, this.IsActive);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public int UpdateCountry()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_UpdateCountry";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "@CountryName", DbType.String, this.CountryName);
            defaultDb.AddInParameter(dbCommand, "@IsActive", DbType.Boolean, this.IsActive);
            defaultDb.AddInParameter(dbCommand, "@CountryId", DbType.Int32, this.CountryId);
            return defaultDb.ExecuteNonQuery(dbCommand);

        }
        public int DeleteCountryById()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_DeleteCountry";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "@CountryId", DbType.Int32, this.CountryId);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        #endregion
    }
}