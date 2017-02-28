<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LihatKosV1.Default" %>
<%@ Register src="~/UserControl/Home/BannerLeft.ascx" tagname="BannerLeft" tagprefix="uc1" %>
<%@ Register src="~/UserControl/Home/SearchControl.ascx" tagname="SearchControl" tagprefix="uc2" %>
<%@ Register Src="~/UserControl/Home/HighestControl.ascx" TagName="HighestControl" TagPrefix="uc3" %>
<%@ Register Src="~/UserControl/Home/MyFavoritesControl.ascx" TagName="MyFavoritesControl" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
        <!-- Front -->
        <div id="front">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8 slide no-gutter">
                        <uc1:BannerLeft ID="BannerLeft" runat="server" />
                    </div>

                    <div class="col-sm-4 search" style="overflow-y:auto;">
                        <uc2:SearchControl ID="SearchControl" runat="server" /> 
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Front -->


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
</asp:Content>
