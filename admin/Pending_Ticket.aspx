<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Pending_Ticket.aspx.cs" Inherits="admin_Pending_Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
<title>Moltran - Responsive Admin Dashboard Template</title>
<link href="assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
<link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
<script src="../../cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <form id="form1" runat="server">
    <div class="content-page">
    <div class="content">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <h4 class="pull-left page-title">Ticket Manage</h4>
            <ol class="breadcrumb pull-right">
              <li><a href="#">Master Mind</a></li>
              <li><a href="#">Dashboard</a></li>
              <li class="active">View Ticket</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Ticket detail
                  <a href="add_ticket_manage.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float: right;">Add New</a>
                    </h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12" style="overflow-x:scroll">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                            <th>Customear</th>
                            <th>Product </th>
                            <th>Descripation</th>
                          
                            <th>Landmark</th>
                            <th>Reserve Date</th>
                            <th>Require Time</th>
                            <%--<th>Problem Image</th>--%>
                        
                            <th>Status</th>
                            <th>Action</th>
                            
                        </tr>
                      </thead>
                      <tbody>
                           <asp:Repeater ID="Repeater13" runat="server">
                              <ItemTemplate>
  
                        <tr>
                              <td><%# Eval("cname") %></td>
                          <td><%# Eval("name") %></td>
                          <td><%# Eval("descripation") %></td>
                          
                            <td><%# Eval("landmark") %></td>
                            <td><%# Eval("register_date") %></td>
                            <td><%# Eval("require_time") %></td>                         
                          <%--<td><img src="../Upload/Ticket/<%# Eval("problem_image") %>" style="height:50px; width:50px;" /></td>--%>
                        
                                                     
                        
                            <td><%# Eval("status") %></td>
                            <td>
<a class="btn btn-icon waves-effect waves-light btn-success m-b-5"><i class="fa fa-edit"></i></a>
<a class="btn btn-icon waves-effect waves-light btn-danger m-b-5"><i class="fa fa-trash-o"></i></a>
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
    <footer class="footer text-right">2015 © Moltran.</footer>
  </div>
        </form>
    <script>var resizefunc = [];</script>

<script src="assets/js/moltran.min.js"></script>
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
<script type="text/javascript">$(document).ready(function () {
    $('#datatable').dataTable();
});</script> <script>    var resizefunc = [];</script>

</asp:Content>

