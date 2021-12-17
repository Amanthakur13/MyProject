using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 

public partial class Emp_reg : System.Web.UI.Page
{
    common objdb = new common();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();
            GetDepartment();
 
        }
    }

    protected void btnregister_Click(object sender, EventArgs e) 
    {
        if (btnregister.Text == "Register")
        {
            objdb.ByProcedure("sp_reg"
                         , new string[] { "flag", "EmployeeName", "Email", "Address", "Phoneno", "Age",  "Dept_id" }
                         , new string[] { "1", txtEmpName.Text.Trim(), txtEmail.Text.Trim(), txtAddress.Text.Trim(), txtPhoneno.Text.Trim(), txtAge.Text.Trim(), DropDownList1.SelectedValue }, "dataset");

            FillGrid();
            

           
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {


 
    }
    protected void FillGrid()
    {        
        GridView1.DataSource = null;
        GridView1.DataBind();

        ds = objdb.ByProcedure("sp_reg"
                             , new string[] { "flag" }
                             , new string[] { "4" }, "dataset");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
    }

    public void GetDepartment()
    {
        DataSet ds_departt = objdb.ByProcedure("sp_reg",
        new string[] { "flag" },
        new string[] { "5" }, "dataset");



        if (ds_departt.Tables[0].Rows.Count > 0)
        {
            DropDownList1.DataSource = ds_departt.Tables[0];
            DropDownList1.DataTextField = "Dept_name";
            DropDownList1.DataValueField = "Dept_id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Select", "0"));
        }
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
        string I_ProductID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        ds = objdb.ByProcedure("sp_reg"
                             , new string[] { "flag", "I_ProductID" }
                             , new string[] { "6", I_ProductID }, "dataset");

        FillGrid();
        
    }
}