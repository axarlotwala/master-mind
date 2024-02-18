<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="../../cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
    <script>(function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date(); a = s.createElement(o),
    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
})(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-65046120-1', 'auto');
        ga('send', 'pageview');</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="wrapper">


                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="pull-left page-title">Invoice</h4>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-8">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="clearfix">
                                            <div class="pull-left">
                                                <h4 class="text-right">
                                                    <img src="assets/images/logo_dark.png" alt="velonic"></h4>
                                            </div>

                                            <div class="pull-right">
                                                <h4>Invoice # 
                                                    <strong><asp:Label ID="lblOrderId" runat="server" /></strong></h4>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="pull-left m-t-30">
                                                        <strong>Name</strong><br>
                                                        <td><asp:Label ID="lblCustomerName" runat="server" /></td><br />
                                                        <strong>Address</strong><br>
                                                        <td><asp:Label ID="lblAddress" runat="server" /></td>
                                                        <br />
                                                        <abbr title="Phone">Contact No</abbr>
                                                        <td><asp:Label ID="lblContactNo" runat="server" /></td>
                                                        <br />
                                                </div>
                                                <div class="pull-right m-t-30">
                                                    <p><strong>Order Date:</strong> <asp:Label ID="lblDate" runat="server" /></p>
                                                    <p class="m-t-10"><strong>Order Status:</strong> <span class="label label-pink"><asp:Label ID="lblStatus" runat="server" /></span></p>                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-h-50"></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table m-t-30">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Product Name</th>                                                                
                                                                <th>Quantity</th>
                                                                <th>price</th>
                                                                <th>Total price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <asp:Repeater ID="repItems" runat="server" OnItemDataBound="repItems_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>1</td>
                                                                        <td><%# Eval("pname") %></td>                                                                        
                                                                        <td><%# Eval("qty") %></td>
                                                                        <td><%# Eval("nprice") %></td>
                                                                        <td><asp:Label ID="lblTotalPrice" runat="server" /></td>
                                                                    </tr>
                                                                </ItemTemplate>

                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="border-radius: 0px">
                                            <div class="col-md-3 col-md-offset-9">
                                                <p class="text-right"><b>Sub-total:</b> <asp:Label ID="lblTotal" runat="server" /></p>
                                                
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="hidden-print">
                                            <div class="pull-right"><a id="" class="btn btn-inverse waves-effect waves-light print_page"><i class="fa fa-print"></i></a><a href="#" class="btn btn-primary waves-effect waves-light">Submit</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <script>var resizefunc = [];</script>
            <script src="assets/js/moltran.min.js"></script>
            <script>
                $(document).ready(function () {

                    $(".print_page").onclick(function () {
                        alert('ohk');
                    });

                });
            </script>
        </div>
    </form>
</body>
</html>
