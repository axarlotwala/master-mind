using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class admin_view_user : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
  

    protected void Page_Load(object sender, EventArgs e)
    {
           SqlConnection sconn = new SqlConnection(mystring);

           if (Request.QueryString["cust_id"] != null && Request.QueryString["cust_id"].ToString() != "")
           {

               SqlDataAdapter adpt = new SqlDataAdapter("select * From Tbl_customer where cust_id='" + Request.QueryString["cust_id"].ToString() + "'", sconn);
               DataSet ds = new DataSet();
               adpt.Fill(ds);
               if (ds.Tables[0].Rows.Count > 0)
               {
                   string block = ds.Tables[0].Rows[0]["Block"].ToString();
                   string sql = "";
                   if (block == "No")
                   {
                       sql = "update tbl_customer set block='Yes' where cust_id='" + Request.QueryString["cust_id"].ToString() + "'";
                   }
                   else
                   {
                       sql = "update tbl_customer set block='No' where cust_id='" + Request.QueryString["cust_id"].ToString() + "'";
                   }

                   SqlCommand cmd = new SqlCommand(sql, sconn);
                   if (sconn.State == ConnectionState.Closed)
                       sconn.Open();

                   cmd.ExecuteNonQuery();
                   sconn.Close();
                   Response.Redirect("view_user.aspx");
               }
           }
        
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        {
            if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
            {
                sconn.Open();
                SqlCommand del = new SqlCommand("delete from Tbl_customer where cust_id='" + Request.QueryString["del"] + "'", sconn);
                del.ExecuteNonQuery();
                Response.Redirect("view_user.aspx");
                sconn.Close();
            }
        }
        view_user();
      }
   
    protected void view_user()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select * from  tbl_customer", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater10.DataSource = ds;
        Repeater10.DataBind();
        sconn.Close();
    }
    protected void Lbtndelete_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        SqlCommand del = new SqlCommand("delete from Tbl_customer where cust_id='" + hfcust_id.Value + "'", sconn);
        del.ExecuteNonQuery();
        Response.Redirect("view_user.aspx");
        sconn.Close();
    }
}