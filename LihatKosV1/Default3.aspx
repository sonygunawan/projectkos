<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default3.aspx.cs" Inherits="LihatKosV1.Default3" %>

<%@ Register src="~/UserControl/Home/BannerLeft.ascx" tagname="BannerLeft" tagprefix="uc1" %>
<%@ Register Src="~/UserControl/Home/HighestControl.ascx" TagName="HighestControl" TagPrefix="uc3" %>
<%@ Register Src="~/UserControl/Home/MyFavoritesControl.ascx" TagName="MyFavoritesControl" TagPrefix="uc4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LihatKos.com | Website Pencari Tempat Kos Terbaik dan Terkini</title>
    <meta name="description" content="Website listing Rumah Kos yang menyajikan berbagai macam data Tempat Kos yang Akurat dan Terverifikasi. Saat ini Lokasi jangkauan wilayah kami meliputi Jakarta, Bogor, Tangerang dan Bekasi." />
    
    <!-- bootstrap -->
    <link type="text/css" rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />

    <link type="text/css" rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link type="text/css" rel="stylesheet" href="assets/wow/animate.css" />
    
    <link type="text/css" rel="stylesheet" href="assets/style.css" />
    <!-- Owl Carousel 2 -->
    <link type="text/css" rel="stylesheet" href="assets/owlcarousel/owl.carousel.min.css" />
    <link type="text/css" rel="stylesheet" href="assets/owlcarousel/owl.theme.default.min.css" />

    <style type="text/css">
        .favList {
            margin: 0px 25px;
        }
        .favPadding {
            padding: 4px;
        }
        .image-container{
            height: 110px;
            width: 150px;
            position: relative;
        }
        #image {
            position: absolute;
            left: 0;
            top: 0;
        }
        .text {
            z-index: 100;
            width:100%;
            background-color:Gray;
            position: absolute;
            color: whitesmoke;
            font-size: 12px;
            font-family:sans-serif;
            font-weight: bold;
            left:0px;
            bottom: 0px;
            padding:0px 5px;
        }
        .modalBackground  {
            background-color:Gray;
            filter:alpha(opacity=70);
            opacity:0.7;
            position: absolute;
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- Owl Carousel 2 -->
    <script src="assets/owlcarousel/owl.carousel.min.js"></script>
    
    <!-- wow script -->
    <script src="assets/wow/wow.min.js"></script>
    
    <!-- uniform -->
    <script src="assets/uniform/js/jquery.uniform.js"></script>

    <!-- boostrap -->
    <script src="assets/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    
    <!-- jquery mobile -->
    <script src="assets/mobile/touchSwipe.min.js"></script>

    <!-- custom script -->
    <script src="assets/script.js"></script>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w&sensor=false&libraries=places"></script>
    <script type="text/javascript">
        function pageLoad() {
            $('.owl-carousel').owlCarousel({
                loop: true,
                items: 1,
                height: 849,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: true
            });

            $(".owl-carousel").owlCarousel();

            $('.dropdown-toggle').dropdown();
        }

        function showLatLng() {
            var geocoder = new google.maps.Geocoder();
            var ddlKecamatan = document.getElementById('ddlKecamatan');
            var kecamatanText = ddlKecamatan.options[ddlKecamatan.selectedIndex].innerHTML != "- Semua -" ? ddlKecamatan.options[ddlKecamatan.selectedIndex].innerHTML : "";

            var ddlKabupaten = document.getElementById('ddlKabupaten');
            var kabupatenText = ddlKabupaten.options[ddlKabupaten.selectedIndex].innerHTML != "- Semua -" ? ddlKabupaten.options[ddlKabupaten.selectedIndex].innerHTML : "";

            var ddlPropinsi = document.getElementById('ddlPropinsi');
            var propinsiText = ddlPropinsi.options[ddlPropinsi.selectedIndex].innerHTML != "- Semua -" ? ddlPropinsi.options[ddlPropinsi.selectedIndex].innerHTML : "";

            var address = "";
            if (kecamatanText == '') {
                address = kabupatenText;
            }
            else {
                address = kabupatenText + "," + kecamatanText;
            }

            if (kabupatenText == "" && kecamatanText == "") {
                address = propinsiText;
                //alert(address);
            }

            geocoder.geocode({ 'address': address }, function (results, status) {

                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    //alert(latitude+ ',' + longitude);
                    //alert(JSON.stringify(results));
                }
            });
        }
    </script>
</head>
<body id="home">
    <form id="form1" runat="server">
    <%--<div>
    
    </div>--%>
        <asp:ScriptManager ID="sm2" runat="server" AsyncPostBackTimeout="3000">
        </asp:ScriptManager>
        
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                
                <!-- navbar -->
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">
                                <img src="" alt="LihatKos" /></a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    
                            <ul class="nav navbar-nav">
                        
                                <li id="liTambahKos" runat="server"><a href="/DaftarKos">Pasang Iklan</a></li>
                                <li id="liAbout" runat="server" class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">About <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/AboutUs">About Us</a></li>
                                        <li><a href="/ContactUs">Contact Us</a></li>
                                    </ul>
                                  </li>   
                                <li id="liAdmin" runat="server" class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                      <li><a href="/FormApproval">Form Approval</a></li>
                                      <li><a href="/FormUser">Form User</a></li>
                                      <li><a href="/FormBanner">Form Banner</a></li>
                                      <li><a href="/Admin/ContactUs">Form ContactUs</a></li>
                                      <li><a href="/Admin/FormContent">Form Content</a></li>
                                    </ul>
                                  </li>       
                            </ul>
                            <p id="pWelcome" runat="server" class="navbar-text" style="margin-left:50px;"><span class="welcome">Welcome, <a href="#" class="navbar-link"><asp:Literal ID="litUsername" runat="server"></asp:Literal></a>
                                </span> <br /><a href="#" class="navbar-link">My Account</a> | <a href="#" class="navbar-link">My Favorites</a> | <a href="/Logout" class="navbar-link">Logout</a></p>        
                                
                            
                        </div>
                        <!-- Wnavbar-collapse -->
                    </div>
                    <!-- container-fluid -->
                </nav>
                <!-- header -->
                <!-- Front -->
        <div id="front">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8 slide no-gutter">
                        <uc1:BannerLeft ID="BannerLeft" runat="server" />
                    </div>
                    
                        </div>
                    <div class="col-sm-4 topservices" style="position:relative;">
                        <div class="favList">
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <div class="image-container">
                                    <a href="#">
                                        <img id="image" src="images/150x110.png"/>
                                        <div class="text">
                                           <span>Casablanca, Jakarta, Indonesia</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <div class="image-container">
                                    <a href="#">
                                        <img id="image" src="images/150x110.png"/>
                                        <div class="text">
                                           <span>Casablanca, Jakarta</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <div class="image-container">
                                    <a href="#">
                                        <img id="image" src="images/150x110.png"/>
                                        <div class="text">
                                           <span>Pluit, Jakarta, Indonesia</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <div class="image-container">
                                    <a href="#">
                                        <img id="image" src="images/150x110.png"/>
                                        <div class="text">
                                           <span>Muara Karang, Jakarta</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <div class="image-container">
                                    <a href="#">
                                        <img id="image" src="images/150x110.png"/>
                                        <div class="text">
                                           <span>Pagedangan, Tangerang</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <div class="image-container">
                                    <a href="#">
                                        <img id="image" src="images/150x110.png"/>
                                        <div class="text">
                                           <span>Kuningan, Jakarta</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>

            <!-- End of Front -->
                <div class="spacersmall services">
                    <div class="container">
                        <div class="row">
                
                            <div class="col-sm-4">
                                <label class="control-label">Propinsi</label>
                                <asp:DropDownList ID="ddlPropinsi" runat="server" CssClass="form-control" AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="ddlPropinsi_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Kabupaten</label>
                                <asp:DropDownList ID="ddlKabupaten" runat="server" CssClass="form-control" AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="ddlKabupaten_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Kecamatan</label>
                                <asp:DropDownList ID="ddlKecamatan" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:DropDownList>
                            </div>
                    
                        </div>
                    </div>
                </div>

                <div class="spacersmaller services">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label>Range Harga</label>
                                    <asp:HiddenField ID="hidMinimumPrice" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidMaximumPrice" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidMinimumSetValue" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidMaximumSetValue" runat="server" ClientIDMode="Static" />
                                    <asp:TextBox ID="multiHandle2_1_BoundControl" runat="server"  Width="150" Text="0"></asp:TextBox>
                                    <asp:TextBox ID="multiHandle2_2_BoundControl" runat="server" Width="150" Text="1000000" />
                                    <asp:TextBox ID="sliderTwo" runat="server" Style="display: none;" />
                                    <cc1:MultiHandleSliderExtender ID="multiHandleSliderExtenderTwo" runat="server"
                                        BehaviorID="multiHandleSliderExtenderTwo"
                                        TargetControlID="sliderTwo"
                                        Minimum="0"
                                        Maximum="1000000"
                                        Steps="25000"
                                        Length="600"
                                        TooltipText="{0}"
                                        Orientation="Horizontal"
                                        EnableHandleAnimation="true"
                                        EnableKeyboard="false"
                                        EnableMouseWheel="false"
                                        ShowHandleDragStyle="true"
                                        ShowHandleHoverStyle="true"
                                        ShowInnerRail="true">
                                        <MultiHandleSliderTargets>
                                            <cc1:MultiHandleSliderTarget ControlID="multiHandle2_1_BoundControl" />
                                            <cc1:MultiHandleSliderTarget ControlID="multiHandle2_2_BoundControl" />
                                        </MultiHandleSliderTargets>
                                    </cc1:MultiHandleSliderExtender>
                                </div>
    
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label></label>
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default btn-fullwidth text-uppercase" Text="Cari Kos" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <%--room --%>

                <asp:Button ID="btn1" runat="server" Style="display:none;" />
                <cc1:ModalPopupExtender ID="MPELogin" runat="server" TargetControlID="btn1" DropShadow="true" PopupControlID="pnlLogin" 
                    CancelControlID="btnClose" BackgroundCssClass="modalBackground" />
                <asp:Panel ID="pnlLogin" runat="server" Style="display:none;background-color: #ffffff;width:600px;border-radius: 6px;background-clip: padding-box;" DefaultButton="btnLoginShort">
                        <div class="modal-header">
                        <asp:Button ID="btnClose" CssClass="close" runat="server" Text="x" />
                        <h3>Login to LihatKos.com</h3>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                              
                              <div class="col-xs-6">
                                  <p class="lead">Register</p>
                                  <div class="form-group">
                                      <label>Name</label>
                                      <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                  </div>
                                  <div class="form-group">
                                      <label>E-mail Address</label>
                                      <asp:TextBox ID="txtEmailRegister" runat="server" CssClass="form-control"></asp:TextBox>
                                  </div>
                                  <div class="form-group">
                                      <label>Password</label>
                                      <asp:TextBox ID="txtPasswordRegister" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                  </div>
                                  <div class="form-group">
                                      <label>Confirm Password</label>
                                      <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                  </div>
                                  <div class="form-group">
                                    <div style="color:red;">
                                        <asp:Label ID="lblRegisterErrorMsg" runat="server" />
                                    </div>
                                    <div style="color:blue;">
                                        <asp:Label ID="lblRegisterSuccessMsg" runat="server" />
                                    </div>
                                </div>
                                  <asp:LinkButton ID="btnRegister" runat="server" CssClass="btn btn-info btn-block" OnClick="btnRegister_Click">Register</asp:LinkButton>
                              </div>
                            <div class="col-xs-6">
                                <p class="lead">Login</p>
                                <div class="well">
                                    
                                        <div class="form-group">
                                            <label for="username" class="control-label">E-mail Address</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="control-label">Password</label>
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                                        </div>
                                    
                                        <div class="form-group">
                                                        <asp:CheckBox ID="chkRemember" runat="server" />
                                                        Remember Me
                                        </div>
                                        <div class="form-group">
                                            <div style="color:red;">&nbsp;
                                                <asp:Label ID="lblLoginErrorMsg" runat="server" />
                                            </div>
                                        </div>
                                        <asp:Button ID="btnLoginShort" runat="server" CssClass="btn btn-success btn-block" Text="Login" OnClick="btnLoginShort_Click" />
                                        <asp:HyperLink ID="hlForgot" runat="server" NavigateUrl="/Forgot" CssClass="btn btn-default btn-block" Text="Forgot Password" />
                                        
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </asp:Panel>
             <%--footer--%>
                
        <footer class="spacer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5">
                        <h4>LihatKos</h4>
                        <p>Dapatkan info kos murah, kos harian, kos bebas dan info kos lainnya di LihatKos.com </p>
                    </div>

                    <div class="col-sm-3">
                        <h4>Lokasi</h4>
                        <ul class="list-unstyled">
                            <li><a href="#">Jabodetabek</a></li>
                            <li><a href="#">Bandung</a></li>
                            <li><a href="#">Yogyakarta</a></li>
                            <li><a href="#">Semarang</a></li>
                            <li><a href="#">Malang</a></li>
                            <li><a href="#">Surabaya</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4 subscribe">
                        <h4>Subscription</h4>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Enter email id here">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">Get Notify</button>
                            </span>
                        </div>
                        <div class="social">
                            <a href="#"><i class="fa fa-facebook-square" data-toggle="tooltip" data-placement="top" data-original-title="facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram" data-toggle="tooltip" data-placement="top" data-original-title="instragram"></i></a>
                            <a href="#"><i class="fa fa-twitter-square" data-toggle="tooltip" data-placement="top" data-original-title="twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest-square" data-toggle="tooltip" data-placement="top" data-original-title="pinterest"></i></a>
                            <a href="#"><i class="fa fa-tumblr-square" data-toggle="tooltip" data-placement="top" data-original-title="tumblr"></i></a>
                            <a href="#"><i class="fa fa-youtube-square" data-toggle="tooltip" data-placement="top" data-original-title="youtube"></i></a>
                        </div>
                    </div>
                </div>
                <!--/.row-->
            </div>
            <!--/.container-->

            <!--/.footer-bottom-->
        </footer>
        <a href="#home" class="toTop scroll"><i class="fa fa-angle-up"></i></a>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
