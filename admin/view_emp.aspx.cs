using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_view_employee : System.Web.UI.Page
{
    string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);

        if (Request.QueryString["emp_id"] != null && Request.QueryString["emp_id"].ToString() != "")
        {

            SqlDataAdapter adpt = new SqlDataAdapter("select * From Tbl_employee where emp_id='" + Request.QueryString["emp_id"].ToString() + "'", sconn);
            DataSet ds = new DataSet();
            adpt.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string block = ds.Tables[0].Rows[0]["Block"].ToString();
                string sql = "";
                if (block == "No")
                {
                    sql = "update tbl_employee set block='Yes' where emp_id='" + Request.QueryString["emp_id"].ToString() + "'";
                }
                else
                {
                    sql = "update tbl_employee set block='No' where emp_id='" + Request.QueryString["emp_id"].ToString() + "'";
                }

                SqlCommand cmd = new SqlCommand(sql, sconn);
                if (sconn.State == ConnectionState.Closed)
                    sconn.Open();

                cmd.ExecuteNonQuery();
                sconn.Close();
                Response.Redirect("view_emp.aspx");
            }
        }

        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (Request.QueryString["del"] != null && Request.QueryString["del"].ToString() != "")
        {
            sconn.Open();
            SqlCommand del = new SqlCommand("delete from Tbl_employee where emp_id=' " + Request.QueryString["del"] + "'", sconn);
            del.ExecuteNonQuery();
            Response.Redirect("view_emp.aspx");
            sconn.Close();
        }
        view_employee();
    }

    protected void view_employee()
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();

        SqlCommand cmd_sel = new SqlCommand("select * from Tbl_employee", sconn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        Repeater11.DataSource = ds;
        Repeater11.DataBind();

        sconn.Close();
    }
    protected void Lbtndelete_Click(object sender, EventArgs e)
    {
        SqlConnection sconn = new SqlConnection(mystring);
        sconn.Open();
        SqlCommand del = new SqlCommand("delete from Tbl_employee where emp_id='" + hfemp_id.Value + "'", sconn);
        del.ExecuteNonQuery();
        Response.Redirect("view_emp.aspx");
        sconn.Close();
    }
}