using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using System.Data;
using NIT.RealTime.BusinessCommon;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;
using NIT.RealTime.DBConnection;
using NIT.RealTime.BLL;
/// <summary>
/// Summary description for City
/// </summary>
/// 
namespace NIT.RealTime.BLL
{
    public class City : State
    {
        #region Class Fields
        int cityId;
        string cityName;
        #endregion

        #region Public Properties
        public int CityId
        {
            get { return this.cityId; }
            set { this.cityId = value; }
        }
        public string CityName
        {
            get { return this.cityName; }
            set { this.cityName = value; }
        }

        #endregion
        public City()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        #region public methods
        public DataSet GetAllCities()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_GetCities";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            if (this.StateId != 0)
                defaultDb.AddInParameter(dbCommand, "StateId", DbType.Int32, this.StateId);
            if (this.CountryId != 0)
                defaultDb.AddInParameter(dbCommand, "CountryId", DbType.Int32, this.CountryId);

            if (this.StateName != string.Empty)
                defaultDb.AddInParameter(dbCommand, "CityName", DbType.String, this.CityName);
            defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
            defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
            return defaultDb.ExecuteDataSet(dbCommand);
        }

        public int InsertCity()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_AddCity";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "@CountryId", DbType.Int32, this.CountryId);
            defaultDb.AddInParameter(dbCommand, "@StateId", DbType.Int32, this.StateId);
            defaultDb.AddInParameter(dbCommand, "@CityName", DbType.String, this.CityName);
            defaultDb.AddInParameter(dbCommand, "@IsActive", DbType.Boolean, this.IsActive);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public int DeleteCityById()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_DeleteCity";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "@CityId", DbType.Int32, this.CityId);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public int UpdateCity()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_UpdateCity";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "@CityName", DbType.String, this.CityName);
            defaultDb.AddInParameter(dbCommand, "@IsActive", DbType.Boolean, this.IsActive);
            defaultDb.AddInParameter(dbCommand, "@CountryId", DbType.Int32, this.CountryId);
            defaultDb.AddInParameter(dbCommand, "@StateId", DbType.Int32, this.StateId);
            defaultDb.AddInParameter(dbCommand, "@CityId", DbType.Int32, this.CityId);
            return defaultDb.ExecuteNonQuery(dbCommand);

        }
        #endregion
    }
}