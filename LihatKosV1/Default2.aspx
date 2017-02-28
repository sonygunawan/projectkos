<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="LihatKosV1.MasterPage.Default2" %>

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

    <!-- uniform -->
    <link type="text/css" rel="stylesheet" href="assets/uniform/css/uniform.default.min.css" />

    <!-- animate.css -->
    <link rel="stylesheet" href="assets/wow/animate.css" />


    <!-- gallery -->
    <link rel="stylesheet" href="assets/gallery/blueimp-gallery.min.css">


    <!-- favicon -->
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
    <link rel="icon" href="images/favicon.png" type="image/x-icon">


    <!-- Owl Carousel 2 -->
    <link rel="stylesheet" href="assets/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/owlcarousel/owl.theme.default.min.css">

    <link rel="stylesheet" href="assets/style.css">
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
    <form id="form1" runat="server">
        <!-- header -->
        <nav class="navbar  navbar-default" role="navigation">
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
                        <img src="images/logo.png" alt="holiday crown"></a>
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
                        <li><a href="#">Register</a></li>
                        <li><a href="#">Login</a></li>
                    </ul>
                </div>
                <!-- Wnavbar-collapse -->
            </div>
            <!-- container-fluid -->
        </nav>
        <!-- header -->

        <!-- banner
<div class="banner">
    <img src="images/photos/banner.jpg"  class="img-responsive" alt="slide">
    <div class="welcome-message">
        <div class="wrap-info">
            <div class="information">
                <h1  class="animated fadeInDown">Best hotel in Dubai</h1>
                <p class="animated fadeInUp">Most luxurious hotel of asia with the royal treatments and excellent customer service.</p>
            </div>
            <a href="#information" class="arrow-nav scroll wowload fadeInDownBig"><i class="fa fa-angle-down"></i></a>
        </div>
    </div>
</div>
banner-->


        <!-- Front -->
        <div id="front">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8 slide no-gutter">
                        <!-- Slide -->
                        <div class="owl-carousel owl-theme">
                            <div class="item">
                                <img src="images/photos/banner.jpg" class="img-responsive" alt="slide">
                            </div>
                            <div class="item">
                                <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                            </div>
                            <div class="item">
                                <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                            </div>
                            <div class="item">
                                <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                            </div>
                            <div class="item">
                                <img src="images/photos/1900x849.png" class="img-responsive" alt="slide">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 search">
                        <form role="form" method="" action="" name="">
                            <h3 class="text-center text-uppercase">Search</h3>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search..">
                            </div>
                            <button class="btn btn-default btn-fullwidth text-uppercase">Cari Kos</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Front -->


        <!-- Room -->
        <div id="room">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="col-sm-4">
                            <h2>Area</h2>
                        </div>

                        <div class="col-sm-8 select-area">
                            <select class="form-control">
                                <option>Jakarta</option>
                                <option>Bandung</option>
                                <option>Surabaya</option>
                                <option>Yogyakarta</option>
                            </select>
                        </div>

                        <div class="col-sm-12">
                            <div class="table-responsive">
                                <table class="table table-room-highlight">
                                    <tbody>
                                        <tr>
                                            <td class="clearfix">
                                                <img src="images/300x150.png" class="pull-left img-responsive" alt="">
                                                <h4>Latest</h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="clearfix">
                                                <img src="images/300x150.png" class="pull-left img-responsive" alt="">
                                                <h4>Favorite</h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="clearfix">
                                                <img src="images/300x150.png" class="pull-left img-responsive" alt="">
                                                <h4>Banyak dilihat</h4>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- #.table-responsive -->
                        </div>
                        <!-- #.col-sm-12 -->
                    </div>
                    <!-- #.col-sm-6 -->

                    <div class="col-sm-6">
                        <div class="table-responsive">
                            <table class="table table-favorite">
                                <caption class="text-center">
                                    <h3>My Favorites</h3>
                                </caption>
                                <thead class="text-center">
                                    <td>#</td>
                                    <td>Price</td>
                                    <td>Location</td>
                                </thead>

                                <tbody class="text-center">
                                    <tr>
                                        <td>
                                            <img src="images/128x128.png" class="img-responsive center-block" alt=""></td>
                                        <td>Rp.200.000/bln</td>
                                        <td>Mekasari, Menteng</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="images/128x128.png" class="img-responsive center-block" alt=""></td>
                                        <td>Rp.150.000/bln</td>
                                        <td>Kepulauan Riau, Tanjungpinang</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="images/128x128.png" class="img-responsive center-block" alt=""></td>
                                        <td>Rp.300.000/bln</td>
                                        <td>Riau, Pekanbaru</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- #.table-responsive -->
                    </div>
                    <!-- #.col-sm-6 -->
                </div>
                <!-- #row -->
            </div>
            <!-- #container-fluid -->
        </div>
        <!-- End of Room -->


        <!-- reservation-information -->
        <!-- <div id="information" class="spacer reserve-info ">
<div class="container">
<div class="row">
<div class="col-sm-7 col-md-8">
    <div class="embed-responsive embed-responsive-16by9 wowload fadeInLeft"><iframe  class="embed-responsive-item" src="//player.vimeo.com/video/55057393?title=0" width="100%" height="400" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>
</div>
<div class="col-sm-5 col-md-4">
<h3>Reservation</h3>
    <form role="form" class="wowload fadeInRight">
        <div class="form-group">
            <input type="text" class="form-control"  placeholder="Name">
        </div>
        <div class="form-group">
            <input type="email" class="form-control"  placeholder="Email">
        </div>
        <div class="form-group">
            <input type="Phone" class="form-control"  placeholder="Phone">
        </div>
        <div class="form-group">
            <div class="row">
            <div class="col-xs-6">
            <select class="form-control">
              <option>No. of Rooms</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
            </div>
            <div class="col-xs-6">
            <select class="form-control">
              <option>No. of Adult</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
            </select>
            </div></div>
        </div>
        <div class="form-group">
            <div class="row">
            <div class="col-xs-4">
              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
                <option>Date</option>
                <option value="01">1</option>
                <option value="02">2</option>
                <option value="03">Mar (03)</option>
                <option value="04">Apr (04)</option>
                <option value="05">May (05)</option>
                <option value="06">June (06)</option>
                <option value="07">July (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Oct (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dec (12)</option>
              </select>
            </div>
            <div class="col-xs-4">
              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
                <option>Month</option>
                <option value="01">Jan (01)</option>
                <option value="02">Feb (02)</option>
                <option value="03">Mar (03)</option>
                <option value="04">Apr (04)</option>
                <option value="05">May (05)</option>
                <option value="06">June (06)</option>
                <option value="07">July (07)</option>
                <option value="08">Aug (08)</option>
                <option value="09">Sep (09)</option>
                <option value="10">Oct (10)</option>
                <option value="11">Nov (11)</option>
                <option value="12">Dec (12)</option>
              </select>
            </div>
            <div class="col-xs-4">
              <select class="form-control" name="expiry-year">
                <option value="13">2013</option>
                <option value="14">2014</option>
                <option value="15">2015</option>
                <option value="16">2016</option>
                <option value="17">2017</option>
                <option value="18">2018</option>
                <option value="19">2019</option>
                <option value="20">2020</option>
                <option value="21">2021</option>
                <option value="22">2022</option>
                <option value="23">2023</option>
              </select>
            </div>
          </div>
        </div>
        <div class="form-group">
            <textarea class="form-control"  placeholder="Message" rows="4"></textarea>
        </div>
        <button class="btn btn-default">Submit</button>
    </form>
</div>
</div>
</div>
</div> -->
        <!-- reservation-information -->



        <!-- services -->
        <div class="spacer services wowload fadeInUp">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <!-- RoomCarousel -->
                        <div id="RoomCarousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="images/photos/8.jpg" class="img-responsive" alt="slide"></div>
                                <div class="item  height-full">
                                    <img src="images/photos/9.jpg" class="img-responsive" alt="slide"></div>
                                <div class="item  height-full">
                                    <img src="images/photos/10.jpg" class="img-responsive" alt="slide"></div>
                            </div>
                            <!-- Controls -->
                            <a class="left carousel-control" href="#RoomCarousel" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                            <a class="right carousel-control" href="#RoomCarousel" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a>
                        </div>
                        <!-- RoomCarousel-->
                        <div class="caption">Rooms<a href="rooms-tariff.php" class="pull-right"><i class="fa fa-edit"></i></a></div>
                    </div>


                    <div class="col-sm-4">
                        <!-- RoomCarousel -->
                        <div id="TourCarousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="images/photos/6.jpg" class="img-responsive" alt="slide"></div>
                                <div class="item  height-full">
                                    <img src="images/photos/3.jpg" class="img-responsive" alt="slide"></div>
                                <div class="item  height-full">
                                    <img src="images/photos/4.jpg" class="img-responsive" alt="slide"></div>
                            </div>
                            <!-- Controls -->
                            <a class="left carousel-control" href="#TourCarousel" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                            <a class="right carousel-control" href="#TourCarousel" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a>
                        </div>
                        <!-- RoomCarousel-->
                        <div class="caption">Tour Packages<a href="gallery.php" class="pull-right"><i class="fa fa-edit"></i></a></div>
                    </div>


                    <div class="col-sm-4">
                        <!-- RoomCarousel -->
                        <div id="FoodCarousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="images/photos/1.jpg" class="img-responsive" alt="slide"></div>
                                <div class="item  height-full">
                                    <img src="images/photos/2.jpg" class="img-responsive" alt="slide"></div>
                                <div class="item  height-full">
                                    <img src="images/photos/5.jpg" class="img-responsive" alt="slide"></div>
                            </div>
                            <!-- Controls -->
                            <a class="left carousel-control" href="#FoodCarousel" role="button" data-slide="prev"><i class="fa fa-angle-left"></i></a>
                            <a class="right carousel-control" href="#FoodCarousel" role="button" data-slide="next"><i class="fa fa-angle-right"></i></a>
                        </div>
                        <!-- RoomCarousel-->
                        <div class="caption">Food and Drinks<a href="gallery.php" class="pull-right"><i class="fa fa-edit"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- services -->

        <footer class="spacer">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5">
                        <h4>Holiday Crown</h4>
                        <p>Holiday Crown was these three and songs arose whose. Of in vicinity contempt together in possible branched. Assured company hastily looking garrets in oh. Most have love my gone to this so. Discovered interested prosperous the our affronting insipidity day. Missed lovers way one vanity wishes nay but. Use shy seemed within twenty wished old few regret passed. Absolute one hastened mrs any sensible. </p>
                    </div>

                    <div class="col-sm-3">
                        <h4>Quick Links</h4>
                        <ul class="list-unstyled">
                            <li><a href="rooms-tariff.php">Rooms & Tariff</a></li>
                            <li><a href="introduction.php">Introduction</a></li>
                            <li><a href="gallery.php">Gallery</a></li>
                            <li><a href="tour.php">Tour Packages</a></li>
                            <li><a href="contact.php">Contact</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4 subscribe">
                        <h4>Subscription</h4>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Enter email id here">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">Get Notify</button>
                            </span>
                        </div>
                        <div class="social">
                            <a href="#"><i class="fa fa-facebook-square" data-toggle="tooltip" data-placement="top" data-original-title="facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram" data-toggle="tooltip" data-placement="top" data-original-title="instragram"></i></a>
                            <a href="#"><i class="fa fa-twitter-square" data-toggle="tooltip" data-placement="top" data-original-title="twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest-square" data-toggle="tooltip" data-placement="top" data-original-title="pinterest"></i></a>
                            <a href="#"><i class="fa fa-tumblr-square" data-toggle="tooltip" data-placement="top" data-original-title="tumblr"></i></a>
                            <a href="#"><i class="fa fa-youtube-square" data-toggle="tooltip" data-placement="top" data-original-title="youtube"></i></a>
                        </div>
                    </div>
                </div>
                <!--/.row-->
            </div>
            <!--/.container-->

            <!--/.footer-bottom-->
        </footer>

        <div class="text-center copyright">Powered by <a href="http://thebootstrapthemes.com">thebootstrapthemes.com</a></div>

        <a href="#home" class="toTop scroll"><i class="fa fa-angle-up"></i></a>




        <!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
        <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
            <!-- The container for the modal slides -->
            <div class="slides"></div>
            <!-- Controls for the borderless lightbox -->
            <h3 class="title">title</h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <!-- The modal dialog, which will be used to wrap the lightbox content -->
        </div>





        <script src="assets/jquery.js"></script>

        <!-- wow script -->
        <script src="assets/wow/wow.min.js"></script>

        <!-- uniform -->
        <script src="assets/uniform/js/jquery.uniform.js"></script>


        <!-- boostrap -->
        <script src="assets/bootstrap/js/bootstrap.js" type="text/javascript"></script>

        <!-- jquery mobile -->
        <script src="assets/mobile/touchSwipe.min.js"></script>

        <!-- jquery mobile -->
        <script src="assets/respond/respond.js"></script>

        <!-- gallery -->
        <script src="assets/gallery/jquery.blueimp-gallery.min.js"></script>

        <!-- Owl Carousel 2 -->
        <script src="assets/owlcarousel/owl.carousel.min.js"></script>


        <!-- custom script -->
        <script src="assets/script.js"></script>


        <!-- Call Owl Carousel 2 -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.owl-carousel').owlCarousel({
                    loop: true,
                    items: 1
                });

                $(".owl-carousel").owlCarousel();
            });
        </script>








    </form>


</body>
</html>
