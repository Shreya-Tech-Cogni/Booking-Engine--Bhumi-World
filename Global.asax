<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
 
 
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
    public static void RegisterRoutes(RouteCollection routeCollection)
    {


        // Login Page
        routeCollection.MapPageRoute("login", "Login", "~/index.aspx");
        routeCollection.MapPageRoute("adminlogin", "AdminLogin", "~/adminlogin.aspx");
        routeCollection.MapPageRoute("steps", "Steps", "~/steps.aspx");
        routeCollection.MapPageRoute("home", "Home", "~/home.aspx");
        routeCollection.MapPageRoute("logout1", "Oracular-Log-Out", "~/logout.aspx");
        routeCollection.MapPageRoute("recover", "Recover", "~/resetpassword.aspx");
        routeCollection.MapPageRoute("comingsoon", "Comingsoon", "~/comingsoon.aspx");
        routeCollection.MapPageRoute("logout", "LogOut", "~/logout.aspx");
       
        routeCollection.MapPageRoute("booking", "Bookings", "~/login.aspx");
        routeCollection.MapPageRoute("bookingprocess", "BookingProcess", "~/inventorytemp.aspx");
        routeCollection.MapPageRoute("bookingid", "Booking/{id}", "~/inventorytemp.aspx");
        //BlogCategoryList
        //routeCollection.MapPageRoute("idblogcategorymaster", "MatchBox-Blog-Category/{id}/{title}", "~/blogcategorymaster.aspx");
        //routeCollection.MapPageRoute("blogcategorymaster", "MatchBox-Add-New-Blog-Category", "~/blogcategorymaster.aspx");
        //routeCollection.MapPageRoute("blogcategorylist", "MatchBox-Blog-Category-List", "~/blogcategorylist.aspx");


         
    }  
</script>
