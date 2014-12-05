using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NIT.RealTime.BLL;
public partial class Admin_ManageHintQuestion : System.Web.UI.Page
{
    HintQuestion objHintQuestion = new HintQuestion();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ViewState["SortOn"] = "HintQuestion";
            ViewState["SortBy"] = "ASC";
            BindHintQuestionData();

        }
    }
    void BindHintQuestionData()
    {
        objHintQuestion.HintQuestion1 = txtSearchHintQuestion.Text.Trim();
        objHintQuestion.SortOn = ViewState["SortOn"].ToString();
        objHintQuestion.SortBy = ViewState["SortBy"].ToString();
        DataSet dsCountry = objHintQuestion.GetHintQuestion();
        grvHintQuestion.DataSource = dsCountry.Tables[0];
        grvHintQuestion.DataBind();
    }
    protected void imgBtnSearch_Click(object sender, EventArgs e)
    {
        BindHintQuestionData();
    }
    protected void imgBtnAdd_Click(object sender, EventArgs e)
    {

    }
    protected void grvHintQuestion_Sorting(object sender, GridViewSortEventArgs e)
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
        BindHintQuestionData();
    }
    protected void grvHintQuestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvHintQuestion.PageIndex = e.NewPageIndex;
        BindHintQuestionData();
    }
    protected void grvHintQuestion_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void imgBtnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = sender as Button;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        int HintQuestionId = Convert.ToInt32(grvHintQuestion.DataKeys[gvr.RowIndex].Value);
        ViewState["EditHintQuestionId"] = HintQuestionId;
        string HintQuestion1 = grvHintQuestion.Rows[gvr.RowIndex].Cells[2].Text;
        bool isActive = ((CheckBox)grvHintQuestion.Rows[gvr.RowIndex].Cells[3].Controls[0]).Checked;
        txtEditHintQuestion.Text = HintQuestion1;
        chkEditIsActive.Checked = isActive;

        mpe2.Show();
        txtEditHintQuestion.Focus();
    }
    protected void imgBtnDelete_Click(object sender, EventArgs e)
    {
        Button btnDelete = sender as Button;
        GridViewRow gvr = (GridViewRow)btnDelete.NamingContainer;
        int hintQuestionId = Convert.ToInt32(grvHintQuestion.DataKeys[gvr.RowIndex].Value);
        ViewState["DelHintQuestionId"] = hintQuestionId;
        lblDeleteError.Text = "Are You Sure You Want To Delete<b> " + grvHintQuestion.Rows[gvr.RowIndex].Cells[2].Text + "</b> HintQuestion ?";
        mpe3.Show();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objHintQuestion.HintQuestion1 = txtAddHintQuestion.Text.Trim();

        objHintQuestion.IsActive = chkAddIsActive.Checked;
        if (objHintQuestion.InsertHintQuestion() > 0)
        {
            lblError.Text = "Hint Question Inserted Successfully";
            txtAddHintQuestion.Text = string.Empty;
            chkAddIsActive.Checked = false;
            txtAddHintQuestion.Focus();
            BindHintQuestionData();
        }
        else
        {
            lblError.Text = "Hint Question Insertion Failed";
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (ViewState["EditHintQuestionId"] != null)
        {
            objHintQuestion.HintQuestionId = Convert.ToInt32(ViewState["EditHintQuestionId"]);
            objHintQuestion.HintQuestion1 = txtEditHintQuestion.Text.Trim();
            objHintQuestion.IsActive = chkEditIsActive.Checked;
            if (objHintQuestion.UpdateHintQuestion() > 0)
            {
                BindHintQuestionData();
            }
            else
            {
                lblEditError.Text = "Updation Failed";
            }
        }
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        if (ViewState["DelHintQuestionId"] != null)
        {
            objHintQuestion.HintQuestionId = Convert.ToInt32(ViewState["DelHintQuestionId"]);
            if (objHintQuestion.DeleteHintQuestionById() > 0)
            {
                BindHintQuestionData();
            }
        }
    }
    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        mpe1.Hide();
    }
}