<%-- 
    Document   : index
    Created on : Dec 30, 2018, 3:04:35 PM
    Author     : Pathana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <head>
        <title>Signup</title>
        <!--css-->
        <link rel="icon" href="${pageContext.request.contextPath}/images/icon.ico" type="image/png" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/font-awesome.css" rel="stylesheet">
        <!--css-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="keywords" content="New Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script src="js/jquery.min.js"></script>
        <link href="//fonts.googleapis.com/css?family=Cagliostro" rel="stylesheet" type="text/css">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,800italic,800,700italic,700,600italic,600,400italic,300italic,300" rel="stylesheet" type="text/css">
        <!--search jQuery-->
        <script src="js/main.js"></script>
        <!--search jQuery-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <!--mycart-->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- cart -->
        <script src="js/simpleCart.min.js"></script>
        <!-- cart -->
        <!--start-rate-->
        <script src="js/jstarbox.js"></script>
        <link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8">
        <script type="text/javascript">
            jQuery(function () {
                jQuery('.starbox').each(function () {
                    var starbox = jQuery(this);
                    starbox.starbox({
                        average: starbox.attr('data-start-value'),
                        changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
                        ghosting: starbox.hasClass('ghosting'),
                        autoUpdateAverage: starbox.hasClass('autoupdate'),
                        buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
                        stars: starbox.attr('data-star-count') || 5
                    }).bind('starbox-value-changed', function (event, value) {
                        if (starbox.hasClass('random')) {
                            var val = Math.random();
                            starbox.next().text(' ' + val);
                            return val;
                        }
                    })
                });
            });
        </script>
        <!--//End-rate-->
    </head>
    <body>
        <!--header-->
        <jsp:include page="header.jsp"></jsp:include>
            <!--header-->
            <!--content-->
            
            <div class="content">
                <!--login-->
                <div class="login">
                    <div class="main-agileits">
                        <div class="form-w3agile form1">
                            <h3>Signup</h3>
                            <form action="UsersServlet" method="post" id = "signupform">
                                <span style="color: red" id="errEmail"></span>
                                <div class="key">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <input type="text" name="Email" id="Email" data-error="#errEmail" placeholder="Please enter Email">
                                    <div class="clearfix"></div>
                                </div>
                                
                                <span style="color: red" id="errName"></span>
                                <div class="key">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <input type="text" name="Name" id="Name" data-error="#errName" placeholder="Please enter username">
                                    <div class="clearfix"></div>
                                </div>
                                
                                <span style="color: red" id="errPassword"></span>
                                <div class="key">
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                    <input type="password" name="Password" id="Password" data-error="#errPassword" placeholder="Please enter password">
                                    <div class="clearfix"></div>
                                </div>
                                
                                <span style="color: red" id="errRePassword"></span>
                                <div class="key">
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                    <input type="password" name="RePassword" id="RePassword" data-error="#errRePassword" placeholder="Repassword">
                                    <div class="clearfix"></div>
                                </div>
                                <input type="hidden" value="insert" name="command">
                                <input type="submit" value="Signup">
                            </form>
                        </div>
						<div class="forg">
                        <a href="login.jsp" class="forg-right">Login your account!</a>
                        <div class="clearfix"></div>
                    </div>
                    </div>
                </div>
                <!--login-->
            </div>
            <!--content-->
            <!---footer--->
        <!---footer--->
        <script src="js/jquery.validate.min.js" type="text/javascript"></script>
        <script>
            $(document)
                    .ready(function () {
                        $("#signupform").validate({
                            rules: {
                                Name: {
                                    required: true
                                },
                                Password: {
                                    required: true,
                                    minlength: 5
                                },
                                RePassword: {
                                    equalTo: "#Password"
                                },
                                Email: {
                                    required: true,
                                    email: true
                                }
                            },
                            messages: {
                                Name: {
                                    required: "User name must not be blank!"
                                },
                                Password: {
                                    required: "User pass must not be blank!",
                                    minlength: "At least 5 characters"
                                },
                                RePassword: {
                                    equalTo: "Does not match password!"
                                },
                                Email: {
                                    required: "Email must not be blank!",
                                    email: "Invalid email!"
                                }
                            },
                            errorPlacement: function (error, element) {
                                var placement = $(element).data('error');
                                if (placement) {
                                    $(placement).append(error);
                                } else {
                                    error.insertAfter(element);
                                }
                            }
                        });
                    });
        </script>
    </body>
</html>