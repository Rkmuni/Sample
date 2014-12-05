using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIT.RealTime.BLL;
public partial class Admin_ManageRelationShip : System.Web.UI.Page
{
    RelationShip objRelationShip = new RelationShip();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "RelationShip";
            ViewState["SortBy"] = "ASC";
            BindRelationShipData();

        }
    }
    void BindRelationShipData()
    {

        objRelationShip.RelationShip1 = txtSearchRelationShip.Text.Trim();
        objRelationShip.SortOn = ViewState["SortOn"].ToString();
        objRelationShip.SortBy = ViewState["SortBy"].ToString();
        DataSet dsCountry = objRelationShip.GetRelationShip();
        grvRelationShip.DataSource = dsCountry.Tables[0];
        grvRelationShip.DataBind();
    }
    protected void imgBtnSearch_Click(object sender, EventArgs e)
    {
        BindRelationShipData();
    }
    protected void imgBtnAdd_Click(object sender, EventArgs e)
    {

    }
    protected void grvRelationShip_Sorting(object sender, GridViewSortEventArgs e)
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
        BindRelationShipData();
    }
    protected void grvRelationShip_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        grvRelationShip.PageIndex = e.NewPageIndex;
        BindRelationShipData();
    }
    protected void imgBtnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = sender as Button;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        int RelationShipId = Convert.ToInt32(grvRelationShip.DataKeys[gvr.RowIndex].Value);
        ViewState["EditRelationShipId"] = RelationShipId;
        string RelationShip1 = grvRelationShip.Rows[gvr.RowIndex].Cells[2].Text;
        bool isActive = ((CheckBox)grvRelationShip.Rows[gvr.RowIndex].Cells[3].Controls[0]).Checked;
        txtEditRelationShip.Text = RelationShip1;
        chkEditIsActive.Checked = isActive;

        mpe2.Show();
        txtEditRelationShip.Focus();
    }
    protected void imgBtnDelete_Click(object sender, EventArgs e)
    {
        Button btnDelete = sender as Button;
        GridViewRow gvr = (GridViewRow)btnDelete.NamingContainer;
        int RelationShipId = Convert.ToInt32(grvRelationShip.DataKeys[gvr.RowIndex].Value);
        ViewState["DelRelationShipId"] = RelationShipId;
        lblDeleteError.Text = "Are You Sure You Want To Delete<b> " + grvRelationShip.Rows[gvr.RowIndex].Cells[2].Text + "</b> RelationShip ?";
        mpe3.Show();
    }
    
    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        mpe1.Hide();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objRelationShip.RelationShip1 = txtAddRelationShip.Text.Trim();

        objRelationShip.IsActive = chkAddIsActive.Checked;
        if (objRelationShip.InsertRelationShip() > 0)
        {
            lblError.Text = "RelationShip Inserted Successfully";
            txtAddRelationShip.Text = string.Empty;
            chkAddIsActive.Checked = false;
            txtAddRelationShip.Focus();
            BindRelationShipData();
        }
        else
        {
            lblError.Text = "RelationShip Insertion Failed";
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (ViewState["EditHintQuestionId"] != null)
        {
            objRelationShip.RelationShipId = Convert.ToInt32(ViewState["EditHintQuestionId"]);
            objRelationShip.RelationShip1 = txtEditRelationShip.Text.Trim();
            objRelationShip.IsActive = chkEditIsActive.Checked;
            if (objRelationShip.UpdateRelationShip() > 0)
            {
                BindRelationShipData();
            }
            else
            {
                lblEditError.Text = "Updation Failed";
            }
        }
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        if (ViewState["DelRelationShipId"] != null)
        {
            objRelationShip.RelationShipId = Convert.ToInt32(ViewState["DelRelationShipId"]);
            if (objRelationShip.DeleteRelationShipById() > 0)
            {
                BindRelationShipData();
            }
        }
    }
}