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
/// Summary description for HintQuestion
/// </summary>
/// 
namespace NIT.RealTime.BLL
{
    public class HintQuestion : Common
    {
        #region private class fields
        int hintQuestionId;
        string hintQuestion;
        bool isActive;
        #endregion
        #region public properties
        public int HintQuestionId
        {
            get { return this.hintQuestionId; }
            set { this.hintQuestionId = value; }
        }
        public string HintQuestion1
        {
            get { return this.hintQuestion; }
            set { this.hintQuestion = value; }
        }
        public bool IsActive
        {
            get { return this.isActive; }
            set { this.isActive = value; }
        }
        #endregion
        public HintQuestion()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        #region public methods
        public DataSet GetHintQuestion()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_GetHintQuestions";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "HintQuestion", DbType.String, this.HintQuestion1);
            defaultDb.AddInParameter(dbCommand, "SortOn", DbType.String, this.SortOn);
            defaultDb.AddInParameter(dbCommand, "SortBy", DbType.String, this.SortBy);
            return defaultDb.ExecuteDataSet(dbCommand);
        }
        public int InsertHintQuestion()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_AddHintQuestion";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "HintQuestion", DbType.String, this.HintQuestion1);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        public int UpdateHintQuestion()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_UpdateHintQuestion";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "HintQuestion", DbType.String, this.HintQuestion1);
            defaultDb.AddInParameter(dbCommand, "IsActive", DbType.Boolean, this.IsActive);
            defaultDb.AddInParameter(dbCommand, "HintQuestionId", DbType.Int32, this.HintQuestionId);
            return defaultDb.ExecuteNonQuery(dbCommand);

        }
        public int DeleteHintQuestionById()
        {
            defaultDb = Connection.GetDefaultDBConnection();
            sqlCommand = "SP_DeleteHintQuestion";
            dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
            defaultDb.AddInParameter(dbCommand, "HintQuestionId", DbType.Int32, this.HintQuestionId);
            return defaultDb.ExecuteNonQuery(dbCommand);
        }
        #endregion
    }
}