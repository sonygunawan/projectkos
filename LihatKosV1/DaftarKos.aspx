<%@ Page Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="DaftarKos.aspx.cs" Inherits="LihatKosV1.DaftarKos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://jqueryui.com/jquery-wp-content/themes/jqueryui.com/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript">
            $(function () {
                $("input[id*=chkFasilitas]").buttonset();
                
                //$("input").checkboxradio({
                //    icon: false
                //});
            });
            <%-- $("#<%= chkFasilitas.ClientID %>").buttonset();
                                 $("#<%= chkLingkungan.ClientID %>").buttonset();--%>
                                

                            </script> 
        <div style="margin-top: 20px;"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <asp:Label ID="lblTitle" runat="server" />
                        </div>

                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:ValidationSummary ID="vs" runat="server" />
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Nama Kost<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtNama" runat="server" MaxLength="250" CssClass="form-control input-md"></asp:TextBox>
                                    <%--<input id="title" name="title" type="text" placeholder="Product name" class="form-control input-md" required="">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Deskripsikan Kos-mu<asp:HyperLink ID="link1" runat="server" CssClass="fa fa-info-circle"></asp:HyperLink></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtDeskripsi" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <%--<textarea class="form-control" id="textarea" name="description" placeholder="Description"></textarea>--%>
                                </div>
                                <asp:Panel ID="Panel1" runat="server" Style="display:none;">
                                    This Balloon Popup appears when you click the link. It uses a Rectangle style and it is set to 
                                    appear at the top-right of the link.
                                </asp:Panel>
                                <cc1:BalloonPopupExtender ID="BalloonPopupExtender1" runat="server" TargetControlID="link1"
                                    BalloonPopupControlID="Panel1" Position="BottomRight" BalloonStyle="Cloud" BalloonSize="Small"
                                    UseShadow="true" />
                            </div>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Area<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control ui-controlgroup-item"></asp:DropDownList>        
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textarea">Alamat</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtAlamat" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <script type="text/javascript">
                                    function geocodeAddress(geocoder, resultsMap) {
                                        
                                        var address = document.getElementById('txtLokasi').value;
                                        geocoder.geocode({ 'address': address }, function (results, status) {
                                            if (status === 'OK') {
                                                resultsMap.setCenter(results[0].geometry.location);
                                                resultsMap.setZoom(15);
                                                var marker = new google.maps.Marker({
                                                    map: resultsMap,
                                                    position: results[0].geometry.location
                                                });
                                                
                                                for (i = 0 ; i < results[0].address_components.length ; ++i) {
                                                    var super_var1 = results[0].address_components[i];
                                                    //find kelurahan
                                                    if (super_var1.types[0] == "administrative_area_level_4") {
                                                        document.getElementById('<%= txtKelurahan.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidKelurahan.ClientID %>').value = super_var1.long_name;
                                                    }
                                                    //find kecamatan
                                                    if (super_var1.types[0] == "administrative_area_level_3") {
                                                        document.getElementById('<%= txtKecamatan.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidKecamatan.ClientID %>').value = super_var1.long_name;
                                                    }
                                                    //find kabupaten
                                                    if (super_var1.types[0] == "administrative_area_level_2") {
                                                        document.getElementById('<%= txtKabupaten.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidKabupaten.ClientID %>').value = super_var1.long_name;
                                                    }
                                                    //find propinsi
                                                    if (super_var1.types[0] == "administrative_area_level_1") {
                                                        document.getElementById('<%= txtCity.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidProvinsi.ClientID %>').value = super_var1.long_name;
                                                    }
                                                }

                                            } else {
                                                alert('Geocode was not successful for the following reason: ' + status);
                                            }
                                        });
                                    }
                                    function initAutocomplete() {
                                        var map = new google.maps.Map(document.getElementById('gmap_canvas'), {
                                            center: { lat: -6.2297264, lng: 106.6894331 },
                                            zoom: 12,
                                            streetViewControl: false,
                                            mapTypeId: 'roadmap'
                                        });

                                        // Create the search box and link it to the UI element.
                                        var input = document.getElementById('txtLokasi');
                                        if (input.value != '') {
                                            var geocoder = new google.maps.Geocoder();
                                            geocodeAddress(geocoder, map);
                                            //initAutocomplete();
                                            //google.maps.event.trigger('places_changed');
                                            //searchBox.getPlaces();
                                        }
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
                                                
                                                for (i = 0 ; i < place.address_components.length ; ++i) {
                                                    var super_var1 = place.address_components[i];
                                                    //find kelurahan
                                                    if (super_var1.types[0] == "administrative_area_level_4") {
                                                        document.getElementById('<%= txtKelurahan.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidKelurahan.ClientID %>').value = super_var1.long_name;
                                                    }
                                                    //find kecamatan
                                                    if (super_var1.types[0] == "administrative_area_level_3") {
                                                        document.getElementById('<%= txtKecamatan.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidKecamatan.ClientID %>').value = super_var1.long_name;
                                                    }
                                                    //find kabupaten
                                                    if (super_var1.types[0] == "administrative_area_level_2") {
                                                        document.getElementById('<%= txtKabupaten.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidKabupaten.ClientID %>').value = super_var1.long_name;
                                                    }
                                                    //find propinsi
                                                    if (super_var1.types[0] == "administrative_area_level_1") {
                                                        document.getElementById('<%= txtCity.ClientID %>').value = super_var1.long_name;
                                                        document.getElementById('<%= hidProvinsi.ClientID %>').value = super_var1.long_name;
                                                    }
                                                }

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
                                <label class="col-md-3 control-label" for="textarea">Lokasi<a class="fa fa-info-circle">
                                  </a></label>
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
                                <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?language=id&key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w&sensor=false&libraries=places&callback=initAutocomplete"></script>
                                
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
                                    <asp:HiddenField ID="hidProvinsi" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidKabupaten" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidKecamatan" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidKelurahan" runat="server" ClientIDMode="Static" />
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
                                        <label class="col-md-2 control-label" for="textarea">Kota</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                        <label class="col-md-2 control-label" for="textarea">Kabupaten</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtKabupaten" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                        <label class="col-md-2 control-label" for="textarea">Kecamatan</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtKecamatan" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                        <label class="col-md-2 control-label" for="textarea">Kelurahan</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtKelurahan" runat="server" CssClass="form-control" Enabled="false" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                        
                                    </div>

                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="price">Contact Person<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtPemilik" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <%--<input id="price" name="price" type="text" placeholder="Product price" class="form-control input-md" required="">--%>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                <ContentTemplate>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="file">Telepon/HP Pemilik<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-8">
                                    <asp:GridView ID="gvKosTelepon" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="false" GridLines="None"
                                        ShowFooter="false" ShowHeader="false" OnRowDataBound="gvKosTelepon_RowDataBound" OnRowDeleting="gvKosTelepon_RowDeleting">
                                        <Columns>
                                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" ItemStyle-Width="10%" />
                                            <asp:TemplateField HeaderText="Telepon" ItemStyle-Width="70%">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtValue" runat="server" Width="100%" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Tipe Nomor" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlPhoneID" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" ItemStyle-Width="5%">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgBtnMinus" runat="server" ImageUrl="~/images/minus.png" OnClientClick="return confirm('Apakah Anda yakin ingin menghapus nomor telepon ini?');" CommandName="Delete" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    
                                    <%--<asp:TextBox ID="txtTlpPemilik" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                </div>
                                <div class="col-md-1" style="display: inline-block;vertical-align:middle;float:none;">
                                    <asp:ImageButton ID="imgBtnPlus" runat="server" ImageUrl="~/images/plus.png" OnClick="imgBtnPlus_Click" />
                                    &nbsp;
                                </div>
                            </div>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Harga Sewa<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                    <ContentTemplate>
                                    <asp:GridView ID="gvKosHarga" runat="server" GridLines="None" CssClass="table table-hover table-striped" AutoGenerateColumns="false" 
                                        ShowHeader="false" ShowFooter="false" OnRowDataBound="gvKosHarga_RowDataBound" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="isChecked" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkIsChecked" runat="server" AutoPostBack="true" OnCheckedChanged="chkIsChecked_CheckedChanged"  />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:CheckBoxField DataField="isChecked" ItemStyle-Width="10%" />--%>
                                            <asp:TemplateField HeaderText="Harga" ItemStyle-Width="30%">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtHarga" runat="server" Width="100%" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="perText" ItemStyle-Width="20%" />
                                            <asp:BoundField DataField="minimumBayarText" ItemStyle-Width="20%" />
                                            <asp:TemplateField HeaderText="Minimum" ItemStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlMinimumBayar" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SatuanHargaID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                                        </Columns>
                                    </asp:GridView>
                                    
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Kamar<a class="fa fa-info-circle">
                                          </a></label>
                                        <div class="col-md-8">
                                            <asp:GridView ID="gvKamarKos" runat="server" GridLines="None" ShowHeader="true" ShowFooter="false"
                                                CssClass="table table-hover table-striped" AutoGenerateColumns="false" OnRowDataBound="gvKamarKos_RowDataBound" OnRowDeleting="gvKamarKos_RowDeleting" >
                                                <Columns>
                                                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" ItemStyle-Width="10%" />
                                                    <asp:TemplateField HeaderText="Luas" ItemStyle-Width="20%">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtLuas" runat="server" Width="100%" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fasilitas" ItemStyle-Width="25%">
                                                        <ItemTemplate>
                                                            <asp:RadioButtonList ID="rblFasilitas" runat="server">
                                                                <asp:ListItem Value="2" Text="Kamar Mandi Luar" Selected="True" />
                                                                <asp:ListItem Value="1" Text="Kamar Mandi Dalam" />
                                                            </asp:RadioButtonList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Jml Kmr" ItemStyle-Width="20%">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtJmlKamar" runat="server" Width="100%" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Kmr Kosong" ItemStyle-Width="20%">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtKamarKosong" runat="server" Width="100%" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" ItemStyle-Width="5%">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtnMinus" runat="server" ImageUrl="~/images/minus.png" OnClientClick="return confirm('Apakah Anda yakin ingin menghapus kamar ini?');" CommandName="Delete" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <div class="col-md-1" style="display: inline-block;vertical-align:middle;float:none;">
                                            <asp:ImageButton ID="imgBtnKamarPlus" runat="server" ImageUrl="~/images/plus.png" OnClick="imgBtnKamarPlus_Click" />
                                            &nbsp;
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="title">Nama Pengelola<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtNamaPengelola" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Telepon/HP Pengelola<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtTlpPengelola" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>--%>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label">Harga Sewa<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtHarian" runat="server" 
                                        CssClass="col-md-8"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" Enabled="True" TargetControlID="txtHarian" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                    <label class="col-md-4">per Hari</label>
                                    
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
                            </div>--%>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="title">Minimum Bayar<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlMinimumBayarMonth" runat="server" CssClass="form-control ui-controlgroup-item"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Keterangan Minimum Bayar<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtMinimumBayarDesc" runat="server" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>--%>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="title">Jumlah Kamar<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtJmlKamar" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" Enabled="True" TargetControlID="txtJmlKamar" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Luas Kamar<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtLuasKamar" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Tipe Kos<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:RadioButtonList ID="rdlTipeKos" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                        CellSpacing="50" CellPadding="50" />
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <label class="col-md-3 control-label" for="title">Jumlah Kamar Kosong<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtJmlKamarKosong" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" Enabled="True" TargetControlID="txtJmlKamarKosong" FilterType="Numbers" FilterMode="ValidChars">
                                    </cc1:FilteredTextBoxExtender>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Binatang Peliharaan<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9">
                                    <asp:RadioButtonList ID="rdlPet" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="1" Text="Boleh&nbsp;&nbsp;&nbsp;&nbsp;"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="Tidak Boleh"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            
                            <style>.chkMargin{ margin-left:4px; margin-right:4px; padding-left:4px;padding-right:4px;}</style>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Fasilitas Kamar<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9 ui-controlgroup-item">
                                    <asp:CheckBoxList ID="chkFasilitas" runat="server" ClientIDMode="Static" 
                                        RepeatDirection="Horizontal" RepeatLayout="Table" CellSpacing="10" CellPadding="10" CssClass="chkMargin" >
                                    </asp:CheckBoxList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="title">Lingkungan Sekitar<a class="fa fa-info-circle">
                                  </a></label>
                                <div class="col-md-9 ui-controlgroup-item">
                                    <asp:CheckBoxList ID="chkLingkungan" runat="server" ClientIDMode="Static" 
                                        RepeatDirection="Horizontal" RepeatLayout="Flow" CellSpacing="10" CellPadding="10" CssClass="chkMargin" ></asp:CheckBoxList>
                                    <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm"></asp:TextBox>--%>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="image">Keterangan Lain-lain<a class="fa fa-info-circle">
                                  </a></label>
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
     
</asp:Content>