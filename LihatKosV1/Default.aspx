<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LihatKosV1.Default" %>
<%@ Register src="~/UserControl/Home/BannerLeft.ascx" tagname="BannerLeft" tagprefix="uc1" %>
<%@ Register Src="~/UserControl/Home/HighestControl.ascx" TagName="HighestControl" TagPrefix="uc3" %>
<%@ Register Src="~/UserControl/Home/MyFavoritesControl.ascx" TagName="MyFavoritesControl" TagPrefix="uc4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <link type="text/css" rel="stylesheet" href="assets/style.css" />
        <style>
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                            <asp:Repeater ID="rptFavList" runat="server" OnItemDataBound="rptFavList_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-sm-6 col-xs-6 favPadding">
                                        <div class="image-container">
                                            <asp:HyperLink ID="hlDetailLink" runat="server" NavigateUrl="~/DetailKos">
                                                <img id="image" src="images/150x110.png"/>
                                                <div class="text">
                                                   <span><asp:Literal ID="litAlamat" runat="server"></asp:Literal></span>
                                                </div>
                                            </asp:HyperLink>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%--<div class="col-sm-6 col-xs-6 favPadding">
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
                            </div>--%>
                            </div>
                        
                    </div>
                </div>
            </div>
               
            </div>
        <!-- End of Front -->
            
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
        <ContentTemplate>

            <%--<script type="text/javascript">
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
                    }

                    geocoder.geocode({ 'address': address }, function (results, status) {

                        if (status == google.maps.GeocoderStatus.OK) {
                            var latitude = results[0].geometry.location.lat();
                            var longitude = results[0].geometry.location.lng();
                        }
                    });
                }
            </script>--%>
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
                <style>
                    
                    .ui-widget-header {
                        border: 1px solid #dddddd;
                        background: #bfa145;
                        color: #333333;
                        font-weight: bold;
                    }
                </style>
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
                        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default btn-fullwidth text-uppercase" Text="Cari Kos" OnClick="btnSearch_Click" /><%--OnClientClick="showLatLng();return false;"--%>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12" align="center" style="padding:40px 0px;background-color:darkblue;color:whitesmoke;">
                <h1>How It Works</h1>
                Learn how to buy our mutual Kos here.
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
            document.write("<head id='Head1' runat='server' />");
        }
    </script>
    
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
