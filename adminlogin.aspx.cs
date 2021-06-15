using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;
using System.IO.Ports;
using System.Globalization;

namespace bramhacorp
{
    public partial class adminlogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["temp.Properties.Settings.tempConnectionString"].ConnectionString);
        bool countid = false;
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Clear();
            Session.RemoveAll();

            if (!IsPostBack)
            {


                try
                {
                    Session["stringuid"] = "";
                    Session["roomid"] = "d87k02zkfnhf";

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }


                    pnlotp.Visible = false;


                    pnlregi.Visible = false;




                }
                catch (Exception ex)
                {
                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }

                }
            }
        }







        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                if (txtloginname.Text != "" && txtloginpass.Text != "")
                {



                    SqlCommand cmd2 = new SqlCommand("Select   id,empcode,(firstname + ' ' + lastname) as name,islogin,isactive,gender,isbookingprint,weblink from GalaxyAccount   where emailID=@emailID and password=@mypassword and compcode=2", con);
                    cmd2.Parameters.AddWithValue("@emailID", encryptdecrypt.Encrypt(txtloginname.Text.Trim().ToLower()));
                    cmd2.Parameters.AddWithValue("@mypassword", encryptdecrypt.Encrypt(txtloginpass.Text));
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd2);
                    DataTable dt = new DataTable();
                    da1.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                       Session["projectid"] = "5";
                       
                        SqlCommand cmdee1kj = new SqlCommand("select distinct r.roomid From roommasterexecutive as rr left outer join roommaster as r on r.id=rr.roomid where rr.executiveid=@id and rr.projectid=@projectid", con);
                        cmdee1kj.Parameters.AddWithValue("@id", dt.Rows[0]["id"].ToString());
                        cmdee1kj.Parameters.AddWithValue("@projectid", Session["projectid"].ToString());
                        SqlDataAdapter adp12kj = new SqlDataAdapter(cmdee1kj);
                        DataTable dt12kj = new DataTable();
                        adp12kj.Fill(dt12kj);
                        if (dt12kj.Rows.Count > 0)
                        {
                            Session["roomid"] = dt12kj.Rows[0]["roomid"].ToString();
                        }

                        SqlCommand cmd2d = new SqlCommand("Insert into GalaxyLogMaster(userid,logintime,demoid) values (@userid,@logintime,'1')", con);
                        cmd2d.Parameters.AddWithValue("@logintime", encryptdecrypt.indiandate());
                        cmd2d.Parameters.AddWithValue("@userid", dt.Rows[0]["id"].ToString());
                        int k2d = cmd2d.ExecuteNonQuery();

                        SqlCommand cmd = new SqlCommand("select  id,name as name from CustomerMaster   where isaccountverify='1' and password=@password and  mobileno=@mobileno ", con);
                        cmd.Parameters.AddWithValue("@password", encryptdecrypt.Encrypt("1"));
                        cmd.Parameters.AddWithValue("@mobileno", "9909904981");
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt2 = new DataTable();
                        da.Fill(dt2);
                        if (dt2.Rows.Count > 0)
                        {
                            Session["id"] = dt2.Rows[0]["id"].ToString();
                            Session["username"] = dt2.Rows[0]["name"].ToString();
                            Response.Cookies["userid"].Value = dt2.Rows[0]["id"].ToString();
                            Response.Cookies["username"].Value = dt2.Rows[0]["name"].ToString();
                            lblmesg.Text = "";
                            lblagree.Text = "";
                            Session["stringuid"] = dt2.Rows[0]["id"].ToString();
                            Response.Redirect("sales1.aspx", false);
                        }
                        else
                        {
                            lblmesg.Text = "Invalid Credentials";
                        }

                    }
                }
                else
                {


                    if (txtloginname.Text == "")
                    {
                        lblmesg.Text = "Please Enter Email ID";
                    }
                    if (txtloginpass.Text == "")
                    {
                        lblmesg.Text = "Please Enter Password";
                    }
                }

            }
            catch (Exception ex)
            {
                lblmesg.Text = "Try after refreshing a page.";
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                //lblmesg.Text = "";

            }

        }


    }
}