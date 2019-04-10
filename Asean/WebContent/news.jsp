<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.News"%>
<%@page import="dao.NewsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Newsbit</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	

	
	<link href="css/bootstrap.css" rel="stylesheet">
	
	<link href="css/style2.css" rel="stylesheet">
	
	<!--css-->
        <link rel="icon" href="${pageContext.request.contextPath}/images/icon.ico" type="image/png" />
        <!--css-->
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        
        <!--mycart-->
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!-- cart -->
        <script src="js/simpleCart.min.js"></script>
        <!-- cart -->
</head>
<body>

        <%
        	NewsDAO productDAO = new NewsDAO();
                            CategoryDAO categoryDAO = new CategoryDAO();
                            
                            long categoryID = 0;
                            if (request.getParameter("categoryID") != null) {
                                categoryID = (long) Long.parseLong(request.getParameter("categoryID"));
                            }
                            

                            // Phân trang
                            int pages = 0, firstResult = 0, maxResult = 0, total = 0;
                            if (request.getParameter("pages") != null) {
                                pages = (int) Integer.parseInt(request.getParameter("pages"));
                            }

                            total = productDAO.countProductByCategory(categoryID);
                            if (total <= 8) {
                                firstResult = 1;
                                maxResult = total;
                            } else {
                                firstResult = (pages - 1) * 8;
                                maxResult = 8;
                            }

                            ArrayList<News> listProduct = productDAO.getListProductByNav(
                                    categoryID, firstResult, maxResult);
        %>
        <!--header-->
        <jsp:include page="header.jsp"></jsp:include>
            <!--header-->
	
	
	
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-7">
					<div class="col-md-12 ">
					<h5 class="p-title"><b>NEWS</b></h5>
    				<%
						for (News p : listProduct) {
					%>
					<a class="oflow-hidden pos-relative mb-20 dplay-block" href="#">
    				<h4><%=p.getNewsTitle()%></h4></a>
					<div class="row">
						<div class="col-sm-6">
							<img src="<%=p.getNewsImage()%>" alt="<%=p.getNewsTitle()%>">
						</div><!-- col-sm-6 -->
						<div class="col-sm-6">
							<p><%=p.getNewsContent()%></p>
							<h6 class="color-lite-black pt-10">by <span class="color-black"><b> Admin</b></span> Jan 25, 2018</h6>
						</div><!-- col-sm-6 -->
						
					</div><!-- row -->
					<br/>
					<hr style="border-top: 1px solid #ccc;"/>				
					<%
                    	}
                    %>
				</div><!-- col-md-9 -->				
					
				</div><!-- col-md-9 -->
				
				<div class="d-none d-md-block d-lg-none col-md-3"></div>
				<div class="col-md-6 col-lg-4">
					
							<h6 class="p-title"><b>POPULAR POSTS</b></h6>
							<a class="oflow-hidden pos-relative mb-20 dplay-block" href="#">
								<div class="wh-100x abs-tlr"><img src="images/boeing.jpg" alt=""></div>
								<div class="ml-120 min-h-100x">
									<h6>Boeing 707 cargo plane with at least nine on board crashes in Iran</h6>
									<h6 class="color-lite-black pt-10">by <span class="color-black"><b>Admin,</b></span> Jan 25, 2018</h6>
								</div>
							</a><!-- oflow-hidden -->
							
							<a class="oflow-hidden pos-relative mb-20 dplay-block" href="#">
								<div class="wh-100x abs-tlr"><img src="images/lucky.png" alt=""></div>
								<div class="ml-120 min-h-100x">
									<h6>Lucky Japan reach Asian Cup knockouts as Qatar hit North Korea for six</h6>
									<h6 class="color-lite-black pt-10">by <span class="color-black"><b>Admin,</b></span> Jan 25, 2018</h6>
								</div>
							</a><!-- oflow-hidden -->
							<a class="oflow-hidden pos-relative mb-20 dplay-block" href="#">
								<div class="wh-100x abs-tlr"><img src="images/fox.png" alt=""></div>
								<div class="ml-120 min-h-100x">
									<h6>Fox Sports: Vietnam goalkeeper one to watch at Asian Cup</h6>
									<h6 class="color-lite-black pt-10">by <span class="color-black"><b>Admin,</b></span> Jan 25, 2018</h6>
								</div>
							</a><!-- oflow-hidden -->	
							
							<a class="oflow-hidden pos-relative mb-20 dplay-block" href="#">
								<div class="wh-100x abs-tlr"><img src="images/mere.jpg" alt=""></div>
								<div class="ml-120 min-h-100x">
									<h6>Meredith moves to sell Time, Fortune and Sports Illustrated titles: sources</h6>
									<h6 class="color-lite-black pt-10">by <span class="color-black"><b>Admin,</b></span> Jan 25, 2018</h6>
								</div>
							</a><!-- oflow-hidden -->	
						</div><!-- mtb-50 -->
						
					
					</div><!--  pl-20 -->
				
		</div><!-- container -->
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- SCIPTS -->
	
	<script src="plugin-frameworks/jquery-3.2.1.min.js"></script>
	
	<script src="plugin-frameworks/tether.min.js"></script>
	
	<script src="plugin-frameworks/bootstrap.js"></script>
	
	<script src="common/scripts.js"></script>
</body>
</html>