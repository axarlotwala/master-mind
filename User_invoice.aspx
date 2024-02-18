<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_invoice.aspx.cs" Inherits="User_invoice" %>

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
    <style>
    .invoice-box{
        max-width:800px;
        margin:auto;
        padding:30px;
        border:1px solid #eee;
        box-shadow:0 0 10px rgba(0, 0, 0, .15);
        font-size:16px;
        line-height:24px;
        font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color:#555;
    }
    
    .invoice-box table{
        width:100%;
        line-height:inherit;
        text-align:left;
    }
    
    .invoice-box table td{
        padding:5px;
        vertical-align:top;
    }
    
    .invoice-box table tr td:nth-child(2){
        text-align:right;
    }
    
    .invoice-box table tr.top table td{
        padding-bottom:20px;
    }
    
    .invoice-box table tr.top table td.title{
        font-size:45px;
        line-height:45px;
        color:#333;
    }
    
    .invoice-box table tr.information table td{
        padding-bottom:40px;
    }
    
    .invoice-box table tr.heading td{
        background:#eee;
        border-bottom:1px solid #ddd;
        font-weight:bold;
    }
    
    .invoice-box table tr.details td{
        padding-bottom:20px;
    }
    
    .invoice-box table tr.item td{
        border-bottom:1px solid #eee;
    }
    
    .invoice-box table tr.item.last td{
        border-bottom:none;
    }
    
    .invoice-box table tr.total td:nth-child(2){
        border-top:2px solid #eee;
        font-weight:bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td{
            width:100%;
            display:block;
            text-align:center;
        }
        
        .invoice-box table tr.information table td{
            width:100%;
            display:block;
            text-align:center;
        }
    }
    </style>
	<script src="libs/modernizr/modernizr.js"></script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="top">
                <td>
                    
                    <table>
                        <tr>
                            <td colspan="2" class="title">
                                <img src="http://nextstepwebs.com/images/logo.png" style="width:100%; max-width:300px;">
                            </td>
                            
                            <td colspan="2">
                                <div class="pull-right">
                                 <h4>Invoice # 
                                 <strong><asp:Label ID="lblOrderId" runat="server" /></strong></h4>   
                                    </div>                          
                              </td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>
            
            <tr class="information">
                <td>
                    <table>
                        <tr>
                            <td>
                                
                            </td>
                            
                            <td colspan="2">
                                <asp:Label ID="lblCustomerName" runat="server" /><br>
                                <asp:Label ID="lblAddress" runat="server" /><br>
                                <asp:Label ID="lblContactNo" runat="server" /><br />
                                <p><strong>Order Date:</strong> <asp:Label ID="lblDate" runat="server" /></p>
                                                    <p class="m-t-10"><strong>Order Status:</strong> <span class="label label-pink"><asp:Label ID="lblStatus" runat="server" /></span></p>                                                    
                            </td>
                        </tr>
                    </table>
                </td>
                <td></td>
            </tr>
            
            <tr class="heading">
                <td>
                 <%# Eval("mode") %>
                </td>
                
                <td>
                    <%# Eval("is_pay") %>
                </td>
            </tr>
            
            <tr class="details">
                <td>
                Check
                </td>
                
                <td>
                    <%# Eval("mode") %>
                </td>
            </tr>
            
                <table>
                    <tr>
                        <th>#</th>
                                                                <th>Product Name</th>                                                                
                                                                <th>Quantity</th>
                                                                <th>price</th>
                                                                <th>Total price</th>
                    </tr>
                    <asp:Repeater ID="repItems" runat="server" OnItemDataBound="repItems_ItemDataBound">
                                                                <ItemTemplate>
            <tr class="item">
                <td>1</td>
                                                                        <td><%# Eval("pname") %></td>                                                                        
                                                                        <td><%# Eval("qty") %></td>
                                                                        <td><%# Eval("nprice") %></td>
                                                                        <td><asp:Label ID="lblTotalPrice" runat="server" /></td>
            </tr>
            </ItemTemplate></asp:Repeater>
                </table>
                
            </tr>
            
           
            <tr class="total">
                <td colspan="2"></td>
                
                <td>
                   Total: $<asp:Label ID="lblTotal" runat="server" />
                </td>
            </tr>
        </table>
    </div>

<script src="js/compressed.min.js"></script>
</asp:Content>
      
