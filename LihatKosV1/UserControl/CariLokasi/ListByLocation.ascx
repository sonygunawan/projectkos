<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListByLocation.ascx.cs" Inherits="LihatKosV1.UserControl.CariLokasi.ListByLocation" %>

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
                    <img src="images/64x64.png" class="img-responsive center-block" alt=""></asp:HyperLink></td>
                <td><asp:Label ID="lblHargaBulanan" runat="server"></asp:Label> /bln</td>
                <td><asp:Label ID="lblLocation" runat="server"></asp:Label></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <%--<tr>
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
    </tr>
        </tbody>
    </table>--%>
        
        
</div>
<!-- #.table-responsive -->