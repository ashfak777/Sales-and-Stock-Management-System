
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Black Lotus Cake Company</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/docs.css" rel="stylesheet">
        <link href="assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
        <link href="assets/css/flexslider.css" rel="stylesheet">
        <link href="assets/css/sequence.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/color/default.css" rel="stylesheet">
        <link href="css/header.css" rel="stylesheet" type="text/css">
        <link href="css/featherpro.css" rel="stylesheet" type="text/css" >
        <link href="css/viewdetails.css" rel="stylesheet" type="text/css">
        <link href="css/viewdetails1.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body onload="search();
            specialload();
            bestsellerload();">

        <%@include file="header.jsp" %>
        <section id="intro">
            <div class="jumbotron masthead">
                <div class="container">
                    <!-- slider navigation -->
                    <div class="sequence-nav">
                        <div class="prev">
                            <span></span>
                        </div>
                        <div class="next">
                            <span></span>
                        </div>
                    </div>
                    <!-- end slider navigation -->
                    <div class="row">
                        <div class="span12">
                            <div id="slider_holder">
                                <div id="sequence">
                                    <ul>
                                        <!-- Layer 1 -->
                                        <li>
                                            <div class="info animate-in">
                                                <h2>Biggest online cake company in</h2>
                                                <br>
                                                <h3>Sri lanka</h3>
                                                <p>
                                                    we have lot of any type cake with special offer with season 
                                                </p>
                                                <a class="btn btn-success" href="#">Read more &raquo;</a>
                                            </div>
                                            <img class="slider_img animate-in" src="img/pic1.jpg" alt="">
                                        </li>
                                        <!-- Layer 2 -->
                                        <li>
                                            <div class="info">
                                                <h2>Biggest online cake company in</h2>
                                                <br>
                                                <h3>Sri lanka</h3>
                                                <p>
                                                    we have lot of any type cake with special offer with season 
                                                </p>
                                                <a class="btn btn-success" href="#">Read more &raquo;</a>
                                            </div>
                                            <img class="slider_img" src="img/pic2.jpg" alt="">
                                        </li>
                                        <!-- Layer 3 -->
                                        <li>
                                            <div class="info">
                                                <h2>Biggest online cake company in</h2>
                                                <br>
                                                <h3>Sri lanka</h3>
                                                <p>
                                                    we have lot of any type cake with special offer with season 
                                                </p>
                                                <a class="btn btn-success" href="#">Read more &raquo;</a>
                                            </div>
                                            <img class="slider_img" src="img/pic3.jpg" alt="">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Sequence Slider::END-->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--FEATURED PRODUCTS-->
        <section class="container">
            <div class="row">
                <div class="col-lg-12 text-center shop-title-store">
                    <h1 class="section-title">FEATURED <span>Cakes</span></h1>

                </div>
            </div>
            <div id="main1">
                <div class="view">  
                    <center>
                        <img src="img/cake/1.png" width="150px" height="120px">
                    </center>
                    <br>
                    <span>Name :</span><span></span>
                    <br>
                    <span>Price :Rs</span><span>1000</span>
                    <br>
                    <span>Available :</span><span>5</span>
                    <br>
                    <input type="text" id="" class="txt">
                    &nbsp;&nbsp;
                    <button onclick="" class="btn btn-info">Add to cart</button>

                </div>


            </div>
        </section>
        <!--         end feathered book-->

        <!--Best seller-->
        <section class="container">
            <div class="row">
                <div class="col-lg-12 text-center shop-title-store">
                    <h1 class="section-title">Best <span>Sellers</span></h1>

                </div>
            </div>
            <div id="main3">
                <div class="view">  
                    <center>
                        <img src="img/cake/1.png" width="150px" height="120px">
                    </center>
                    <br>
                    <span>Name :</span><span>abc</span>
                    <br>
                    <span>Price :Rs</span><span>1000</span>
                    <br>
                    <span>Available :</span><span>5</span>
                    <br>
                    <input type="text" id="" class="txt">
                    &nbsp;&nbsp;
                    <button onclick="" class="btn btn-info">Add to cart</button>

                </div>


            </div>
        </section>
        <!--  end  Best seller-->

        <!--Special-->
        <section class="container">
            <div class="row">
                <div class="col-lg-12 text-center shop-title-store">
                    <h1 class="section-title">Special</span></h1>

                </div>
            </div>
            <div id="main2">
                <div class="view" style="width: 250px">
                    <center>
                        <img src="img/cake/1.png" width="150px" height="120px">
                    </center>
                    <br>
                    <span>Name :</span><span>abc</span>
                    <br>
                    <span>Price :Rs</span><span>1000</span>
                    <br>
                    <span>Available :</span><span>5</span>
                    <br>
                    <input type="text" id="" class="txt" >
                    &nbsp;&nbsp;
                    <button onclick="" class="btn btn-info">Add to cart</button>

                </div>
            </div>
        </section>

        <!--  end  Special-->

        <!-- Footer
       ================================================== -->
        <%@include file="footer.jsp" %>
        <script type="text/javascript">

            function search() {

                //  alert("1");
                var request = new XMLHttpRequest();

                request.onreadystatechange = function() {
                    if (request.readyState == 4) {
                        if (request.status === 200) {

                            document.getElementById("main1").innerHTML = "";
                            var json_string = request.responseText;

                            var array = JSON.parse(json_string);

                            for (var i = 0; i < array.length; i++) {
                                var u = array[i];

                                var div1 = document.createElement("div");
                                div1.setAttribute("class", "view");
                                var center = document.createElement("center");
                                var img = document.createElement("img");
                                img.setAttribute("src", "" + u.imgurl);
                                img.setAttribute("class", "image");
                                var table = document.createElement("table");
                                var tr1 = document.createElement("tr");
                                var tr2 = document.createElement("tr");
                                var tr3 = document.createElement("tr");
                                var tr4 = document.createElement("tr");
                                var td1 = document.createElement("td");
                                var td2 = document.createElement("td");
                                var td3 = document.createElement("td");
                                var td4 = document.createElement("td");
                                var td5 = document.createElement("td");
                                var td6 = document.createElement("td");
                                var td7 = document.createElement("td");
                                var td8 = document.createElement("td");
                                //var br=document.createElement("br");
                                var input = document.createElement("input");
                                input.setAttribute("type", "text");
                                input.setAttribute("id", "q" + u.idcakestore);
                                input.setAttribute("class", "txt");
                                var space = document.createTextNode('  ');
                                var button = document.createElement("button");
                                button.setAttribute("onclick", "addToCart(" + u.idcakestore + ")");
                                button.setAttribute("class", "btn btn-info btn1");
                                var span = document.createElement("span");
                                var a = document.createElement("a");
                                a.setAttribute("href", "viewmore.jsp?a=" + u.idcakestore);
                                var button1 = document.createElement("button");
                                button1.setAttribute("class", "btn btn-link btn1");
                                var button2 = document.createElement("button");
                                button2.setAttribute("class", "btn btn-color btn1");
                                // button.setAttribute("class","btn1");
                                td1.innerHTML = "Name :";
                                td2.innerHTML = u.name;
                                td3.innerHTML = "Seller :";
                                td4.innerHTML = u.sller;
                                td5.innerHTML = "uprice :";
                                td6.innerHTML = u.uprice;
                                td7.innerHTML = "Available :";
                                td8.innerHTML = u.qty;
                                button.innerHTML = "Add to card";
                                button1.innerHTML = "View more";
                                button2.innerHTML = "Buy now";

                                center.appendChild(img);
                                div1.appendChild(center);
                                div1.appendChild(table);
                                table.appendChild(tr1);
                                tr1.appendChild(td1);
                                tr1.appendChild(td2);
                                table.appendChild(tr2);
                                tr2.appendChild(td3);
                                tr2.appendChild(td4);
                                table.appendChild(tr3);
                                tr3.appendChild(td5);
                                tr3.appendChild(td6);
                                table.appendChild(tr4);
                                tr4.appendChild(td7);
                                tr4.appendChild(td8);
                                //div1.appendChild(br);
                                div1.appendChild(input);
                                div1.appendChild(space);
                                div1.appendChild(button);
                                span.appendChild(button1);
                                div1.appendChild(span);
                                a.appendChild(button1);
                                div1.appendChild(a);
                                div1.appendChild(button2);
                                document.getElementById("main1").appendChild(div1);
                            }

                        }

                    }
                };
                request.open("GET", "featureproducts", true);
                request.send();
            }

            function specialload() {

                //  alert("1");
                var request = new XMLHttpRequest();

                request.onreadystatechange = function() {
                    if (request.readyState == 4) {
                        if (request.status === 200) {

                            document.getElementById("main2").innerHTML = "";
                            var json_string = request.responseText;

                            var array = JSON.parse(json_string);

                            for (var i = 0; i < array.length; i++) {
                                var u = array[i];

                                var div1 = document.createElement("div");
                                div1.setAttribute("class", "view");
                                var center = document.createElement("center");
                                var img = document.createElement("img");
                                img.setAttribute("src", "" + u.imgurl);
                                img.setAttribute("class", "image");
                                var table = document.createElement("table");
                                var tr1 = document.createElement("tr");
                                var tr2 = document.createElement("tr");
                                var tr3 = document.createElement("tr");
                                var tr4 = document.createElement("tr");
                                var td1 = document.createElement("td");
                                var td2 = document.createElement("td");
                                var td3 = document.createElement("td");
                                var td4 = document.createElement("td");
                                var td5 = document.createElement("td");
                                var td6 = document.createElement("td");
                                var td7 = document.createElement("td");
                                var td8 = document.createElement("td");
                                //var br=document.createElement("br");
                                var input = document.createElement("input");
                                input.setAttribute("type", "text");
                                input.setAttribute("id", "q" + u.idcakestore);
                                input.setAttribute("class", "txt");
                                var space = document.createTextNode('  ');
                                var button = document.createElement("button");
                                button.setAttribute("onclick", "addToCart(" + u.idcakestore + ")");
                                button.setAttribute("class", "btn btn-info btn1");
                                var span = document.createElement("span");
                                var a = document.createElement("a");
                                a.setAttribute("href", "viewmore.jsp?a=" + u.idcakestore);
                                var button1 = document.createElement("button");
                                button1.setAttribute("class", "btn btn-link btn1");
                                var button2 = document.createElement("button");
                                button2.setAttribute("class", "btn btn-color btn1");
                                // button.setAttribute("class","btn1");
                                td1.innerHTML = "Name :";
                                td2.innerHTML = u.name;
                                td3.innerHTML = "Seller :";
                                td4.innerHTML = u.seller;
                                td5.innerHTML = "uprice :";
                                td6.innerHTML = u.uprice;
                                td7.innerHTML = "Available :";
                                td8.innerHTML = u.qty;
                                button.innerHTML = "Add to card";
                                button1.innerHTML = "View more";
                                button2.innerHTML = "Buy now";

                                center.appendChild(img);
                                div1.appendChild(center);
                                div1.appendChild(table);
                                table.appendChild(tr1);
                                tr1.appendChild(td1);
                                tr1.appendChild(td2);
                                table.appendChild(tr2);
                                tr2.appendChild(td3);
                                tr2.appendChild(td4);
                                table.appendChild(tr3);
                                tr3.appendChild(td5);
                                tr3.appendChild(td6);
                                table.appendChild(tr4);
                                tr4.appendChild(td7);
                                tr4.appendChild(td8);
                                //div1.appendChild(br);
                                div1.appendChild(input);
                                div1.appendChild(space);
                                div1.appendChild(button);
                                span.appendChild(button1);
                                div1.appendChild(span);
                                a.appendChild(button1);
                                div1.appendChild(a);
                                div1.appendChild(button2);
                                document.getElementById("main2").appendChild(div1);
                            }

                        }

                    }
                };
                request.open("GET", "homespecial", true);
                request.send();
            }

            function bestsellerload() {

                //  alert("1");
                var request = new XMLHttpRequest();

                request.onreadystatechange = function() {
                    if (request.readyState == 4) {
                        if (request.status === 200) {

                            document.getElementById("main3").innerHTML = "";
                            var json_string = request.responseText;

                            var array = JSON.parse(json_string);

                            for (var i = 0; i < array.length; i++) {
                                var u = array[i];

                                var div1 = document.createElement("div");
                                div1.setAttribute("class", "view");
                                var center = document.createElement("center");
                                var img = document.createElement("img");
                                img.setAttribute("src", "" + u.imgurl);
                                img.setAttribute("class", "image");
                                var table = document.createElement("table");
                                var tr1 = document.createElement("tr");
                                var tr2 = document.createElement("tr");
                                var tr3 = document.createElement("tr");
                                var tr4 = document.createElement("tr");
                                var td1 = document.createElement("td");
                                var td2 = document.createElement("td");
                                var td3 = document.createElement("td");
                                var td4 = document.createElement("td");
                                var td5 = document.createElement("td");
                                var td6 = document.createElement("td");
                                var td7 = document.createElement("td");
                                var td8 = document.createElement("td");
                                //var br=document.createElement("br");
                                var input = document.createElement("input");
                                input.setAttribute("type", "text");
                                input.setAttribute("id", "q" + u.idcakestore);
                                input.setAttribute("class", "txt");
                                var space = document.createTextNode('  ');
                                var button = document.createElement("button");
                                button.setAttribute("onclick", "addToCart(" + u.idcakestore + ")");
                                button.setAttribute("class", "btn btn-info btn1");
                                var span = document.createElement("span");
                                var a = document.createElement("a");
                                a.setAttribute("href", "viewmore.jsp?a=" + u.idcakestore);
                                var button1 = document.createElement("button");
                                button1.setAttribute("class", "btn btn-link btn1");
                                var button2 = document.createElement("button");
                                button2.setAttribute("class", "btn btn-color btn1");
                                // button.setAttribute("class","btn1");
                                td1.innerHTML = "Name :";
                                td2.innerHTML = u.name;
                                td3.innerHTML = "Seller :";
                                td4.innerHTML = u.seller;
                                td5.innerHTML = "uprice :";
                                td6.innerHTML = u.uprice;
                                td7.innerHTML = "Available :";
                                td8.innerHTML = u.qty;
                                button.innerHTML = "Add to card";
                                button1.innerHTML = "View more";
                                button2.innerHTML = "Buy now";

                                center.appendChild(img);
                                div1.appendChild(center);
                                div1.appendChild(table);
                                table.appendChild(tr1);
                                tr1.appendChild(td1);
                                tr1.appendChild(td2);
                                table.appendChild(tr2);
                                tr2.appendChild(td3);
                                tr2.appendChild(td4);
                                table.appendChild(tr3);
                                tr3.appendChild(td5);
                                tr3.appendChild(td6);
                                table.appendChild(tr4);
                                tr4.appendChild(td7);
                                tr4.appendChild(td8);
                                //div1.appendChild(br);
                                div1.appendChild(input);
                                div1.appendChild(space);
                                div1.appendChild(button);
                                span.appendChild(button1);
                                div1.appendChild(span);
                                a.appendChild(button1);
                                div1.appendChild(a);
                                div1.appendChild(button2);
                                document.getElementById("main3").appendChild(div1);
                            }

                        }

                    }
                };
                request.open("GET", "homebestsellers", true);
                request.send();
            }

            function addToCart(id) {

                var qty = document.getElementById("q" + id).value;
                // alert(qty+"wrong");
                var request = new XMLHttpRequest();

                request.onreadystatechange = function() {
                    if (request.readyState == 4) {
                        if (request.status === 200) {
                            alert(request.responseText);

                        }

                    }
                };

                request.open("GET", "cart?id=" + id + "&qty=" + qty, true);
                request.send();
            }
        </script>
        <!-- JavaScript Library Files -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.easing.js"></script>
        <script src="assets/js/google-code-prettify/prettify.js"></script>
        <script src="assets/js/modernizr.js"></script>
        <script src="assets/js/bootstrap.js"></script>
        <script src="assets/js/jquery.elastislide.js"></script>
        <script src="assets/js/sequence/sequence.jquery-min.js"></script>
        <script src="assets/js/sequence/setting.js"></script>
        <script src="assets/js/jquery.prettyPhoto.js"></script>
        <script src="assets/js/application.js"></script>
        <script src="assets/js/jquery.flexslider.js"></script>
        <script src="assets/js/hover/jquery-hover-effect.js"></script>
        <script src="assets/js/hover/setting.js"></script>

        <!-- Template Custom JavaScript File -->
        <script src="assets/js/custom.js"></script>

    </body>
</html>
