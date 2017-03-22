<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormUser.aspx.cs" Inherits="LihatKosV1.Admin.FormUser" %>
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
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
