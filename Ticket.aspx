<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Ticket.aspx.cs" Inherits="Ticket" %>

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
    <link href="admin/assets/vendor/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
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

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbXDsEJcgc13bVo1u4mHMY0h6c1cTquWg&v=3.exp&sensor=false&libraries=places"></script>
<script>


    function initialize() {

        var input = document.getElementById('<% =txtlandmark.ClientID %>');
        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.setTypes(['geocode']);
        google.maps.event.addListener(autocomplete, 'place_changed', function () {
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                return;
            }

            var address = '';
            if (place.address_components) {
                address = [
                    (place.address_components[0] && place.address_components[0].short_name || ''),
                    (place.address_components[1] && place.address_components[1].short_name || ''),
                    (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
            }
            /*********************************************************************/
            /* var address contain your autocomplete address *********************/
            /* place.geometry.location.lat() && place.geometry.location.lat() ****/
            /* will be used for current address latitude and longitude************/
            /*********************************************************************/
            document.getElementById('<% =lat.ClientID %>').value = place.geometry.location.lat();
            document.getElementById('<% =logi.ClientID %>').value = place.geometry.location.lng();
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);



    function empty_text() {
        document.getElementById('lat').value = "";
        document.getElementById('long').value = "";
    }

</script>

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
						<h1>Add Ticket</h1>
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
                        <asp:TextBox ID="txtdescp" Class="name" name="contact-name" Placeholder="descripation" TextMode="MultiLine"  runat="server"></asp:TextBox><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdescp" Font-Bold="true" ForeColor="Red" ErrorMessage="User Name Is Rquire"></asp:RequiredFieldValidator>
                    
					
                            <asp:TextBox ID="txtaddress" Class="name" name="contact-name" placeholder="Address" TextMode="MultiLine"  runat="server"></asp:TextBox><br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtaddress" Font-Bold="true" ForeColor="Red" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
                              
                            
                            <asp:TextBox ID="txtlandmark"  Class="name" name="contact-NO" placeholder="Landmark"  runat="server"></asp:TextBox><br />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlandmark" Font-Bold="true" ForeColor="Red" ErrorMessage="Phone no Is Require"></asp:RequiredFieldValidator>
         <asp:HiddenField ID="lat" runat="server" />
         <asp:HiddenField ID="logi" runat="server" />

                            
                                       
                                <asp:TextBox ID="txtnextdate"  CssClass="name mydatepicker" placeholder="Requirenext-Date" runat="server"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtnextdate" Font-Bold="true" ForeColor="Red" ErrorMessage="Next Date"></asp:RequiredFieldValidator>

                                   <asp:FileUpload ID="fimage" runat="server" class="form-control"/>
                                            <img runat="server" id="imgfile" visible="false"  style="height:60px; width:60px;" />
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fimage" ForeColor="Red" Font-Bold="true" ErrorMessage="Image is required"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Select Only Image" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$"  ControlToValidate="fimage" ForeColor="Red" Font-Bold="true"></asp:RegularExpressionValidator>

                          
                             <asp:Button ID="btnsubmit" runat="server" class="btn-contact button-lardge"  Text="Submit" OnClick="btnsubmit_Click"/>
                            
						
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
    <script type="text/javascript" src="admin/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".mydatepicker").datepicker({
                format: "yyyy-mm-dd",
                startDate: new Date()
            });
        });
    </script>
</asp:Content>

