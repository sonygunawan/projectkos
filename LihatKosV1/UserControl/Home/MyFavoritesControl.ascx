<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyFavoritesControl.ascx.cs" Inherits="LihatKosV1.UserControl.MyFavoritesControl" %>

<div class="table-responsive">
    <table class="table table-favorite">
        <caption class="text-center">
            <h2>My Favorites</h2>
        </caption>
        <thead class="text-center">
            <th>#</th>
            <th>Price</th>
            <th>Location</th>
        </thead>

        <tbody class="text-center">
            <asp:Repeater ID="rptFavorites" runat="server" OnItemDataBound="rptFavorites_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:HyperLink ID="hlDetailLink" runat="server" NavigateUrl="~/DetailKos.aspx">
                                <img src="images/128x128.png" class="img-responsive center-block" alt="">
                            </asp:HyperLink>
                        </td>
                        <td><asp:Label ID="lblHargaBulanan" runat="server"></asp:Label> /bln
                        </td>
                        <td><asp:Label ID="lblLocation" runat="server"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            
<%--        <tr>
                <td>
                    <img src="images/128x128.png" class="img-responsive center-block" alt=""></td>
                <td>Rp.200.000/bln</td>
                <td>Mekasari, Menteng</td>
            </tr>
            <tr>
                <td>
                    <img src="images/128x128.png" class="img-responsive center-block" alt=""></td>
                <td>Rp.150.000/bln</td>
                <td>Kepulauan Riau, Tanjungpinang</td>
            </tr>
            <tr>
                <td>
                    <img src="images/128x128.png" class="img-responsive center-block" alt=""></td>
                <td>Rp.300.000/bln</td>
                <td>Riau, Pekanbaru</td>
            </tr>--%>
        </tbody>
    </table>
</div>
<!-- #.table-responsive -->
