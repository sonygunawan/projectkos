<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="LihatKosV1.LoginForm" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>LihatKos.com | Website Pencari Tempat Kos Terbaik dan Terkini</title>

    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500,800|Old+Standard+TT' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500,800' rel='stylesheet' type='text/css'>

    <!-- font awesome -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">


    <!-- bootstrap -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/login.css" />
</head>

<body id="home">


    <!-- top
  <form class="navbar-form navbar-left newsletter" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Enter Your Email Id Here">
        </div>
        <button type="submit" class="btn btn-inverse">Subscribe</button>
    </form>
 top -->
    <form class="form-horizontal" id="form1" runat="server">
        <!-- header -->
        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.php">
                        <img src="" alt="LihatKos"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">

                    <ul class="nav navbar-nav">
                        <!--
        <li><a href="index.php">Home </a></li>
        <li><a href="rooms-tariff.php">Rooms & Tariff</a></li>
        <li><a href="introduction.php">Introduction</a></li>
        <li><a href="gallery.php">Gallery</a></li>
        <li><a href="contact.php">Contact</a></li>
      -->
                        
                        <li><a href="/Register">Register</a></li>
                        <li><a href="/Login">Login</a></li>
                    </ul>
                </div>
                <!-- navbar-collapse -->
            </div>
            <!-- container-fluid -->
        </nav>
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

    </form>


</body>
</html>
