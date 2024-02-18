<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="admin_add_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">
    <title>Moltran - Responsive Admin Dashboard Template</title>
    <link href="assets/css/moltran.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
    <script src="../../cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <form class="content-page" runat="server">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="pull-left page-title">New Product</h4>
                        <ol class="breadcrumb pull-right">
                            <li><a href="#">Master Mind</a></li>
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">New Product</li>
                        </ol>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title" runat="server" id="lblhead">Add product
                                <a href="view_product.aspx" class="btn btn-info waves-effect waves-light m-b-5" style="float: right;">View List</a>
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
                                        <label class="col-md-2 control-label">Category</label>
                                        <div class="col-md-10">
                                            <asp:DropDownList ID="Drpcategory" runat="server" class="form-control"></asp:DropDownList><br />
                                        </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Product Code</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtproductcode" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Bold="true" ForeColor="Red"  ErrorMessage="Product code is require" ControlToValidate="txtproductcode"></asp:RequiredFieldValidator>
                            
                                         </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Product Title</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txttitle" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter a title" ControlToValidate="txttitle" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                                             
                                           </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Descripation</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtdescp" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox><br />
                                        </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Old Price</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtoldprice" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter a price" ControlToValidate="txtoldprice" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="red" ValueToCompare="0" ControlToValidate="txtoldprice"
ErrorMessage="Must enter positive integers" Operator="GreaterThan" Type="Integer"></asp:CompareValidator>
                                            </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">New Price</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtnewprice" runat="server" class="form-control" TextMode="Number" onblur="return validateprice();"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter a price" ControlToValidate="txtnewprice" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                              <asp:CompareValidator ID="CompareValidator2" runat="server" ForeColor="red" ValueToCompare="0" ControlToValidate="txtnewprice"
ErrorMessage="Must enter positive integers" Operator="GreaterThan" Type="Integer"></asp:CompareValidator>
                                            

                                           </div>
                                    </div>

                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Video Url</label>
                                        <div class="col-md-10">
                                       <asp:TextBox ID="txtvideo" runat="server" class="form-control"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Valid  Url" Font-Bold="true" ForeColor="Red" ControlToValidate="txtvideo"></asp:RequiredFieldValidator>
                                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Url" Font-Bold="true" ForeColor="Red" ControlToValidate="txtvideo"></asp:RegularExpressionValidator>--%>      
                                        </div>
                                    </div>

                                  
                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Total Quantaty</label>
                                        <div class="col-md-10">
                                             <asp:TextBox ID="txtqty" runat="server" class="form-control" TextMode="Number"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Quantaty" ControlToValidate="txtqty" Font-Bold="true" ForeColor="Red" ></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Must Be Numeric" Font-Bold="true" ForeColor="Red" ControlToValidate="txtqty" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                                                        </div>
                                        </div>


                                    <div class="div-group">
                                        <label class="col-md-2 control-label">Install Charge</label>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="txtinstallcharge" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="enter a charges" ControlToValidate="txtinstallcharge" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                          <asp:CompareValidator ID="CompareValidator3" runat="server" ForeColor="red" ValueToCompare="0" ControlToValidate="txtinstallcharge"
ErrorMessage="Must enter positive integers" Operator="GreaterThan" Type="Integer"></asp:CompareValidator>

                                             </div>
                                    </div>

                                     <div class="div-group">
                                        <label class="col-md-2 control-label">Images</label>
                                        <div class="col-md-10">
                                       <asp:FileUpload ID="fileuploadimages"  AllowMultiple="true"  runat="server" /><br />
                                    </div>
                                    </div>

                                    <div class="div-group">
                                    <label class="col-md-2 control-label">status</label>
                                    <div class="col-md-10">
                                    <asp:DropDownList ID="drpstatus" runat="server">
                                      <asp:ListItem Value="In Stock">In Stock</asp:ListItem>
                                     <asp:ListItem Value="Out Of Stock">Out Of Stock</asp:ListItem>
                                                </asp:DropDownList>
                                        
                                    </div>
                                    </div>
                                   

                                    <div class="div-group">
                                        <label class="col-md-2 control-label"></label>
                                        <div class="col-md-10">
                                            <asp:LinkButton ID="btnsubmit" class="btn btn-purple waves-effect waves-light" OnClientClick="validateprice();"  runat="server" Text="Submit" OnClick="btnsubmit_Click" />
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
    <script type="text/javascript">
        function validateprice() {
            var oldprice = document.getElementById('<%= txtoldprice.ClientID %>').value;
            var newprice = document.getElementById('<%= txtnewprice.ClientID %>').value;

            if (oldprice != "" && newprice != "") {
                if (parseFloat(oldprice) < parseFloat(newprice)) {
                    alert("Old Price must be less than New Price!!!");
                    return false;
                }
            }
        }
    </script>
</asp:Content>

