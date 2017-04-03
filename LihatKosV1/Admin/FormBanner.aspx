<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormBanner.aspx.cs" Inherits="LihatKosV1.Admin.FormBanner" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:20px;"></div>
        <div class="container">
            <div class="row col-md-6 custyle">
                <div class="card mb-12">
                <h2>Form Banner</h2>
                <asp:Button ID="btnAddBanner" runat="server" Text="Add Banner" OnClick="btnAddBanner_Click" Visible="true" />
                <asp:UpdatePanel ID="UpdatePanelGrid" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="viewBanner" runat="server">
                            <div class="card-block p-0">
                                <asp:GridView ID="gvBanner" runat="server" CssClass="table table-striped custab"
                                    AutoGenerateColumns="false" OnRowDataBound="gvBanner_RowDataBound" 
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvBanner_PageIndexChanging" >
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" />
                                        <asp:BoundField DataField="Nama" HeaderText="Nama Banner" />
                                        <asp:BoundField DataField="FilePath" HeaderText="File" />
                                        <asp:BoundField DataField="Url" HeaderText="Url" />
                                        <asp:BoundField DataField="Prioritas" HeaderText="Prioritas" />
                                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" OnCommand="lbtnEdit_Command" runat="server" CssClass="btn btn-info btn-xs" OnClientClick="return confirm('Apakah Anda yakin ingin mengubah banner ini?');">Edit</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnDelete" OnCommand="lbtnDelete_Command" runat="server" CssClass="btn btn-danger btn-xs"  OnClientClick="return confirm('Apakah Anda yakin ingin menghapus banner ini?');">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Width="140px"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanelPopup" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btn1" runat="server" Style="display:none;" />
                        <cc1:ModalPopupExtender ID="MPEForm" runat="server" TargetControlID="btn1" DropShadow="true" PopupControlID="pnlForm" 
                            CancelControlID="btnClose" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pnlForm" runat="server" Style="display:none;background-color: #ffffff;width:900px;border-radius: 6px;background-clip: padding-box;">
                            <div class="modal-header">
                                <asp:Button ID="btnClose" CssClass="close" runat="server" Text="x" />
                                <h3><asp:Literal ID="litPopupTitle" runat="server"></asp:Literal></h3>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-xs-11">
                                        <div class="well">
                                        <%--<div class="form-group">
                                            <label>Kode</label>
                                            <asp:TextBox ID="txtKode" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>--%>
                                        <div class="form-group">
                                            <label>Nama</label>
                                            <asp:TextBox ID="txtNama" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Url</label>
                                            <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:LinkButton ID="btnTambah" runat="server" CssClass="btn btn-info" OnClick="btnTambah_Click">Tambah</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
