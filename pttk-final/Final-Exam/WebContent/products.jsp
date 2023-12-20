<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Detail Products | Ecommerce</title>
            <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"
                rel="stylesheet" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
            <link rel="stylesheet" href="css/style.css">
        </head>

        <body>
            <div class="container" style="background-color: #fd8585;">
                <div class="navbar">
                    <div class="logo">
                        <a href="home"><img src="images/logo.png" alt="logo" width="125px"></a>
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="home">Home</a></li>
                            <li><a href="admin">Admin Site</a></li>
                            <li><a href="orderlists">Order Histories</a></li>
                            <li><a href="#maps">Contact</a></li>
                            <c:if test="${customerID}">
                                <li><a href="logout">Logout</a></li>
                            </c:if>
                            <c:if test="${!customerID}">
                                <li><a href="account.jsp">Login/Register</a></li>
                            </c:if>
                        </ul>
                    </nav>
                    <a href="cart"><img src="images/cart.png" width="30px" height="30px"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                </div>
            </div>

            <!-- Single Products -->
            <div class="small-container single-product">
                <div class="row">
                    <div class="col-2">
                        <img src="images/gallery-1.jpg" width="100%" id="ProductImg">

                        <div class="small-img-row">
                            <div class="small-img-col">
                                <img src="images/gallery-1.jpg" width="100%" class="small-img">
                            </div>
                            <div class="small-img-col">
                                <img src="images/gallery-2.jpg" width="100%" class="small-img">
                            </div>
                            <div class="small-img-col">
                                <img src="images/gallery-3.jpg" width="100%" class="small-img">
                            </div>
                            <div class="small-img-col">
                                <img src="images/gallery-4.jpg" width="100%" class="small-img">
                            </div>
                        </div>

                    </div>
                    <div class="col-8">
                        <h1>${bookitem.book.title}</h1>
                        <h2> - ${bookitem.book.author.name}</h2>
                        <h4>Price: ${bookitem.price}đ</h4>
                        <h5 style="color: red;"> (-${bookitem.discount}đ)</h5>
                        <h4 style="color: green;">Instock: ${bookitem.inStock} pcs</h4>
                        <input id="bookquantity" type="number" value="1">
                        <a onclick="addbook(${bookitem.ID}, 1, 'book')" class="btn">Add To Cart</a>

                        <h3>Summary:</h3>
                        <br>
                        <p>${bookitem.book.summary}.</p>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <section id="maps">
                <div class="container" style="margin-top: 40px; padding-bottom: 50px;">
                    <div class="title-3 wow fadeInUp" data-wow-duration="1.5s">
                        <h1 style="color: rgb(255, 41, 41);">Bản đồ & Fanpage</h1>
                        <div class="img-hoavan">
                            <img src="images/img-hoavan.png">
                        </div>
                    </div>
                    <div class="row wow fadeInUp" data-wow-duration="1.6s">
                        <div class="col-md-8">
                            <div id="map">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59591.666042484176!2d105.7507820959328!3d21.01350656759759!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135accdd8a1ad71%3A0xa2f9b16036648187!2zSOG7jWMgdmnhu4duIGLGsHUgY2jDrW5oIHZp4buFbiB0aMO0bmcgUHRpdA!5e0!3m2!1svi!2s!4v1602036764946!5m2!1svi!2s"
                                    width="640" height="500" frameborder="0" style="border:0;" allowfullscreen=""
                                    aria-hidden="false" tabindex="0"></iframe>
                            </div>
                        </div class="col-md-4">
                        <iframe
                            src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FITPTIT%2F&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
                            width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
                            allowfullscreen="true"
                            allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                    </div>
                </div>
            </section>

            <footer id="footer">
                <div class="footer-bottom">
                    <div class="container">
                        <h2 class="tt-ft-bottom wow fadeInUp" data-wow-duration="1.6s">Thông tin liên hệ</h2>
                        <div class="wow animated zoomIn">
                            <div class="row">
                                <div class="col-md-7 col-sm-12 col-xs-12">
                                    <h4>Trụ sở chính TP. Hà Nội:</h3>
                                        <p>Số 122, Đường Hoàng Quốc Việt, Q.Cầu Giấy, Hà Nội</p>
                                        <h4>Cơ sở chính tại TP. Hà Nội:</h3>
                                            <p>Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội</p>
                                </div>
                                <div class="col-md-5 col-sm-12 col-xs-12">
                                    <h4>Cơ sở 1 tại TP. Hồ Chí Minh:</h3>
                                        <p>11 Nguyễn Đình Chiểu, P. Đa Kao, Q.1 TP Hồ Chí Minh</p>
                                        <h4>Cơ sở 2 tại TP. Hồ Chí Minh:</h3>
                                            <p>Đường Man Thiện, P. Hiệp Phú, Q.9 TP Hồ Chí Minh</p>
                                </div>
                            </div>
                        </div>
                        <br><br><br>
                        <div class="copy-right">
                            <span style="text-align: center;">Copyright © 2023 Website ECommerce</span>
                        </div>
                    </div>
                </div>
                </div>
            </footer>

            <!-- javascript -->

            <script>
                var MenuItems = document.getElementById("MenuItems");
                MenuItems.style.maxHeight = "0px";
                function menutoggle() {
                    if (MenuItems.style.maxHeight == "0px") {
                        MenuItems.style.maxHeight = "200px"
                    }
                    else {
                        MenuItems.style.maxHeight = "0px"
                    }
                }
            </script>

            <!-- product gallery -->
            <script>
                var ProductImg = document.getElementById("ProductImg");
                var SmallImg = document.getElementsByClassName("small-img");

                SmallImg[0].onclick = function () {
                    ProductImg.src = SmallImg[0].src;
                }
                SmallImg[1].onclick = function () {
                    ProductImg.src = SmallImg[1].src;
                }
                SmallImg[2].onclick = function () {
                    ProductImg.src = SmallImg[2].src;
                }
                SmallImg[3].onclick = function () {
                    ProductImg.src = SmallImg[3].src;
                }
            </script>
            <script>
                function addbook(bookItemId, quant, type) {
                    var quantity = document.getElementById("bookquantity").value;
                    $.ajax({
                        url: 'addbook',
                        type: 'POST',
                        data: {
                            bookItemId,
                            type,
                            quantity
                        },
                        success: function (data, textStatus, xhr) {
                            if (xhr.status == 302) {
                                location.href = xhr.getResponseHeader("Location");
                                return;
                            }
                            alert(data);
                        },
                        complete: function (xhr, textStatus) {
                            console.log(xhr.status);
                        }
                    });
                }
            </script>
        </body>

        </html>