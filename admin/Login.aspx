<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Admin Login | MasterMind </title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="assets/js/modernizr.min.js"></script>
    <style type="text/css">
        .form-group {
    margin-left: -15px;
    margin-right: -15px;
}

.form-group {
    margin-bottom: 50px;
}
        .form-control {
            width: 100%;
    
    padding: 6px 12px;
    -moz-border-radius: 2px;
    -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
    -webkit-border-radius: 2px;
    -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
    background-color: #fafafa;
    border-radius: 2px;
    border: 1px solid #eee;
    box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
    box-shadow: none;
    color: rgba(0,0,0,0.6);
    font-size: 14px;
}
.form-control1 {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    -moz-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    -moz-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    -ms-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
    </style>
</head>
<body>
    <form id="form3" runat="server" >
    <div class="wrapper-page" style="width: 500px;">
        <div class="panel panel-color panel-primary panel-pages">
            <div class="panel-heading bg-img">
                <div class="bg-overlay"></div>
                <h3 class="text-center m-t-10 text-white">Sign In to <strong>MasterMind Panel</strong></h3>
            </div>
            <div class="panel-body">
                
                    <div id="divError" runat="server" visible="false" class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        Invalid Username or Password. Please try again!!!
                    </div>
                <form class="form-horizontal m-t-20">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control input-lg" required="" placeholder="Username"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control input-lg" TextMode="Password" required="" placeholder="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="checkbox checkbox-primary">
                                <input id="checkbox-signup" type="checkbox">
                                <label for="checkbox-signup">Remember me</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-center m-t-40">
                        <div class="col-xs-12">
                            <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-lg w-lg waves-effect waves-light" OnClick="btnSubmit_Click">Log In</asp:LinkButton>

                        </div>
                    </div>
                  </form>
            </div>
        </div>
    </div>
        </form>
    <script>var resizefunc = [];</script>
    <script src="assets/js/moltran.min.js"></script>
</body>
</html>
