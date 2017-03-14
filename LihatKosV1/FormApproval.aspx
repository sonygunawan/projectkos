<%@ Page Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormApproval.aspx.cs" Inherits="LihatKosV1.FormApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="margin-top:20px;"></div>
        <div class="container">
            <div class="row col-md-6 custyle">
                <div class="card mb-12">
                <h2>Form Approval</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="card-block p-0">
                        <asp:GridView ID="gvApprovalKos" runat="server" CssClass="table table-striped custab"
                             AutoGenerateColumns="false" OnRowDataBound="gvApprovalKos_RowDataBound"
                             AllowPaging="true" PageSize="10" OnPageIndexChanging="gvApprovalKos_PageIndexChanging" PagerStyle-Wrap="false">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                <asp:BoundField DataField="Nama" HeaderText="Nama" ItemStyle-Width="30%" />
                                <asp:BoundField DataField="NamaTipeKos" HeaderText="TipeKos" />
                                <asp:BoundField DataField="Hewan" HeaderText="Hewan" />
                                <asp:BoundField DataField="NamaArea" HeaderText="Area" />
                                <asp:BoundField DataField="NamaPemilik" HeaderText="Pemilik" />
                                <asp:BoundField DataField="Harga" HeaderText="Harga" DataFormatString="{0:0}" />
                                <%--<asp:BoundField DataField="SatuanHarga" HeaderText="Satuan Hrg" />--%>
                                <asp:BoundField DataField="MinimumBayarMonth" HeaderText="Minimum Bayar" />
                                <asp:BoundField DataField="LuasKamar" HeaderText="Luas Kmr" />
                                <asp:BoundField DataField="JmlKamar" HeaderText="Jml Kmr" />
                                <asp:BoundField DataField="JmlKamarKosong" HeaderText="Jml Kmr Kosong" />
                                <asp:BoundField DataField="UserName" HeaderText="User" />
                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnApprove" OnCommand="lbApprove_Command" runat="server" CssClass="btn btn-info btn-xs" OnClientClick="return confirm('Apakah Anda yakin ingin mengubah status Form ini?');">Approve</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnAbort" OnCommand="lbAbort_Command" runat="server" CssClass="btn btn-danger btn-xs"  OnClientClick="return confirm('Apakah Anda yakin ingin mengubah status Form ini?');">Abort</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="140px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView> 
                        </div>
                        <%--<asp:Repeater ID="rptApprovalKos" runat="server" OnItemDataBound="rptApprovalKos_ItemDataBound" OnItemCommand="rptApprovalKos_ItemCommand">
                            <HeaderTemplate>
                                <div class="card-block p-0">
                                    <table class="table table-striped custab">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nama</th>
                                                <th>TipeKos</th>
                                                <th>Hewan</th>
                                                <th>Area</th>
                                                <th>Nama Pemilik</th>
                                                <th>Harga</th>
                                                <th>Satuan Hrg</th>
                                                <th>Minimum Bayar Bulan</th>
                                                <th>Luas Kamar</th>
                                                <th>Jml Kamar</th>
                                                <th>Jml Kmr Kosong</th>
                                                <th>User</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><asp:Label ID="lblID" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblNama" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblTipeKos" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblPet" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblArea" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblNamaPemilik" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblHarga" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblSatuanHarga" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblMinimumPamentMonth" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblLuasKamar" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblJmlKamar" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblJmlKmrKosong" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblUser" runat="server"></asp:Label></td>
                                    <td class="text-center"><asp:HyperLink ID="hlApprovalButton" runat="server" CssClass="btn btn-info btn-xs" 
                                        ClientIDMode="Static" Enabled="true" Visible="true"><span class="glyphicon glyphicon-edit"></span>Approve</asp:HyperLink></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                                    </div>
                                
                                    
                            </FooterTemplate>
                        </asp:Repeater>
                        <uc1:PagingControl ID="PagingControl1" runat="server" OnClick="LinkPaging_Click" />
                        <script type="text/javascript">
                            function btnDelete_Click(ID) {
                                if (confirm("Are you sure want to delete?")) {
                                    location.href = 'Delete.aspx?id=' + ID;
                                }
                            }

                        </script>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        </div>
</asp:Content>