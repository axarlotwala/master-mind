<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

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
    <style>
        .main-wishlist .block-cart table .cart-name-prodct {
            width: 30%;} 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
   <div class="main-wishlist">
	<div class="box-1675">
		<div class="container-fluid">
			<div class="row">
											<!-- Block Bar Offers End -->
				
				<div class="wishlist-content">
				<div class="title-wishlist entry-title">
					<h1>My Order</h1>	
				</div>
				
				<div class="wish-list" style="width:130%">

		<div>
							<div>
								<table  class="table table-striped table-bordered" >
									<thead>
										<tr>
											<th>
                                                <span>ORDER</span>
											</th>
											<th>
												<span>Address</span>
											</th>
											<th>
												<span>PAY MODE</span>
											</th>
											<th>
												<span>PAYMENT</span>
											</th>
											<th>
											DETAIL
										</th>	
										
										</tr>
                                       </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>                    
         <tr>
											<td>
                                                <span>ORDER201700<%# Eval("order_id") %></span>
											</td>
											<td>
												<span><%# Eval("address") %></span>
                                                </td>
											<td>
												<span><%# Eval("mode") %></span>
											</td>
											<td>
												<span>Rs. <%# Eval("total_pay") %></span>
											</td>
											<td>
											<a href="product_list.aspx?oid=<%# Eval("order_id") %>" class="button-small">View More </a>
											
											</td>
										</tr>
								</ItemTemplate>
                                        </asp:Repeater>   
                                        </tbody>		
								</table>
							</div>
						</div>

				</div>
			</div>
		</div>
	</div>
</div>
</div>
          
     
     <script src="js/compressed.min.js"></script>
</asp:Content>

