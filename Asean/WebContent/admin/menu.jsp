<%-- 
    Document   : menu
    Created on : Dec 13, 2018, 9:16:51 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="${pageContext.request.contextPath}/admin/content/dist/img/pathana.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>Admin</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>

                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">Main Function</li>
                     <li><a href="${pageContext.request.contextPath}/admin/index.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manager_category.jsp"><i class="fa fa-object-group"></i> <span> Management Category</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manager_news.jsp"><i class="fa fa-copy"></i> <span> Management News</span></a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manager_users.jsp"><i class="fa fa-venus-mars"></i> <span> Management Users</span></a></li>
                	<li><a href="${pageContext.request.contextPath}/admin/manager_contact.jsp"><i class="fa fa-wechat"></i> <span> Management Contact</span></a></li>
                	
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
    </body>
</html>
