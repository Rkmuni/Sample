using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RealTime.BLL;
public partial class Admin_Login : System.Web.UI.Page
{
    DataSet ds;
    AdminAccount objAdmin = new AdminAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    void GetAdminAccountDetails()
    {
        ds = new DataSet();
        objAdmin.UserName = txtUserName.Text.Trim();
        objAdmin.Password = txtPassword.Text.Trim();
        ds = objAdmin.GetAdminAccountByUserName();
    }
    protected void imgLogin_Click(object sender, ImageClickEventArgs e)
    {
        GetAdminAccountDetails();
        if (ds.Tables[0].Rows.Count>0)
        {
            if (ds.Tables[0].Rows[0][0].ToString() == txtUserName.Text.Trim() && ds.Tables[0].Rows[0][1].ToString() == txtPassword.Text.Trim())
            {
                objAdmin.LastAccessedDateTime = DateTime.Now;
                Session["UserName"] = txtUserName.Text.Trim();
                if (ds.Tables[0].Rows[0][3].ToString()=="")
                 {
                    Session["Flag"] = false;
                    Session["LastAccessedDateTime"] = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt");
                 }
                else
                 {
                    Session["Flag"] = true;
                    Session["LastAccessedDateTime"] = ((DateTime)ds.Tables[0].Rows[0][3]).ToString("dd/MM/yyyy hh:mm:ss tt");
                 }
                if (objAdmin.UpdateAdminAccountLastAccessedDateTimeByUserName() > 0)
                 {
                     Response.Write("AdminAccount LastAccessedDateTime Updated Successfully!!!");
                 }
                else
                 {
                    Response.Write("AdminAccount LastAccessedDateTime Updation Failed!!!");
                 }
                Response.Redirect("~/Admin/ControlPanel.aspx");
            }
            else
                lblError.Text = "Invalid Password!!!";
            

        }
        else
            lblError.Text = "Invalid UserName or Password!!!";
      }

        
    }
