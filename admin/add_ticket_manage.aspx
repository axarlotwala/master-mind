<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="add_ticket_manage.aspx.cs" Inherits="admin_ticket_manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <link href="assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .bootstrap-timepicker-widget table td input {
            width:50%;
        }
    </style>
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="../../cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>




    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbXDsEJcgc13bVo1u4mHMY0h6c1cTquWg&v=3.exp&sensor=false&libraries=places"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="content-page">
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="pull-left page-title">Ticket</h4>
                            <ol class="breadcrumb pull-right">
                                <li><a href="#">Mastar Mind</a></li>
                                <li><a href="#">Dashboard</a></li>
                                <li class="active">Ticket Manage</li>
                            </ol>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Ticket Manage
                  <a href="view_ticket.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float: right;">View List</a>
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
                                                <label class="col-md-2 control-label">Order</label>
                                                <div class="col-md-10">
                                                    <asp:DropDownList ID="drpCustomers" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <br />
                                                </div>
                                            </div>


                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Product</label>
                                                <div class="col-md-10">
                                                    <asp:DropDownList ID="drpproduct" runat="server" CssClass="form-control"></asp:DropDownList><br />
                                                </div>
                                            </div>

                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Descripation</label>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtdescripation" runat="server" class="form-control" TextMode="MultiLine" CssClass="form-control"></asp:TextBox><br />
                                                </div>
                                            </div>


                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Address</label>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtadd" runat="server" class="form-control" TextMode="MultiLine" CssClass="form-control"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter a Address" ControlToValidate="txtadd" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>


                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Landmark</label>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtlandmark" runat="server" class="form-control"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter a Landmark" ControlToValidate="txtlandmark" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Latitude</label>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtlatitude" runat="server" class="form-control"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter a Latitute" ControlToValidate="txtlatitude" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>


                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Longtitude</label>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtlongtitude" runat="server" class="form-control"></asp:TextBox><br />
                                                </div>
                                            </div>

                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Reserve Date</label><br />
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtreservedate" runat="server" class="form-control mydatepicker"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter a Reserve date" ControlToValidate="txtreservedate" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Require Time</label><br />
                                                <div class="col-md-10">
                                                    <div class="bootstrap-timepicker">
                                                    <asp:TextBox ID="txtrequiretime" runat="server" CssClass="form-control mytimepicker"></asp:TextBox></div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter a Time" ControlToValidate="txtrequiretime" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                           <%-- <div class="div-group">
                                                <label class="col-md-2 control-label">Problem Image</label><br />
                                                <div class="col-md-10">
                                                    <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" />
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Select Only Image" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" ControlToValidate="FileUpload2" ForeColor="Red" Font-Bold="true"></asp:RegularExpressionValidator>--%>

                                                </div>
                                            </div>

                                            <%--<div class="div-group">
                                                <label class="col-md-2 control-label">Ticket Date</label><br />
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtticketdate" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Ticket date Require" ControlToValidate="txtticketdate" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>--%>

                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Employee</label><br />
                                                <div class="col-md-10">
                                                    <asp:DropDownList ID="drpemployee" class="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Status</label><br />
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtstatus" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Maintain Status" ControlToValidate="txtstatus" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <br />
<%--                                            <div class="div-group">
                                                <label class="col-md-2 control-label">Assign Date</label><br />
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txtassigndate" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Maintain Date" ControlToValidate="txtassigndate" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>--%>


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
                </div>
                <footer class="footer text-right">2017 © Master Minds .</footer>
            </div>
    </form>
    <script>var resizefunc = [];</script>
    <script src="assets/js/moltran.min.js"></script>
    <script src="assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".mydatepicker").datepicker({
                format: "yyyy-mm-dd",
                startDate: new Date()
            });

            $(".mytimepicker").timepicker({ defaultTIme: true });
        });
    </script>
    <script>


        function initialize() {

            var input = document.getElementById('<% =txtlandmark.ClientID %>');
            var autocomplete = new google.maps.places.Autocomplete(input);

            autocomplete.setTypes(['geocode']);
            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var place = autocomplete.getPlace();
                if (!place.geometry) {
                    return;
                }

                var address = '';
                if (place.address_components) {
                    address = [
                        (place.address_components[0] && place.address_components[0].short_name || ''),
                        (place.address_components[1] && place.address_components[1].short_name || ''),
                        (place.address_components[2] && place.address_components[2].short_name || '')
                    ].join(' ');
                }
                /*********************************************************************/
                /* var address contain your autocomplete address *********************/
                /* place.geometry.location.lat() && place.geometry.location.lat() ****/
                /* will be used for current address latitude and longitude************/
                /*********************************************************************/
                document.getElementById('<% =txtlatitude.ClientID %>').value = place.geometry.location.lat();
            document.getElementById('<% =txtlongtitude.ClientID %>').value = place.geometry.location.lng();
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);



    </script>
</asp:Content>

