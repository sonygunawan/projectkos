﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchControlDetail.ascx.cs" Inherits="LihatKosV1.UserControl.CariLokasi.SearchControlDetail" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
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
                OnSelectedIndexChanged="chkFasilitas_SelectedIndexChanged" ></asp:CheckBoxList>
        </div>
    </div>

</div>
        
</ContentTemplate>
</asp:UpdatePanel>
<%--    <div class="form-group">
        <label for="type1" class="control-label">Type</label>
        <select class="form-control" name="" id="type1">
            <option value="">Any</option>
            <option value="">1</option>
            <option value="">2</option>
        </select>
    </div>
    <div class="form-group">
        <label for="pricefrom" class="control-label">Min Price</label>
        <div class="input-group">
            <div class="input-group-addon" id="basic-addon1">$</div>
            <input type="text" class="form-control" id="pricefrom" aria-describedby="basic-addon1">
        </div>
    </div>
    <div class="form-group">
        <label for="priceto" class="control-label">Max Price</label>
        <div class="input-group">
            <div class="input-group-addon" id="basic-addon2">$</div>
            <input type="text" class="form-control" id="priceto" aria-describedby="basic-addon1">
        </div>
    </div>
</div>--%>



<script type="text/javascript">
    $(function () {
        $("#slider-3").slider({
            range: true,
            min: 0,
            max: 5000000,
            step:5000,
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
<div class="form-horizontal">
    <div class="form-group">
        <label>Range Harga</label>
        <asp:TextBox ID="multiHandle2_1_BoundControl" runat="server" Width="150" Text="0" ClientIDMode="Static" />&nbsp; - &nbsp;
                        <asp:TextBox ID="multiHandle2_2_BoundControl" runat="server" Width="150" Text="1000000" ClientIDMode="Static" />
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
        <%--<input type="text" id="price" 
            style="border:0; color:#b9cd6d; font-weight:bold;">
       <div id="slider-3"></div>--%>
    </div>
    
</div>

<div class="form-group">
    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Cari Lokasi.." ClientIDMode="Static"></asp:TextBox>
    <%--<input type="text" class="form-control" placeholder="Cari Lokasi..">--%>
</div>
<asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default btn-fullwidth text-uppercase" Text="Cari Kos" OnClick="btnSearch_Click" />
<%--<button class="btn btn-default btn-fullwidth text-uppercase">Cari Kos</button>--%>

<asp:HiddenField ID="hidLatitude" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hidLongitude" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hidLowRate" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hidHighRate" runat="server" ClientIDMode="Static" />