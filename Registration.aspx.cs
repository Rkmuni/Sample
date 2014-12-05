using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using NIT.RealTime.BLL;
using System.Text;
public partial class Registration : System.Web.UI.Page
{
    User objUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                txtEmail.Text = PreviousPage.Email;
                txtPassword.Text = PreviousPage.Password;
                txtPasswordAgain.Text = PreviousPage.Password2;
                txtPassword.Attributes.Add("value", PreviousPage.Password);
                txtPasswordAgain.Attributes.Add("value", PreviousPage.Password2);
                txtEmail.ReadOnly = true;
                txtPassword.ReadOnly = true;
                txtPasswordAgain.ReadOnly = true;
            }
            else
            {
                txtEmail.ReadOnly = false;
                txtPassword.ReadOnly = false;
                txtPasswordAgain.ReadOnly = false;
            }
        }
    }
    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnGetStarted_Click(object sender, EventArgs e)
    {
        objUser.EmailId = txtEmail.Text.Trim();
        objUser.Password = txtPassword.Text;
        objUser.DateOfRegistration = System.DateTime.Now;
        objUser.IsApproved = false;
        objUser.IsCancelled = false;
        objUser.FirstName = txtFirstName.Text.Trim();
        objUser.MiddleName = txtMiddleName.Text.Trim();
        objUser.LastName = txtLastName.Text.Trim();
        objUser.DateOfBirth = txtDateOfBirth.Text.Trim();
        objUser.Gender = rdblGender.SelectedItem.Value;
        objUser.IsAgeSecret = chkAgeSecret.Checked;
        objUser.MobileNo = txtMobileNo.Text.Trim();
        IDataReader dr = objUser.CheckEmailForRegistration();
        if (dr.Read())
        {
            lblError.Text = "This EMail Address Already Exists,Please Try Another";
            lblError.ForeColor = System.Drawing.Color.Red;
            return;
        }
        else
        {
            lblError.Text = string.Empty;
        }
        if (objUser.UserRegistration() > 0)
        {
            //send mail to the user
            MailMessage objMailMessage = new MailMessage();
            objMailMessage.From = new MailAddress(ConfigurationManager.AppSettings["From"].ToString(), "WebMaster");
            objMailMessage.To.Add(new MailAddress(txtEmail.Text.Trim()));
            objMailMessage.Subject = "Activation Link::User Registration";
            StringBuilder sbMailBody = new StringBuilder();
            sbMailBody.Append("<table style='width:100% ; border:5px solid green'>");
            sbMailBody.Append("<tr><td><img src='" + ConfigurationManager.AppSettings["InternetUrl"].ToString() + "Images/garden.jpg' width='100%' height='150' alt='Image'/></td></tr>");

            sbMailBody.Append("<tr><td><b>Dear User,</b><br/></td></tr>");
            sbMailBody.Append("<tr><td><p style='text-align:justify'><b>Greetings From Web Master</b><br/>Thank You For Registering With Us<br/><br/>Please Click The Following Link To Activate The Account In Order To Use  Our Services:</p></td></tr>");
            sbMailBody.Append("<tr><td><a href='" + ConfigurationManager.AppSettings["InternetUrl"].ToString() + "Activation.aspx?eml=" + txtEmail.Text.Trim() + "' target='_blank'>" + ConfigurationManager.AppSettings["InternetUrl"].ToString() + "Activation.aspx?eml=" + txtEmail.Text.Trim() + "' target='_blank'>" + "</a></td></tr>");
            sbMailBody.Append("<tr><td><b>Thanks&Best Regards,</b><br/>Management Team<br/>Web Master</td></tr>");
            sbMailBody.Append("</table>");
            objMailMessage.Body = sbMailBody.ToString();
            objMailMessage.IsBodyHtml = true;
            objMailMessage.Priority = MailPriority.High;
            SmtpClient objSmtpClient = new SmtpClient();
            objSmtpClient.Host = ConfigurationManager.AppSettings["Host"].ToString();
            objSmtpClient.Port = int.Parse(ConfigurationManager.AppSettings["Port"].ToString());
            System.Net.NetworkCredential objNetworkCredential = new System.Net.NetworkCredential("kayam.guna@gmail.com", "!guna1234@");
            objSmtpClient.Credentials = objNetworkCredential;
            objSmtpClient.EnableSsl = true;
            objSmtpClient.Send(objMailMessage);

            lblInfo.Text = "User Registered Successfully!!!,Please Check Your Email To Activate Your Account";
            lblInfo.ForeColor = System.Drawing.Color.Green;
            foreach (var ctrl in panel1.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox textBox = (TextBox)ctrl;
                    textBox.Text = string.Empty;
                }
            }
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtPasswordAgain.Text = string.Empty;
            chkAgeSecret.Checked = false;
            rdblGender.SelectedIndex = 0;
            txtFirstName.Focus();

            //Response.Redirect("~/Activation.aspx");
        }
        else
        {
            lblInfo.Text = "User Registration Failed";

            lblInfo.ForeColor = System.Drawing.Color.Red;
        }

    }
}