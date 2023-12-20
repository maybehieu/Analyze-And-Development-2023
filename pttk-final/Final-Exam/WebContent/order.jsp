<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Order | Ecommerce</title>
            <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

            <!-- Cart items details -->
            <div class="small-container">
                <div class="wrapper">
                    <h2 class="title">Order</h2>
                    <div class="table-responsive">
                        <table class="table activitites">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-uppercase header">Product</th>
                                    <th scope="col" class="text-uppercase header">Quantity</th>
                                    <th scope="col" class="text-uppercase header">Price each</th>
                                    <th scope="col" class="text-uppercase header">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${bookItems}" var="item" varStatus="i">
                                    <tr>
                                        <td class="item">
                                            <div class="d-flex"> <img src="images/book.jpg" alt="">
                                                <div class="pl-2">${item.book.title}
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <div class="text-muted">${item.book.author.name}</div>
                                                    </div>
                                                </div>
                                        </td>
                                        <td>${bookQuantity[i.index]}</td>
                                        <td class="d-flex flex-column"><span class="red">${item.price}</span> <del
                                                class="cross">-${item.discount}đ</del> </td>
                                        <td class="font-weight-bold">
                                            ${bookPrice[i.index]-item.discount*bookQuantity[i.index]}d</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="d-flex flex-column justify-content-end align-items-end">
                        <div class="d-flex px-3 pr-md-5 py-1 subtotal">
                            <div class="px-4">Subtotal</div>
                            <div class="h5 font-weight-bold px-md-2">${totalPrice}d</div>
                        </div>
                        <div class="d-flex px-3 pr-md-5 py-1 subtotal">
                            <div class="px-4">Shipment Fees</div>
                            <div class="h5 font-weight-bold px-md-2">${shipmentPrice}d</div>
                        </div>
                        <div class="d-flex px-3 pr-md-5 py-1 subtotal">
                            <div class="px-4">Payment Fees</div>
                            <div class="h5 font-weight-bold px-md-2">${paymentPrice}d</div>
                        </div>
                        <div class="d-flex px-3 pr-md-5 py-1 subtotal">
                            <div class="px-4">Discount</div>
                            <div class="h5 font-weight-bold px-md-2">${discount}d</div>
                        </div>
                        <div class="d-flex px-3 pr-md-5 py-1 subtotal">
                            <div class="px-4">Total</div>
                            <div class="h5 font-weight-bold px-md-2">${total}d</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col text-center">
                <a href="home" class="text-center btn btn-primary btn-lg active" role="button" aria-pressed="true">Back
                    to Homepage</a>
            </div>
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

        </body>

        </html>