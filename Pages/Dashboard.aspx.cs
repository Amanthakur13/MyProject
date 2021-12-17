using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Pages_Dashboard : System.Web.UI.Page
{
    common objdb = new common();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetTable();
            RepeterData();
            // RepeterCart();
            RepeterTable();

            getTableData();


            foreach (RepeaterItem item in repeater_table.Items)
            {
                DataSet ds1 = null;
                Button OccupyTable = (Button)item.FindControl("btn_Table");
                Label TableNumber = (Label)item.FindControl("lbl_tableid");
                ds1 = objdb.ByProcedure("SP_ProductBilling",
                new String[] { "flag", "Table_id" },
                new string[] { "12", TableNumber.Text }, "DataSet");
                if (ds1 != null)
                {
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToInt16(ds1.Tables[0].Rows[0]["Tablecount"].ToString()) > 0)
                        {
                            OccupyTable.BackColor = Color.Green;
                        }
                        else
                        {
                            OccupyTable.BackColor = Color.Red;
                        }

                    }
                    else
                    {
                        OccupyTable.BackColor = Color.Red;
                    }

                }
                else
                {
                    OccupyTable.BackColor = Color.Red;
                }
            }




        }
    }
    public void txt_Name_TextChanged(object sender, EventArgs e)
    {

    }
    public void txt_Phoneno_TextChanged(object sender, EventArgs e)
    {

    }
    public void txt_Email_TextChanged(object sender, EventArgs e)
    {

    }
    public void ddls_Table_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public void GetTable()
    {
        DataSet ds_productname = objdb.ByProcedure("SP_ProductBilling",
            new String[] { "flag" },
            new string[] { "6" }, "DataSet");

        if (ds_productname.Tables[0].Rows.Count > 0)
        {
            DropDown.DataSource = ds_productname.Tables[0];
            DropDown.DataTextField = "table_Name";
            DropDown.DataValueField = "Table_id";
            DropDown.DataBind();
            DropDown.Items.Insert(0, new ListItem("Select", "0"));
        }
    }

    public void RepeterData()
    {
        ds = objdb.ByProcedure("SP_ProductDetail",
            new String[] { "flag" },
            new string[] { "2" }, "DataSet");
        Repeater.DataSource = ds;
        Repeater.DataBind();
    }

    public void btn_Order(object sender, EventArgs e)
    {
    }


    


    protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //string ProductId = ((Label)e.Item.FindControl("lbl_productid")).ToString();

        switch (e.CommandName)
        {


            case "Order":


                Label ProductId = (Label)e.Item.FindControl("lbl_productid");
                Label ProductName = (Label)e.Item.FindControl("Lbl_ProductName");
                Label ProductPrice = (Label)e.Item.FindControl("Lbl_ProductPrice");
                Label ProductQuantity = (Label)e.Item.FindControl("lbl_quantity");



                // Label tableid = (Label)e.Item.FindControl("lbl_tableid");


                double ProductRate = Convert.ToDouble(ProductPrice.Text);
                int qty = 1;
                objdb.ByProcedure("SP_ProductBilling"
                        , new string[] { "flag", "Product_Name", "Product_Price", "Quantity", "Product_id", "Table_id" }
                        , new string[] { "8", ProductName.Text,ProductRate.ToString(),qty.ToString(),ProductId.Text,DropDown.SelectedValue
                                 }, "dataset");


                getTableData();

                double total = 0;
                double FinalTotal = 0;
                foreach (RepeaterItem item in Repeatercart.Items)
                {

                    Label price = (Label)item.FindControl("Lbl_ProductPrice");
                    Label Qty = (Label)item.FindControl("lbl_quantity");

                    total = Convert.ToDouble(price.Text) * Convert.ToDouble(Qty.Text);
                    FinalTotal = FinalTotal + total;
                    lblTotalprice.Text = Convert.ToString(FinalTotal);
                }

                break;

        }

    }
    public void RepeterCart()
    {
        ds = objdb.ByProcedure("SP_ProductBilling",
            new String[] { "flag" },
            new string[] { "2" }, "DataSet");
        Repeatercart.DataSource = ds;
        Repeatercart.DataBind();
    }
    public void btn_Delete(object sender, EventArgs e)
    {

    }
    public void delete()
    {

    }
    public void btn_Add(object sender, EventArgs e)
    {

    }
    public void btn_Sub(object sender, EventArgs e)
    {

    }
    public void AddQty(EventArgs e, object sender)
    {


        int qty1 = 1;
        qty1++;

        Repeatercart.DataSource = ds;
        Repeatercart.DataBind();
    }

    protected void Repeatercart_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {

            case "Delete":

                Label TempId = (Label)e.Item.FindControl("lbl_tempid");
                ds = objdb.ByProcedure("SP_ProductBilling"
                                     , new string[] { "flag", "temp_id" }
                                     , new string[] { "3", TempId.Text }, "dataset");


                //RepeterCart();
                getTableData();



                 double total = 0;
                double FinalTotal = 0;
                foreach (RepeaterItem item in Repeatercart.Items)
                {

                    Label price = (Label)item.FindControl("Lbl_ProductPrice");
                    Label Qty = (Label)item.FindControl("lbl_quantity");

                    total = Convert.ToDouble(price.Text) * Convert.ToDouble(Qty.Text);
                    FinalTotal = FinalTotal + total;
                    lblTotalprice.Text = Convert.ToString(FinalTotal);
                }


                break;

            case "Add":
                Label NewproId = (Label)e.Item.FindControl("lbl_productid");
                Label NewtempId = (Label)e.Item.FindControl("lbl_tempid");
                Label NewProductQuantity = (Label)e.Item.FindControl("lbl_quantity");
                int Newqty = Convert.ToInt32(NewProductQuantity.Text) + 1;
                ds = objdb.ByProcedure("SP_ProductBilling"
                                    , new string[] { "flag", "Quantity", "temp_id", "Product_id" }
                                    , new string[] { "7", Newqty.ToString(), NewtempId.Text, NewproId.Text }, "dataset");
                //RepeterCart();
                getTableData();


                 double total2 = 0;
                double FinalTotal2 = 0;
                foreach (RepeaterItem item in Repeatercart.Items)
                {

                    Label price = (Label)item.FindControl("Lbl_ProductPrice");
                    Label Qty = (Label)item.FindControl("lbl_quantity");

                    total2 = Convert.ToDouble(price.Text) * Convert.ToDouble(Qty.Text);

                    
                    FinalTotal2 = FinalTotal2 + total2;
                    lblTotalprice.Text = Convert.ToString(FinalTotal2);
                }



                break;

            case "Sub":
                Label NewproId1 = (Label)e.Item.FindControl("lbl_productid");
                Label NewtempId1 = (Label)e.Item.FindControl("lbl_tempid");
                Label NewProductQuantity1 = (Label)e.Item.FindControl("lbl_quantity");
                int Newqty1 = Convert.ToInt32(NewProductQuantity1.Text) - 1;
                if (Newqty1 > 0)
                {
                    ds = objdb.ByProcedure("SP_ProductBilling"
                                        , new string[] { "flag", "Quantity", "temp_id", "Product_id" }
                                        , new string[] { "7", Newqty1.ToString(), NewtempId1.Text, NewproId1.Text }, "dataset");
                    //RepeterCart();
                    getTableData();


                    double total1 = 0;
                    double FinalTotal1 = 0;
                    foreach (RepeaterItem item in Repeatercart.Items)
                    {

                        Label price = (Label)item.FindControl("Lbl_ProductPrice");
                        Label Qty = (Label)item.FindControl("lbl_quantity");

                        total1 = Convert.ToDouble(price.Text) * Convert.ToDouble(Qty.Text);


                        FinalTotal1 = FinalTotal1 + total1;
                        lblTotalprice.Text = Convert.ToString(FinalTotal1);
                    }



                }


                break;

        }

    }
    public void btn_Table(object sender, EventArgs e)
    {

    }
    protected void Repeater_tablecommand(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Table":
                Label NewtableId = (Label)e.Item.FindControl("lbl_tableid");
                
                DropDown.SelectedValue = NewtableId.Text;
                getTableData();
                DataSet dstables = null;
                Button OccupyTable = (Button)e.Item.FindControl("btn_Table");
                Label TableNumber = (Label)e.Item.FindControl("lbl_tableid");
                dstables = objdb.ByProcedure("SP_ProductBilling",
                new String[] { "flag", "Table_id" },
                new string[] { "12", TableNumber.Text }, "DataSet");
                if (dstables != null)
                {
                    int finaltotal1 = 0;
                    int finaltottal2 = 0;
                    int finaltotal = 0;
                    
                    if (dstables.Tables[0].Rows.Count > 0)
                    {
                        
                        
                        
                        if (Convert.ToInt16(dstables.Tables[0].Rows[0]["Tablecount"].ToString()) > 0)
                        {
                            OccupyTable.BackColor = Color.Green;
                            
                        }
                        else
                        {
                            OccupyTable.BackColor = Color.Red;
                            lblTotalprice.Text = Convert.ToString(finaltotal);
                        }

                    }
                    else
                    {
                        OccupyTable.BackColor = Color.Red;
                        lblTotalprice.Text = Convert.ToString(finaltotal1);
                    }

                }
                else
                {
                    OccupyTable.BackColor = Color.Red;
                    //lblTotalprice.Text = Convert.ToString(finaltottal);
                }



                double total = 0;
                double FinalTotal = 0;
                foreach (RepeaterItem item in Repeatercart.Items)
                {

                    Label price = (Label)item.FindControl("Lbl_ProductPrice");
                    Label Qty = (Label)item.FindControl("lbl_quantity");

                    total = Convert.ToDouble(price.Text) * Convert.ToDouble(Qty.Text);
                    FinalTotal = FinalTotal + total;
                    lblTotalprice.Text = Convert.ToString(FinalTotal);
                }








                
                break;
        }

    }

    public void RepeterTable()
    {
        ds = objdb.ByProcedure("SP_ProductBilling",
            new String[] { "flag" },
            new string[] { "9" }, "DataSet");
        repeater_table.DataSource = ds;
        repeater_table.DataBind();
    }

    public void getTableData()
    {

        if (DropDown.SelectedIndex != 0)
        {
            lblShowTableNo.Text = DropDown.SelectedItem.Text;
            ds = null;
            ds = objdb.ByProcedure("SP_ProductBilling",
               new String[] { "flag", "Table_id" },
               new string[] { "11", DropDown.SelectedValue }, "DataSet");
            Repeatercart.DataSource = ds;
            Repeatercart.DataBind();


        }


    }


}