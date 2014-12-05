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
/// Summary description for State
/// </summary>
/// 
namespace NIT.RealTime.BLL
{
    public class State : Country
    {
        #region Class Fields
        protected int stateId;
        string stateName;
        protected bool isActive;
        #endregion

        #region Public Properties
        public int StateId
        {
            get { return this.stateId; }
            set { this.stateId = value; }
        }
        public string StateName
        {
            get { return this.stateName; }
            set { this.stateName = value; }
        }

        #endregion
        public State()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #region public methods
        public DataSet GetAllState()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_GetStates";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            if (this.CountryId != 0)
                defaultDb.AddInParameter(dbCommand, "CountryId", DbType.Int32, this.CountryId);

            if (this.StateName != string.Empty)
                defaultDb.AddInParameter(dbCommand, "StateName", DbType.String, this.StateName);
            defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
            defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
            return defaultDb.ExecuteDataSet(dbCommand);
        }
        public int InsertState()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_AddState";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "CountryId", DbType.Int32, this.CountryId);
            defaultDb.AddInParameter(dbCommand, "StateName", DbType.String, this.StateName);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public int UpdateState()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_UpdateState";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "StateName", DbType.String, this.StateName);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            defaultDb.AddInParameter(dbCommand, "CountryId", DbType.Int32, this.CountryId);
            defaultDb.AddInParameter(dbCommand, "StateId", DbType.Int32, this.StateId);
            return defaultDb.ExecuteNonQuery(dbCommand);

        }
        public int DeleteStateById()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_DeleteState";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "StateId", DbType.Int32, this.StateId);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        #endregion

    }
}