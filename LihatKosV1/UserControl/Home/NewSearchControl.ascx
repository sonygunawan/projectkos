<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewSearchControl.ascx.cs" Inherits="LihatKosV1.UserControl.Home.NewSearchControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:UpdatePanel ID="UpdatePanel7" runat="server">
    <ContentTemplate>
        <script type="text/javascript">
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
                <script type="text/javascript">
                    //$(document).ready(function () {

                    //});
                    //function pageLoad() {
                    //    $("#slider-3").slider({
                    //        range: true,
                    //        min: 0,
                    //        max: 5000000,
                    //        step: 5000,
                    //        values: [25000, 2000000],
                    //        slide: function (event, ui) {
                    //            $("#price").val("Rp." + ui.values[0] + " - Rp." + ui.values[1]);
                    //            $("#hidLowRate").val(ui.values[0]);
                    //            $("#hidHighRate").val(ui.values[1]);
                    //        }
                    //    });
                    //    $("#price").val("Rp." + $("#slider-3").slider("values", 0) +
                    //       " - Rp." + $("#slider-3").slider("values", 1));
                    //}

                </script>
                <div class="col-sm-8">
                    <div class="form-group">
                        <label for="price">Harga:</label>
                        <%--<asp:Label ID="lblSliderValue" runat="server" />
                        
                        <cc1:MultiHandleSliderExtender ID="MultiHandleSliderExtender1" runat="server" TargetControlID="txtSlider"
                            Minimum="100" Maximum="600" Increment="1" RaiseChangeOnlyOnMouseUp="true" EnableRailClick="false"
                            Length="600" OnClientDragEnd="OnClientDragEnd">
                            <MultiHandleSliderTargets>
                                <cc1:MultiHandleSliderTarget ControlID="hfStart" />
                                <cc1:MultiHandleSliderTarget ControlID="hfEnd" />
                            </MultiHandleSliderTargets>
                        </cc1:MultiHandleSliderExtender>
                        <asp:HiddenField ID="hfStart" runat="server" />
                        <asp:HiddenField ID="hfEnd" runat="server" />
                        <asp:TextBox ID="txtSlider" runat="server"></asp:TextBox>
                        <asp:LinkButton ID="lnkSliderChanged" OnClick="lnkSliderChanged_Click" runat="server" />
                        <script type="text/javascript">
                            function OnClientDragEnd(sender, args) {
                                document.getElementById("<%=lnkSliderChanged.ClientID %>").click();
                            }
                        </script>--%>
                        <%--<input type="text" id="price" 
                            style="border:0; background-color:#dedbd3; color:#756534; font-weight:bold;">
                       <div id="slider-3"></div>--%>
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
    </ContentTemplate>
</asp:UpdatePanel>      
