<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="All_Ticket.aspx.cs" Inherits="admin_All_Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="assets/js/modernizr.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-page">
            <div class="content">
                <div class="wraper container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="bg-picture text-center" style="background-image: url('assets/images/big/bg.jpg')">
                                <div class="bg-picture-overlay"></div>
                                <div class="profile-info-name">
                                    <img src="assets/images/users/avatar-1.jpg" class="thumb-lg img-circle img-thumbnail" alt="profile-image"><h3 class="text-white">John Deon</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row user-tabs">
                        <div class="col-lg-6 col-md-9 col-sm-9">
                            <ul class="nav nav-tabs tabs">
                                <li class="active tab"><a href="#home-2" data-toggle="tab" aria-expanded="false" class="active"><span class="visible-xs"><i class="fa fa-home"></i></span><span class="hidden-xs">All Ticket</span></a></li>
                                <li class="tab"><a href="#messages-2" data-toggle="tab" aria-expanded="true"><span class="visible-xs"><i class="fa fa-envelope-o"></i></span><span class="hidden-xs">Data</span></a></li>
                                
                                <div class="indicator"></div>
                            </ul>
                        </div>

                        <div class="col-lg-6 col-md-3 col-sm-3 hidden-xs">
                            <div class="pull-right">
                                <div class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle btn-rounded btn btn-primary waves-effect waves-light" href="#">Following <span class="caret"></span></a>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        <li><a href="#">Poke</a></li>
                                        <li><a href="#">Private message</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Unfollow</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="tab-content profile-tab-content">
                                <div class="tab-pane active" id="home-2">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="panel panel-default panel-fill">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Personal Information</h3>
                                                </div>
        
                                                                                                <div class="panel-body">
                                                    <div class="about-info-p"><strong>Customer</strong><br>
                                                    <div><%# Eval("cust_id") %></div>
                                                    </div>
                                                    <div class="about-info-p"><strong>Product</strong><br>
                                                        <div><%# Eval("product_id") %></div>
                                                    </div>
                                                    <div class="about-info-p"><strong>Employee</strong><br>
                                                        <p class="text-muted"><%# Eval("emp_id") %></p>
                                                    </div>
                                                    <div class="about-info-p m-b-0"><strong>Address</strong><br>
                                                        <div><%# Eval("address") %></div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="col-md-8">
                                            <div class="panel panel-default panel-fill">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">Descripation</h3>
                                                    <div><%# Eval("descripation") %></div>
                                                </div>
                                                <div class="panel-body">
                                                </div>
                                            </div>
                                                                                       </div>
                                    </div>
                                </div>
                                
                                <div class="tab-pane" id="messages-2">
                                    <div class="panel panel-default panel-fill">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">My Projects</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th>Customer Name</th>
                                                            <th>Product Name</th>
                                                            <th>Require Date</th>
                                                            <th>Require Time</th>
                                                            <th>Status</th>
                                                            <th>Assign</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            
                                                            <td><%# Eval("cust_id") %></td>
                                                            <td><%# Eval("product_id") %></td>
                                                            <td><%# Eval("register_date") %></td>
                                                            <td><%# Eval("require_time") %></td>
                                                            <td><%# Eval("status") %></td>
                                                            <td> <a href="Assign_ticket.aspx">Assign</a></td>
                                                            <td>
                                                                <a class="btn btn-icon waves-effect waves-light btn-success m-b-5"><i class="fa fa-edit"></i></a>
                                                                <a class="btn btn-icon waves-effect waves-light btn-danger m-b-5"><i class="fa fa-trash-o"></i></a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </ItemTemplate>
                                </asp:Repeater>
                                <div class="tab-pane" id="settings-2">
                                    <div class="panel panel-default panel-fill">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Edit Profile</h3>
                                        </div>
                                        <div class="panel-body">
                                            <form role="form">
                                                <div class="form-group">
                                                    <label for="FullName">Full Name</label><input type="text" value="John Doe" id="FullName" class="form-control"></div>
                                                <div class="form-group">
                                                    <label for="Email">Email</label><input type="email" value="first.last@example.com" id="Email" class="form-control"></div>
                                                <div class="form-group">
                                                    <label for="Username">Username</label><input type="text" value="john" id="Username" class="form-control"></div>
                                                <div class="form-group">
                                                    <label for="Password">Password</label><input type="password" placeholder="6 - 15 Characters" id="Password" class="form-control"></div>
                                                <div class="form-group">
                                                    <label for="RePassword">Re-Password</label><input type="password" placeholder="6 - 15 Characters" id="RePassword" class="form-control"></div>
                                                <div class="form-group">
                                                    <label for="AboutMe">About Me</label><textarea style="height: 125px" id="AboutMe" class="form-control">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</textarea></div>
                                                <button class="btn btn-primary waves-effect waves-light w-md" type="submit">Save</button></form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer text-right">2015 © Moltran.</footer>
        </div>
        

    
    
      <script>var resizefunc = [];</script>
    <script src="assets/js/moltran.min.js"></script>
</asp:Content>

