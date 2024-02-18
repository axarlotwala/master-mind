<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="../../cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="pull-left page-title">Welcome !</h4>
                        <ol class="breadcrumb pull-right">
                            <li><a href="#">Moltran</a></li>
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-lg-3">
                        <div class="mini-stat clearfix bx-shadow bg-white">
                            <span class="mini-stat-icon bg-info"><i class="ion-social-usd"></i></span>
                            <div class="mini-stat-info text-right text-dark">
                                <span class="counter text-dark">
                                    <asp:Label ID="Lbluser" runat="server" Style="color: black"></asp:Label></span> Total Users
                            </div>
                            <div class="tiles-progress">
                                <div class="m-t-20">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-3">
                        <div class="mini-stat clearfix bx-shadow bg-white">
                            <span class="mini-stat-icon bg-purple"><i class="ion-ios7-cart"></i></span>
                            <div class="mini-stat-info text-right text-dark">
                                <span class="counter text-dark">

                                    <asp:Label ID="Lblticket" runat="server" Style="color: black"></asp:Label></span>Ticket
                            </div>

                            <div class="m-t-20">
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-3">
                        <div class="mini-stat clearfix bx-shadow bg-white">
                            <span class="mini-stat-icon bg-success"><i class="ion-android-contacts"></i></span>
                            <div class="mini-stat-info text-right text-dark"><span class="counter text-dark"></span>Employee</div>
                            <asp:Label ID="Lblemployee" runat="server" Style="color: black"></asp:Label>
                            <div class="tiles-progress">
                                <div class="m-t-20">
                                    <h5 class="text-uppercase">Total Employee<span class="pull-right"></span></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-lg-3">
                        <div class="mini-stat clearfix bx-shadow bg-white">
                            <span class="mini-stat-icon bg-primary"><i class="ion-eye"></i></span>
                            <div class="mini-stat-info text-right text-dark"><span class="counter text-dark"></span>Order</div>
                            <asp:Label ID="Lblorder" runat="server" Style="color: black"></asp:Label>
                            <div class="tiles-progress">
                                <div class="m-t-20">
                                    <h5 class="text-uppercase">Order<span class="pull-right"></span></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="portlet">
                            <div class="portlet-heading">
                                <h3 class="portlet-title text-dark text-uppercase">Website Stats</h3>
                                <div class="portlet-widgets"><a href="javascript:;" data-toggle="reload"><i class="ion-refresh"></i></a><span class="divider"></span><a data-toggle="collapse" data-parent="#accordion1" href="#portlet1"><i class="ion-minus-round"></i></a><span class="divider"></span><a href="#" data-toggle="remove"><i class="ion-close-round"></i></a></div>
                                <div class="clearfix"></div>
                            </div>
                            <div id="portlet1" class="panel-collapse collapse in">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:Chart ID="Chart1" runat="server">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="cust_name" YValueMembers="Count"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true"></asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-right">2015 © Moltran.</footer>
    </div>

    <script src="assets/js/moltran.min.js"></script>
    <script src="assets/vendor/moment/moment.js"></script>
    <script src="assets/vendor/waypoints/lib/jquery.waypoints.js"></script>
    <script src="assets/plugins/counterup/jquery.counterup.min.js"></script>
    <script src="assets/vendor/sweetalert/dist/sweetalert.min.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.time.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.tooltip.min.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.resize.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.pie.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.selection.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.stack.js"></script>
    <script src="assets/plugins/flot-chart/jquery.flot.crosshair.js"></script>
    <script src="assets/pages/jquery.todo.js"></script>
    <script src="assets/pages/jquery.chat.js"></script>
    <script src="assets/pages/jquery.dashboard.js"></script>
    <script type="text/javascript">/* ==============================================
            Counter Up
            =============================================== */
        jQuery(document).ready(function ($) {
            $('.counter').counterUp({
                delay: 100,
                time: 1200
            });
        });

    </script>
</asp:Content>

