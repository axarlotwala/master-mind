using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnsubmit(object sender, EventArgs e)
    {
        if (txtusername.Text != "" && txtpassword.Text != "")
        {
            string mystring = System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString();
            SqlConnection sconn = new SqlConnection(mystring);

            if (RadioCustomer.Checked == true)
            {

                SqlCommand cmd_sel = new SqlCommand("select * from tbl_customer where email_id = @email_id and password = @password", sconn);

                cmd_sel.Parameters.AddWithValue("@email_id", txtusername.Text);

                cmd_sel.Parameters.AddWithValue("@password", txtpassword.Text);

                cmd_sel.Connection = sconn;
                SqlDataAdapter adp = new SqlDataAdapter(cmd_sel);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string Block = ds.Tables[0].Rows[0]["block"].ToString();
                    if (Block == "No")
                    {
                        string username = ds.Tables[0].Rows[0]["email_id"].ToString();
                        string password = ds.Tables[0].Rows[0]["password"].ToString();
                        string custid = ds.Tables[0].Rows[0]["cust_id"].ToString();
                        if (username == txtusername.Text && password == txtpassword.Text)
                        {
                            Session["Customer"] = txtusername.Text;
                            Session["Custid"] = custid;
                            Response.Redirect("view_ticket.aspx");
                        }
                        else
                        {
                            divError.Visible = true;
                        }
                    }

                    else
                    {
                        divblock.Visible = true;
                    }
                }
                else
                {

                    divError.Visible = true;
                }
             }    
            else
            {
                SqlCommand sel_emp = new SqlCommand("select * from tbl_employee where  username=@username and password=@password", sconn);

                sel_emp.Parameters.AddWithValue("@username", txtusername.Text);

                sel_emp.Parameters.AddWithValue("@password", txtpassword.Text);

                sel_emp.Connection = sconn;
                SqlDataAdapter adpt = new SqlDataAdapter(sel_emp);
                DataSet dss = new DataSet();
                adpt.Fill(dss);

                if (dss.Tables[0].Rows.Count > 0)
                {
                    string block = dss.Tables[0].Rows[0]["Block"].ToString();
                    if (block == "No")
                    {
                        string username = dss.Tables[0].Rows[0]["username"].ToString();
                        string password = dss.Tables[0].Rows[0]["password"].ToString();
                        string empid = dss.Tables[0].Rows[0]["emp_id"].ToString();
                        if (username == txtusername.Text && password == txtpassword.Text)
                        {
                            Session["Employee"] = txtusername.Text;
                            Session["Empid"] = empid;
                            Response.Redirect("View_ticket.aspx");
                        }
                        else
                        {
                            divError.Visible = true;
                        }
                    }
                    else
                    {
                        divblock.Visible = true;
                    }
                }
                else
                {
                    divError.Visible = true;
                }

            }


           
           

        }
    }
}