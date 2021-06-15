using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bramhacorp
{
    public partial class Dataform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblBillingName.Text = Request.QueryString["BillingName"];
            lblAddress.Text = Request.QueryString["Address"];
            lblcity.Text = Request.QueryString["city"];
            //lblcountry.Text = Request.QueryString["country"];
            lblemail.Text = Request.QueryString["email"];
            lblphone.Text = Request.QueryString["phone"];
            lblstate.Text = Request.QueryString["state"];
            lblzip.Text = Request.QueryString["zip"];
            string orderid= Request.QueryString["orderid"];
            order_id.Value=Request.QueryString["orderid"];
            lblorderid.Text = orderid;

            //urlRediret.Value = "ccavResponseHandler.aspx?orderid=" + orderid;

        }
    }
}