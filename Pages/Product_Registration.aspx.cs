using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
//using System.Collections.Generic;
public partial class Pages_Product_Registration : System.Web.UI.Page
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
    protected void btnAddProduct_Click(object sender, EventArgs e)
    {

        int IsActive = 0;
        if (CheckBox1.Checked == true)
        {

            IsActive = 1;
        }


        if (btn_AddProduct.Text == "Add Product")
        {
            string pathname = "";
            if (FileUpload1.PostedFile != null)
            {
                string imgfile = Path.GetFileName(FileUpload1.PostedFile.FileName);
                pathname = "../images/" + Guid.NewGuid() + "-" + imgfile;
                FileUpload1.SaveAs(Server.MapPath(pathname));
            }
            objdb.ByProcedure("SP_ProductDetail"
                         , new string[] { "flag", "Product_Name", "Product_Price", "IsActive", "Image_Path" }
                         , new string[] { "1", txt_ProductName.Text.Trim(), txt_ProductRate.Text.Trim(), IsActive.ToString(),pathname
                                 }, "dataset");

            // lblMsg.Text = objdb.Alert("fa-check", "alert-success", "Thank You!", "Product Saved Successfully.");
        }
        else if (btn_AddProduct.Text == "MODIFY")
        {
            objdb.ByProcedure("SP_ProductDetail"
                         , new string[] { "flag", "Product_Name", "Product_Price", "IsActive", }
                         , new string[] { "3", txt_ProductName.Text.Trim(), txt_ProductRate.Text.Trim(), IsActive.ToString() }, "dataset");

            //lblMsg.Text = objdb.Alert("fa-check", "alert-success", "Thank You!", "Product Modify Successfully.");
        }


        FillGrid();
        txt_ProductName.Text = "";
        txt_ProductRate.Text = "";
        CheckBox1.Text = "";

        btn_AddProduct.Text = "Add Product";

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        ViewState["ID"] = GridView1.SelectedDataKey.Value.ToString();
        DataSet ds1 = objdb.ByProcedure("SP_ProductDetail"
                             , new string[] { "flag", "Product_Id" }
                             , new string[] { "5", ViewState["ID"].ToString() }, "dataset");

        if (ds1 != null && ds1.Tables[0].Rows.Count > 0)
        {
            txt_ProductName.Text = ds1.Tables[0].Rows[0]["Product_Name"].ToString();
            txt_ProductRate.Text = ds1.Tables[0].Rows[0]["Product_Price"].ToString();
            CheckBox1.Text = ds1.Tables[0].Rows[0]["IsActive"].ToString();


            btn_AddProduct.Text = "MODIFY";
        }




    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Product_Id = GridView1.DataKeys[e.RowIndex].Value.ToString();
        ds = objdb.ByProcedure("SP_ProductDetail"
                            , new string[] { "flag", "Product_Id" }
                            , new string[] { "4", Product_Id }, "dataset");

        FillGrid();

    }
    protected void FillGrid()
    {
        GridView1.DataSource = null;
        GridView1.DataBind();

        ds = objdb.ByProcedure("SP_ProductDetail"
                             , new string[] { "flag" }
                             , new string[] { "2" }, "dataset");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }
    protected void Upload(object sender, EventArgs e)
    {

    }

}