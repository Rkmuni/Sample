using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIT.RealTime.BLL;
public partial class Admin_ManageCountry : System.Web.UI.Page
{
    Country objCountry = new Country();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "CountryName";
            ViewState["SortBy"] = "ASC";
            BindCountryData();

        }
    }
    void BindCountryData()
    {
        objCountry.CountryName = txtSearchCountryName.Text.Trim();
        objCountry.SortOn = ViewState["SortOn"].ToString();
        objCountry.SortBy = ViewState["SortBy"].ToString();
        DataSet dsCountry = objCountry.GetCountries();
        grvCountry.DataSource = dsCountry.Tables[0];
        grvCountry.DataBind();


    }
    protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        BindCountryData();
    }
   
   
    protected void grvCountry_Sorting(object sender, GridViewSortEventArgs e)
    {
        ViewState["SortOn"] = e.SortExpression;
        if (ViewState["SortBy"].ToString() == "ASC")
        {
            ViewState["SortBy"] = "DESC";
        }
        else
        {
            ViewState["SortBy"] = "ASC";
        }
        BindCountryData();
    }
    protected void grvCountry_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvCountry.PageIndex = e.NewPageIndex;
        BindCountryData();

    }
    protected void grvCountry_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void imgBtnEdit_Click(object sender,EventArgs e)
    {
        Button btnEdit = sender as Button;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        int countryId = Convert.ToInt32(grvCountry.DataKeys[gvr.RowIndex].Value);
        ViewState["EditCountryId"] = countryId;
        string countryName = grvCountry.Rows[gvr.RowIndex].Cells[2].Text;
        bool isActive = ((CheckBox)grvCountry.Rows[gvr.RowIndex].Cells[3].Controls[0]).Checked;
        txtEditCountryName.Text = countryName;
        chkEditIsActive.Checked = isActive;

        mpe2.Show();
        txtEditCountryName.Focus();
    }
    protected void imgBtnDelete_Click(object sender, EventArgs e)
    {
        Button btnDelete = sender as Button;
        GridViewRow gvr = (GridViewRow)btnDelete.NamingContainer;
        int CountryId = Convert.ToInt32(grvCountry.DataKeys[gvr.RowIndex].Value);
        ViewState["DelCountryId"] = CountryId;
        lblDeleteError.Text = "Are You Sure You Want To Delete<b> " + grvCountry.Rows[gvr.RowIndex].Cells[2].Text + "</b> Country ?";
        mpe3.Show();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        objCountry.CountryName = txtAddCountryName.Text.Trim();

        objCountry.IsActive = chkAddIsActive.Checked;
        if (objCountry.InsertCountry() > 0)
        {
            lblError.Text = "Country Inserted Successfully";
            txtAddCountryName.Text = string.Empty;
            chkAddIsActive.Checked = false;
            txtAddCountryName.Focus();
            BindCountryData();
        }
        else
        {
            lblError.Text = "Country Insertion Failed";
        }
        
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (ViewState["EditCountryId"] != null)
        {
            objCountry.CountryId = Convert.ToInt32(ViewState["EditCountryId"]);
            objCountry.CountryName = txtEditCountryName.Text.Trim();
            objCountry.IsActive = chkEditIsActive.Checked;
            if (objCountry.UpdateCountry() > 0)
            {
                BindCountryData();
            }
            else
            {
                lblEditError.Text = "Updation Failed";
            }
        }

    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        if (ViewState["DelCountryId"] != null)
        {
            objCountry.CountryId = Convert.ToInt32(ViewState["DelCountryId"]);
            if (objCountry.DeleteCountryById() > 0)
            {
                BindCountryData();
            }
        }
    }
    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        mpe1.Hide();
    }

    protected void imgBtnAdd_Click(object sender, EventArgs e)
    {
    }


   
}