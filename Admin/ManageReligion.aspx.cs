using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIT.RealTime.BLL;
public partial class Admin_ManageReligion : System.Web.UI.Page
{
    Religion objReligion = new Religion();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "Religion";
            ViewState["SortBy"] = "ASC";
            BindReligionData();

        }
    }
    void BindReligionData()
    {

        objReligion.Religion1 = txtSearchReligion.Text.Trim();
        objReligion.SortOn = ViewState["SortOn"].ToString();
        objReligion.SortBy = ViewState["SortBy"].ToString();
        DataSet dsCountry = objReligion.GetReligion();
        grvReligion.DataSource = dsCountry.Tables[0];
        grvReligion.DataBind();
    }
    protected void imgBtnSearch_Click(object sender, EventArgs e)
    {
        BindReligionData();
    }
    protected void imgBtnAdd_Click(object sender, EventArgs e)
    {

    }
    protected void grvReligion_Sorting(object sender, GridViewSortEventArgs e)
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
        BindReligionData();
    }
    protected void grvReligion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvReligion.PageIndex = e.NewPageIndex;
        BindReligionData();
    }
    protected void imgBtnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = sender as Button;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        int ReligionId = Convert.ToInt32(grvReligion.DataKeys[gvr.RowIndex].Value);
        ViewState["EditReligionId"] = ReligionId;
        string Religion1 = grvReligion.Rows[gvr.RowIndex].Cells[2].Text;
        bool isActive = ((CheckBox)grvReligion.Rows[gvr.RowIndex].Cells[3].Controls[0]).Checked;
        txtEditReligion.Text = Religion1;
        chkEditIsActive.Checked = isActive;

        mpe2.Show();
        txtEditReligion.Focus();
    }
    protected void imgBtnDelete_Click(object sender, EventArgs e)
    {
        Button btnDelete = sender as Button;
        GridViewRow gvr = (GridViewRow)btnDelete.NamingContainer;
        int ReligionId = Convert.ToInt32(grvReligion.DataKeys[gvr.RowIndex].Value);
        ViewState["DelReligionId"] = ReligionId;
        lblDeleteError.Text = "Are You Sure You Want To Delete<b> " + grvReligion.Rows[gvr.RowIndex].Cells[2].Text + "</b> RelationShip ?";
        mpe3.Show();
    }
    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        mpe1.Hide();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objReligion.Religion1 = txtAddReligion.Text.Trim();

        objReligion.IsActive = chkAddIsActive.Checked;
        if (objReligion.InsertReligion() > 0)
        {
            lblError.Text = "Religion Inserted Successfully";
            txtAddReligion.Text = string.Empty;
            chkAddIsActive.Checked = false;
            txtAddReligion.Focus();
            BindReligionData();
        }
        else
        {
            lblError.Text = "Religion Insertion Failed";
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        if (ViewState["EditReligionId"] != null)
        {
            objReligion.ReligionId = Convert.ToInt32(ViewState["EditReligionId"]);
            objReligion.Religion1 = txtEditReligion.Text.Trim();
            objReligion.IsActive = chkEditIsActive.Checked;
            if (objReligion.UpdateReligion() > 0)
            {
                BindReligionData();
            }
            else
            {
                lblEditError.Text = "Updation Failed";
            }
        }
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {

        if (ViewState["DelReligionId"] != null)
        {
            objReligion.ReligionId = Convert.ToInt32(ViewState["DelReligionId"]);
            if (objReligion.DeleteReligionById() > 0)
            {
                BindReligionData();
            }
        }
    }
}