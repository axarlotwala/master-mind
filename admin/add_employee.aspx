<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="add_employee.aspx.cs" Inherits="admin_employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
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
                        <h4 class="pull-left page-title">New Employee</h4>
                        <ol class="breadcrumb pull-right">
                            <li><a href="#">Master Mind</a></li>
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Employee</li>
                        </ol>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" runat="server" id="lblhead">Employee
                                <a href="view_emp.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float: right;">View List</a>
                                </h3>
                            </div>
                            <div class="panel-body">

                                <div class="div-horizontal" role="div">
                                    <div id="divSuccess" runat="server" visible="false" class="alert alert-success alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        Data has been submitted successfully
                                    </div>
                                    <div id="divError" runat="server" visible="false" class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        There is some error in submitting data. Please try again!!!
                                    </div>
                                  



                                    <div class="div-horizontal" role="div">
                                        <div class="div-group">
                                            <label class="col-md-2 control-label">Emp name</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtempname" runat="server" class="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtempname" ForeColor="Red" Font-Bold="true" ErrorMessage="Name is Require"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtempname" ForeColor="Red" Font-Bold="true" ErrorMessage="Enter /name" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                                           </div>
                                        </div>


                                        <div class="div-group">
                                            <label class="col-md-2 control-label">Contact</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtcontact" runat="server" class="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Contact no Require" ForeColor="Red" Font-Bold="true"  ControlToValidate="txtContact"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Numeric Value" ForeColor="Red" Font-Bold="true"  ControlToValidate="txtContact" ValidationExpression="^[0-9]{0,10}$"></asp:RegularExpressionValidator>
                                                   </div>
                                        </div>

                                        <div class="div-group">
                                            <label class="col-md-2 control-label">Email Id</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtemailid" runat="server" class="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Id Is Require" ControlToValidate="txtemailid" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter valid emailid" ForeColor="Red" Font-Bold="true" ControlToValidate="txtemailid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                        <div class="div-group">
                                            <label class="col-md-2 control-label">Profile</label>
                                            <div class="col-md-10">
                                                <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" />
                                                <img runat="server" id="imgfile" visible="false" style="height: 60px; width: 60px;" />
                                                <asp:HiddenField ID="hfoldImageName" runat="server" />
                                                <asp:RequiredFieldValidator ID="reqimage" runat="server" ErrorMessage="Choose Only Image" ControlToValidate="FileUpload2" ForeColor="Red" Font-Bold="true" ></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Only Image !!" ForeColor="Red" Font-Bold="true" ControlToValidate="fileupload2" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                        <div class="div-group">
                                            <label class="col-md-2 control-label">Address</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtadd" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address Is Require" ControlToValidate="txtadd" ForeColor="Red" Font-Bold="true" ></asp:RequiredFieldValidator>
                                            </div>
                                        </div>



                                        <div class="div-group">
                                            <label class="col-md-2 control-label">User Name</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtusername" runat="server" class="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtusername" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>



                                        <div class="div-group" id="divPwd" runat="server">
                                            <label class="col-md-2 control-label">Password</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtpassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Password" ForeColor="Red" Font-Bold="true" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="div-group">
                                            <label class="col-md-2 control-label">Block</label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="drpBlock" runat="server">
                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                </asp:DropDownList>

                                                
                                            </div>
                                        </div>


                                        <div class="div-group">
                                            <label class="col-md-2 control-label"></label>
                                            <div class="col-md-10">

                                                <asp:LinkButton ID="btnsubmit" class="btn btn-purple waves-effect waves-light" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
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
            <footer class="footer text-right">2017 © Master Minds .</footer>
        </div>
        </form>
        <script>var resizefunc = [];</script>
        <script src="assets/js/moltran.min.js"></script>
</asp:Content>

