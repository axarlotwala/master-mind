<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

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
   <div class="box-cart">
        <div class="box-1675">
            <div class="box-steps">
                <ul>
                    <li><a class="active" href="Cart.aspx">Buy</a></li>
                </ul>
            </div>
	<div class="title">
                <h1>Your Cart</h1>
            </div>
            <div class="main-blocks-cart hidden-768" id="main-blocks-cart">
                <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound">
                    <ItemTemplate>
                        <div class="block-cart">
                            <asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("ProdID") %>' />
                            <a href="Productdetail.aspx?pid<%# Eval("ProdID") %>">
                                <div class="cart-img">
                                    <img id="prodimg" runat="server" style="height: 80px; width: 80px;" alt='<%# Eval("ProdName") %>'>
                                </div>
                                <div class="cart-name-prodct"><span title="Box one"><%# Eval("ProdName") %></span></div>
                            </a>
                            <div class="box-counter-cart">
                                <asp:Label runat="server" ID="txtQuantity" Text='<%# Eval("Quantity") %>' />                                
                            </div>
                            <div class="cart-overall-price"><span title="&#8377;<%# Eval("UnitPrice") %>">&#8377; <%# Eval("UnitPrice") %></span></div>
                            <div class="cart-overall-price"><span title="&#8377;<%# Eval("TotalPrice") %>">&#8377; <%# Eval("TotalPrice") %></span></div>                            
                        
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="box-total-buy">
                    <div class="block-right-cost">
                        
                        <div class="box-total">
                            <p>Total:&nbsp;&nbsp;</p>
                            &#8377; <span id="divTotal" runat="server"></span>
                        </div>                        
                    </div>                   
                </div>
            </div>	
    </div>
       </div>
	<div class="main-step-two">
		<div  class="form-step-two">

       
              <asp:TextBox ID="txtcname" class="input-style" placeholder="Name"  runat="server"></asp:TextBox><br />
          
             <asp:TextBox ID="txtno" class="input-style" placeholder="Contact No"  runat="server"></asp:TextBox><br />
          
             <asp:TextBox ID="txtemail" class="input-style" placeholder="Email"  runat="server"></asp:TextBox><br />

             <asp:TextBox ID="txtaddress" class="input-style" placeholder="Address"  runat="server"></asp:TextBox><br />

			 <asp:TextBox ID="txtPincode" class="input-style" placeholder="Pincode"  runat="server"></asp:TextBox><br />
           

		</div>
	</div>


    <asp:Button ID="Order" class="submit-input-style button-lardge" runat="server" OnClick="Order_Click" Text="Order" />
    
        <script src="js/compressed.min.js"></script>
</asp:Content>

