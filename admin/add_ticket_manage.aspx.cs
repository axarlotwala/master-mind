using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_ticket_manage : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
            
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            FillCustomers();
            FillProduct();
            FillEmployee();
        }
    }

 

    private void FillEmployee()
    {
     SqlConnection sconn = new SqlConnection(mystring);
     SqlDataAdapter adpt = new SqlDataAdapter("select * from tbl_employee where block='no'", sconn);
     DataSet ds = new DataSet();
     adpt.Fill(ds);

     if (ds.Tables[0].Rows.Count > 0)
        {
         drpemployee.DataSource = ds.Tables[0];
         drpemployee.DataTextField = "emp_name";
         drpemployee.DataValueField = "emp_id";
         drpemployee.DataBind();
        }
    }

    private void FillProduct()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from tbl_product", sconn);
        DataSet ds = new DataSet();
        adpt.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                drpproduct.DataSource = ds.Tables[0];
                drpproduct.DataTextField = "product_code";
                drpproduct.DataValueField = "product_id";
                drpproduct.DataBind();
            }
    }

    private void FillCustomers()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        SqlDataAdapter adpt = new SqlDataAdapter("select * from tbl_customer",sconn);
        DataSet ds = new DataSet();
        adpt.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            drpCustomers.DataSource = ds.Tables[0];
            drpCustomers.DataTextField = "cust_name";
            drpCustomers.DataValueField = "cust_id";
            drpCustomers.DataBind();
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (drpCustomers.SelectedValue != "")
        {
            SqlConnection sconn = new SqlConnection(mystring);

            String SqlQuery = "INSERT INTO tbl_ticket values('"+drpCustomers.SelectedValue+"','"+drpproduct.SelectedValue+"','"+txtdescripation.Text.Trim()+"','"+txtadd.Text.Trim()+"','"+txtlandmark.Text.Trim()+"','"+txtlatitude.Text.Trim()+"','"+txtlongtitude.Text.Trim()+"','"+Convert.ToDateTime(txtreservedate.Text.Trim())+"','"+txtrequiretime.Text.Trim()+"','','"+DateTime.Now.ToString()+"','"+drpemployee.SelectedValue +"','"+DBNull.Value+"','"+DBNull.Value+"','"+txtstatus.Text.Trim()+"')";
            SqlCommand sqlcmd = new SqlCommand(SqlQuery, sconn);
            sconn.Open();

            int res = 0;
            try
            {
                res = sqlcmd.ExecuteNonQuery();
                if (res != -1)
                {
                    divSuccess.Visible = true;
                    divError.Visible = false;
                }
                else
                {
                    divSuccess.Visible = false;
                    divError.Visible = true;
                }      
            }
            catch (Exception ex)
                {
                divSuccess.Visible = false;
                divError.Visible = true;
                }
            sconn.Close();
    }
}
    private void clearvalues()
    {
        drpCustomers.ClearSelection();
        drpproduct.ClearSelection();
        txtdescripation.Text = "";
        txtadd.Text = "";
        txtlandmark.Text = "";
        txtlatitude.Text = "";
        txtlongtitude.Text = "";
        txtreservedate.Text = "";
        txtrequiretime.Text = "";
        // txtticketdate.Text = "";
        drpemployee.ClearSelection();
        //txtassigndate.Text = "";
        txtstatus.Text = "";
    }
}
