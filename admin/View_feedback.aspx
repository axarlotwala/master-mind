<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="View_feedback.aspx.cs" Inherits="admin_View_feedback" %>

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
            <h4 class="pull-left page-title">Feedback</h4>
            <ol class="breadcrumb pull-right">
              <li><a href="#">Master Mind</a></li>
              <li><a href="#">Dashboard</a></li>
              <li class="active">Feedback</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Feedback View
                 </h3>
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>E-mail</th>
                          <th>Message</th>
                          
                         
                        </tr>
                      </thead>
                      <tbody>
                          <asp:Repeater ID="Repeaterfeed" runat="server">
                              <ItemTemplate>
                        <tr>
                          <td><%# Eval("name") %></td>
                         <td><%# Eval("email_id") %></td>
                          <td><%# Eval("Message") %></td>
                         
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
 
       
    <footer class="footer text-right">2015 © Moltran.</footer>
  </div>
        </form>
        <script>var resizefunc = [];</script>
    <script src="assets/js/moltran.min.js"></script>
</asp:Content>

