using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Billing : System.Web.UI.Page
{
    common objdb = new common();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetProductName();
            GetTable();
            FillGrid();
        }

    }
    protected void ddls_ProductName_SelectedIndexChanged(object sender, EventArgs e)
    {



        txtd_UnitPrice.Text = "";
        txtI_Quantity.Text = "";
        // DropDown.Text = "";

        if (ddls_ProductName.SelectedIndex > 0)
        {
            DataSet dsGetDetail = objdb.ByProcedure("SP_ProductDetail"
                , new string[] { "flag", "Product_Id" }
                , new string[] { "6", ddls_ProductName.SelectedValue }, "dataset");

            if (dsGetDetail != null && dsGetDetail.Tables[0].Rows.Count > 0)
            {

                txtd_UnitPrice.Text = dsGetDetail.Tables[0].Rows[0]["Product_Price"].ToString();

            }
        }

    }


    protected void ddls_Table_SelectedIndexChanged(object sender, EventArgs e)
    {


    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        if (btnAdd.Text == "ADD")
        {
            objdb.ByProcedure("SP_ProductBilling"
                         , new string[] { "flag", "Product_Name", "Product_Price", "Quantity", "Table_No", "Total" }
                         , new string[] { "1", ddls_ProductName.Text.Trim(), txtd_UnitPrice.Text.Trim(), txtI_Quantity.Text.Trim(),DropDown.Text.Trim(),txtd_Total.Text.Trim()
                                 }, "dataset");

            // lblMsg.Text = objdb.Alert("fa-check", "alert-success", "Thank You!", "Product Saved Successfully.");
        }
        FillGrid();
        // ddls_ProductName.Text = "";
        txtd_UnitPrice.Text = "";
        txtI_Quantity.Text = "";
        // DropDown.Text="";
        txtd_Total.Text = "";
        btnAdd.Text = "ADD";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["ID"] = GridView1.SelectedDataKey.Value.ToString();
        DataSet ds1 = objdb.ByProcedure("SP_ProductBilling"
                             , new string[] { "flag", "temp_id" }
                             , new string[] { "4", ViewState["ID"].ToString() }, "dataset");

        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            ddls_ProductName.Text = ds1.Tables[0].Rows[0]["Product_Name"].ToString();
            txtd_UnitPrice.Text = ds1.Tables[0].Rows[0]["Product_Price"].ToString();
            txtI_Quantity.Text = ds1.Tables[0].Rows[0]["Quantity"].ToString();
            DropDown.Text = ds1.Tables[0].Rows[0]["Table_No"].ToString();
            txtd_Total.Text = ds1.Tables[0].Rows[0]["Total"].ToString();

            btnAdd.Text = "ADD";
        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string ID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        ds = objdb.ByProcedure("SP_ProductBilling"
                             , new string[] { "flag", "temp_id" }
                             , new string[] { "3", ID }, "dataset");

        FillGrid();

    }
    public void GetProductName()
    {
        DataSet ds_productname = objdb.ByProcedure("SP_ProductDetail",
            new String[] { "flag" },
            new string[] { "2" }, "DataSet");

        if (ds_productname.Tables[0].Rows.Count > 0)
        {
            ddls_ProductName.DataSource = ds_productname.Tables[0];
            ddls_ProductName.DataTextField = "Product_Name";
            ddls_ProductName.DataValueField = "Product_Id";
            ddls_ProductName.DataBind();
            ddls_ProductName.Items.Insert(0, new ListItem("Select", "0"));
        }



    }

    public void Sum()
    {
        double Total = Convert.ToDouble((txtd_UnitPrice.Text)) * Convert.ToDouble(txtI_Quantity.Text);
        txtd_Total.Text = Convert.ToString(Total);
    }
    protected void txt_Price_TextChanged(object sender, EventArgs e)
    {
        Sum();
    }
    protected void txt_quantity_TextChanged(object sender, EventArgs e)
    {
        Sum();
    }
    protected void FillGrid()
    {
        GridView1.DataSource = null;
        GridView1.DataBind();

        ds = objdb.ByProcedure("SP_ProductBilling"
                             , new string[] { "flag" }
                             , new string[] { "5" }, "dataset");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }

    public void GetTable()
    {
        DataSet ds_productname = objdb.ByProcedure("SP_ProductBilling",
            new String[] { "flag" },
            new string[] { "6" }, "DataSet");

        if (ds_productname.Tables[0].Rows.Count > 0)
        {
            DropDown.DataSource = ds_productname.Tables[0];
            DropDown.DataTextField = "Table_no";
            DropDown.DataValueField = "Table_id";
            DropDown.DataBind();
            DropDown.Items.Insert(0, new ListItem("Select", "0"));
        }
    }
}