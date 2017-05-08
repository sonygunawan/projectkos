<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="FormAboutUs.aspx.cs" Inherits="LihatKosV1.Admin.FormAboutUs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:20px;"></div>
    <div class="container">
        <div class="row">
            <h2>Form Content</h2>
            <br />
            <asp:DropDownList ID="ddlContent" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlContent_SelectedIndexChanged">
                <asp:ListItem Value="4" Text="About Us"></asp:ListItem>
                <asp:ListItem Value="5" Text="Term And Condition"></asp:ListItem>
                <asp:ListItem Value="6" Text="WhyUs"></asp:ListItem>
                <asp:ListItem Value="7" Text="FAQ"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:TextBox ID="txtEditor" runat="server" Width="1000" Height="200" />
            <cc1:HtmlEditorExtender ID="txtEditorHtmlExtender" runat="server" TargetControlID="txtEditor"
                 EnableSanitization="false">
            </cc1:HtmlEditorExtender>
            
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="btn btn-info" 
                 OnClick="btnSubmit_Click" />
             <asp:Label ID="lblContents" runat="server" />
            <%--<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe nostrum ullam eveniet pariatur voluptates odit, fuga atque ea nobis sit soluta odio, adipisci quas excepturi maxime quae totam ducimus consectetur?</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque architecto error, repellendus iusto reprehenderit, doloribus, minus sunt. Numquam at quae voluptatum in officia voluptas voluptatibus, minus!</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum molestiae debitis nobis, quod sapiente qui voluptatum, placeat magni repudiandae accusantium fugit quas labore non rerum possimus, corrupti enim modi! Et.</p>
            </div>--%>
        </div>
    </div>
</asp:Content>
