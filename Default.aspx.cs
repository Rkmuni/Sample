using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    public string Email
    {
        get { return this.txtEmail.Text.Trim(); }
    }
    public string Password
    {
        get { return this.txtPassword.Text.Trim(); }
    }
    public string Password2
    {
        get { return this.txtPassword2.Text.Trim(); }
    }
    protected void imgGetStarted_Click(object sender, ImageClickEventArgs e)
    {
        //imgGetStarted.PostBackUrl = "~/Registration.aspx";
        Response.Redirect("Registration.aspx");
    }
    protected void imgGetStarted_Click1(object sender, ImageClickEventArgs e)
    {

    }
}