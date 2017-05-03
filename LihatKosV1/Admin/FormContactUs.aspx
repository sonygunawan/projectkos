<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormContactUs.aspx.cs" Inherits="LihatKosV1.Admin.FormContactUs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 20px;"></div>
    <div class="container">
        <div class="row col-md-6 custyle">
            <div class="card mb-12">
                <h2>Form Contact</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtSearch" runat="server" Width="200" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        <div class="card-block p-0">
                            <asp:GridView ID="gvContact" runat="server" CssClass="table table-striped custab"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="25" OnRowDataBound="gvContact_RowDataBound" OnPageIndexChanging="gvContact_PageIndexChanging"
                                PagerStyle-Wrap="false" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                    <asp:BoundField DataField="UserName" HeaderText="UserName" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="SubjectContact" HeaderText="Subject" />
                                    <asp:BoundField DataField="Message" HeaderText="Message" />
                                    <asp:BoundField DataField="StrStatus" HeaderText="Status" />
                                    <asp:TemplateField HeaderText="Action" HeaderStyle-Width="150px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDetail" OnCommand="lbtnDetail_Command" runat="server" CssClass="btn btn-info btn-xs">Detail</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnApprove" OnCommand="lbtnApprove_Command" runat="server" CssClass="btn btn-primary btn-xs" OnClientClick="return confirm('Apakah Anda yakin ingin menyetujui Comment ini?');">Approve</asp:LinkButton>
                                            <asp:LinkButton ID="lbtnReject" OnCommand="lbtnReject_Command" runat="server" CssClass="btn btn-danger btn-xs" OnClientClick="return confirm('Apakah Anda yakin ingin menolak Comment ini?');">Reject</asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Width="140px"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <%--Pop Up--%>
                        <asp:Button ID="btn1" runat="server" Style="display: none;" />
                        <cc1:ModalPopupExtender ID="MPEForm" runat="server" TargetControlID="btn1" DropShadow="true" PopupControlID="pnlForm"
                            CancelControlID="btnClose" BackgroundCssClass="modalBackground" />
                        <asp:Panel ID="pnlForm" runat="server" Style="display: none; background-color: #ffffff; width: 900px; border-radius: 6px; background-clip: padding-box; overflow-y: auto;">
                            <div class="modal-header">
                                <asp:Button ID="btnClose" CssClass="close" runat="server" Text="x" />
                                <h3>
                                    <asp:Literal ID="litPopupTitle" runat="server"></asp:Literal></h3>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-xs-11">
                                        <div class="well">
                                            <div class="form-group">
                                                <label>UserName</label>
                                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label>Subject</label>
                                                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" Enabled="false" />
                                            </div>
                                            <div class="form-group">
                                                <label for="name">
                                                    Message</label>
                                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" Rows="9" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                                                
                                            </div>
                                            <asp:LinkButton ID="btnApprove" runat="server" CssClass="btn btn-info"
                                                 OnClick="btnApprove_Click" ClientIDMode="Static">Approve</asp:LinkButton>
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
