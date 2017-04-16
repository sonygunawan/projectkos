<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="CariLokasi.aspx.cs" Inherits="LihatKosV1.CariLokasi" %>

<%@ Register Src="~/UserControl/CariLokasi/ListByLocation.ascx" TagName="ListByLocation" TagPrefix="uc2" %>
<%@ Register Src="~/UserControl/CariLokasi/SearchControlDetail.ascx" TagName="SearchControlDetail" TagPrefix="uc4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="CustomAjaxControls" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hidLatitude" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hidLongitude" runat="server" ClientIDMode="Static" />
    <!-- Room -->
    <div id="room" runat="server">
        <div class="container-fluid">
            <div class="row">
                
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <div class="col-sm-6">
                    <div class="search" style="margin-bottom: 10px;">
                        <%--<uc4:SearchControlDetail ID="SearchControlDetail" runat="server" /> --%>
                        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBbgdCbXWZn1idf6nn4KEVi-1YdG_5yu6w&sensor=false&libraries=places"></script>
                        <script type="text/javascript">
                            google.maps.event.addDomListener(window, 'load', function () {
                                var places = new google.maps.places.Autocomplete(document.getElementById('txtSearch'));
                                google.maps.event.addListener(places, 'place_changed', function () {
                                    var place = places.getPlace();
                                    var address = place.formatted_address;
                                    var latitude = place.geometry.location.lat();
                                    var longitude = place.geometry.location.lng();
                                    var mesg = "Address: " + address;
                                    mesg += "\nLatitude: " + latitude;
                                    mesg += "\nLongitude: " + longitude;
                                    document.getElementById('hidLatitude').value = latitude;
                                    document.getElementById('hidLongitude').value = longitude;
                                    //alert(mesg);
                                });
                            });
                        </script>
                                <h3 class="text-center text-uppercase">Search</h3>

                                <style>
                                    .form-horizontal .form-group {
                                        margin-right: 0px;
                                        margin-left: 0px;
                                    }
                                </style>
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label">Propinsi</label>
                                        <asp:DropDownList ID="ddlPropinsi" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPropinsi_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Kabupaten</label>
                                        <asp:DropDownList ID="ddlKabupaten" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlKabupaten_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Kecamatan</label>
                                        <asp:DropDownList ID="ddlKecamatan" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Tipe Kos</label>
                                        <asp:DropDownList ID="ddlTipeKos" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Jangka Waktu</label>
                                        <asp:DropDownList ID="ddlSatuanHarga" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Fasilitas</label>
                                        <div class="ui-controlgroup-item">
                                            <asp:CheckBoxList ID="chkFasilitas" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow"
                                                OnSelectedIndexChanged="chkFasilitas_SelectedIndexChanged">
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Range Harga</label>
                                        <asp:TextBox ID="multiHandle2_1_BoundControl" runat="server" Width="150" Text="0" />&nbsp; - &nbsp;
                                        <asp:TextBox ID="multiHandle2_2_BoundControl" runat="server" Width="150" Text="1000000" />
                                        <asp:TextBox ID="sliderTwo" runat="server" Style="display: none;" />
                                        <cc1:MultiHandleSliderExtender ID="multiHandleSliderExtenderTwo" runat="server"
                                            BehaviorID="multiHandleSliderExtenderTwo"
                                            TargetControlID="sliderTwo"
                                            Minimum="0"
                                            Maximum="1000000" 
                                            Steps="25000"
                                            Length="600"
                                            Orientation="Horizontal"
                                            EnableHandleAnimation="true"
                                            EnableKeyboard="false"
                                            EnableMouseWheel="false"
                                            ShowHandleDragStyle="true"
                                            ShowHandleHoverStyle="true"
                                            ShowInnerRail="true" 
                                            OnClientValueChanged="OnClientValueChanged">
                                            <MultiHandleSliderTargets>
                                                <cc1:MultiHandleSliderTarget ControlID="multiHandle2_1_BoundControl" />
                                                <cc1:MultiHandleSliderTarget ControlID="multiHandle2_2_BoundControl" />
                                            </MultiHandleSliderTargets>
                                        </cc1:MultiHandleSliderExtender>
                                        <script type="text/javascript">
                                            function OnClientValueChanged(sender, args) {
                                                document.getElementById("<%=lnkSliderChanged.ClientID %>").click();
                                                return false;
                                            }
                                        </script>
                                        <%--<input type="text" id="price" 
                                            style="border:0; color:#b9cd6d; font-weight:bold;">
                                        <div id="slider-3"></div>--%>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Cari Lokasi.." ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default btn-fullwidth text-uppercase" Text="Cari Kos" OnClick="btnSearch_Click" />

                                    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="HiddenField2" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidLowRate" runat="server" ClientIDMode="Static" />
                                    <asp:HiddenField ID="hidHighRate" runat="server" ClientIDMode="Static" />
                                </div>

                        <br />
                    </div>
                    <%--<div style='overflow: hidden; height: 700px; width: 100%;'>
                        <div id='gmap_canvas' style='height: 700px; width: 100%;'>
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
                        google.maps.event.addDomListener(window, 'load', init_map);</script>--%>
                </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>
                <!-- #.col-sm-6 -->

                <div class="col-sm-6" style="height: 820px; overflow: auto;">
                    <asp:LinkButton ID="lnkSliderChanged" OnClick="lnkSliderChanged_Click" runat="server" ClientIDMode="Static" />
                    <%--<uc2:ListByLocation ID="ListByLocation" runat="server" />--%>
                    <div class="table-responsive">
                        <asp:Repeater ID="rptListByLoc" runat="server" OnItemDataBound="rptListByLoc_ItemDataBound">
                            <HeaderTemplate>
                                <table class="table table-favorite">
                                    <caption class="text-center">
                                        <h2>List</h2>
                                    </caption>
                                    <thead class="text-center">
                                        <th>#</th>
                                        <th>Price</th>
                                        <th>Location</th>
                                    </thead>
                                    <tbody class="text-center">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="hlDetailLink" runat="server" NavigateUrl="~/DetailKos.aspx">
                                            <asp:Image ID="imgDetail" runat="server" CssClass="img-responsive center-block" />
                                            <%--<img src="images/64x64.png" class="img-responsive center-block" alt="">--%>
                                        </asp:HyperLink></td>
                                    <td>
                                        <asp:Label ID="lblHargaBulanan" runat="server"></asp:Label>
                                        /bln</td>
                                    <td>
                                        <asp:Label ID="lblLocation" runat="server"></asp:Label></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <!-- #.col-sm-6 -->
                    
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="lnkSliderChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
            </div>
            
            <!-- #row -->
        </div>
        <!-- #container-fluid -->
    </div>
    <!-- End of Room -->
    <script type="text/javascript">
        function show() {
            document.write("<head id='Head1' runat='server' />");
        }
    </script>
</asp:Content>
