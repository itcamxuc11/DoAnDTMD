

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <head>
        <title>Login</title>
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
        <link href="//fonts.googleapis.com/css?family=Cagliostro" rel="stylesheet" type="text/css">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,800italic,800,700italic,700,600italic,600,400italic,300italic,300" rel="stylesheet" type="text/css">
        <!--search jQuery-->
        <!--search jQuery-->
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
                        <div class="form-w3agile">
                            <h3>Login</h3>
                            <form action="UsersServlet" method="post">
                            <%if (request.getAttribute("error") != null) {%>
                            <div>
                                <p style="color:red"><%=request.getAttribute("error")%></p>
                            </div> 
                            <%}%>
                            
                            <span style="color: red" id="errEmail"></span>
                                <div class="key">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <input type="text" name="Email" id="Email" data-error="#errEmail" placeholder="Please enter Email!">
                                    <div class="clearfix"></div>
                                </div>
                                
                                <span style="color: red" id="errPassword"></span>
                                <div class="key">
                                    <i class="fa fa-lock" aria-hidden="true"></i>
                                    <input type="password" name="Password" id="Password" data-error="#errPassword" placeholder="Please enter password!">
                                    <div class="clearfix"></div>
                                </div>
                             <input type="hidden" value="login" name="command">   
                            <input type="submit" value="Login">
                        </form>
                    </div>
                    <div class="forg">
                        <a href="signup.jsp" class="forg-right">Signup a new account!</a>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!--login-->
        </div>
        <!--content-->
        <!---footer--->
        <!---footer--->
    </body>
</html>