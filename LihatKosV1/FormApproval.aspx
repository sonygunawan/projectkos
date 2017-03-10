<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormApproval.aspx.cs" Inherits="LihatKosV1.FormApproval" %>

<%@ Register src="~/UserControl/PagingControl.ascx" tagname="PagingControl" tagprefix="uc1" %>
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
                        <asp:GridView ID="gvApprovalKos" runat="server" AutoGenerateColumns="false"
                             AllowPaging="true" PageSize="20" OnPageIndexChanging="gvApprovalKos_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                <asp:BoundField DataField="Nama" HeaderText="Nama" />
                                <asp:BoundField DataField="NamaTipeKos" HeaderText="TipeKos" />
                                <asp:BoundField DataField="PetID" HeaderText="Hewan" />
                                <asp:BoundField DataField="NamaArea" HeaderText="Area" />
                                <asp:BoundField DataField="NamaPemilik" HeaderText="Pemilik" />
                                <asp:BoundField DataField="Harga" HeaderText="Harga" DataFormatString="N0" />
                                <asp:BoundField DataField="SatuanHarga" HeaderText="Satuan Hrg" />
                                <asp:BoundField DataField="MinimumBayarMonth" HeaderText="Minimum Bayar" />
                                <asp:BoundField DataField="LuasKamar" HeaderText="Luas Kmr" />
                                <asp:BoundField DataField="JmlKamar" HeaderText="Jml Kmr" />
                                <asp:BoundField DataField="JmlKamarKosong" HeaderText="Jml Kmr Kosong" />
                                <asp:BoundField DataField="UserName" HeaderText="User" />
                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="350px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnApprove" OnCommand="lbApprove_Command" runat="server">Approve</asp:LinkButton>
                                        |
                                        <asp:LinkButton ID="lbtnAbort" OnCommand="lbAbort_Command" runat="server">Abort</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="140px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView> 
                        <%--<asp:Repeater ID="rptApprovalKos" runat="server" OnItemDataBound="rptApprovalKos_ItemDataBound" OnItemCommand="rptApprovalKos_ItemCommand">
                            <HeaderTemplate>
                                <div class="card-block p-0">
                                    <table class="table table-striped custab">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nama</th>
                                                <th>TipeKos</th>
                                                <th>Hewan</th>
                                                <th>Area</th>
                                                <th>Nama Pemilik</th>
                                                <th>Harga</th>
                                                <th>Satuan Hrg</th>
                                                <th>Minimum Bayar Bulan</th>
                                                <th>Luas Kamar</th>
                                                <th>Jml Kamar</th>
                                                <th>Jml Kmr Kosong</th>
                                                <th>User</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><asp:Label ID="lblID" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblNama" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblTipeKos" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblPet" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblArea" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblNamaPemilik" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblHarga" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblSatuanHarga" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblMinimumPamentMonth" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblLuasKamar" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblJmlKamar" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblJmlKmrKosong" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblUser" runat="server"></asp:Label></td>
                                    <td class="text-center"><asp:HyperLink ID="hlApprovalButton" runat="server" CssClass="btn btn-info btn-xs" 
                                        ClientIDMode="Static" Enabled="true" Visible="true"><span class="glyphicon glyphicon-edit"></span>Approve</asp:HyperLink></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                                    </div>
                                
                                    
                            </FooterTemplate>
                        </asp:Repeater>
                        <uc1:PagingControl ID="PagingControl1" runat="server" OnClick="LinkPaging_Click" />
                        <script type="text/javascript">
                            function btnDelete_Click(ID) {
                                if (confirm("Are you sure want to delete?")) {
                                    location.href = 'Delete.aspx?id=' + ID;
                                }
                            }

                        </script>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        </div>

    </form>


</body>
</html>