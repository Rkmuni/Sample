using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using NIT.RealTime.BLL;
using System.Data;

public partial class ChangePassword : System.Web.UI.Page
{
    AdminAccount objUser = new AdminAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            txtOldPassword.Focus();
        else
            txtNewPassword.Focus();
        txtOldPassword.Attributes.Add("value", txtOldPassword.Text.Trim());
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (objUser.ChangeAdminPassword(Session["UserName"].ToString(), txtOldPassword.Text.Trim(), txtNewPassword.Text.Trim()) > 0)
        {
            lblPwdStatus.Text = "<b style='color:green'>Password has been changed successfully!!!</b>";
            txtOldPassword.Attributes.Add("value", "");
            txtOldPassword.Focus();
        }
        else
            lblPwdStatus.Text = "<b style='color:red'>Password Changing failed please try again!!!</b>";
    }
    protected void txtOldPassword_TextChanged(object sender, EventArgs e)
    {
        IDataReader dr = objUser.CheckOldPassword(txtOldPassword.Text.Trim());
        if (!dr.Read())
        {
            lblStatus.Text = "please enter correct old password!!!";
            btnChangePassword.Enabled = false;
        }
        else
        { 
            lblStatus.Text="";
            btnChangePassword.Enabled = true;
        }
    }

}