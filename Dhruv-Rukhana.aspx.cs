using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace bramhacorp
{
    public partial class Dhruv_Rukhana : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["temp.Properties.Settings.tempConnectionString"].ConnectionString);
        bool countid = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string useragent = Request.Headers["User-Agent"].ToString();
            var userAgent = Request.Headers["User-Agent"];
            string uaString = Convert.ToString(userAgent[0]);
            if (!IsPostBack)
            {
                try
                {
                    Session["stringuid"] = "";
                    if (Session["roomid"] == null)
                    {
                        Session["roomid"] = "d87k02zkfnhf";
                    }
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    if (Session["id"] != null && Session["username"] != null)
                    {

                        lblusernamehidden.Value = Session["username"].ToString();

                        SqlCommand cmdd = new SqlCommand("Select Top(1)  id,uid,name as name,emailid,mobileno  from customermaster where id=@uid", con);
                        cmdd.Parameters.AddWithValue("@uid", Session["id"].ToString());
                        SqlDataAdapter dad = new SqlDataAdapter(cmdd);
                        DataTable dtd = new DataTable();
                        dad.Fill(dtd);
                        if (dtd.Rows.Count > 0)
                        {
                            if (Request.Cookies["_ga"] != null)
                            {
                                string strcookies = Request.Cookies["_ga"].Value.ToString().Remove(0, 6);
                                SqlCommand cmdg = new SqlCommand("select * from customeranalytics   where cid=@cid and uid=@uid ", con);
                                cmdg.Parameters.AddWithValue("@cid", strcookies);
                                cmdg.Parameters.AddWithValue("@uid", dtd.Rows[0]["uid"].ToString());
                                SqlDataAdapter dag = new SqlDataAdapter(cmdg);
                                DataTable dtg = new DataTable();
                                dag.Fill(dtg);
                                if (dtg.Rows.Count == 0)
                                {
                                    int i = 1;
                                    SqlCommand cmdg1 = new SqlCommand("select * from customeranalytics   where  uid=@uid ", con);
                                    cmdg1.Parameters.AddWithValue("@uid", dtd.Rows[0]["uid"].ToString());
                                    SqlDataAdapter dag1 = new SqlDataAdapter(cmdg1);
                                    DataTable dtg1 = new DataTable();
                                    dag1.Fill(dtg1);
                                    if (dtg1.Rows.Count > 0)
                                    {
                                        i = (dtg1.Rows.Count + 1);
                                    }


                                    SqlCommand cmd1 = new SqlCommand("Insert into customeranalytics (cid,uid, entrydate,device,name,mobileno,emailid,projectid)values(@cid,@uid,@entrydate,@device,@name,@mobileno,@emailid,@projectid)", con);
                                    cmd1.Parameters.AddWithValue("@entrydate", encryptdecrypt.indiandate());
                                    cmd1.Parameters.AddWithValue("@uid", dtd.Rows[0]["uid"].ToString());
                                    cmd1.Parameters.AddWithValue("@name", dtd.Rows[0]["name"].ToString());
                                    cmd1.Parameters.AddWithValue("@emailid", dtd.Rows[0]["emailid"].ToString());
                                    cmd1.Parameters.AddWithValue("@mobileno", dtd.Rows[0]["mobileno"].ToString());
                                    cmd1.Parameters.AddWithValue("@cid", strcookies);
                                    cmd1.Parameters.AddWithValue("@projectid", Session["projectid"].ToString());
                                    cmd1.Parameters.AddWithValue("@device", "Device" + i.ToString());
                                    int k1 = cmd1.ExecuteNonQuery();
                                }
                                SqlCommand cmd2f = new SqlCommand("Insert into CustomerLogMaster(userid,logintime,cid) values (@userid,@logintime,@cid)", con);
                                cmd2f.Parameters.AddWithValue("@logintime", encryptdecrypt.indiandate());
                                cmd2f.Parameters.AddWithValue("@userid", dtd.Rows[0]["id"].ToString());
                                cmd2f.Parameters.AddWithValue("@cid", strcookies);
                                int k2f = cmd2f.ExecuteNonQuery();
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "bodyfun1", " ga('set', 'dimension1', '" + strcookies + "');", true);
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "bodyfun2", " ga('set', 'dimension2', '" + dtd.Rows[0]["uid"].ToString() + "');", true);
                            }
                            //  ScriptManager.RegisterStartupScript(Page, Page.GetType(), "bodyfun1", " ga('set', 'dimension1', '" + Session["gadimension"].ToString() + "');", true);
                        }
                        Session["stringuid"] = Session["id"].ToString();

                    }
                    else
                    {
                        Response.Redirect("sales.aspx", false);
                    }

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

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Application["username"] = null;
            Session["id"] = null;

            Application["amauniqueid"] = null;
            Response.Redirect(GetRouteUrl("login", new { }), false);

        }
    }
}