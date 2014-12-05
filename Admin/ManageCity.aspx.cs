using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using NIT.RealTime.BLL;
using NIT.RealTime.BusinessCommon;

public partial class Admin_ManageCity : System.Web.UI.Page
{
    City objCity = new City();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "CountryName";
            ViewState["SortBy"] = "ASC";
            BindCountry();
            BindCity();
        }
    }
    void BindCountry()
    {

        objCity.SortOn = ViewState["SortOn"].ToString();
        objCity.SortBy = ViewState["SortBy"].ToString();
        Common.BindCountryDDL(ddlCountryName);
        ddlCountryName.Items.Insert(0, new ListItem("<all>", "0"));
       
        Common.BindStateDDL(ddlStateName);
        ddlStateName.Items.Insert(0, new ListItem("<all>", "0"));

        Common.BindCountryDDL(ddlAddCountryName);
        ddlAddCountryName.Items.Insert(0, new ListItem("<Select>", "0"));
        //Common.BindStateDDL(ddlAddState);
        //ddlAddState.Items.Insert(0, new ListItem("<Select>", "0"));

        Common.BindCountryDDL(ddlEditCountryName);
       // ddlEditCountryName.Items.Insert(0, new ListItem("<Select>", "0"));
       Common.BindStateDDL(ddlEditStateName);
        //ddlEditStateName.Items.Insert(0, new ListItem("<Select>", "0"));

    }
    void BindCity()
    {
        if (ddlStateName.SelectedIndex == -1)
            objCity.StateId = 0;
        else
            objCity.StateId = int.Parse(ddlStateName.SelectedItem.Value);

        if (ddlCountryName.SelectedIndex == -1)
            objCity.CountryId = 0;
        else
            objCity.CountryId = int.Parse(ddlCountryName.SelectedItem.Value);
        if (txtCityName.Text == "" || txtCityName.Text == string.Empty)
            objCity.CityName = string.Empty;
        else
            objCity.CityName = txtCityName.Text.Trim();

        objCity.SortOn = ViewState["SortOn"].ToString();
        objCity.SortBy = ViewState["SortBy"].ToString();
        DataSet dsState = objCity.GetAllCities();
        grvCity.DataSource = dsState;
        grvCity.DataBind();


    }


    protected void ddlCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);   
        if (ddlCountryName.SelectedIndex != 0)
        {
            BindStateAdd(ddlStateName, ddlCountryName);
            ddlStateName.Items.Insert(0, new ListItem("<all>", "0"));

            BindCity();
        }
        else
        {
            BindCity();
            Common.BindStateDDL(ddlStateName);
            ddlStateName.Items.Insert(0, new ListItem("<all>", "0"));

        }
    }
    void BindStateAdd(DropDownList ddl,DropDownList ddl1)
    {
        objCity.SortOn = "CountryName";
        objCity.SortBy = "Asc";
        txtCityName.Text = string.Empty;
        objCity.StateName = string.Empty;
        objCity.CountryId = int.Parse(ddl1.SelectedValue);
        DataSet ds = objCity.GetAllState();
        ddl.DataSource = ds;
        ddl.DataTextField = "StateName";
        ddl.DataValueField = "StateId";
        ddl.DataBind();
    }
    protected void imgBtnSearch_Click(object sender, EventArgs e)
    {
        BindCity();
    }
    protected void imgBtnAddCity_Click(object sender, EventArgs e)
    {

    }
    protected void grvCity_Sorting(object sender, GridViewSortEventArgs e)
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
        BindCity();
    }
    protected void grvCity_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvCity.PageIndex = e.NewPageIndex;
        BindCity();
    }
    protected void imgBtnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = sender as Button;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        int cityId = Convert.ToInt32(grvCity.DataKeys[gvr.RowIndex].Value);
        ViewState["EditCityId"] = cityId;
        string cityName = grvCity.Rows[gvr.RowIndex].Cells[2].Text;
        string stateName = grvCity.Rows[gvr.RowIndex].Cells[3].Text;
        string countryName = grvCity.Rows[gvr.RowIndex].Cells[4].Text;
        bool isActive = ((CheckBox)grvCity.Rows[gvr.RowIndex].Cells[5].Controls[0]).Checked;
        ddlEditCountryName.SelectedIndex = ddlEditCountryName.Items.IndexOf(ddlEditCountryName.Items.FindByText(countryName));
        BindStateAdd(ddlEditStateName, ddlEditCountryName);
        ddlEditStateName.SelectedIndex = ddlEditStateName.Items.IndexOf(ddlEditStateName.Items.FindByText(stateName));
        txtEditCityName.Text = cityName;
        chkEditIsActive.Checked = isActive;
        mpe2.Show();
    }
    protected void imgBtnDelete_Click(object sender, EventArgs e)
    {
        Button btnDelete = sender as Button;
        GridViewRow gvr = (GridViewRow)btnDelete.NamingContainer;
        int CityId = Convert.ToInt32(grvCity.DataKeys[gvr.RowIndex].Value);
        ViewState["DelCityId"] = CityId;
        lblDeleteError.Text = "Are You Sure You Want To Delete<b> " + grvCity.Rows[gvr.RowIndex].Cells[2].Text + "</b> City ?";
        
        mpe3.Show();
    }
    protected void ddlAddCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
        if (ddlAddCountryName.SelectedIndex != 0)
        {
            BindStateAdd(ddlAddState, ddlAddCountryName);
            ddlAddState.Items.Insert(0, new ListItem("<Select>", "0"));
        }
        else if(ddlAddCountryName.SelectedIndex==0)
        {
            ddlAddState.Items.Clear();
            ddlAddState.Items.Add(new ListItem("Please Select Country","0"));
        }
        mpe1.Show();
    }
    
    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objCity.CountryId = int.Parse(ddlAddCountryName.SelectedItem.Value);
        objCity.StateId = int.Parse(ddlAddState.SelectedItem.Value);
        objCity.CityName = txtAddCity.Text.Trim();
        objCity.IsActive = chkAddIsActive.Checked;
        if (objCity.InsertCity() > 0)
        {
            lblError.Text = "<b>City Inserted Successfully</b>";
            txtAddCity.Text = string.Empty;
            chkAddIsActive.Checked = false;
            ddlAddCountryName.Focus();
            ddlAddCountryName.SelectedIndex = 0;
            ddlAddState.Items.Clear();
            ddlAddState.Items.Add(new ListItem("Please Select Country", "0"));
            mpe1.Show();
            BindCity();           
        }
        else
        {
            lblError.Text = "State Insertion Failed";
        }
    }
    protected void ddlEditCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
        BindStateAdd(ddlEditStateName, ddlEditCountryName);
        mpe2.Show();
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        if (ViewState["DelCityId"] != null)
        {

            objCity.CityId = Convert.ToInt32(ViewState["DelCityId"]);
            if (objCity.DeleteCityById() > 0)
            {
                BindCity();
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (ViewState["EditCityId"] != null)
        {
            objCity.CityId = Convert.ToInt32(ViewState["EditCityId"]);
            objCity.CountryId = Convert.ToInt32(ddlEditCountryName.SelectedItem.Value);
            objCity.StateId = Convert.ToInt32(ddlEditStateName.SelectedItem.Value);
            objCity.CityName = txtEditCityName.Text.Trim();
            objCity.IsActive = chkEditIsActive.Checked;
            if (objCity.UpdateCity() > 0)
            {
                BindCity();
            }
            else
            {
                lblEditError.Text = "Updation Failed";
            }
        }
    }
    protected void ddlStateName_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity();
    }
    protected void txtAddCity_TextChanged(object sender, EventArgs e)
    {
        mpe1.Show();
    }
    protected void chkAddIsActive_CheckedChanged(object sender, EventArgs e)
    {
        mpe1.Show();
    }
    protected void grvCity_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}