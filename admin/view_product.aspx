<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="view_product.aspx.cs" Inherits="admin_view_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="../../cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="content-page">
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="pull-left page-title">View Product List</h4>
                            <ol class="breadcrumb pull-right">
                                <li><a href="#">Master Mind</a></li>
                                <li><a href="#">Dashboard</a></li>
                                <li class="active">View Product List</li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Product Details
                                <a href="add_product.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float: right;">Add new</a>
                                    </h3>
                                </div>
                                <a href="?product_id<%# Eval("product_id") %>"><%# Eval("status") %></a>

                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12" style="overflow-x: scroll">
                                            <table id="datatable" class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Category</th>
                                                        <th>Code</th>
                                                        <th>Title</th>
                                                        <th>Description</th>
                                                        <th>Old Price</th>
                                                        <th>New Price</th>
                                                        <th>Images</th>
                                                        <th>Video Url</th>

                                                        <th>Total Quantity</th>

                                                        <th>Inastall Charge</th>
                                                        <th>status</th>
                                                        <th>Action</th>

                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("cname") %>
                                                                    <asp:HiddenField ID="HiddenField1" Value='<%#Eval("product_id") %>' runat="server" />
                                                                </td>
                                                                <td><%# Eval("product_code") %></td>
                                                                <td><%# Eval("title") %></td>
                                                                <td><%# Eval("descripation") %></td>
                                                                <td><%# Eval("old_price") %></td>
                                                                <td><%# Eval("new_price") %></td>
                                                                <td>
                                                                    <asp:Repeater ID="repImages" runat="server">
                                                                        <ItemTemplate>
                                                                            <img src="image/product/<%# Eval("img_url") %>" style="height: 50px; width: 50px;" />
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </td>
                                                                <td>
                                                                   
<iframe width="200" height="200" src="<%# Eval("video") %>" frameborder="0" allowfullscreen></iframe>
                                                                </td>
                                                                <td><%# Eval("Total_Quantity") %></td>
                                                                <td><%# Eval("install_charge") %></td>
                                                                <td><a href="?product_id=<%# Eval("product_id") %>"></a><%# Eval("status")%></td>

                                                                <td><a href="add_product.aspx?upd=<%# Eval("product_id") %>" class="btn btn-icon waves-effect waves-light btn-success m-b-5"><i class="fa fa-edit"></i></a>
                                                                    <a class="btn btn-icon waves-effect waves-light btn-danger m-b-5" data-id="<%# Eval("product_id") %>" data-toggle="modal" data-target=".bs-example-modal-sm"><i class="fa fa-trash-o"></i></a>
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
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="tr6ue">×</button><h4 class="modal-title" id="mySmallModalLabel">Confirm Delete ?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <h4>Are you sure want to  delete ?</h4>
                                                            <br />
                                                            <asp:HiddenField ID="hfp_id" runat="server" />
                                                            <div style="float: right">
                                                                <asp:LinkButton ID="Lbtndelete" runat="server" OnClick="Lbtndelete_Click" class="btn btn-icon waves-effect waves-light btn-success m-b-5">Yes</asp:LinkButton>
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

                var p_id = $(this).data('id');
                // alert(product_id);

                document.getElementById("<%=hfp_id.ClientID %>").value = p_id;
            });
        });
    </script>



    <script type="text/javascript">$(document).ready(function () {
    $('#datatable').dataTable();
});</script>
</asp:Content>

