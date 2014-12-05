using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ControlPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            //lblWelcomeMsg.Text = "Welcome " + Session["UserName"].ToString();
            if ((bool)Session["Flag"] == true)
            {
                lblLastVisitedTime.Text = "Last Accessed Date and Time: " + Session["LastAccessedDateTime"].ToString();

            }
            else
            {
                lblLastVisitedTime.Text = "First Time Accessing Date and Time: " + Session["LastAccessedDateTime"].ToString();
            }
        }
    }
    protected void lnkBtnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Remove("UserName");
        Session.Remove("Flag");
        Session.Remove("LastAccessedDateTime");
        Response.Redirect("~/Admin/Login.aspx");
    }
}