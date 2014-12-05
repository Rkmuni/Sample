using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using NIT.RealTime.BusinessCommon;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Data;
using NIT.RealTime.DBConnection;
/// <summary>
/// Summary description for Religion
/// </summary>
/// 
namespace NIT.RealTime.BLL
{
    public class Religion : Common
    {
        #region private class fields
        int religionId;
        string religion;
        bool isActive;
        #endregion
        #region public properties
        public int ReligionId
        {
            get { return this.religionId; }
            set { this.religionId = value; }
        }
        public string Religion1
        {
            get { return this.religion; }
            set { this.religion = value; }
        }
        public bool IsActive
        {
            get { return this.isActive; }
            set { this.isActive = value; }
        }
        #endregion
        public Religion()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #region public methods
        public DataSet GetReligion()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_GetReligions";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "Religion", DbType.String, this.Religion1);
            defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
            defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
            return defaultDb.ExecuteDataSet(dbCommand);
        }
        public int InsertReligion()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_AddReligion";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "Religion", DbType.String, this.Religion1);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public int UpdateReligion()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_UpdateReligion";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "Religion", DbType.String, this.Religion1);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            defaultDb.AddInParameter(dbCommand, "ReligionId", DbType.Int32, this.ReligionId);
            return defaultDb.ExecuteNonQuery(dbCommand);

        }
        public int DeleteReligionById()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_DeleteReligion";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "ReligionId", DbType.Int32, this.ReligionId);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        #endregion
    }
}