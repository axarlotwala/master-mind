<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Assign_ticket.aspx.cs" Inherits="admin_Assign_ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="assets/js/modernizr.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="pull-left page-title">Ticket </h4>
                        <ol class="breadcrumb pull-right">
                            <li><a href="#">Master Mind</a></li>
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Assign Ticket</li>
                        </ol>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" runat="server" id="lblhead">Ticket Assign
                                <a href="View_assign.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float: right;">View List</a>
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
                                      
                                       <div class="form-group">
                                        <label class="col-sm-2 control-label">Ticket</label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList ID="ddlticket" class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                      </div>
    </div>

        
                                    <div class="div-group">
                                      
                                       <div class="form-group">
                                        <label class="col-sm-2 control-label">Employee</label>
                                        <div class="col-sm-10">
                                           <asp:DropDownList ID="ddlemployee" class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                      </div>
    </div>

                <div class="div-group">
                    <label class="col-md-2 control-label"></label>
                    <div class="col-md-10">
                        <asp:LinkButton ID="btnsubmit" class="btn btn-purple waves-effect waves-light" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                        <asp:LinkButton ID="btnreset" class="btn  waves-effect waves-light" runat="server">Reset</asp:LinkButton>
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

