using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIT.RealTime.BLL;
using NIT.RealTime.BusinessCommon;

public partial class Admin_ManageState : System.Web.UI.Page
{
    State objState = new State();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "CountryName";
            ViewState["SortBy"] = "ASC";
            BindCountry();
            BindState();

        }

    }
    void BindCountry()
    {

        objState.SortOn = ViewState["SortOn"].ToString();
        objState.SortBy = ViewState["SortBy"].ToString();
        Common.BindCountryDDL(ddlCountryName);
        ddlCountryName.Items.Insert(0, new ListItem("<all>", "0"));

        Common.BindCountryDDL(ddlAddCountryName);
        ddlAddCountryName.Items.Insert(0, new ListItem("<Select>", "0"));

        Common.BindCountryDDL(ddlEditCountryName);
        ddlEditCountryName.Items.Insert(0, new ListItem("<Select>", "0"));

    }
    void BindState()
    {

        if (ddlCountryName.SelectedIndex == -1)
            objState.CountryId = 0;
        else
            objState.CountryId = int.Parse(ddlCountryName.SelectedItem.Value);
        if (txtStateName.Text == "" || txtStateName.Text == string.Empty)
            objState.StateName = string.Empty;
        else
        objState.StateName = txtStateName.Text.Trim();

        objState.SortOn = ViewState["SortOn"].ToString();
        objState.SortBy = ViewState["SortBy"].ToString();
        DataSet dsState = objState.GetAllState();
        grvState.DataSource = dsState;
        grvState.DataBind();


    }

    protected void imgBtnSearch_Click(object sender, EventArgs e)
    {
        BindState();
    }
    protected void ddlCountryName_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindState();
    }
    protected void grvState_Sorting(object sender, GridViewSortEventArgs e)
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
        BindState();
    }
    protected void grvState_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvState.PageIndex = e.NewPageIndex;
        BindState();
    }
    protected void imgBtnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = sender as Button;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        int stateId = Convert.ToInt32(grvState.DataKeys[gvr.RowIndex].Value);
        ViewState["EditStateId"] = stateId;
        string stateName = grvState.Rows[gvr.RowIndex].Cells[2].Text;
        string countryName = grvState.Rows[gvr.RowIndex].Cells[3].Text;
        bool isActive = ((CheckBox)grvState.Rows[gvr.RowIndex].Cells[4].Controls[0]).Checked;
        ddlEditCountryName.SelectedIndex = ddlEditCountryName.Items.IndexOf(ddlEditCountryName.Items.FindByText(countryName));
        txtEditStateName.Text = stateName;
        //put code for ddlEditState display

        chkEditIsActive.Checked = isActive;

        mpe2.Show();

    }
    protected void imgBtnDelete_Click(object sender, EventArgs e)
    {
        Button btnDelete = sender as Button;
        GridViewRow gvr = (GridViewRow)btnDelete.NamingContainer;
        int StateId = Convert.ToInt32(grvState.DataKeys[gvr.RowIndex].Value);
        ViewState["DelStateId"] = StateId;
        lblDeleteError.Text = "Are You Sure You Want To Delete<b> " + grvState.Rows[gvr.RowIndex].Cells[2].Text + "</b> State ?";
        mpe3.Show();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objState.CountryId = int.Parse(ddlAddCountryName.SelectedItem.Value);
        objState.StateName = txtAddState.Text.Trim();
        objState.IsActive = chkAddIsActive.Checked;
        if (objState.InsertState() > 0)
        {
          //  lblError.Text = "State Inserted Successfully";
            txtAddState.Text = string.Empty;
            chkAddIsActive.Checked = false;
            ddlAddCountryName.SelectedIndex = 0;
            ddlAddCountryName.Focus();

            ddlCountryName.SelectedIndex = -1;
            txtStateName.Text = string.Empty;
            BindState();
        }
        else
        {
            lblError.Text = "StateInsertion Failed";
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (ViewState["EditStateId"] != null)
        {
            objState.StateId = Convert.ToInt32(ViewState["EditStateId"]);
            objState.CountryId = Convert.ToInt32(ddlEditCountryName.SelectedItem.Value);
            objState.StateName = txtEditStateName.Text.Trim();
            objState.IsActive = chkEditIsActive.Checked;
            if (objState.UpdateState() > 0)
            {
                ddlCountryName.SelectedIndex = -1;
                txtStateName.Text = string.Empty;
                BindState();
            }
            else
            {
                lblEditError.Text = "Updation Failed";
            }
        }
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        if (ViewState["DelStateId"] != null)
        {

            objState.StateId = Convert.ToInt32(ViewState["DelStateId"]);
            if (objState.DeleteStateById() > 0)
            {
                ddlCountryName.SelectedIndex = -1;
                txtStateName.Text = string.Empty;
                BindState();
            }
            else
            {
                lblEditError.Text = "Deletion Failed";
            }
        }
    }
} 