﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="view_image.aspx.cs" Inherits="admin_view_image" %>

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
            <h4 class="pull-left page-title">Product View</h4>
            <ol class="breadcrumb pull-right">
              <li><a href="#">Master Mind</a></li>
              <li><a href="#">Dashboard</a></li>
              <li class="active"#">Product Category</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Product Details</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                          
                         <tr>
                            <th>Product</th>
                            <th>Img Url</th>
                            <th>Img Title</th>
                          <th>Action</th>
                         
                        </tr>
                              
                      </thead>
                      <tbody>

                           <asp:Repeater ID="Repeater8" runat="server">
                              <ItemTemplate>
                              
                        <tr>
                          <td><%#  Eval("ptitle") %></td>
                          <td><%#  Eval("img_url") %></td>
                          <td><%# Eval("img_title")  %></td>
                          <td>
<a class="btn btn-icon waves-effect waves-light btn-success m-b-5"><i class="fa fa-edit"></i></a>
<a href="?del=<%#Eval("img_id")%>" class="btn btn-icon waves-effect waves-light btn-danger m-b-5" onclick="Return Confirm('Are You Sure Want To Delete ??')"><i class="fa fa-trash-o"></i></a>
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
                                                    <asp:HiddenField ID="hfi_id" runat="server" />
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
          </form>
      <script>var resizefunc = [];</script>

<script src="assets/js/moltran.min.js"></script>
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
    
    <script>
        $(document).ready(function () {

            $(".btn-danger").click(function () {

                var i_id = $(this).data('id');
                // alert(i_id);

                document.getElementById("<%=hfi_id.ClientID %>").value = iid;
            });
        });

    </script>
<script type="text/javascript">$(document).ready(function () {
    $('#datatable').dataTable();
});</script>
</asp:Content>

