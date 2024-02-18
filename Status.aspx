<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Status.aspx.cs" Inherits="Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" sizes="48x48" href="img/favicon/Ecom-favicon-purple-48-x-48.html">
    <link rel="apple-touch-icon" sizes="57x57" href="img/favicon/Ecom-favicon-purple-57-x-57.html">
    <link rel="apple-touch-icon" sizes="72x72" href="img/favicon/Ecom-favicon-purple-72-x-72.html">
    <link rel="apple-touch-icon" sizes="114x114" href="img/favicon/Ecom-favicon-purple-114-x-114.html">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="libs/animate/animate.css">
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap-dropdownhover.min.css">
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="libs/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="libs/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="libs/waves/css/waves.css">


    <!-- Uncompressed CSS files
	<link rel="stylesheet" href="css/fonts.css">
	<link rel="stylesheet" href="css/main.css">  
	-->

    <link rel="stylesheet" href="css/fonts.min.css">
    <link rel="stylesheet" href="css/main.min.css">

    <script src="libs/modernizr/modernizr.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    

                <div class="form-horizontal" role="form">
                                    <div class="div-group">
    <div class="panel-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">Ticket</label>
            <div class="col-sm-10">
                <asp:DropDownList ID="drpticktno" class="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>

       
        <div class="form-group">
            <label class="col-sm-2 control-label">status</label>
            <div class="col-sm-10">
                <asp:DropDownList ID="drpstatus" class="form-control" runat="server">
                   
                    <asp:ListItem>complete</asp:ListItem>
                    <asp:ListItem>Switch</asp:ListItem>
                    </asp:DropDownList>

            </div>
        </div>
        

                                <div class="div-group">
                                        <label class="col-md-2 control-label">Description</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtdescp" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox><br />
                                        </div>
                                    </div>

        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <asp:Button ID="btnsubmit" class="btn btn-success waves-effect waves-light" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
            </div>
        </div>
    </div>
    </div>
       </div>
           <script src="js/compressed.min.js"></script>
</asp:Content>

