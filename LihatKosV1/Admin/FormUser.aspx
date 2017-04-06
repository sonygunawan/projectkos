<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormUser.aspx.cs" Inherits="LihatKosV1.Admin.FormUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:20px;"></div>
        <div class="container">
            <div class="row col-md-6 custyle">
                <div class="card mb-12">
                <h2>Form User</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="card-block p-0">
                        <asp:GridView ID="gvUser" runat="server" CssClass="table table-striped custab"
                             AutoGenerateColumns="false" OnRowDataBound="gvUser_RowDataBound"
                             AllowPaging="true" PageSize="10" OnPageIndexChanging="gvUser_PageIndexChanging" PagerStyle-Wrap="false">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" />
                                <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="30%" />
                                <asp:BoundField DataField="TipeUser" HeaderText="Tipe User" />
                                <asp:BoundField DataField="LastActivityDate" HeaderText="Last Activity" DataFormatString="{0:G}" />
                                <asp:BoundField DataField="LastChangeAktifDate" HeaderText="Last Change Active" DataFormatString="{0:G}" />
                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnEdit" OnCommand="lbtnEdit_Command" runat="server" CssClass="btn btn-info btn-xs" OnClientClick="return confirm('Apakah Anda yakin ingin mengedit User ini?');">Edit</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnActive" OnCommand="lbtnActive_Command" runat="server" CssClass="btn btn-primary btn-xs" OnClientClick="return confirm('Apakah Anda yakin ingin mengaktifkan User ini?');">Aktifkan</asp:LinkButton>
                                        <asp:LinkButton ID="lbtnDeactive" OnCommand="lbtnDeactive_Command" runat="server" CssClass="btn btn-danger btn-xs"  OnClientClick="return confirm('Apakah Anda yakin ingin menonaktifkan User ini?');">Deaktifkan</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="140px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView> 
                        </div>
                        <%--Pop Up--%>
                        <asp:Button ID="btn1" runat="server" Style="display:none;" />
                        <cc1:ModalPopupExtender ID="MPEForm" runat="server" TargetControlID="btn1" DropShadow="true" PopupControlID="pnlForm" 
                            CancelControlID="btnClose" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pnlForm" runat="server" Style="display:none;background-color: #ffffff;width:900px;border-radius: 6px;background-clip: padding-box;overflow-y:auto;">
                            <div class="modal-header">
                                <asp:Button ID="btnClose" CssClass="close" runat="server" Text="x" />
                                <h3><asp:Literal ID="litPopupTitle" runat="server"></asp:Literal></h3>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-xs-11">
                                        <div class="well">
                                        <div class="form-group">
                                            <label>UserName</label>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Tipe User</label>
                                            <asp:DropDownList ID="ddlTipeUser" runat="server" CssClass="form-control" />
                                        </div>
                                        <asp:LinkButton ID="btnTambah" runat="server" CssClass="btn btn-info" 
                                            OnClick="btnTambah_Click" ClientIDMode="Static">Tambah</asp:LinkButton>
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
