<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchControl.ascx.cs" Inherits="LihatKosV1.UserControl.SearchControl" %>
    
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- boostrap -->
<script src="../../assets/bootstrap/js/bootstrap.js" type="text/javascript"></script>
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
<div class="form-horizontal" style="margin:2px 0px;">
    <div class="form-group">
        <label>Tipe Kos</label>
        <asp:DropDownList ID="rdlTipeKos" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:DropDownList>
    </div>
</div>
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
<div class="form-group">
    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Cari Lokasi.." ClientIDMode="Static"></asp:TextBox>
    <%--<input type="text" class="form-control" placeholder="Cari Lokasi..">--%>
</div>
<asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default btn-fullwidth text-uppercase" Text="Cari Kos" OnClick="btnSearch_Click" />
<%--<button class="btn btn-default btn-fullwidth text-uppercase">Cari Kos</button>--%>

<asp:HiddenField ID="hidLatitude" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hidLongitude" runat="server" ClientIDMode="Static" />
