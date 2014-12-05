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
/// Summary description for User
/// </summary>
/// 
namespace NIT.RealTime.BLL
{
public class User:Common
{
	
        #region Class Fields
        #region class fields for UserAccountDetails
        int userId;
        string emailId;
        string password;
        DateTime dateOfRegistration;
        int hintQuestionId;
        string newHintQuestion;
        string hintQuestionAnswer;
        bool isApproved;
        bool isCancelled;
        #endregion
        #region class fields for UserPersonalDetails
        string firstName;
        string middleName;
        string lastName;
        string dateOfBirth;
        string anniversaryDate;
        string gender;
        bool isAgeSecret;
        string mobileNo;
        string nickName;
        string userPhoto;
        #endregion
        #region class fields for UserAddressDetails
        string addressLine1;
        int countryId;
        int stateId;
        int cityId;
       string pinCode;
        #endregion
        #endregion

         #region Public Properties
        #region public class properties for UserAccountDetails
        public int UserId
        {
            get { return this.userId; }
            set { this.userId = value; }
        }
        public string EmailId
        {
            get { return this.emailId; }
            set { this.emailId = value; }
        }
        public string Password
        {
            get { return this.password; }
            set { this.password = value; }
        }

        public DateTime DateOfRegistration
        {
            get { return this.dateOfRegistration; }
            set { this.dateOfRegistration= value; }
        }

     public int HintQuestionId
        {
            get { return this.hintQuestionId; }
            set { this.hintQuestionId = value; }
        }

        public string NewHintQuestion
        {
            get { return this.newHintQuestion; }
            set { this.newHintQuestion = value; }
        }
        public string HintQuestionAnswer
        {
            get { return this.hintQuestionAnswer;}
            set{this.hintQuestionAnswer=value;}
        }
        public bool IsApproved
        {
            get { return this.isApproved; }
            set { this.isApproved = value; }
        }

        public bool IsCancelled
        {
            get { return this.isCancelled; }
            set { this.isCancelled = value; }
        }
#endregion

    #region public class properties for UserPersonalDetails
        public string FirstName
        {
            get { return this.firstName; }
            set { this.firstName = value; }
        }
        public string MiddleName
        {
            get { return this.middleName; }
            set { this.middleName = value; }
        }
        public string LastName
        {
            get { return this.lastName; }
            set { this.lastName = value; }
        }
        public string DateOfBirth
        {
            get { return this.dateOfBirth; }
            set { this.dateOfBirth = value; }
        }
        public string Gender
        {
            get { return this.gender; }
            set { this.gender = value; }
        }
     public string AnniversaryDate
        {
            get { return this.anniversaryDate; }
            set { this.anniversaryDate = value; }
        }
       
        public bool IsAgeSecret
        {
            get { return this.isAgeSecret; }
            set { this.isAgeSecret = value; }
        }
        public string MobileNo
        {
            get { return this.mobileNo; }
            set { this.mobileNo = value; }
        }
       
        public string UserPhoto
        {
            get { return this.userPhoto; }
            set { this.userPhoto = value; }
        }
    #endregion

    #region public class properties for UserAddressDetails
        public string AddressLine1
        {
            get { return this.addressLine1; }
            set { this.addressLine1 = value; }

        }
        public int CountryId
        {
            get { return this.countryId; }
            set { this.countryId = value; }
        }
        public int StateId
        {
            get { return this.stateId; }
            set { this.stateId = value; }
        }
        public int CityId
        {
            get { return this.cityId; }
            set { this.cityId = value; }
        }
        public string Pincode
        {
            get { return this.pinCode; }
            set { this.pinCode = value; }
        }
#endregion

        #endregion
 
      public User()
        {
            //
            // TODO: Add constructor logic here
            //
        }

      #region Public Class Methods
      public int UserRegistration()
      {
          defaultDb = Connection.GetDefaultDBConnection();
          sqlCommand = "SP_UserRegistration";
          dbCommand = defaultDb.GetStoredProcCommand(sqlCommand);
          defaultDb.AddInParameter(dbCommand, "EmailId", DbType.String, this.EmailId);
          defaultDb.AddInParameter(dbCommand, "Password", DbType.String, this.Password);
          defaultDb.AddInParameter(dbCommand, "DateOfRegistration", DbType.DateTime, this.DateOfRegistration);
          defaultDb.AddInParameter(dbCommand, "IsApproved", DbType.Boolean, this.IsApproved);
          defaultDb.AddInParameter(dbCommand, "IsCancelled", DbType.Boolean, this.IsCancelled);
          defaultDb.AddInParameter(dbCommand, "FirstName", DbType.String, this.FirstName);
          defaultDb.AddInParameter(dbCommand, "MiddleName", DbType.String, this.MiddleName);
          defaultDb.AddInParameter(dbCommand, "LastName", DbType.String, this.LastName);
          defaultDb.AddInParameter(dbCommand, "DateOfBirth", DbType.String, this.DateOfBirth);
          defaultDb.AddInParameter(dbCommand, "Gender", DbType.String, this.Gender);
          defaultDb.AddInParameter(dbCommand, "IsAgeSecret", DbType.Boolean, this.IsAgeSecret);
          defaultDb.AddInParameter(dbCommand, "MobileNo", DbType.String, this.MobileNo);
          return defaultDb.ExecuteNonQuery(dbCommand);
      }



     
      public IDataReader CheckEmailForRegistration()
      {
          defaultDb = Connection.GetDefaultDBConnection();
          sqlCommand = "Select * from tblUserAccountDetails where EmailId='" + this.EmailId + "'";
          dbCommand = defaultDb.GetSqlStringCommand(sqlCommand);
          return defaultDb.ExecuteReader(dbCommand);

      }
      #endregion
}

}