using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text != "" && txtPassword.Text != "")
        {
            string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
            SqlConnection sconn = new SqlConnection(mystring);

            SqlCommand cmd_sel = new SqlCommand("select * from tbl_admin_loggin where username=@uname and password=@password", sconn);
            cmd_sel.Parameters.AddWithValue("@uname", txtUserName.Text);
            cmd_sel.Parameters.AddWithValue("@password", txtPassword.Text);

            cmd_sel.Connection = sconn;
            SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                divError.Visible = false;

                string username = ds.Tables[0].Rows[0]["username"].ToString();
                string Password = ds.Tables[0].Rows[0]["password"].ToString();
                if (username == txtUserName.Text && Password == txtPassword.Text)
                {
                    Session["admin"] = txtUserName.Text.Trim();
                    Response.Redirect("Dashboard.aspx");

                }
                else
                {
                    divError.Visible = true;
                }
            }
            else 
            {
                divError.Visible = true;
            }
        }
    }
}