<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormBanner.aspx.cs" Inherits="LihatKosV1.Admin.FormBanner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:20px;"></div>
        <div class="container">
            <div class="row col-md-6 custyle">
                <div class="card mb-12">
                <h2>Form User</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
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
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
