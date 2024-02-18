<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="View_ticket.aspx.cs" Inherits="View_ticket" %>

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
    <div class="main-page">
	<div class="box-1675">
		<div class="container-fluid">
			<div class="row">
                <div = "title">
            <h1>My Tickets</h1>
         </div>



                <a href="?tid=<%# Eval("tickt_id") %>"><%# Eval("status") %></a>
     <table  class="table table-striped table-bordered" >
         
                    
                      <thead>
                        <tr>
                           <th>#</th> 
                          <th>Ticket</th>
                          <th>Product</th>
                            <th>Address</th>
                            <th>Date</th>
                            <th>Time</th>
                         <th>Status</th>
                            
                        </tr>
                      </thead>
                      <tbody>
                          <asp:Repeater ID="Repeater7" runat="server">
                              <ItemTemplate>
                                  <tr>
                                     <td></td>
                                      <td>COMPTICKET<%# Eval("ticket_id") %></td>
                                      <td><%# Eval("pname") %></td>
                                      <td><%# Eval("address") %></td>
                                      <td><%# Eval("register_date") %></td>
                                      <td><%# Eval("require_time")%></td>
                                      <td><a href="Status.aspx?tid=<%# Eval("ticket_id") %>"><%# Eval("status") %></a></td>
                                    
                                     
                                             </tr>

                              </ItemTemplate>
                          </asp:Repeater>
                          </tbody>
                          </table>
                </div>
            </div></div>
        </div>
                          <script src="js/compressed.min.js"></script>
</asp:Content>

