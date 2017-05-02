<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormContactUs.aspx.cs" Inherits="LihatKosV1.Admin.FormContactUs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:20px;"></div>
    <div class="container">
        <div class="row col-md-6 custyle">
            <div class="card mb-12">
            <h2>Form Contact</h2>
                <div class="card-block p-0">
                    <asp:GridView ID="gvContact" runat="server" CssClass="table table-striped custab"
                        AutoGenerateColumns="false" AllowPaging="true" PageSize="25" OnPageIndexChanging="gvContact_PageIndexChanging"
                        PagerStyle-Wrap="false">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="SubjectContact" HeaderText="Subject" />
                            <asp:BoundField DataField="StrStatus" HeaderText="Status" />
                            </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
