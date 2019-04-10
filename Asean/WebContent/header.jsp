<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Asean</title>
	<link href="css/bootstrap.css" rel="stylesheet">

    <!-- font-awesome -->

    <link href="css/style1.css" rel="stylesheet">
 	 

  
<%@page import="model.Users"%>
<%@page import="model.Category"%>  
<%@page import="dao.CategoryDAO"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
       <%
            Users users = null;
            if (session.getAttribute("user") != null) {
                users = (Users) session.getAttribute("user");
            }
            

        %>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
        %>
<!-- Page Preloader -->
<div id="preloader">
    <div id="status">
        <div class="status-mes"></div>
    </div>
</div>
<!-- preloader -->


<div class="content-wrapper">

    <div class="container">
        <div class="header-section">
            <div class="row">
                <div class="col-md-4">
                    <div class="left_section">
                         <span class="date"><%= (new java.util.Date()).toLocaleString()%></span>
                        
                    </div>
                    <!-- Left Header Section -->
                </div>
                <div class="col-md-4">
                    <div class="logo">
                        <a href="index.jsp"><h2>ASEAN</h2></a>
                    </div>
                    <!-- Logo Section -->
                </div>
                <div class="col-md-4">
                    <div class="right_section">
                        <ul class="nav navbar-nav">
                        	<%
                            if (session.getAttribute("user") != null) {
	                        %>
	                        <li><a href="#"><%=users.getUserName()%></a></li>
	                        <li><a href="UsersServlet"> Logout </a></li>
	                        <%
	                            }else
	                            {
	                        %>
	                        <li><a href="login.jsp">Login</a></li>
	                        <li><a href="signup.jsp">Signup</a></li>
	                        
	                        <%
	                              }
	                        %>
							<li><a href="contact.jsp">Contact</a></li>
                            <li class="dropdown lang">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">English <i
                                        class="fa fa-angle-down"></i></button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li><a href="#">Chinese</a></li>
                                    <li><a href="#">Spanish</a></li>
                                    <li><a href="#">Hindi</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- Language Section -->

                        <!-- Search Section -->
                    </div>
                    <!-- Right Header Section -->
                </div>
            </div>
        </div>
        <!-- Header Section -->

        <div class="navigation-section">
            <nav class="navbar m-menu navbar-default">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#navbar-collapse-1"><span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="#navbar-collapse-1">
                        <ul class="nav navbar-nav main-nav">
                        	<li><a href="index.jsp"><h3>Home</h3></a></li>
                        	<%
		                    	for (Category c : categoryDAO.getListCategoryForNews()) {
		                    %>
		                    	<li><a href="news.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><h3><%=c.getCategoryName()%></h3></a>&nbsp;&nbsp;</li>
		                    <%
		                    	}
		                    %>
						
							
						
								  
		                    <%
		                        for (Category c : categoryDAO.getListCategoryForLiving()) {
		                    %>
		                     	<li><a href="news.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><h3><%=c.getCategoryName()%></h3></a>&nbsp;&nbsp;</li>
		                    <%
		                      	}
		                    %>
                        </ul>
                    </div>
                    <!-- .navbar-collapse -->
                </div>
                <!-- .container -->
            </nav>
            <!-- .nav -->
        </div>
        <!-- .navigation-section -->
    </div>
    <!-- .container -->


</div>

</body>
</html>