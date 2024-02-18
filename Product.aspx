<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

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
    <div class="main-content"><!-- Blocks with the goods Start -->
		<div class="box-1675">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sidebar">
						<!-- Block Bar Categories Start -->
						<div class="block-sidebar hidden-768">
							<div class="title-sidebar">
								All categories
							</div>
							<div class="content-sidebar">
								<ul class="categories-wrap">
								<asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
										<li><a href="Product.aspx?cid=<%# Eval("categ_id") %>"><%# Eval("categ_name") %></a></li>
										</ItemTemplate>
									</asp:Repeater>
									</ul>
								</div>
							</div>	<!-- Block Bar Categories End -->
						<!-- Block Bar Filters Start -->
							<!-- Block Bar Filters End -->
					
						<!-- Block Bar Bunner Start -->
						<div class="block-bunners hidden-768">
									<a href="#"><img src="img/bunner-img.jpg" alt=""></a>
								</div>	<!-- Block Bar Bunner End -->
					
						<!-- Block Bar Offers Start -->
							<div class="block-sidebar hidden-768">
								<div class="title-sidebar">
									Special offers
								</div>
								<div class="block-special-offers" style="height:400px; overflow-y:scroll;">
									<ul>
<asp:Repeater ID="Repeater3" runat="server">
    <ItemTemplate>
										<li>
											<a href="Productdetail.aspx">
												<div class="spec-offers-img">
													<img src="admin/image/product/<%# Eval("img") %>" alt="">
												</div>
												<div class="spec-offers-content">
													<div class="spec-offers-title" title="<%# Eval("title") %>"><%# Eval("title") %></div>
													<div class="spec-offers-cost" title="Rs. <%# Eval("new_price") %>">Rs. <%# Eval("new_price") %></div>
												</div>
											</a>
										</li>
										</ItemTemplate>
</asp:Repeater>
									</ul>
								</div>
							</div>	<!-- Block Bar Offers End -->
						
						</div>						<div class="col-content">
						<div class="title">
							<h1>Product</h1>
						</div>
						<div class="box-sampe hidden-sm hidden-xs">
							<div class="stract-box-sample" id="stract-box-sample">
							<button class="js-stract-sample stract-sample stract-arrow-down" id="js-stract-sample">
								<span class="stract-one js-active-stract active"></span><i class="fa fa-angle-down" aria-hidden="true"></i>
						
							</button>
							<ul id="stract-list">
								<li data-stract="stract-one"><span class="stract-one"></span></li>
								<li  class="active" data-stract="stract-two"><span class="stract-two"></span></li>
								<li class="active" data-stract="stract-three"><span class="stract-three"></span></li>
								<li class="active" data-stract="stract-four"><span class="stract-four"></span></li>
							</ul>
						</div>
						
						<div class="box-sort-sample">
							<div class="sort-box-sample" id="sort-box-sample">
							<button class="js-sort-sample sort-sample sort-arrow-down" id="js-sort-sample">
								<span class="sort-one js-active-sort active">Sort by price</span><i class="fa fa-angle-down" aria-hidden="true"></i>
						
							</button>
								<ul id="sort-list">
									<li data-sort="sort-one"><span>Sort by price</span>
						</li>
									<li class="active" data-sort="sort-two"><span>By date</span></li>
									<li class="active" data-sort="sort-three"><span>From A to Z</span></li>
									<li class="active" data-sort="sort-four"><span>From Z to A</span></li>
								</ul>
							</div>
						
						
						</div>
						</div>						
                            <div class="display-unit">
							<div class="block-products unit-one active" id="unit-one">
									<asp:Repeater ID="Repeater1" runat="server">

                                    <ItemTemplate>
  
                                <div class="wrap-products-masonry js-change-img js-wrap-products">
									<div class="block-bestseller"><p>Bestseller</p></div>
										<a href="Productdetail.aspx?pid=<%# Eval("product_id") %>" class="box-img-products">
											
											<img src="admin/image/product/<%# Eval("img") %>" alt="">
										</a>
										<div class="prod-offer">
											<a href="Productdetail.aspx?pid=<%# Eval("product_id") %>&cid=<%# Eval("categ_id") %>" class="title-product" title="Box one"><%# Eval("title") %></a>
											<div class="wrap-info-prod">
												<span class="mark-info-prod hidden-768"><a href="Productdetail.aspx">Category</a></span>
												<span class="shlist-info-prod"><a href="page_wish-list.html"><i class="fa fa-heart icon-wish" aria-hidden="true"></i><%# Eval("cname") %></a></span>
											</div>
												
											<div class="descr-prod hidden-768">
												<%# Eval("descripation") %>
											</div>
											<div class="box-price-prod">
												
                                              <span class="price-now"> <span style="color:black"> <del>Rs. <%# Eval("old_price") %></del></span> Rs. <%# Eval("new_price") %></span>
												
											</div>
                                          
									</div>
									</ItemTemplate>
									</asp:Repeater>

                                 
							</div>
							
						</div>
						<!-- Block Content End -->
					</div>
				</div>
			</div>
		</div>
	</div>
    <script src="js/compressed.min.js"></script>
</asp:Content>

