    <%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

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
          <span><i class="fa fa-angle-right" aria-hidden="true"></i>Contacts</span>
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
			<div class="row">
					
				<div class="box-contacts">
					<div class="title">
						<h1>Registration</h1>
					</div>

   <div id="divSuccess" runat="server" visible="false" class="alert alert-success alert-dismissable">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                      Data has been submitted successfully
     </div>
     <div id="divError" runat="server" visible="false" class="alert alert-danger alert-dismissable">
     <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        There is some error in submitting data. Please try again!!!
     </div>

                    
					<div class="top">
						<div class="form-contact">
                        <asp:TextBox ID="txtcustname" Class="name" name="contact-name" Placeholder="Name"  runat="server"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcustname" Font-Bold="true" ForeColor="Red" ErrorMessage="User Name Is Rquire"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Enter User Name" ControlToValidate="txtcustname" Font-Bold="true" ForeColor="Red"></asp:RegularExpressionValidator>

					    	<asp:TextBox ID="txtcustcontact"  Class="name" name="contact-NO" placeholder="Contact No"   runat="server"></asp:TextBox><br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcustcontact" Font-Bold="true" ForeColor="Red" ErrorMessage="Phone no Is Require"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="\d{10}" ErrorMessage="Only Number!!" ControlToValidate="txtcustcontact" Font-Bold="true" ForeColor="Red"></asp:RegularExpressionValidator>


                            <asp:TextBox ID="txtcustemail" Class="name"   name="contact-name" placeholder="Email ID"  runat="server"></asp:TextBox><br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcustemail" Font-Bold="true" ForeColor="Red" ErrorMessage="Email Is Require"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Enter User Name" ControlToValidate="txtcustemail" Font-Bold="true" ForeColor="Red"></asp:RegularExpressionValidator>

					
                            <asp:TextBox ID="txtcustpassword"  Class="name" name="contact-name" placeholder="Password"  TextMode="Password" runat="server"></asp:TextBox><br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcustpassword" Font-Bold="true" ForeColor="Red" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
                         

                            
                            <asp:TextBox ID="txtcustaddress" TextMode="MultiLine" Class="name" name="contact-name" placeholder="Address" runat="server"></asp:TextBox><br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcustaddress" Font-Bold="true" ForeColor="Red" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
                        
                            <asp:FileUpload ID="Fileprofile" runat="server" />
                            <img runat="server" id="imgfile" visible="false" style="height: 60px; width: 60px;" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Image Is Require" ControlToValidate="Fileprofile" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                           
                          

                             <asp:Button ID="btnsubmit" runat="server" class="btn-contact button-lardge"  Text="Submit" onclick="btnsubmit_Click1" />
                            
						
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