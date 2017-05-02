<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="LihatKosV1.ContactUs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .jumbotron {
            /*background: #358CCE;*/
            color: #FFF;
            border-radius: 0px;
        }

        .jumbotron-sm {
            padding-top: 24px;
            padding-bottom: 24px;
        }

        .jumbotron small {
            color: #FFF;
        }

        .h1 small {
            font-size: 24px;
        }

        .unwatermarked {
            height: 18px;
            width: 148px;
        }

        .watermarked {
            height: 20px;
            width: 150px;
            padding: 2px 0 0 2px;
            border: 1px solid #BEBEBE;
            background-color: #FFFFFF;
            color: gray;
        }
    </style>
    <div class="jumbotron jumbotron-sm spacersmall services">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-lg-12">
                    <h1 class="h1">Contact us <small>Feel free to contact us</small></h1>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="well well-sm">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">
                                    Name</label>
                                <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                <cc1:TextBoxWatermarkExtender ID="txtNameWatermarkExtender" runat="server" TargetControlID="txtName" WatermarkText="Enter name" />
                                <%--<input type="text" class="form-control" id="name" placeholder="Enter name" required="required" />--%>
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                    </span>
                                    <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <cc1:TextBoxWatermarkExtender ID="txtEmailWatermarkExtender" runat="server" TargetControlID="txtEmail" WatermarkText="Enter email" />
                                    <%--<input type="email" class="form-control" id="email" placeholder="Enter email" required="required" /></div>--%>
                                </div>
                                <div class="form-group">
                                    <label for="subject">
                                        Subject</label>
                                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <%--<select id="subject" name="subject" class="form-control" required="required">
                                    <option value="na" selected="">Choose One:</option>
                                    <option value="service">General Customer Service</option>
                                    <option value="suggestions">Suggestions</option>
                                    <option value="product">Product Support</option>
                                </select>--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">
                                    Message</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" Rows="9" TextMode="MultiLine"></asp:TextBox>
                                <cc1:TextBoxWatermarkExtender ID="txtMessageWatermarkExtender" runat="server" TargetControlID="txtMessage" WatermarkText="Message" />
                                <%--<textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                    placeholder="Message"></textarea>--%>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <asp:Button ID="btnContactUs" runat="server" CssClass="btn btn-default pull-right" Text="Send Message" OnClick="btnContactUs_Click" />
                            <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div style="color: darkblue;">
                                        <asp:Label ID="lblSuccess" runat="server" Text="Register Success.. Activation email has been sent. Loading!!"></asp:Label>
                                    </div>
                                </div>
                            </asp:Panel>
                            <%--                            <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                                Send Message</button>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <legend><span class="glyphicon glyphicon-globe"></span>Our office</legend>
                <address>
                    <asp:Literal ID="litAddress" runat="server"></asp:Literal>
                </address>
                <address>
                    <strong>LihatKos</strong><br>
                    <a href="mailto:#">support@lihatkos.com</a>
                </address>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function show() {
            document.write("<head id='Head1' runat='server' />");
        }
    </script>
</asp:Content>
