﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailKos.aspx.cs" Inherits="LihatKosV1.DetailKos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>LihatKos.com | Website Pencari Tempat Kos Terbaik dan Terkini</title>

    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500,800|Old+Standard+TT' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500,800' rel='stylesheet' type='text/css'>

    <!-- font awesome -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">


    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/login.css" />
    
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    
    <!-- font awesome -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- uniform -->
    <link type="text/css" rel="stylesheet" href="assets/uniform/css/uniform.default.min.css" />

    <!-- animate.css -->
    <link rel="stylesheet" href="assets/wow/animate.css" />


    <!-- gallery -->
    <link rel="stylesheet" href="assets/gallery/blueimp-gallery.min.css">


<%--    <!-- favicon -->
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <link rel="icon" href="images/favicon.png" type="image/x-icon">--%>


    <!-- Owl Carousel 2 -->
    <link rel="stylesheet" href="assets/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/owlcarousel/owl.theme.default.min.css">

</head>

<body id="home">
    <form class="form-horizontal" id="form1" runat="server">
        <asp:ScriptManager ID="sm" AsyncPostBackTimeout="36000" runat="server" ></asp:ScriptManager>
        <!-- header -->
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
                    <a class="navbar-brand" href="index.php">
                        <img src="" alt="LihatKos"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">

                    <ul class="nav navbar-nav">
                        <!--
        <li><a href="index.php">Home </a></li>
        <li><a href="rooms-tariff.php">Rooms & Tariff</a></li>
        <li><a href="introduction.php">Introduction</a></li>
        <li><a href="gallery.php">Gallery</a></li>
        <li><a href="contact.php">Contact</a></li>
      -->

                        <li><a href="/Register">Register</a></li>
                        <li><a href="/Login">Login</a></li>
                    </ul>
                </div>
                <!-- navbar-collapse -->
            </div>
            <!-- container-fluid -->
        </nav>
        <div style="margin-top: 20px;"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <asp:Label ID="lblNama" runat="server"></asp:Label>
                        </div>

                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:ValidationSummary ID="vs" runat="server" />
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="col-sm-8">
                                    <div class="owl-carousel owl-theme">
                                        <div class="item">
                                            <img src="images/photos/banner.jpg" class="img-responsive" alt="slide">
                                        </div>
                                        <div class="item">
                                            <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                                        </div>
                                        <div class="item">
                                            <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                                        </div>
                                        <div class="item">
                                            <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                                        </div>
                                        <div class="item">
                                            <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 search">
                                    <h3 class="text-center text-uppercase">Harga</h3>
                                    <div class="form-group">
                                        
                                            <label class="col-sm-8">Sisa Kamar</label>
                                            <div class="col-sm-4 control-label"><asp:Label ID="lblSisaKamar" runat="server"></asp:Label></div>
                                    
                                            <label class="col-md-8">Sewa Harian</label>
                                            <div class="col-md-4 control-label"><asp:Label ID="lblHarian" runat="server"></asp:Label></div>
                                    
                                            <label class="col-md-8">Sewa Mingguan</label>
                                            <div class="col-md-4 control-label"><asp:Label ID="lblMingguan" runat="server"></asp:Label></div>
                                    
                                            <label class="col-md-8">Sewa Bulanan</label>
                                            <div class="col-md-4 control-label"><asp:Label ID="lblBulanan" runat="server"></asp:Label></div>
                                    
                                            <label class="col-md-8">Sewa Tahunan</label>
                                            <div class="col-md-4 control-label"><asp:Label ID="lblTahunan" runat="server"></asp:Label></div>
                                            <br />
                                            <div style="margin:4px 4px;">
                                                
                                            </div>
                                    </div>
                                    <div style="text-align:center;">
                                    <asp:Button ID="btnHubungi" runat="server" CssClass="btn btn-primary text-center text-capitalize" Text="Hubungi" OnClick="btnHubungi_Click" />
                                    <br />
                                    <asp:Label ID="lblNamaPengelola" runat="server" Font-Bold="true"></asp:Label>
                                        <br />
                                    <asp:Label ID="lblNmrTlpnPengelola" runat="server"></asp:Label>
                                    <%--<label>Nayla</label>
                                        <br />
                                    <label>08193283782</label>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Deskripsi</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtDeskripsi" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"
                                         Enabled="false"></asp:TextBox>
                                    <%--<textarea class="form-control" id="textarea" name="description" placeholder="Description"></textarea>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Area</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control ui-controlgroup-item" Enabled="false"></asp:DropDownList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>--%>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Alamat</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtAlamat" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
                                    <%--<textarea class="form-control" id="textarea" name="description" placeholder="Description"></textarea>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                
                                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w"></script>
                                
                                <script type="text/javascript">
                                    function init_map() {
                                        var latitude = document.getElementById('hidLatitude').value;
                                        var longitude = document.getElementById('hidLongitude').value;
                                        var myOptions = { zoom: 13, center: new google.maps.LatLng(latitude, longitude), mapTypeId: google.maps.MapTypeId.ROADMAP }; map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions); marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(latitude, longitude), animation: google.maps.Animation.DROP }); marker.addListener('click', toggleBounce);
                                    }

                                    function toggleBounce() {
                                        if (marker.getAnimation() !== null) {
                                            marker.setAnimation(null);
                                        } else {
                                            marker.setAnimation(google.maps.Animation.BOUNCE);
                                        }
                                    }
                                    google.maps.event.addDomListener(window, 'load', init_map);
                                    <%--function initAutocomplete() {

                                        var map = new google.maps.Map(document.getElementById('gmap_canvas'), {
                                            center: { lat: -6.136299, lng: 106.800735 },
                                            zoom: 12,
                                            streetViewControl: false,
                                            mapTypeId: 'roadmap'
                                        });

                                        // Create the search box and link it to the UI element.
                                        var input = document.getElementById('txtLokasi');
                                        var searchBox = new google.maps.places.SearchBox(input);
                                        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                                        // Bias the SearchBox results towards current map's viewport.
                                        map.addListener('bounds_changed', function () {
                                            searchBox.setBounds(map.getBounds());
                                        });

                                        var markers = [];
                                        // Listen for the event fired when the user selects a prediction and retrieve
                                        // more details for that place.
                                        searchBox.addListener('places_changed', function () {
                                            var places = searchBox.getPlaces();

                                            if (places.length == 0) {
                                                return;
                                            }

                                            // Clear out the old markers.
                                            markers.forEach(function (marker) {
                                                marker.setMap(null);
                                                marker.setMap(map);

                                            });
                                            markers = [];

                                            // For each place, get the icon, name and location.
                                            var bounds = new google.maps.LatLngBounds();
                                            places.forEach(function (place) {
                                                if (!place.geometry) {
                                                    console.log("Returned place contains no geometry");
                                                    return;
                                                }
                                                var icon = {
                                                    url: place.icon,
                                                    size: new google.maps.Size(71, 71),
                                                    origin: new google.maps.Point(0, 0),
                                                    anchor: new google.maps.Point(17, 34),
                                                    scaledSize: new google.maps.Size(25, 25)
                                                };

                                                // Create a marker for each place.
                                                markers.push(new google.maps.Marker({
                                                    map: map,
                                                    icon: icon,
                                                    title: place.name,
                                                    position: place.geometry.location
                                                }));

                                                var latitude = place.geometry.location.lat();
                                                var longitude = place.geometry.location.lng();
                                                document.getElementById('<%= hidLatitude.ClientID %>').value = latitude;
                                                document.getElementById('<%= hidLongitude.ClientID %>').value = longitude;
                                                document.getElementById('<%= txtLatitude.ClientID %>').value = latitude;
                                                document.getElementById('<%= txtLongitude.ClientID %>').value = longitude;

                                                //alert(true);
                                                if (place.geometry.viewport) {
                                                    // Only geocodes have viewport.
                                                    bounds.union(place.geometry.viewport);
                                                } else {
                                                    bounds.extend(place.geometry.location);
                                                }
                                            });
                                            map.fitBounds(bounds);
                                        });
                                        //google.maps.event.addDomListener(window, 'load', function () {
                                        //var places = new google.maps.places.Autocomplete(document.getElementById('txtLokasi'));
                                        //google.maps.event.addListener(places, 'place_changed', function () {
                                        //    var place = places.getPlace();
                                        //    var address = place.formatted_address;
                                        //    var latitude = place.geometry.location.lat();
                                        //    var longitude = place.geometry.location.lng();
                                        //    var mesg = "Address: " + address;
                                        //    mesg += "\nLatitude: " + latitude;
                                        //    mesg += "\nLongitude: " + longitude;
                                        //    document.getElementById('txtLatitude').value = latitude;
                                        //    document.getElementById('txtLongitude').value = longitude;
                                        //    //alert(mesg);

                                        //});
                                    }
                                    //google.maps.event.addDomListener(window, 'load', function () {
                                    //    var places = new google.maps.places.Autocomplete(document.getElementById('txtLokasi'));
                                    //    google.maps.event.addListener(places, 'place_changed', function () {
                                    //        var place = places.getPlace();
                                    //        var address = place.formatted_address;
                                    //        var latitude = place.geometry.location.lat();
                                    //        var longitude = place.geometry.location.lng();
                                    //        var mesg = "Address: " + address;
                                    //        mesg += "\nLatitude: " + latitude;
                                    //        mesg += "\nLongitude: " + longitude;
                                    //        document.getElementById('txtLatitude').value = latitude;
                                    //        document.getElementById('txtLongitude').value = longitude;
                                    //        //alert(mesg);

                                    //    });

                                    //});
                                    //// Create the search box and link it to the UI element.
                                    //var input = document.getElementById('txtLokasi');
                                    //var searchBox = new google.maps.places.SearchBox(input);

                                    //var places = new google.maps.places.Autocomplete(document.getElementById('txtLokasi'));
                                    //var myOptions = { zoom: 12, center: new google.maps.LatLng(latitude, longitude), mapTypeId: google.maps.MapTypeId.ROADMAP };
                                    //var map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                                    //map.addListener('bounds_changed', function () {
                                    //    searchBox.setBounds(map.getBounds());
                                    //});
                                    //alert(JSON.stringify(places));
                                    //var marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(latitude, longitude) }); google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker);
                                    //google.maps.event.addDomListener(window, 'load', function () {
                                    //    //var places = new google.maps.places.Autocomplete(document.getElementById('txtLokasi'));
                                    //    google.maps.event.addListener(places, 'place_changed', function () {
                                    //        var place = places.getPlace();
                                    //        var address = place.formatted_address;
                                    //        var latitude = place.geometry.location.lat();
                                    //        var longitude = place.geometry.location.lng();
                                    //        var mesg = "Address: " + address;
                                    //        mesg += "\nLatitude: " + latitude;
                                    //        mesg += "\nLongitude: " + longitude;
                                    //        document.getElementById('txtLatitude').value = latitude;
                                    //        document.getElementById('txtLongitude').value = longitude;
                                    //        //alert(mesg);

                                    //    });

                                    //});

                                    //var myOptions = { zoom: 12, center: new google.maps.LatLng(latitude, longitude), mapTypeId: google.maps.MapTypeId.ROADMAP };
                                    //map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                                    //marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(latitude, longitude) }); google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker);
                                    //google.maps.event.addDomListener(window, 'load', function () {
                                    //    var places = new google.maps.places.Autocomplete(document.getElementById('txtLokasi'));
                                    //    google.maps.event.addListener(places, 'place_changed', function () {
                                    //        var place = places.getPlace();
                                    //        var address = place.formatted_address;
                                    //        var latitude = place.geometry.location.lat();
                                    //        var longitude = place.geometry.location.lng();
                                    //        var mesg = "Address: " + address;
                                    //        mesg += "\nLatitude: " + latitude;
                                    //        mesg += "\nLongitude: " + longitude;
                                    //        document.getElementById('txtLatitude').value = latitude;
                                    //        document.getElementById('txtLongitude').value = longitude;
                                    //        //alert(mesg);

                                    //    });

                                    //});--%>
                                </script>
                                <label class="col-md-3 control-label" for="textarea">Lokasi</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtLokasi" runat="server" CssClass="form-control" ClientIDMode="Static"
                                         MaxLength="1000" Visible="false" ></asp:TextBox>
                                    <div style='overflow: hidden; height: 400px; width: 100%;'>
                                    <div id='gmap_canvas' style='height: 400px;  width: 100%;'>
                                    </div>
                                    <div>
                                        <small>
                                            <a href="http://embedgooglemaps.com">embed google maps</a>

                                        </small>
                                    </div>
                                    <div><small><a href="#">privacy policy template</a></small></div>
                                    <style>
                                        #gmap_canvas img {
                                            max-width: none !important;
                                            background: none !important;
                                        }
                                    </style>

                                </div>
                                <script type='text/javascript'>
                                    //function init_map() {
                                    //    //alert('initmap');
                                    //    var latitude = -6.3394791;//document.getElementById('txtLatitude').value;
                                    //    var longitude = 106.63954179999996;//document.getElementById('txtLongitude').value;
                                    //    var myOptions = { zoom: 12, center: new google.maps.LatLng(latitude, longitude), mapTypeId: google.maps.MapTypeId.ROADMAP }; map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions); marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(latitude, longitude) }); google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker);
                                    //} google.maps.event.addDomListener(window, 'load', init_map);</script>

                                </div>
                                <div class="col-md-3">
                                    <asp:HiddenField ID="hidLatitude" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidLongitude" runat="server" ClientIDMode="Static" />
                                    </div>
                                    <%--<textarea class="form-control" id="textarea" name="description" placeholder="Description"></textarea>--%>
                                    <div class="col-md-9">
                                        <label class="col-md-2 control-label" for="textarea">Latitude</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtLatitude" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                        <label class="col-md-2 control-label" for="textarea">Longitude</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtLongitude" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>

                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="price">Nama Pemilik</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtPemilik" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                    <%--<input id="price" name="price" type="text" placeholder="Product price" class="form-control input-md" required="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Alamat Pemilik</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtAlamatPemilik" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
                                    <%--<input id="image" name="image" type="text" placeholder="Image URL" class="form-control input-md">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="file">Telepon/HP Pemilik</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtTlpPemilik" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Nama Pengelola</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtNamaPengelola" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Telepon/HP Pengelola</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtTlpPengelola" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Minimum Bayar</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlMinimumBayarMonth" runat="server" CssClass="form-control ui-controlgroup-item" Enabled="false"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Keterangan Minimum Bayar</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtMinimumBayarDesc" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Luas Kamar</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtLuasKamar" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Tipe Kos</label>
                                <div class="col-md-9">
                                    <asp:RadioButtonList ID="rdlTipeKos" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                        CellSpacing="50" CellPadding="50" Enabled="false" />
                                    <%--<asp:DropDownList ID="ddlTipeKos" runat="server" CssClass="form-control ui-controlgroup-item" ></asp:DropDownList>--%>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Binatang Peliharaan</label>
                                <div class="col-md-9">
                                    <%--<asp:RadioButton ID="rdlPet1" runat="server" GroupName="Pet" CssClass="form-control radio-inline" Text="Boleh" />
                                    <asp:RadioButton ID="rdlPet2" runat="server" GroupName="Pet" CssClass="form-control radio-inline" Text="Tidak Boleh" />--%>
                                    
                                    <asp:RadioButtonList ID="rdlPet" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Enabled="false">
                                        <asp:ListItem Value="1" Text="Boleh&nbsp;&nbsp;&nbsp;&nbsp;"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="Tidak Boleh"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <style>.chkMargin{ margin-left:4px; margin-right:4px; padding-left:4px;padding-right:4px;}</style>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Fasilitas Kamar</label>
                                <div class="col-md-9 ui-controlgroup-item">
                                    <asp:CheckBoxList ID="chkFasilitas" runat="server" ClientIDMode="Static" 
                                        RepeatDirection="Horizontal" RepeatLayout="Table" CellSpacing="10" CellPadding="10" CssClass="chkMargin" Enabled="false">
                                    </asp:CheckBoxList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Landmark</label>
                                <div class="col-md-9 ui-controlgroup-item">
                                    <asp:CheckBoxList ID="chkLingkungan" runat="server" ClientIDMode="Static" 
                                        RepeatDirection="Horizontal" RepeatLayout="Flow" CellSpacing="10" CellPadding="10" CssClass="chkMargin" Enabled="false"></asp:CheckBoxList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Keterangan Lain-lain</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtKeteranganLain" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="submit"></label>
                                <div class="col-md-9">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" Visible="false" />
                                    <%--<button id="submit" name="submit" class="btn btn-primary">Insert</button>--%>
                                </div>
                            </div>
                            <!-- 
                                <fieldset>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="title">Title</label>
                        <div class="col-md-9">
                            <input id="title" name="title" type="text" placeholder="Product name" class="form-control input-md" required="">
 
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="textarea">Description</label>
                        <div class="col-md-9">
                            <textarea class="form-control" id="textarea" name="description" placeholder="Description" ></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="price">Price</label>
                        <div class="col-md-9">
                            <input id="price" name="price" type="text" placeholder="Product price" class="form-control input-md" required="">
 
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="image">Image URL</label>
                        <div class="col-md-9">
                            <input id="image" name="image" type="text" placeholder="Image URL" class="form-control input-md" >
 
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="file">File</label>
                        <div class="col-md-9">
                            <input id="file" name="file" class="input-file" type="file">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="submit"></label>
                        <div class="col-md-9">
                            <button id="submit" name="submit" class="btn btn-primary">Insert</button>
                        </div>
                    </div>
 
                </fieldset>
                                -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
        
        <script src="assets/jquery.js"></script>
        
        <!-- uniform -->
        <script src="assets/uniform/js/jquery.uniform.js"></script>

        <!-- boostrap -->
        <script src="assets/bootstrap/js/bootstrap.js" type="text/javascript"></script>

        <!-- gallery -->
        <script src="assets/gallery/jquery.blueimp-gallery.min.js"></script>
        <!-- Owl Carousel 2 -->
        <script src="assets/owlcarousel/owl.carousel.min.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function () {

                $('.owl-carousel').owlCarousel({
                    loop: true,
                    items: 1,
                    autoplay: true,
                    autoplayTimeout: 5000,
                    autoplayHoverPause: true
                });

                $(".owl-carousel").owlCarousel();

                $("#<%= chkFasilitas.ClientID %>").buttonset();
                $("#<%= chkLingkungan.ClientID %>").buttonset();
            });
        </script>
    </form>
</body>
</html>
