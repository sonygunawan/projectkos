<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestJquery.aspx.cs" Inherits="LihatKosV1.TestJquery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <!-- HTML --> 
	  <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet" />
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      <!-- Javascript -->
      <script>
          $(function () {
              $("#slider-3").slider({
                  range: true,
                  min: 0,
                  max: 500,
                  values: [35, 200],
                  slide: function (event, ui) {
                      $("#price").val("$" + ui.values[0] + " - $" + ui.values[1]);
                  }
              });
              $("#price").val("$" + $("#slider-3").slider("values", 0) +
                 " - $" + $("#slider-3").slider("values", 1));
          });
      </script>
      <p>
         <label for = "price">Price range:</label>
         <input type = "text" id = "price" 
            style = "border:0; color:#b9cd6d; font-weight:bold;">
      </p>
      <div id = "slider-3"></div>
    </form>
</body>
</html>
