<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DaftarKos.aspx.cs" Inherits="LihatKosV1.DaftarKos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
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
                            Form Pendaftaran LihatKos
                        </div>

                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:ValidationSummary ID="vs" runat="server" />
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Nama Kost</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtNama" runat="server" MaxLength="250" CssClass="form-control input-md"></asp:TextBox>
                                    <%--<input id="title" name="title" type="text" placeholder="Product name" class="form-control input-md" required="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Deskripsikan Kos-mu</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtDeskripsi" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <%--<textarea class="form-control" id="textarea" name="description" placeholder="Description"></textarea>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Area</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control ui-controlgroup-item"></asp:DropDownList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>--%>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Alamat</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtAlamat" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <%--<textarea class="form-control" id="textarea" name="description" placeholder="Description"></textarea>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <script type="text/javascript">
                                    function initAutocomplete() {
                                        var map = new google.maps.Map(document.getElementById('gmap_canvas'), {
                                            center: { lat: -6.2297264, lng: 106.6894331 },
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

                                    //});
                                </script>
                                <label class="col-md-3 control-label" for="textarea">Lokasi</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtLokasi" runat="server" CssClass="form-control" ClientIDMode="Static"
                                         MaxLength="1000" ></asp:TextBox>
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
                                <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w&sensor=false&libraries=places&callback=initAutocomplete"></script>
                                
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
                                    <asp:TextBox ID="txtPemilik" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <%--<input id="price" name="price" type="text" placeholder="Product price" class="form-control input-md" required="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Alamat Pemilik</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtAlamatPemilik" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <%--<input id="image" name="image" type="text" placeholder="Image URL" class="form-control input-md">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="file">Telepon/HP Pemilik</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtTlpPemilik" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Nama Pengelola</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtNamaPengelola" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Telepon/HP Pengelola</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtTlpPengelola" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Harga Sewa</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtHarian" runat="server" 
                                        CssClass="col-md-8"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True" TargetControlID="txtHarian" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                    <label class="col-md-4">per Hari</label>
                                    <%--<label class="col-md-3">Mingguan</label>--%>
                                    <%--<label class="col-md-3">Harian</label>--%>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3"></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtMingguan" runat="server" 
                                        CssClass="col-md-8"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="True" TargetControlID="txtMingguan" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                    <label class="col-md-4">per Minggu</label>
                                    <%--<label class="col-md-3">Harian</label>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3"></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtBulanan" runat="server" 
                                        CssClass="col-md-8"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="True" TargetControlID="txtBulanan" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                    <label class="col-md-4">per Bulan</label>
                                    <%--<label class="col-md-3">Harian</label>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3"></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtTahunan" runat="server" 
                                        CssClass="col-md-8"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" Enabled="True" TargetControlID="txtTahunan" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                    <label class="col-md-4">per Tahun</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Minimum Bayar</label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlMinimumBayarMonth" runat="server" CssClass="form-control ui-controlgroup-item"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Keterangan Minimum Bayar</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtMinimumBayarDesc" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Jumlah Kamar</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtJmlKamar" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" Enabled="True" TargetControlID="txtJmlKamar" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Luas Kamar</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtLuasKamar" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Tipe Kos</label>
                                <div class="col-md-9">
                                    <asp:RadioButtonList ID="rdlTipeKos" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                        CellSpacing="50" CellPadding="50" />
                                    <%--<asp:DropDownList ID="ddlTipeKos" runat="server" CssClass="form-control ui-controlgroup-item" ></asp:DropDownList>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Jumlah Kamar Kosong</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtJmlKamarKosong" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" Enabled="True" TargetControlID="txtJmlKamarKosong" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Binatang Peliharaan</label>
                                <div class="col-md-9">
                                    <%--<asp:RadioButton ID="rdlPet1" runat="server" GroupName="Pet" CssClass="form-control radio-inline" Text="Boleh" />
                                    <asp:RadioButton ID="rdlPet2" runat="server" GroupName="Pet" CssClass="form-control radio-inline" Text="Tidak Boleh" />--%>
                                    
                                    <asp:RadioButtonList ID="rdlPet" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="1" Text="Boleh&nbsp;&nbsp;&nbsp;&nbsp;"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="Tidak Boleh"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <script type="text/javascript"> $(document).ready(function () {
                                $("#<%= chkFasilitas.ClientID %>").buttonset();
                                 $("#<%= chkLingkungan.ClientID %>").buttonset();
                             }); </script> 
                            <style>.chkMargin{ margin-left:4px; margin-right:4px; padding-left:4px;padding-right:4px;}</style>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Fasilitas Kamar</label>
                                <div class="col-md-9 ui-controlgroup-item">
                                    <asp:CheckBoxList ID="chkFasilitas" runat="server" ClientIDMode="Static" 
                                        RepeatDirection="Horizontal" RepeatLayout="Table" CellSpacing="10" CellPadding="10" CssClass="chkMargin" >
                                    </asp:CheckBoxList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Landmark</label>
                                <div class="col-md-9 ui-controlgroup-item">
                                    <asp:CheckBoxList ID="chkLingkungan" runat="server" ClientIDMode="Static" 
                                        RepeatDirection="Horizontal" RepeatLayout="Flow" CellSpacing="10" CellPadding="10" CssClass="chkMargin" ></asp:CheckBoxList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Keterangan Lain-lain</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtKeteranganLain" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="image">Foto Depan</label>
                                <div class="col-md-9">
                                    <style>
                                        .ajax__fileupload_button {
                                            background-color: green;
                                        }
                                    </style>

                                    <script type="text/javascript">

                                        function onClientDepanUploadComplete(sender, e) {
                                            
                                            onImageValidated("TRUE", e);
                                        }

                                        function onImageValidated(arg, context) {
                                            var test = document.getElementById("testuploaded");
                                            test.style.display = 'block';

                                            var fileList = document.getElementById("fileList");
                                            var item = document.createElement('div');
                                            item.style.padding = '4px';

                                            if (arg == "TRUE") {
                                                var url = context.get_postedUrl();
                                                url = url.replace('&amp;', '&');
                                                item.appendChild(createThumbnail(context, url));
                                            } else {
                                                item.appendChild(createFileInfo(context));
                                            }

                                            fileList.appendChild(item);
                                        }

                                        function createFileInfo(e) {
                                            var holder = document.createElement('div');
                                            holder.appendChild(document.createTextNode(e.get_fileName() + ' with size ' + e.get_fileSize() + ' bytes'));

                                            return holder;
                                        }

                                        function createThumbnail(e, url) {
                                            var holder = document.createElement('div');
                                            var img = document.createElement("img");
                                            img.style.width = '80px';
                                            img.style.height = '80px';
                                            img.setAttribute("src", url);

                                            holder.appendChild(createFileInfo(e));
                                            holder.appendChild(img);

                                            return holder;
                                        }

                                        function onClientDepanUploadStart(sender, e) {
                                            document.getElementById('uploadCompleteInfo').innerHTML = 'Please wait while uploading ' + e.get_filesInQueue() + ' files...';
                                            
                                        }

                                        function onClientDepanUploadError(sender, e) {
                                            document.getElementById('uploadCompleteInfo').innerHTML = "There was an error while uploading.";
                                        }

                                        function onClientDepanUploadCompleteAll(sender, e) {
                                            //alert('upload complete all');
                                            var args = JSON.parse(e.get_serverArguments()),
                                                unit = args.duration > 60 ? 'minutes' : 'seconds',
                                                duration = (args.duration / (args.duration > 60 ? 60 : 1)).toFixed(2);

                                            var info = 'At <b>' + args.time + '</b> server time <b>'
                                                + e.get_filesUploaded() + '</b> of <b>' + e.get_filesInQueue()
                                                + '</b> files were uploaded with status code <b>"' + e.get_reason()
                                                + '"</b> in <b>' + duration + ' ' + unit + '</b>';

                                            document.getElementById('uploadCompleteInfo').innerHTML = info;
                                        }
                                    </script>
                                    <asp:Label runat="server" ID="throbberDepan" Style="display: none;"><img align="absmiddle" alt="" src="images/uploading.gif" /></asp:Label>
                                        <ajaxToolkit:AjaxFileUpload ID="fuFotoDepan" runat="server" Padding-Bottom="4"
                                        Padding-Left="2" Padding-Right="1" Padding-Top="4" ThrobberID="throbberDepan"
                                        MaxFileSize="1024" MaximumNumberOfFiles="3" AllowedFileTypes="jpg,jpeg,png" 
                                        OnClientUploadComplete="onClientDepanUploadComplete" OnUploadComplete="fuFotoDepan_UploadComplete"
                                        OnClientUploadCompleteAll="onClientDepanUploadCompleteAll" OnUploadCompleteAll="fuFotoDepan_UploadCompleteAll" 
                                        OnUploadStart="fuFotoDepan_UploadStart" OnClientUploadStart="onClientDepanUploadStart" OnClientUploadError="onClientDepanUploadError"
                                         />
                                    <div id="uploadCompleteInfo"></div>
                                    <br />
                                    <div id="testuploaded" style="display: none; padding: 4px; border: gray 1px solid;">
                                        <h4>list of uploaded files:</h4>
                                        <hr />
                                        <div id="fileList">
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="submit"></label>
                                <div class="col-md-9">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Lanjut" OnClick="btnSubmit_Click" />
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

    </form>
</body>
</html>
