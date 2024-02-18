<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

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
        
        System.Data.DataTable ObjDT = new System.Data.DataTable("ShoppingCart");
        ObjDT.Columns.Add("ProdID", typeof(System.String));
        ObjDT.Columns.Add("ProdName", typeof(System.String));
        ObjDT.Columns.Add("Quantity", typeof(System.String));
        ObjDT.Columns.Add("UnitPrice", typeof(System.String));
        ObjDT.Columns.Add("TotalPrice", typeof(System.String));
        Session["ShoppingCart"] = ObjDT;

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
