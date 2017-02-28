<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="CariLokasi.aspx.cs" Inherits="LihatKosV1.CariLokasi" %>
<%@ Register Src="~/UserControl/CariLokasi/ListByLocation.ascx" TagName="ListByLocation" TagPrefix="uc2" %>
<%@ Register src="~/UserControl/CariLokasi/SearchControlDetail.ascx" tagname="SearchControlDetail" tagprefix="uc4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolKit" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="CustomAjaxControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <AjaxToolKit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <asp:HiddenField ID="hidLatitude" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hidLongitude" runat="server" ClientIDMode="Static" />
    <!-- Room -->
        <div id="room" runat="server">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="search" style="margin-bottom:10px;">
                             <uc4:SearchControlDetail ID="SearchControlDetail" runat="server" /> 
                            <br />
                        </div>
                        <%--<script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w&libraries=places'></script>
                        --%>
                        <div style='overflow: hidden; height: 700px; width: 100%;'>
                            <div id='gmap_canvas' style='height: 700px;  width: 100%;'>
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
                            google.maps.event.addDomListener(window, 'load', init_map);</script>
                    </div>
                    <!-- #.col-sm-6 -->

                    <div class="col-sm-6" style="height: 820px;overflow: auto;">
                        <uc2:ListByLocation ID="ListByLocation" runat="server" />
                    </div>
                    <!-- #.col-sm-6 -->
                </div>
                <!-- #row -->
            </div>
            <!-- #container-fluid -->
        </div>
        <!-- End of Room -->
</asp:Content>
