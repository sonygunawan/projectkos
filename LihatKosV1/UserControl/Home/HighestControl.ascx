<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HighestControl.ascx.cs" Inherits="LihatKosV1.UserControl.HighestControl" %>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>--%>
        <script type="text/javascript">
         //   $(document).ready(function () {
         //       $.getJSON('https://geoip-db.com/json/geoip.php?jsonp=?')
         //.done(function (location) {
         //    //$(".ddlArea").val('Bandung');
         //    //$(".ddlArea").val($(".ddlArea option:contains(" + 'Bandung' + ")").val());
         //    //$('.ddlArea').html(location.city);
         //    //alert(location.city);
         //});
         //   });
        </script>
<div class="col-sm-4">
    <h2>Area</h2>
</div>

<div class="col-sm-8 select-area">
    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control ddlArea" />
<%--    <select class="form-control">
        <option>Jakarta</option>
        <option>Bandung</option>
        <option>Surabaya</option>
        <option>Yogyakarta</option>
    </select>--%>
</div>

<div class="col-sm-12">
    <div class="table-responsive">
        <table class="table table-room-highlight">
            <tbody>
                <tr>
                    <td class="clearfix">
                        <img src="images/300x150.png" class="pull-left img-responsive" alt="">
                        <h4>Latest</h4>
                    </td>
                </tr>
                <tr>
                    <td class="clearfix">
                        <img src="images/300x150.png" class="pull-left img-responsive" alt="">
                        <h4>Favorit</h4>
                    </td>
                </tr>
                <tr>
                    <td class="clearfix">
                        <img src="images/300x150.png" class="pull-left img-responsive" alt="">
                        <h4>Banyak dilihat</h4>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- #.table-responsive -->
</div>
<!-- #.col-sm-12 -->
