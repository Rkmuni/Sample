using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPageControlPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LastAccessedDateTime"] != null)
        {
            lblVisitedTime.Text = "<b style='font-family:Tahoma;color:Green;font-size:12px'>Last Visited Date & Time :</b>" + "<b style='font-family:Tahoma;color:gray;font-size:12px;'>" + Convert.ToDateTime(Session["LastAccessedDateTime"]).ToString("dd/MM/yyyy hh:mm:ss tt") + "</b>";
        }
    }
    protected void lnkBtnSignOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Remove("UserName");
        Session.Remove("LastVisitedTime");
        Response.Redirect("~/Admin/ControlPanel.aspx");
    }
}
