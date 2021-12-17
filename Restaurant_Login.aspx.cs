using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Restaurant_Login : System.Web.UI.Page
{
    common objdb = new common();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Session["userName"] = "";
            }
        }

        catch (Exception ex)
        {
            LblMsg.Text = objdb.Alert("fa-ban", "alert-danger", "Sorry!", ex.Message.ToString());
        }
    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {



        LblMsg.Text = "";
        try
        {
            if (txt_UserName.Text.Trim() != "" && txt_Password.Text.Trim() != "")
            {
                DataSet ds_ACCESS1 = objdb.ByProcedure("SP_Login"
                                        , new string[] { "flag", "Username", "Password" }
                                        , new string[] { "1", txt_UserName.Text, txt_Password.Text }, "dataset");

                if (ds_ACCESS1 != null)
                {
                    if (ds_ACCESS1.Tables[0].Rows.Count > 0)
                    {

                        Session["userName"] = ds_ACCESS1.Tables[0].Rows[0]["Username"].ToString();


                        Response.Redirect("Pages/Product_Registration.aspx");

                    }
                    else
                    {
                        LblMsg.Text = objdb.Alert("fa-ban", "alert-danger", "Sorry!", "Please Enter Valid Credential.");
                        LblMsg.Text = "Sorry!, Please Enter Valid Credential.";
                    }
                }

                else
                {
                    LblMsg.Text = objdb.Alert("fa-ban", "alert-danger", "Sorry!", "Please Enter Valid Credential.");
                    LblMsg.Text = "Sorry!, Please Enter Valid Credential.";
                }
            }
            else
            {
                LblMsg.Text = objdb.Alert("fa-ban", "alert-danger", "Sorry!", "Please Enter Password");
                LblMsg.Text = "Sorry!, Please Enter Password.";
            }
        }
        catch (Exception ex)
        {
            LblMsg.Text = objdb.Alert("fa-ban", "alert-danger", "Sorry!", ex.Message.ToString());
        }




    }
}