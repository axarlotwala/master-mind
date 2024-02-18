using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Contact_us : System.Web.UI.Page
{

    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string sqlQuery = "INSERT INTO tbl_feedback values('" + txtname.Text.Trim() + "','"+txtmail.Text.Trim()+"','"+txtmsg.Text.Trim()+"')";
        SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);

        sconn.Open();
        sqlcmd.ExecuteNonQuery();
        sconn.Close();
      }
}