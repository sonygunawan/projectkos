<%@ Page Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="LihatKosV1.RegisterForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="margin-top: 20px;"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">Register</div>
                        <div class="panel-body">
                            

                        <div class="form-group">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                                <%--<input id="name" type="text" class="form-control" name="name">--%>
                               
                            </div>
                        </div>

                                <div class="form-group">
                                    <label for="email" class="col-md-4 control-label">E-mail Address</label>

                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                                        <%--<input id="email" type="email" class="form-control" name="email">--%>
                                        
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
                                    <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control" TextMode="Password" />
                                        <%--<input id="password-confirm" type="password" class="form-control" name="password_confirmation">--%>
                                        
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div style="color:red;">
                                        <asp:ValidationSummary ID="vs" runat="server" />
                                    </div>
                                </div>
                                <asp:Panel ID="pnlSuccess" runat="server" Visible ="false">
                                <div class="form-group">
                                    <label class="col-md-4 control-label"></label>
                                    <div style="color:darkblue;">
                                        <asp:Label ID="lblSuccess" runat="server" Text="Register Success.. Activation email has been sent. Loading!!"></asp:Label>
                                    </div>
                                </div>
                                </asp:Panel>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-4">
                                        <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click"><i class="fa fa-btn fa-user"></i>Register</asp:LinkButton>
                                        <%--<button type="submit" class="btn btn-primary">
                                            <i class="fa fa-btn fa-user"></i>Register
                                        </button>--%>
                                    </div>
                                </div>
                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
