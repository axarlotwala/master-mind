<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="view_detail.aspx.cs" Inherits="admin_view_detail" %>

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
            <h4 class="pull-left page-title">All Detail</h4>
            <ol class="breadcrumb pull-right">
              <li><a href="#">Master Mind</a></li>
              <li><a href="#">Dashboard</a></li>
              <li class="active">Detail Product</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Details</h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Order</th>
                          <th>Product</th>
                          <th>Qty</th>
                          <th>price</th>
                          
                         
                        </tr>
                      </thead>
                      <tbody>
                        
                            <asp:Repeater ID="Repeater6" runat="server">
                                <ItemTemplate>
                                    <tr>
                          <td><%# Eval("order_id") %></td>
                          <td>
                              <table>
                                  <tr>
                                      <td><img src="image/product/<%# Eval("iname") %>" style="height:50px;width:50px;" /></td>
                                      <td style="padding-left:10px;"><%# Eval("ptitle") %></td>
                                  </tr>
                              </table>
                              

                          </td>
                            <td><%# Eval ("qty") %></td>
                            <td><%# Eval("price") %></td>
                          


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
                                                    <asp:HiddenField ID="hfd_id" runat="server" />
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

                var d_id = $(this).data('id');
                // alert(d_id);

                document.getElementById("<%=hfd_id.ClientID %>").value = d_id;
         });
        });
    </script>

<script type="text/javascript">$(document).ready(function () {
    $('#datatable').dataTable();
});</script>
</asp:Content>

