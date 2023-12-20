<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login | Ecommerce</title>
            <link rel="stylesheet" href="css/style.css">
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </head>

        <body>
            <!-- <div class="container" style="background-color: #fd8585;">
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
                    <li><a href="account.html">Account</a></li>
                </ul>
            </nav>
            <a href="cart.html"><img src="images/cart.png" width="30px" height="30px"></a>
            <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
        </div>
    </div>  -->

            <!-- Account Page -->
            <div class="account-page">
                <div class="container">
                    <div class="row">
                        <div class="col-8">
                            <img src="images/image1.png" width="75%">
                        </div>
                        <div class="col-2">
                            <div class="form-container">
                                <div class="form-btn">
                                    <span onclick="login()">Login</span>
                                    <span onclick="register()">Register</span>
                                    <hr id="Indicator">
                                </div>
                                <form id="LoginForm" action="login" method="POST">
                                    <input name="username" type="text" placeholder="Username" required>
                                    <input name="password" type="password" placeholder="Password" required>
                                    <button type="submit" class="btn">Login</button>
                                    <a href="home" class="btn">Go to Homepage</a>
                                </form>

                                <form id="RegForm" action="register" method="POST"
                                    style="height: calc(100% - 180px); overflow-y: auto;">
                                    <input name="usernameReg" type="text" placeholder="Username" required>
                                    <input name="passwordReg" type="password" placeholder="Password" required>
                                    <input name="firstName" type="text" placeholder="First Name" required>
                                    <input name="lastName" type="text" placeholder="Last Name" required>
                                    <input name="gender" type="text" placeholder="Gender" required>
                                    <input name="phoneNum" type="text" placeholder="Phone Number" required>
                                    <input name="type" type="text" placeholder="Phone Type" required>
                                    <input name="city" type="text" placeholder="City" required>
                                    <input name="district" type="text" placeholder="District" required>
                                    <input name="houseNo" type="text" placeholder="House No" required>
                                    <input name="day" type="text" placeholder="Birth Day" required>
                                    <input name="month" type="text" placeholder="Birth Month" required>
                                    <input name="years" type="text" placeholder="Birth Year" required>
                                    <input name="accountNum" type="text" placeholder="Account Number" required>
                                    <div class="btn btn-primary text-center" onclick="register1()">Register</div>
                                    <!-- <button type="submit" class="btn">Register</button> -->
                                </form>
                            </div>
                        </div>
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

            <!-- Toggle Form -->
            <script>
                var LoginForm = document.getElementById("LoginForm");
                var RegForm = document.getElementById("RegForm");
                var Indicator = document.getElementById("Indicator");
                function register() {
                    RegForm.style.transform = "translatex(0px)";
                    LoginForm.style.transform = "translatex(0px)";
                    Indicator.style.transform = "translateX(100px)";

                }
                function login() {
                    RegForm.style.transform = "translatex(300px)";
                    LoginForm.style.transform = "translatex(300px)";
                    Indicator.style.transform = "translate(0px)";

                }
                login();
            </script>

            <script>
                function register1() {
                    var firstName = $('input[name="firstName"]').val();
                    var lastName = $('input[name="lastName"]').val();
                    var gender = $('input[name="gender"]').val();
                    var username = $('input[name="usernameReg"]').val();
                    var password = $('input[name="passwordReg"]').val();
                    var phoneNum = $('input[name="phoneNum"]').val();
                    var type = $('input[name="type"]').val();
                    var accountNum = $('input[name="accountNum"]').val();
                    var city = $('input[name="city"]').val();
                    var district = $('input[name="district"]').val();
                    var houseNo = $('input[name="houseNo"]').val();
                    var day = $('input[name="day"]').val();
                    var month = $('input[name="month"]').val();
                    var years = $('input[name="years"]').val();
                    $(':input', '#RegForm').val('');
                    $.ajax({
                        url: 'register',
                        type: 'POST',
                        data: {
                            firstName,
                            lastName,
                            gender,
                            username,
                            password,
                            phoneNum,
                            type,
                            accountNum,
                            city,
                            district,
                            houseNo,
                            day,
                            month,
                            years
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