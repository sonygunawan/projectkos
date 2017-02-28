<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormApproval.aspx.cs" Inherits="LihatKosV1.FormApproval" %>

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

    <style type="text/css">
        .custab {
            border: 1px solid #ccc;
            padding: 5px;
            margin: 5% 0;
            box-shadow: 3px 3px 2px #ccc;
            transition: 0.5s;
        }

        .custab:hover {
            box-shadow: 3px 3px 0px transparent;
            transition: 0.5s;
        }
    </style>
    <!-- top
  <form class="navbar-form navbar-left newsletter" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Enter Your Email Id Here">
        </div>
        <button type="submit" class="btn btn-inverse">Subscribe</button>
    </form>
 top -->
    <form class="form-horizontal" id="form1" runat="server">
        <asp:ScriptManager ID="sm" AsyncPostBackTimeout="36000" runat="server" ></asp:ScriptManager>
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
            <div class="row col-md-6 col-md-offset-2 custyle">
                <div class="card mb-5">
                <h2>Form Approval</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="rptApprovalKos" runat="server" OnItemDataBound="rptApprovalKos_ItemDataBound" OnItemCommand="rptApprovalKos_ItemCommand">
                            <HeaderTemplate>
                                <div class="card-block p-0">
                                    <table class="table table-striped custab">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nama</th>
                                                <th>Area</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><asp:Label ID="lblID" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblNama" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblArea" runat="server"></asp:Label></td>
                                    <td class="text-center"><asp:HyperLink ID="hlApprovalButton" runat="server" CssClass="btn btn-info btn-xs" 
                                        ClientIDMode="Static" Enabled="true" Visible="true"><span class="glyphicon glyphicon-edit"></span>Approve</asp:HyperLink><%-- <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>Del</a>--%></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                                    </div>
                                    <div class="card-footer p-0">
                                        <nav aria-label="...">
                                            <ul class="pagination justify-content-end mt-3 mr-3">
                                                <li class="page-item disabled">
                                                    <span class="page-link">Previous</span>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item active">
                                                    <span class="page-link">2<span class="sr-only">(current)</span>
                                                    </span>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        </div>

    </form>


</body>
</html>