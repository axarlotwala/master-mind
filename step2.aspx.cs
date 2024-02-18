using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class step2 : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        SqlCommand cmd_sel = new SqlCommand("select * from tbl_customer where otp=@otp and contact_no='" + Session["Contact"] + "'", sconn);

            cmd_sel.Parameters.AddWithValue("@otp", txtotp.Text);
            cmd_sel.Connection = sconn;
            SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
            DataSet ds = new DataSet();
            adp.Fill(ds);


            if (ds.Tables[0].Rows.Count > 0)
            {
                  Session["otp"] = txtotp.Text;
                  Response.Redirect("step3.aspx");
              
            }
            else
            {
                divError.Visible = true;
            }
        }
   
}