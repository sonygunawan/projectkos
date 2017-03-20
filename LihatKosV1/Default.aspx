<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LihatKosV1.Default" %>
<%@ Register src="~/UserControl/Home/BannerLeft.ascx" tagname="BannerLeft" tagprefix="uc1" %>
<%@ Register src="~/UserControl/Home/SearchControl.ascx" tagname="SearchControl" tagprefix="uc2" %>
<%@ Register Src="~/UserControl/Home/HighestControl.ascx" TagName="HighestControl" TagPrefix="uc3" %>
<%@ Register Src="~/UserControl/Home/MyFavoritesControl.ascx" TagName="MyFavoritesControl" TagPrefix="uc4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w&sensor=false&libraries=places"></script>
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <style>
            .favList {
                margin: 0px 25px;
            }
            .favPadding {
                padding: 4px;
            }
            .text 
            {
                z-index:100;
                background-color:lightgray;
                position:absolute;
                left:0px;
                bottom:-30px;
                padding:2px;
                font-size:12px;
                font-family:sans-serif;

            }
        </style>
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
                                <a href="#"><img src="images/150x110.png" ></a>
                                <label class="text">Setiabudi, Jakarta</label>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <a href="#"><img src="images/150x110.png" ></a>
                                <p class="text">Casablanca, Jakarta</p>
                            </div>
                        
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <a href="#"><img src="images/150x110.png" ></a>
                                <p class="text">Pluit, Jakarta</p>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <a href="#"><img src="images/150x110.png" ></a>
                                <p class="text">Muara Karang, Jakarta</p>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <a href="#"><img src="images/150x110.png" ></a>
                                <p class="text">Pagedangan, Tangerang</p>
                            </div>
                            <div class="col-sm-6 col-xs-6 favPadding">
                                <a href="#"><img src="images/150x110.png" ></a>
                                <p class="text">Kuningan, Jakarta</p>
                            </div>
                        </div>
                        <%--<div class="row favList ">
                            <div class="col-sm-6 favPadding">
                                <a href="#"><img src="images/150x110.png"</a>
                            </div>
                            <div class="col-sm-6 favPadding">
                                <a href="#"><img src="images/150x110.png"</a>
                            </div>
                            <div class="col-sm-6 favPadding">
                                <a href="#"><img src="images/150x110.png"</a>
                            </div>
                            <div class="col-sm-6 favPadding">
                                <a href="#"><img src="images/150x110.png"</a>
                            </div>
                            <div class="col-sm-6 favPadding">
                                <a href="#"><img src="images/150x110.png"</a>
                            </div>
                            <div class="col-sm-6 favPadding">
                                <a href="#"><img src="images/150x110.png"</a>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="col-sm-12 newsearch">

                    </div>
                </div>--%>
               
            </div>
        </div>
        <!-- End of Front -->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function showLatLng() {
                    var geocoder = new google.maps.Geocoder();
                    var ddlKecamatan = document.getElementById('ddlKecamatan');
                    var kecamatanText = ddlKecamatan.options[ddlKecamatan.selectedIndex].innerHTML != "- Semua -" ? ddlKecamatan.options[ddlKecamatan.selectedIndex].innerHTML : "" ;
                    
                    var ddlKabupaten = document.getElementById('ddlKabupaten');
                    var kabupatenText = ddlKabupaten.options[ddlKabupaten.selectedIndex].innerHTML != "- Semua -" ? ddlKabupaten.options[ddlKabupaten.selectedIndex].innerHTML : "";

                    var ddlPropinsi = document.getElementById('ddlPropinsi');
                    var propinsiText = ddlPropinsi.options[ddlPropinsi.selectedIndex].innerHTML != "- Semua -" ? ddlPropinsi.options[ddlPropinsi.selectedIndex].innerHTML : "";

                    var address = "";
                    if (kecamatanText == '')
                    {
                        address = kabupatenText;
                    }
                    else
                    {
                        address = kabupatenText + "," + kecamatanText;
                    }
                    
                    if (kabupatenText == "" && kecamatanText == "")
                    {
                        address = propinsiText;
                        //alert(address);
                    }
                    
                    geocoder.geocode({ 'address': address }, function (results, status) {

                        if (status == google.maps.GeocoderStatus.OK) {
                            var latitude = results[0].geometry.location.lat();
                            var longitude = results[0].geometry.location.lng();
                            //alert(latitude+ ',' + longitude);
                            alert(JSON.stringify(results));
                        }
                    });
                }
            </script>
    <div class="spacersmall services">
        <div class="container">
            <div class="row">
                
                <div class="col-sm-4">
                    <label>Propinsi</label>
                    <asp:DropDownList ID="ddlPropinsi" runat="server" AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="ddlPropinsi_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <label>Kabupaten</label>
                    <asp:DropDownList ID="ddlKabupaten" runat="server" AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="ddlKabupaten_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <label>Kecamatan</label>
                    <asp:DropDownList ID="ddlKecamatan" runat="server" ClientIDMode="Static"></asp:DropDownList>
                </div>
                    
            </div>
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <div class="spacersmaller services">
        <div class="container">
            <div class="row">
                <style>
                    
                    .ui-widget-header {
                        border: 1px solid #dddddd;
                        background: #bfa145;
                        color: #333333;
                        font-weight: bold;
                    }
                </style>
                <script type="text/javascript">
                    $(function () {
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
                    });
                </script>
                <div class="col-sm-8">
                    <div class="form-group">
                        <label></label>
                        <input type="text" id="price" 
                            style="width:100%;border:0; background-color:#dedbd3; color:#756534; font-weight:bold;">
                       <div id="slider-3"></div>
                    </div>
    
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label></label>
                        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default btn-fullwidth text-uppercase" Text="Cari Kos" OnClientClick="showLatLng();return false;" />
                    </div>
                </div>
            </div>

        </div>
    </div>

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
            document.write("<head id='Head1' runat='server'></head>");
        }
    </script>
    
</asp:Content>
