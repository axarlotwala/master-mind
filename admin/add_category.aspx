<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="add_category.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="assets/js/modernizr.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="pull-left page-title">New Category </h4>
                        <ol class="breadcrumb pull-right">
                            <li><a href="#">Master Mind</a></li>
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Add Category</li>
                        </ol>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" runat="server" id="lblhead">Add Category
                                <a href="view_category.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float: right;">View List</a>
                                </h3>
                            </div>
                            <div class="panel-body">
                                
                                    <div id="divSuccess" runat="server" visible="false" class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        Data has been submitted successfully
                                    </div>
                                    <div id="divError" runat="server" visible="false" class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        There is some error in submitting data. Please try again!!!
                                    </div>
                                <div class="form-horizontal" role="form">
                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Name</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtname" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter alphabets only" ValidationExpression="^[a-zA-Z]+$"  ControlToValidate="txtname" ForeColor="Red" Font-Bold="true"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ForeColor="Red" Font-Bold="true" ErrorMessage="Required Field"></asp:RequiredFieldValidator>                                         </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Description</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtdescp" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox><br />
                                        </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Image</label>
                                        <div class="col-md-10">
                                            <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>
                                            <img runat="server" id="imgfile" visible="false"  style="height:60px; width:60px;" />
                                            <asp:HiddenField ID="hfOldImageName" runat="server" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" ForeColor="Red" Font-Bold="true" Visible="true" ErrorMessage="Image is required"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Select Only Image" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$"  ControlToValidate="FileUpload1" ForeColor="Red" Font-Bold="true"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="div-group">
                                        <label class="col-md-2 control-label"></label>
                                        <div class="col-md-10">
                                            <asp:LinkButton ID="btnsubmit" CssClass="btn btn-purple waves-effect waves-light" runat="server" OnClick="btnsubmit_Click">Submit</asp:LinkButton>
                                            <asp:LinkButton ID="btnreset" CssClass="btn waves-effect waves-light" runat="server">Reset</asp:LinkButton>
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
</asp:Content>

