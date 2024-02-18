<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="review_product.aspx.cs" Inherits="review_product" %>

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
    <div class="main-product hidden-768">  
  <div class="box-1675">
    <!-- Bread Сrumbs Start -->
    <div class="main-bread">
      <div class="container-fluid">
        <div class="row">
          <div class="block-bread">
            <span><a href="index-2.html">Back</a></span>
            <span><i class="fa fa-angle-right" aria-hidden="true"></i><a href="product_accessories.html">Manufacturer</a></span>
            <span><i class="fa fa-angle-right" aria-hidden="true"></i>Beap studio</span>
            </div>
          </div>
        </div>
      </div>
      <!-- Bread Сrumbs End -->
      <div class="row">
        <div class="col-md-6 col-sm-5 col-xs-12">   
          <div class="block-cart-product">
            <div class="block-img-product" id="block-img-product">
              <div class="full-img-product" id="full-img-product">
                 <asp:Repeater ID="Repeaterimage" runat="server">
                     <ItemTemplate>
                         <div class="preview-img-mini-product preview-product-active" data-full-img="admin/image/product/<%# Eval("img_url") %>">
                 <img src="admin/image/product/<%# Eval("pimg") %>" alt="">
              </div>
                         </ItemTemplate>
                     </asp:Repeater>
              <div class="box-preview-img-product">
                <div class="preview-img-mini-product preview-product-active" data-full-img="http://webark.io/ecom/presentation/html/img/blue/product_1_1.jpg">
                  <img src="../../webark.io/ecom/presentation/html/img/blue/product_1_1_80x80.jpg" alt="">
                </div>
                <div class="preview-img-mini-product" data-full-img="http://webark.io/ecom/presentation/html/img/blue/product_1_2.jpg">
                  <img src="../../webark.io/ecom/presentation/html/img/blue/product_1_2_80x80.jpg" alt="">
                </div>
                <div class="soc-wrap">  
                  <a target="_blank" href="#"><i class="fa fa-youtube" aria-hidden="true"></i></a>
                  <a target="_blank" href="https://plus.google.com/u/0/104841685075716062830"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                  <a target="_blank" href="https://twitter.com/WebarkSystems"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                  <a target="_blank" href="https://www.facebook.com/WebArk-346789308995961"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                  <a target="_blank" href="https://www.instagram.com/webarksystem/"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-sm-7 col-xs-12">
         <div class="block-decr-product">
             <asp:Repeater ID="Repeater1" runat="server">
                 <ItemTemplate>

           <div class="title"><%# Eval("title") %></div>
            <div class="undertitle">
              <div class="brand-name">Manufacturer</div>
              <div class="wrap-info-product">
               <span class="shlist-info-product"><a href="page_wish-list.html"><i class="fa fa-heart" aria-hidden="true"></i>
                Wishlist (<span>10</span>)</a></span>
                <span class="compare-info-product"><a href="page_compare.html"><i class="fa fa-exchange" aria-hidden="true"></i>
                  Compare (<span>3</span>)</a></span>
                </div>
              </div>
              <div id="context-desdr" class="description"><%# Eval ("descripation") %>


               <p>Lorem ipsum dolor sit amet, quod wisi liber cu ius. Ut augue timeam usu, id nec vero maiestatis efficiendi, est primis neglegentur an. At eam diam nibh labitur. Cum et meliore fierent consequat, eum dicit debitis inimicus an. Lorem ipsum dolor sit amet, quod wisi liber cu ius. Ut augue timeam usu, id nec vero maiestatis efficiendi, est primis neglegentur an. At eam diam nibh labitur Lorem ipsum dolor sit amet, quod wisi liber cu ius. t meliore fierent consequat, eum dicit debitis inimicus an. Lorem ipsum dolor sit amet, quod wisi liber cu ius. Ut augue timeam usu, id nec vero maiestatis efficiendi, est primis neglegentur an cu ius. </p>

               <p>Lorem ipsum dolor sit amet, quod wisi liber cu ius. Ut augue timeam usu, id nec vero maiestatis efficiendi, est primis neglegentur an. At eam diam nibh labitur. Cum et meliore fierent consequat, eum dicit debitis inimicus an. Lorem ipsum dolor sit amet, quod wisi liber cu ius. Ut augue timeam usu, id nec vero maiestatis efficiendi, est primis neglegentur an. At eam diam nibh labitur Lorem ipsum dolor sit amet, quod wisi liber cu ius. t meliore fierent consequat, eum dicit debitis inimicus an. Lorem ipsum dolor sit amet, quod wisi liber cu ius. Ut augue timeam usu, id nec vero maiestatis efficiendi, est primis neglegentur an cu ius. 
               </p>
             </div>
               <div class="box-price">
                 <div class="wrap-price">
                   <span class="price-strike"></span>  
                   <span class="price-normal">$1255.50</span>
                 </div>
                 <div class="box-counter"> 
                  <input id="spinner" name="value" value="1" readonly>
                </div>
              </div>
              <div class="box-add-cart-product">
              <a href="page_cart-step-one.html" class="add-cart-product button-lardge">Add to cart </a>
               
              </div>
                         
                 </ItemTemplate>
                </asp:Repeater>
               
          </div>
        </div>
      </div> 
      <div class="row">
        
                              </div>
                              <div id="tabs_cart_product">
                                <ul>
                                  <li><a href="#tabs-1">Description</a></li>
                                  <li><a href="#tabs-2">Additional Information</a></li>
                                  <li><a href="#tabs-3">Reviews (<span>4</span>)</a></li>
                                </ul>
                                
                              <div id="tabs-3">
                               <div class="title">4 Reviews for Beats studio</div>
                               <div class="wrap-comment">
                                 <div class="image-auther">
                                   <img src="img/img-products/auther-img1.jpg" alt="">
                                 </div>
                                 <div class="info-auther">
                                  <div class="top">
                                      <asp:Repeater ID="Repeaterreview" runat="server">
                                          <ItemTemplate>                                   <div class="name">Mark smith</div>
                                   <div class="date">September 22, 2015</div><%#  Eval("review_date") %>
                                 </div>
                                 <div class="text-auther">
                                   <p><%# Eval("review_text") %></p>
                                 </div>
                               </div>
                             </div>
                             <div class="wrap-comment">
                               <div class="image-auther">
                                 <img src="img/img-products/auther-img2.jpg" alt="">
                               </div>
                               <div class="info-auther">
                                <div class="top">
                                </ItemTemplate>
                                          </asp:Repeater>
                            
                         <div class="block-review">
                           <div class="title">Add a review</div>
                           <div class="form-review">
                             
                               
                              
                               <asp:TextBox ID="txtmessage" Placeholder="message" runat="server" TextMode="MultiLine"></asp:TextBox>
                               <asp:TextBox ID="txtdate" runat="server" placeholder="date" TextMode="DateTime"></asp:TextBox>
                          <asp:Button ID="Button1"  class="btn-review"  runat="server" Text="submit" OnClick="Button1_Click" />    
                            
                           </div>
                         </div>
                       </div>
                    

                   </div>
                 </div>
               </div>
               <!-- Main Products for Desktop End -->

               <!-- Accordion Products for Mobile Start -->
               <div id="accordion_cart_product_mob">
                <h3>Description <i class="fa fa-angle-down" aria-hidden="true"></i>
                </h3>
                <div class="item text-description">
                  <p>Orem ipsum dolor sit amet, quod wisi liber cu ius. Ut augue timeam usu, id nec vero maiestatis efficiendi, est primis neglegentur an.</p>
                  <p>At eam diam nibh labitur. Cum et meliore fierent consequat, eum dicit debitis inimicus an. Idque nonumy timeam te vel, ad eos dolore maiorum feugait. Vix cu nostrud atomorum referrentur.</p>
                  <p>Ei posse dicant adolescens ius, error argumentum disputationi sit et, pri soluta menandri ei.</p>
                </div>
                <h3>Additional Information<i class="fa fa-angle-down" aria-hidden="true"></i></h3>
                <div class="item">
                 <table>
                   <tr>
                    <td>Hard Disk</td>
                    <td>Built-in</td>
                  </tr>
                  <tr>
                    <td>Video</td>
                    <td>BD6xCAV DVD 8xCAV</td>
                  </tr>
                  <tr>
                    <td>Sound</td>
                    <td>Stereo</td>
                  </tr>
                </table>
                </div>
              
              <h3>Reviews (<span>4</span>)<i class="fa fa-angle-down" aria-hidden="true"></i></h3>
              <div class="reviews">
               <div class="wrap-comment">
                 <div class="image-auther hidden-768">
                   <img src="img/img-products/auther-img1.jpg" alt="">
                 


                 </div>
                 <div class="info-auther">
                  <div class="top">
                   <div class="name">Mark smith</div>
                   <div class="date hidden-768">September 22, 2015</div>
                 </div>
                 <div class="text-auther">
                   <p>He is damn right, the first wave of customers just buy the product with no questions asked…the stupidity or the shear wastage of money they want to do, no idea. But wait till winter sale comes.</p>
                   <div class="date-xs visible-xs">September 22, 2015</div>
                 </div>

               </div>
             </div>
             <div class="wrap-comment">
               <div class="image-auther hidden-768">
                 <img src="img/img-products/auther-img2.jpg" alt="">
               </div>
              


 <script src="js/compressed.min.js"></script>

</asp:Content>


