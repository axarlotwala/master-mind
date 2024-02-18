using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;

public partial class admin_employee : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["myConnection"].ToString());
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["upd"] != null && Request.QueryString["upd"].ToString()!="")
                {
                    bind_div_data(Request.QueryString["upd"]);
                }
         }
      }

    private void bind_div_data(string s)
    {
        SqlCommand sel = new SqlCommand("select * from Tbl_employee where emp_id='"+s+"'", sconn);
        sconn.Open();
        SqlDataReader dr = sel.ExecuteReader();
        if(dr.Read())
        {
            ViewState["eid"]=dr["emp_id"];
            txtempname.Text=dr["emp_name"].ToString();
            txtcontact.Text=dr["contact_no"].ToString();
            txtemailid.Text=dr["email_id"].ToString();
            txtadd.Text=dr["address"].ToString();
           txtusername.Text=dr["username"].ToString();
            txtpassword.Text=dr["password"].ToString();

            divPwd.Visible = false;
            
            lblhead.InnerText = "Update Employee Detail";
 
            imgfile.Visible = true;
            if (dr["profile"].ToString() != "")
            {
                hfoldImageName.Value = dr["profile"].ToString();
                imgfile.Src = "image/Employee/" + dr["profile"].ToString();
                reqimage.Enabled = false;
            }
            else 
            {
                reqimage.Enabled = false;
            }

            if (drpBlock.Items.FindByValue(dr["block"].ToString()) != null)
            {
                drpBlock.Items.FindByValue(dr["block"].ToString()).Selected = true;
            }

            btnsubmit.Text = "Update";
            btnreset.Text = "Cancel";
        }
        sconn.Close();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (txtempname.Text.Trim() != " ")
        {
            if (ViewState["eid"] == null || ViewState["eid"].ToString() == "")
            {
                SqlCommand sel = new SqlCommand("select * from Tbl_employee where email_id='" + txtemailid.Text.Trim() + "'", sconn);
                SqlDataAdapter adp = new SqlDataAdapter(sel);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    divError.Visible = true;
                }
                else
                {
                    string fname = DateTime.Now.Ticks + FileUpload2.FileName;                                        

                    string sqlQuery = "INSERT INTO tbl_employee values('" + txtempname.Text.Trim() + "','" + txtcontact.Text.Trim() + "','" + txtemailid.Text.Trim() + "','" + fname + "','" + txtadd.Text.Trim() + "','" + txtusername.Text.Trim() + "','" + txtpassword.Text.Trim() + "','" + drpBlock .SelectedValue+ "')";
                    SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
                    sconn.Open();

                    int res = 0;

                    try
                    {
                        res = sqlcmd.ExecuteNonQuery();
                        if (res != -1)
                        {

                            FileUpload2.SaveAs(Server.MapPath("image/Employee/") + fname);

                            string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=axarlotwala@gmail.com:123456789&senderID=TEST SMS&receipientno=" + txtcontact.Text.Trim() + "&msgtxt=username :: " + txtusername.Text.Trim() + "Password ::" + txtpassword.Text.Trim() + "&state=4";
                            WebRequest request = HttpWebRequest.Create(strUrl);
                            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                            Stream s = (Stream)response.GetResponseStream();
                            StreamReader readStream = new StreamReader(s);
                            string dataString = readStream.ReadToEnd();
                            response.Close();
                            s.Close();
                            readStream.Close();

                            divSuccess.Visible = true;
                            divError.Visible = false;
                            ClearValues();
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
            else
            {
                string fname = "";
                if (FileUpload2.FileName != "")
                {
                    fname = DateTime.Now.Ticks + FileUpload2.FileName;
                }
                else
                {
                    fname = hfoldImageName.Value;
                }

                string sqlQuery = "Update Tbl_employee set emp_name ='" + txtempname.Text.Trim() + "',contact_no='" + txtcontact.Text.Trim() + "',email_id='" + txtemailid.Text.Trim() + "',profile='" + fname + "',address='" + txtadd.Text.Trim() + "',username='" + txtusername.Text.Trim() + "',block='" + drpBlock.SelectedValue + "'  where emp_id='" + ViewState["eid"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(sqlQuery, sconn);
                sconn.Open();

                int res = 0;
                try
                {
                    res = sqlcmd.ExecuteNonQuery();
                    if (res != -1)
                    {

                        if (FileUpload2.FileName != "")
                        {
                            FileUpload2.SaveAs(Server.MapPath("image/Employee/") + fname);
                        }
                        divSuccess.Visible = true;
                        divError.Visible = false;
                        ClearValues();
                        Response.Redirect("view_emp.aspx");
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
    }
        private void ClearValues()
        {
                txtempname.Text="";
                txtcontact.Text = "";
                txtemailid.Text = "";
                txtadd.Text = "";
                txtusername.Text = "";
                txtpassword.Text = "";
                imgfile.Visible = false;
                hfoldImageName.Value="";
                reqimage.Enabled = true;
                ViewState["eid"] = null;
                divPwd.Visible = true;
        }
}





        
    
