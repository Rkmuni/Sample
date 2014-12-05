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
/// Summary description for RelationShip
/// </summary>
/// 
namespace NIT.RealTime.BLL
{
    public class RelationShip:Common
    {
        #region private class fields
        int relationShipId;
        string relationShip;
        bool isActive;
        #endregion
        #region public properties
        public int RelationShipId
        {
            get { return this.relationShipId; }
            set { this.relationShipId = value; }
        }
        public string RelationShip1
        {
            get { return this.relationShip; }
            set { this.relationShip = value; }
        }
        public bool IsActive
        {
            get { return this.isActive; }
            set { this.isActive = value; }
        }
        #endregion
        public RelationShip()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        #region public methods
        public DataSet GetRelationShip()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_GetRelationShips";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "RelationShip", DbType.String, this.RelationShip1);
            defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
            defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
            return defaultDb.ExecuteDataSet(dbCommand);
        }
        public int InsertRelationShip()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_AddRelationShip";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "RelationShip", DbType.String, this.RelationShip1);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public int UpdateRelationShip()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_UpdateRelationShip";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "RelationShip", DbType.String, this.RelationShip1);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            defaultDb.AddInParameter(dbCommand, "RelationShipId", DbType.Int32, this.RelationShipId);
            return defaultDb.ExecuteNonQuery(dbCommand);

        }
        public int DeleteRelationShipById()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_DeleteRelationShip";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "RelationShipId", DbType.Int32, this.RelationShipId);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        #endregion
    }
}