<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="LihatKosV1.LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="margin-top:20px;"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">Login</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="email" class="col-md-4 control-label">E-mail Address</label>

                                <div class="col-md-6">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                                    <%--<input id="email" type="email" class="form-control" name="email" />--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password" class="col-md-4 control-label">Password</label>

                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                                    <%--<input id="password" type="password" class="form-control" name="password">--%>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <div class="checkbox">
                                        <label>
                                            <%--<input type="checkbox" name="remember">--%>
                                            <asp:CheckBox ID="chkRemember" runat="server" />
                                            Remember Me
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div style="color:red;">
                                        <asp:ValidationSummary ID="vs" runat="server" />
                                    </div>
                                </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click"><i class="fa fa-btn fa-sign-in"></i>Login</asp:LinkButton>
                                    <%--<button type="submit" class="btn btn-primary">
                                        <i class="fa fa-btn fa-sign-in"></i>Login
                                    </button>--%>

                                    <%--<a class="btn btn-link" href="#">Forgot Your Password?</a>--%>
                                    <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="#">Forgot Your Password?</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>