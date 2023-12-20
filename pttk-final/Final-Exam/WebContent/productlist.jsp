<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Homepage | Ecommerce</title>
            <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
                integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
                crossorigin="anonymous">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
            <link rel="stylesheet" href="css/style.css">
            <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        </head>

        <body>
            <div class="header">
                <div class="container">
                    <div class="navbar">
                        <div class="logo">
                            <a href="home"><img src="images/logo.png" alt="logo" width="85px"></a>
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
                        <form action="search">
                            <input name="keywords" type="text" style="display:inline-block; width: 80%;"
                                placeholder="Search.." name="search">
                            <button type="submit" style="display:inline-block;"><i class="fa fa-search"></i></button>
                        </form>
                        <a href="cart"><img src="images/cart.png" width="30px" height="30px"></a>
                        <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                    </div>

                </div>
            </div>

            <div class="container-fluid">
                <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="images/banner3.jpg" style="width:100%;">
                        </div>

                        <div class="item">
                            <img src="images/banner2.jpg" style="width:100%;">
                        </div>

                        <div class="item">
                            <img src="images/banner1.jpg" style="width:100%;">
                        </div>

                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>
            </div>

            <!-- Featured Products -->
            <div class="small-container">
                <h2 class="title">Books</h2>
                <div class="row">
                    <c:forEach items="${listBooks}" var="product">
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/category-1.jpg" alt="img product">
                                <div class="card-body">
                                    <h4 class="card-title">${product.product.name}</h4>
                                    <h6 class="card-text">${product.product.summary}</h6>
                                    <h5 class="card-text">${product.price}đ</h5>
                                    <div class="btn btn-primary text-center" style="margin: 0px 0px;"
                                        onclick="addproduct(${product.ID}, 1, 'book')">Add
                                        to Cart</div>
                                    <form action="productdetails">
                                        <input type="hidden" name="id" value=${product.ID} />
                                        <input type="submit" class="text-center btn btn-primary btn-lg active"
                                            style="height: auto;" value="Details">
                                    </form>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="small-container">
                <h2 class="title">Phones</h2>
                <div class="row">
                    <c:forEach items="${listPhones}" var="product">
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/category-3.jpg" alt="img product">
                                <div class="card-body">
                                    <h4 class="card-title">${product.product.name}</h4>
                                    <h6 class="card-text">${product.product.summary}</h6>
                                    <h5 class="card-text">${product.price}đ</h5>
                                    <div class="btn btn-primary text-center" style="margin: 0px 0px;"
                                        onclick="addproduct(${product.ID}, 1, 'book')">Add
                                        to Cart</div>.
                                    <form action="productdetails">
                                        <input type="hidden" name="id" value=${product.ID} />
                                        <input type="submit" class="text-center btn btn-primary btn-lg active"
                                            style="height: auto;" value="Details">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div><!-- Featured Products -->
            <div class="small-container">
                <h2 class="title">Clothes</h2>
                <div class="row">
                    <c:forEach items="${listClothes}" var="product">
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/category-2.jpg" alt="img product">
                                <div class="card-body">
                                    <h4 class="card-title">${product.product.name}</h4>
                                    <h6 class="card-text">${product.product.summary}</h6>
                                    <h5 class="card-text">${product.price}đ</h5>
                                    <div class="btn btn-primary text-center" style="margin: 0px 0px;"
                                        onclick="addproduct(${product.ID}, 1, 'book')">Add
                                        to Cart</div>
                                    <form action="productdetails">
                                        <input type="hidden" name="id" value=${product.ID} />
                                        <input type="submit" class="text-center btn btn-primary btn-lg active"
                                            style="height: auto;" value="Details">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
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

            <!-- javascript -->

            <script>
                function addproduct(productItemId, quantity, type) {
                    $.ajax({
                        url: 'addproduct',
                        type: 'POST',
                        data: {
                            productItemId,
                            type,
                            quantity: quantity
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