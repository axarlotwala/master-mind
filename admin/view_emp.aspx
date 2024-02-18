 <%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="view_emp.aspx.cs" Inherits="admin_view_employee" %>

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
            <h4 class="pull-left page-title">Employee Information</h4>
            <ol class="breadcrumb pull-right">
              <li><a href="#">Master Mind</a></li>
              <li><a href="#">Dashboard</a></li>
              <li class="active">Employee List</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Emp Detail
 <a href="add_employee.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float:right;">Add New</a>
              </h3>
                    </div>
                <a href="?emp_id=<%# Eval("emp_id") %>"><%# Eval("block") %></a>

              <div class="panel-body">
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Contact No</th>
                            <th>Email Id</th>
                            <th>Profile</th>
                            <th>Address</th>
                          <th>User Name</th>
                         <th>Password</th>
                            <th>Block</th>
                            <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        
                            <asp:Repeater ID="Repeater11" runat="server">
                                <ItemTemplate>
                                    <tr>
                                    <td><%# Eval("emp_name") %></td>
                                    <td><%# Eval("contact_no") %></td>
                                    <td><%# Eval("email_id") %></td>
                                    <td><img src="image/Employee/<%# Eval("profile").ToString() %>" style="height:60px;width:60px"/></td>
                                        <td><%# Eval("address") %></td>
                                        <td><%# Eval("username") %></td>
                                        <td><%# Eval("password") %></td>
                                     <td><a href="?emp_id=<%# Eval ("emp_id") %>"><%# Eval("block") %></a>
                                            </td>                                                            
                          <td>
                                                         
<a  href="add_employee.aspx?upd=<%# Eval("emp_id") %>"  class="btn btn-icon waves-effect waves-light btn-success m-b-5"><i class="fa fa-edit"></i></a>
<a class="btn btn-icon waves-effect waves-light btn-danger m-b-5" data-id="<%# Eval("emp_id") %>" data-toggle="modal" data-target=".bs-example-modal-sm"><i class="fa fa-trash-o"></i></a>
                          </td>
                         
                       </tr>
                    </ItemTemplate>
                  </asp:Repeater>
                       
                            </tbody>
                    </table>

                      <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h4 class="modal-title" id="mySmallModalLabel">Confirm Delete ?</h4>
                                                </div>
                                                <div class="modal-body"><h4>Are you sure want to  delete ?</h4>
                                                    <br />
                                                    <asp:HiddenField ID="hfemp_id" runat="server" />
 <div style="float:right"> 
     <asp:LinkButton ID="Lbtndelete" runat="server"  OnClick="Lbtndelete_Click" class="btn btn-icon waves-effect waves-light btn-success m-b-5">Yes</asp:LinkButton>
     <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">No</button>
                                                </div>
                                                </div>
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
          </div>
        </div>
        </div>
        </form>
<script>var resizefunc = [];</script>

<script src="assets/js/moltran.min.js"></script>
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
          
          <script>
              $(document).ready(function () {

                  $(".btn-danger").click(function () {

                      var emp_id = $(this).data('id');
                      // alert(emp_id);

                      document.getElementById("<%=hfemp_id.ClientID %>").value = emp_id;
            });
              });

          </script>
<script type="text/javascript">$(document).ready(function () {
    $('#datatable').dataTable();
});</script> <script>    var resizefunc = [];</script>
</asp:Content>

