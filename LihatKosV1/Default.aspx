﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LihatKosV1.Default" %>
<%@ Register src="~/UserControl/Home/BannerLeft.ascx" tagname="BannerLeft" tagprefix="uc1" %>
<%@ Register src="~/UserControl/Home/SearchControl.ascx" tagname="SearchControl" tagprefix="uc2" %>
<%@ Register Src="~/UserControl/Home/NewSearchControl.ascx" TagName="NewSearchControl" TagPrefix="uc5" %>
<%@ Register Src="~/UserControl/Home/HighestControl.ascx" TagName="HighestControl" TagPrefix="uc3" %>
<%@ Register Src="~/UserControl/Home/MyFavoritesControl.ascx" TagName="MyFavoritesControl" TagPrefix="uc4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link type="text/css" rel="stylesheet" href="assets/style.css">
<%--    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w&sensor=false&libraries=places"></script>
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>--%>
        <style>
            .favList {
                margin: 0px 25px;
            }
            .favPadding {
                padding: 4px;
            }
            .modalBackground  {
                background-color:Gray;
                filter:alpha(opacity=70);
                opacity:0.7;
                position: absolute;
            }
            /*.text 
            {
                z-index:100;
                background-color:lightgray;
                position:absolute;
                left:0px;
                bottom:-30px;
                padding:2px;
                font-size:12px;
                font-family:sans-serif;

            }*/
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
        </style>
    <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet" />
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
            <script type="text/javascript">
                
                function pageLoad()
                {
                    $("#slider-3").slider({
                        range: true,
                        min: 0,
                        max: 5000000,
                        step: 5000,
                        values: [25000, 2000000],
                        slide: function (event, ui) {
                            $("#price").val("Rp." + ui.values[0] + " - Rp." + ui.values[1]);
                            $("#hidLowRate").val(ui.values[0]);
                            $("#hidHighRate").val(ui.values[1]);
                        }
                    });
                    $("#price").val("Rp." + $("#slider-3").slider("values", 0) +
                       " - Rp." + $("#slider-3").slider("values", 1));
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <!-- Front -->
        <div id="front">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8 slide no-gutter">
                        <uc1:BannerLeft ID="BannerLeft" runat="server" />
                    </div>
                    
                    <div class="col-sm-4 topservices" style="position:relative;">
                        <%--<uc2:SearchControl ID="SearchControl" runat="server" /> --%>
                        <div class="row favList">
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
                <%--<div class="row">
                    <div class="col-sm-12 newsearch">

                    </div>
                </div>--%>
               
            </div>
        </div>
            <div class="ui-helper-clearfix"></div>
        <!-- End of Front -->
        
            <uc5:NewSearchControl ID="NewSearchControl" runat="server" />
        

        <!-- Room -->
        <asp:Panel ID="room" runat="server"  ClientIDMode="Static">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <uc3:HighestControl ID="HighestControl" runat="server" />
                    </div>
                    <!-- #.col-sm-6 -->

                    <div class="col-sm-6">
                        <uc4:MyFavoritesControl ID="MyFavoritesControl" runat="server" />
                    </div>
                    <!-- #.col-sm-6 -->
                </div>
                <!-- #row -->
            </div>
            <!-- #container-fluid -->
        </asp:Panel>
        <!-- End of Room -->
    <script  type="text/javascript">
        function show() {
            document.write("<head id='Head1' runat='server' />");
        }
    </script>
    
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
