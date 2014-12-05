using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIT.RealTime.BLL;
public partial class CheckEmailRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        User objUser=new User();
      if (Request.QueryString["email"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            string strEmail = Request.QueryString["email"].ToString();
            objUser.EmailId = strEmail;
            IDataReader dr = objUser.CheckEmailForRegistration();
            if (dr.Read())
            {
                Response.Write("This Email Already In Use,Please Try Another One");
            }
            else
            {
                Response.Write("");
            }
            Response.End();
        }
      }
    }
