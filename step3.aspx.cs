using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class step3 : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
            SqlConnection sconn = new SqlConnection(mystring);

            SqlCommand cmd_sel = new SqlCommand("select * from tbl_customer where otp='" + Session["otp"] + "' and contact_no='" + Session["Contact"] + "'", sconn);
          
            cmd_sel.Connection = sconn;
            SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
            DataSet ds = new DataSet();
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                SqlCommand cmd = new SqlCommand("update tbl_customer set password='" + txtconfirmpassword.Text + "' where  otp='" + Session["otp"] + "' and contact_no='" + Session["Contact"] + "'",sconn);
                sconn.Open();
                cmd.ExecuteNonQuery();
                sconn.Close();
                Session.RemoveAll();
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
            else
            {
                divError.Visible = true;
            }
    }
    private void ClearValues()
    {
        txtnewpassword.Text = "";
        txtconfirmpassword.Text = "";
    }
}