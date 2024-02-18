<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="step3.aspx.cs" Inherits="step3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="main-bread">
<div class="box-1675">
    <div class="container-fluid">
      <div class="row">
        <div class="block-bread">
          <span><a href="index-2.html">Home</a></span>
          <span><i class="fa fa-angle-right" aria-hidden="true"></i>Forget Password</span>
        </div>
      </div>
    </div>
    </div>
</div>
<!-- Bread Сrumbs End -->


<!-- Blocks with the goods Start -->
<div class="main-contacts">
	<div class="box-1675">
		<div class="container-fluid">
			<div class="row" style="margin-left:400px;">
					
				<div class="box-contacts">
					<div class="title">
						<h1>Forget Password</h1>
					</div>

                <div id="divError" runat="server" visible="false" class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                      There is some error in submitting data. Please try again!!!
                </div>

					<div class="top">           
						<div class="form-contact">
                  <asp:TextBox ID="txtnewpassword" Class="name" name="contact-name" placeholder="New password" runat="server"></asp:TextBox><br /> 
                  <asp:TextBox ID="txtconfirmpassword" Class="name" name="contact-name" placeholder="Confirm password" runat="server"></asp:TextBox> 

          		    <asp:Button ID="btnsave" class="btn-contact button-lardge"  runat="server" Text="Save" OnClick="btnsave_Click" /> 
				</div>
						<div class="block-info">
							
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
    <script src="js/compressed.min.js"></script>


</asp:Content>


