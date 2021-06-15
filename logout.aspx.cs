using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bramhacorp
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application["username"] = null;
            Session["id"] = null; 
            Application["amauniqueid"] = null;
            Response.Redirect(GetRouteUrl("login", new { }), false);
        }
    }
}