<%-- 
    Document   : manager_category
    Created on : Dec 14, 2018, 8:33:38 AM
    Author     : Pathana 
--%>
 
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
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

            int pages = 1;
            int recordsPerPage = 5;

            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            String keyword = "";
            if (request.getParameter("keyword") != null) {
                keyword = request.getParameter("keyword");
            }
            ArrayList<Category> listCategory = categoryDAO.getListCategoryPageList(keyword, (pages - 1) * recordsPerPage, recordsPerPage);

            int noOfRecords = categoryDAO.countCategory();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
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
                            List Category

                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="${pageContext.request.contextPath}/admin/index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">List Category</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <!-- Default box -->
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">List</h3>
                                <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                                    <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="row">

                                    <div class="col-md-6">
                                        <form method="get" action="/Asean/ManagerCategoryServlet">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="keyword" value="<%=keyword%>" placeholder="Keyword">
                                            <input type="hidden" name="command" value="search">
                                            <span class="input-group-btn">  
                                                <button class="btn btn-default" type="submit" > 
                                                    Search
                                                </button>
                                            </span>
                                        </div>
                                    </form>

                                </div>
                                <div class="col-md-6">
                                    <button onclick="window.location.href = '${pageContext.request.contextPath}/admin/insert_category.jsp'" class="btn btn-success">Add New</button>
                                </div>
                            </div>
                                <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <tr>
                                            
                                            <th style="width:10%">ID</th>
                                            <th style="width: 35%">Category Name</th>
                                            <th style="width: 40%">Category Group</th>
                                            <th style="width: 10%">Action</th>
                                        </tr>
                                        <%                                            int count = 0;
                                            for (Category category : listCategory) {
                                                count++;
                                        %>
                                        <tr>
                                            
                                            <td><%=count%></td>
                                            <td>
                                                <%=category.getCategoryName()%>
                                            </td>
                                            <!--class="badge bg-red"-->
                                            <td>
                                                <%=category.getCategoryGroup()%>
                                            </td>
                                            <td>
                                                <a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/admin/edit_category.jsp?categoryID=<%=category.getCategoryID()%>"><i class="fa fa-pencil"></i></a>
                                                <a class="btn  btn-sm btn-danger" href="/Asean/ManagerCategoryServlet?command=delete&category_id=<%=category.getCategoryID()%>"><i class="fa fa-trash"></i></a>
                                            </td>
                                        </tr>
                                        <%}%>
                                        <tfoot>
                                            <tr>
                                                <td colspan="6"><span class="pull-right">Page: <%=(pages)%> - Total of recorders: <%=noOfRecords%></span></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <ul class="pagination pagination-sm">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <%for (int i = 1; i <= noOfPages; i++) {%>
                                <li><a href="${pageContext.request.contextPath}/admin/manager_category.jsp?pages=<%=i%>"><%=i%></a></li>
                                    <%}%>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </div><!-- /.box-footer-->
                    </div><!-- /.box -->
                </section><!-- /.content -->
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
    </body>
</html>
