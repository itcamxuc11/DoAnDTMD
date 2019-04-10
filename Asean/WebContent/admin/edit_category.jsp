<%-- 
    Document   : edit_category
    Created on : Dec 14, 2018, 11:11:54 PM
    Auth or     : Pathana
--%>
 
<%@page import="model.Category"%>
<%@page import="model.News"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="${pageContext.request.contextPath}/images/icon.ico" type="image/png" />
        <title>Admin</title>
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

        <link href="${pageContext.request.contextPath}/admin/content/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <%
            if (session.getAttribute("userAdmin") == null) {
                response.sendRedirect("/Asean/admin/login.jsp");
            }
            CategoryDAO categoryDAO = new CategoryDAO();
            Category category = new Category();
            String categoryID = "";
            if (request.getParameter("categoryID") != null) {
                categoryID = request.getParameter("categoryID");
                category = categoryDAO.getCategory(Long.parseLong(categoryID));
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
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            List News

                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/manager_category.jsp">Category</a></li>
                            <li class="active">Edit</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">Edit</h3>
                            </div><!-- /.box-header -->
                            <!-- form start -->
                            <form class="form-horizontal" action="/Asean/ManagerCategoryServlet" method="post">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-2 control-label">Category Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="tenDanhMuc" value="<%=category.getCategoryName()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label">Category Group</label>
                                    <div class="col-sm-10">
                                        <%
                                            if (category.getCategoryGroup().equals("Nam")) {
                                        %>
                                        <input type="radio" name="groupDanhMuc" value='Living' checked> Living
                                        <input type="radio" name="groupDanhMuc" value='News'> News        
                                        <%} else { %>
                                        <input type="radio" name="groupDanhMuc" value='Living'> Living          
                                        <input type="radio" name="groupDanhMuc" value='News' checked> News
                                        <%}%>

                                    </div>
                                </div>
                            </div><!-- /.box-body -->
                            <div class="box-footer">
                                <a href='${pageContext.request.contextPath}/admin/manager_category.jsp' class="btn btn-default">Delete</a> 
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="category_id" value="<%=categoryID%>">
                                <input type="submit" class="btn btn-success pull-right" value='Update'/>
                            </div><!-- /.box-footer -->
                        </form>
                    </div><!-- /.box -->
                </section><!-- /.content -->
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
    </body>
</html>
