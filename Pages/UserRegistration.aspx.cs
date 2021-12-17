using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_UserRegistration : System.Web.UI.Page
{
    common objdb = new common();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();



        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        int IsActive = 0;
        if (CheckBox1.Checked == true)
        {

            IsActive = 1;
        }

        if (btn_Register.Text == "Register")
        {
            objdb.ByProcedure("SP_UserRegistration"
                         , new string[] { "flag", "UserName", "Password", "IsActive" }
                         , new string[] { "1", txt_UserName.Text.Trim(), txt_Password.Text.Trim(),IsActive.ToString() 
                                  }, "dataset");

            //lblMsg.Text = objdb.Alert("fa-check", "alert-success", "Thank You!", "Product Saved Successfully.");
        }
        else if (btn_Register.Text == "MODIFY" && ViewState["I_ProductID"] != "0")
        {
            objdb.ByProcedure("SP_UserRegistration"
                         , new string[] { "flag", "UserName", "Password", "IsActive", "User_Id" }
                         , new string[] { "2", txt_UserName.Text.Trim(), txt_Password.Text.Trim(), CheckBox1.Text, ViewState["I_ProductID"].ToString() }, "dataset");

           // lblMsg.Text = objdb.Alert("fa-check", "alert-success", "Thank You!", "Product Modify Successfully.");
        }

        FillGrid();
        txt_UserName.Text = "";
        txt_Password.Text = "";
        CheckBox1.Text = "";
        btn_Register.Text = "Register";



    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        ViewState["I_ProductID"] = GridView1.SelectedDataKey.Value.ToString();
        DataSet ds1 = objdb.ByProcedure("SP_UserRegistration"
                             , new string[] { "flag", "User_Id" }
                             , new string[] { "5", ViewState["I_ProductID"].ToString() }, "dataset");

        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            txt_UserName.Text = ds1.Tables[0].Rows[0]["UserName"].ToString();
            txt_Password.Text = ds1.Tables[0].Rows[0]["Password"].ToString();
            CheckBox1.Text = ds1.Tables[0].Rows[0]["IsActive"].ToString();

            btn_Register.Text = "MODIFY";
        }



    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string I_ProductID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        ds = objdb.ByProcedure("SP_UserRegistration"
                             , new string[] { "flag", "User_Id" }
                             , new string[] { "4", I_ProductID }, "dataset");

        FillGrid();
    }
    protected void FillGrid()
    {
        GridView1.DataSource = null;
        GridView1.DataBind();
        ds = null;
        ds = objdb.ByProcedure("SP_UserRegistration"
        , new string[] { "flag" }
        , new string[] { "3" }, "dataset");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }
}