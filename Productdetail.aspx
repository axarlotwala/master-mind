<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Productdetail.aspx.cs" Inherits="Productdetail" %>

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
   <div class="main-product">  
  <div class="block-title-product-mob">
    <div class="back-link-mob"><a href="product_accessories.html"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</a></div>
    <div class="title">Beap studio</div>
  </div>
  <!-- Slider Mobile Start -->
  <div id="slider-product-mob" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="item active">
        <img src="../../webark.io/ecom/presentation/html/img/blue/product_1_1_690x690.jpg" alt="">
      </div>
      <div class="item">
        <img src="../../webark.io/ecom/presentation/html/img/blue/product_1_2_690x690.jpg" alt="">  
      </div>
    </div>

    <!-- Controls Slider Start-->
    <a class="left carousel-control" href="#slider-product-mob" role="button" data-slide="prev">
     <i class="fa fa-angle-left" aria-hidden="true"></i>

   </a>
   <a class="right carousel-control" href="#slider-product-mob" role="button" data-slide="next">
     <i class="fa fa-angle-right" aria-hidden="true"></i>

   </a>
   <!-- Controls Slider End-->
 </div>
 <!-- Slider Mobile End -->
 <div class="block-price-mob">
  <span class="price-strike"></span>  
  <span class="price-normal">$1255.50</span>
  <asp:LinkButton ID="lnkAddToCart1" runat="server" CssClass="add-cart-mob button-small" OnClick="lnkAddToCart1_Click">Add to cart </asp:LinkButton>
</div>
</div>
<!-- Main Products for Modile End -->

<!-- Main Products for Desktop Start -->
<div class="main-product hidden-768">  
  <div class="box-1675">
    <!-- Bread Сrumbs Start -->
    <div class="main-bread">
      <div class="container-fluid">
        <div class="row">
          <div class="block-bread">
            <span><a href="index-2.html">Home</a></span>
            <span><i class="fa fa-angle-right" aria-hidden="true"></i><a href="product_accessories.html">Product</a></span>
            <span><i class="fa fa-angle-right" aria-hidden="true"></i>Product Detail</span>
            </div>
          </div>
        </div>
      </div>
      <!-- Bread Сrumbs End -->
      <div class="row">
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
    <ItemTemplate>

  
        <div class="col-md-6 col-sm-5 col-xs-12">   
          <div class="block-cart-product">
            <div class="block-img-product" id="block-img-product">
              <div class="full-img-product" id="full-img-product">
                <img src="admin/image/product/<%# Eval("pimg") %>" alt="">
              </div>
              <div class="box-preview-img-product">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                      <div class="preview-img-mini-product preview-product-active" data-full-img="admin/image/product/<%# Eval("img_url") %>">
                  <img src="admin/image/product/<%# Eval("img_url") %>" alt="">
                </div>
              </ItemTemplate>
            </asp:Repeater>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-sm-7 col-xs-12">
         <div class="block-decr-product">
           <div class="title"><%# Eval("title") %></div>
            <div class="undertitle">
              <div class="brand-name">Category</div>
              <div class="wrap-info-product">
               <span class="shlist-info-product"><a href="page_wish-list.html"><i class="fa fa-heart" aria-hidden="true"></i>
              <%# Eval("cname") %></a></span>
               
              </div>
              <div id="context-desdr" class="description">


               <p>	<%# Eval("descripation") %> 
               </p>
              
             </div>
             <div class="wrap-cost">
               <div class="box-price">
                 <div class="wrap-price">
                   <span class="price-strike"></span>  
                    <span class="price-now"> <span style="color:black"> <del>Rs. <%# Eval("old_price") %></del></span> Rs. <%# Eval("new_price") %></span>
											
                 </div>
                               </div>
              <div class="box-add-cart-product">
           <span">     <asp:TextBox runat="server" ID="txtQuantity" Placeholder="Quantity"  TextMode="Number"/> </span>   <asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="add-cart-product button-lardge" OnClick="lnkAddToCart_Click">Add to cart </asp:LinkButton>
    <asp:RangeValidator ID="RangeValidator1" runat="server" Type="Integer" ErrorMessage="Invalid Quantity" ControlToValidate="txtQuantity" ForeColor="Red" Font-Bold="true"  MinimumValue="0" MaximumValue="50"></asp:RangeValidator>
                             </div>
            </div>
          </div>
        </div>
            </div>
  </ItemTemplate>
</asp:Repeater>
      </div> 
      <div class="row">
                              <div id="tabs_cart_product">
                                <ul>
                                  <li><a href="#tabs-1">Description</a></li>
                                    
                                  <li><a href="#tabs-3">Reviews (<span>4</span>)</a></li>
                                </ul>

                                <div id="tabs-1">
                                 
                                  <p> 
    <asp:Label ID="Lbldesc" runat="server"></asp:Label>
                                  </p></div>
                                
                              <div id="tabs-3">
                               <div class="title">4 Reviews for Beats studio</div>
                              <asp:Repeater ID="RepeaterRevirews" runat="server">
                                  <ItemTemplate>
                                   <div class="wrap-comment">
                                 <div class="image-auther">
                                   <img src="img/img-products/auther-img1.jpg" alt="">
                                 </div>
                                 <div class="info-auther">
                                  <div class="top">
                                   <div class="name"><%# Eval("cname") %></div>
                                   <div class="date"><%# Eval("review_date") %></div>
                                 </div>
                                 <div class="text-auther">
                                   <p>
                                       <%# Eval("review_text") %>

                                   </p></div>
                               </div>
                             </div>
                            </ItemTemplate>
                              </asp:Repeater>
                       </div>
                   


                   </div>
           </div>
      
      <div class="row">
        <div class="related-products">
          <div class="title">Related Products</div>
          <div class="owl-carousel owl-theme" id="owl-carousel">
           <asp:Repeater ID="RepeaterRelatedProduct" runat="server">
               <ItemTemplate>

               <div class="wrap-item">
              <div class="item">
                <a href="page_product_2.html">
                  <div class="image">
                    <img src="admin/image/product/<%# Eval("pimg") %>" alt="">
                  </div>
                  <div class="name-products">
                 	<a href="Productdetail.aspx?pid=<%# Eval("product_id") %>&cid=<%# Eval("categ_id") %>" class="title-product" title="Box one"><%# Eval("title") %></a>
											
                  </div>
                  <div class="model-products">
                   <%# Eval("cname") %>
                  </div>
                </a>
                <div class="price-products">
                 <span class="now"> Rs. <%# Eval("new_price") %></span>
               </div>
               <div class="box-hide-related">
               <a href="page_cart-step-one.html" class="btn-related button-small">add to cart</a>
                
                
                </div>
              </div>
         
           
                                  </div>
                   
               </ItemTemplate>
           </asp:Repeater>          
                 </div>
                              </div>
                 </div>
               </div>
               <!-- Main Products for Desktop End -->

               <!-- Accordion Products for Mobile Start -->
               
    

 <script src="js/compressed.min.js"></script>

</asp:Content>

