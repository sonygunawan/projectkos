﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BannerLeft.ascx.cs" Inherits="LihatKosV1.UserControl.BannerLeft" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!-- Slide -->
<asp:UpdatePanel ID="UpdatePanel5" runat="server">
    <ContentTemplate>
<div class="owl-carousel owl-theme">
    <asp:Repeater ID="rptBanner" runat="server" OnItemDataBound="rptBanner_ItemDataBound">
        <ItemTemplate>
            <div class="item">
                <asp:Image ID="imgBanner" runat="server" CssClass="img-responsive" AlternateText="slide" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
    </ContentTemplate>
</asp:UpdatePanel>
    <%--<div class="item">
        <img src="images/photos/banner.jpg" class="img-responsive" alt="slide">
    </div>
    <div class="item">
        <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
    </div>
    <div class="item">
        <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
    </div>
    <div class="item">
        <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
    </div>
    <div class="item">
        <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
    </div>
</div>--%>