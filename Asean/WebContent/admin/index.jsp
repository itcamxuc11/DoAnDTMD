<%-- 
    Document   : index
    Created on : Dec 13, 2018, 9:18:16 AM
    Author     : Admin 
--%>
 
<%@page import="java.util.Date"%>

<%@page import="model.News"%>
<%@page import="dao.NewsDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin</title>
        <link rel="icon" href="${pageContext.request.contextPath}/images/icon.ico" type="image/png" />
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link href="${pageContext.request.contextPath}/admin/content/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath}/admin/content/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link href="${pageContext.request.contextPath}/admin/content/bootstrap/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/admin/content/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
        
	<%@page import="model.Users"%>
	<%@page import="model.Category"%>  
	<%@page import="dao.CategoryDAO"%>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
		
		
		
        <%
        	if (session.getAttribute("userAdmin") == null) {
                                response.sendRedirect("/Asean/admin/login.jsp");
                            }
                            NewsDAO productDAO = new NewsDAO();

                          
        %>
        
        <%
            Users users = null;
            if (session.getAttribute("userAdmin") != null) {
                users = (Users) session.getAttribute("userAdmin");
            }
            

        %>

        <!-- Site wrapper -->
        <div class="wrapper">
            <jsp:include page="header.jsp"></jsp:include>
                <!-- =============================================== -->
                <!-- Left side column. contains the sidebar -->
            <jsp:include page="menu.jsp"></jsp:include>
                <!-- =============================================== -->
                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">

                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Dashboard
                        </h1>
                        <%
                            if (session.getAttribute("userAdmin") != null) {
                        %>
                        <p>Welcome <%=users.getUserName()%> to admin page!</p>
                        <%
                        }
                        %>
                    </section>
                    
                <!-- /.content -->

            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="footer.jsp"></jsp:include>
                <!-- Control Sidebar -->

            </div>
            <!-- ./wrapper -->


            <!-- jQuery 2.2.3 -->
            <script src="${pageContext.request.contextPath}/admin/content/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/admin/content/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Bootstrap 3.3.6 -->
        <!-- SlimScroll -->
        <script src="${pageContext.request.contextPath}/admin/content/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="${pageContext.request.contextPath}/admin/content/plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/admin/content/dist/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/admin/content/dist/js/demo.js"></script>
        <script src="${pageContext.request.contextPath}/admin/content/bootstrap/js/bootstrap-datepicker.min.js"></script>

        <script language="javascript">
                                            function GetData() {
                                                if ($('#date').val() == "")
                                                {
                                                    return false;
                                                } else if ($('#date2').val() == "")
                                                {
                                                    return false;
                                                }

                                                return true;
                                            }
        </script>


        <script>
            $(document).ready(function () {
                var date_input = $('input[name="date"]'); //our date input has the name "date"
                var date_input2 = $('input[name="date2"]'); //our date input has the name "date"
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                date_input.datepicker({
                    format: 'mm/dd/yyyy',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                })
                date_input2.datepicker({
                    format: 'mm/dd/yyyy',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                })
            })
        </script>

    </body>
</html>
