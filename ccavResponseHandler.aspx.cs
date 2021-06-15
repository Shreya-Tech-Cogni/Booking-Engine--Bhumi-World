using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using CCA.Util;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ResponseHandler : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["temp.Properties.Settings.tempConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string workingKey = "31437C204A0866A2BC9A250C535D7DD9";//put in the 32bit alpha numeric key in the quotes provided here
            CCACrypto ccaCrypto = new CCACrypto();
            string encResponse = ccaCrypto.Decrypt(Request.Form["encResp"],workingKey);
            NameValueCollection Params = new NameValueCollection();
            string[] segments = encResponse.Split('&');
            foreach (string seg in segments)
            {
                string[] parts = seg.Split('=');
                if (parts.Length > 0)
                {
                    string Key = parts[0].Trim();
                    string Value = parts[1].Trim();
                    Params.Add(Key, Value);
                }
            }
            
            for (int i = 0; i < Params.Count; i++)
            {
            Response.Write("<b><p>TRANSACTION SUCCESSFULLY COMPLETED!!!</P></B><br>");
            Response.Write(Params.Keys[i] + " = " + Params[i] + "<br>");
            }
      

    }
    }
