<%-- 
    Document   : update_Users
    Created on : Dec 15, 2018, 23:36:31 AM
    Author     : Pathana 
--%>
 
<%@page import="dao.UsersDAO"%>
<%@page import="model.Users"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="${pageContext.request.contextPath}/images/icon.ico" type="image/png" />
        <title>Update Users</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link href="${pageContext.request.contextPath}/admin/content/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link href="${pageContext.request.contextPath}/admin/content/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/admin/content/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <%
        	if (session.getAttribute("userAdmin") == null) {
                                response.sendRedirect("/Asean/admin/login.jsp");
                            }
                            UsersDAO usersDAO = new UsersDAO();
                            Users users = new Users();
                            String userID = "";
                            if (request.getParameter("userID") != null) {
                                userID = request.getParameter("userID");
                                users = usersDAO.getUser(Long.parseLong(userID));
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
                            Update Users
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="index.jsp"><i class="fa fa-dashboard"></i>Home</a></li>
                            <li><a href="manager_news">Users</a></li>
                            <li class="active">Update</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">User Information</h3>
                            </div><!-- /.box-header -->
                            <!-- form start -->
                            <form action="/Asean/ManagerUsersServlet" method="post" class="form-horizontal" >
                                <div class="box-body">
                                    <input type="text" hidden name="userid" value="<%=userID%>">
		                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-8">
                                            <input id="proname" type="text" class="form-control" name="useremail" value="<%=users.getUserEmail()%>" placeholder="Email">		                      	
                                            <span id="msgProductName" style="color:red" hidden>Please enter email!</span>
                                        </div>		                      
		                    </div>                
 	                    	                   
		                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Name</label>
                                        <div class="col-sm-8">
                                              <input id="des" type="text" class="form-control" name="username" value="<%=users.getUserName()%>"  placeholder="User Name">	                      	
                                             <span id="msgDes" style="color:red" hidden>Please enter Name!</span>
                                        </div>		                      
		                    </div>             
                       </div>
		                 
		                 <div class="box-footer">
                                    <a href='manager_users.jsp' class="btn btn-default">Delete</a> 
                                    <input type="hidden" name="command" value="update"> 
                                    <input onclick="return SaveUser();" id="btnUpdate" type="submit" class="btn btn-success pull-right" value='Update'/>
                                </div>
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
        <script src="${pageContext.request.contextPath}/admin/content/dist/js/autoNumeric.js"></script>
        
         <script language="javascript">  
                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            $('#showAvatar').prop('hidden', false);
                            $('#showAvatar').attr('src', e.target.result);
                        };
                        reader.readAsDataURL(input.files[0]);
                    }
                }
        </script>
        
         <script language="javascript">  
            $(document).ready(function () {
                $('#price').bind('blur focusout keypress keyup', function () {
                    
                })
            });
            
        </script>
        
        <script language="javascript">  
            
            function isNumberKey(evt){
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
            
            function SaveUser(){
                if($('#proname').val() == "")
                {
                    $('#msgProductName').prop('hidden', false);
                    
                    if($('#des').val() == "")
                    {
                        $('#msgDes').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgDes').prop('hidden', true);
                    }
                    
                   
                    
                    if($('#categoryid').val() == 0)
                    {
                        $('#msgCate').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgCate').prop('hidden', true);
                    }
                                  
                    return false;
                }
                else if($('#des').val() == "")
                {
                    $('#msgDes').prop('hidden', false);
                    
                    if($('#proname').val() == "")
                    {
                        $('#msgProductName').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgProductName').prop('hidden', true);
                    }
                    
                    if($('#price').val() == "")
                    {
                        $('#msgPrice').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgPrice').prop('hidden', true);
                    }
                    
                    if($('#quantity').val() == "")
                    {
                        $('#msgQuantity').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgQuantity').prop('hidden', true);
                    }
                    
                    if($('#categoryid').val() == 0)
                    {
                        $('#msgCate').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgCate').prop('hidden', true);
                    }
                                       
                    return false;
                }             
                else if($('#price').val() == "")
                {
                    $('#msgPrice').prop('hidden', false);
                    
                    if($('#proname').val() == "")
                    {
                        $('#msgProductName').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgProductName').prop('hidden', true);
                    }                                 
                   
                    if($('#quantity').val() == "")
                    {
                        $('#msgQuantity').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgQuantity').prop('hidden', true);
                    }
                    
                    if($('#categoryid').val() == 0)
                    {
                        $('#msgCate').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgCate').prop('hidden', true);
                    }
                    
                     if($('#des').val() == "")
                    {
                        $('#msgDes').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgDes').prop('hidden', true);
                    }
                    return false;
                }
                else if($('#categoryid').val() == "")
                {
                    $('#msgCate').prop('hidden', false);
                    
                    if($('#proname').val() == "")
                    {
                        $('#msgProductName').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgProductName').prop('hidden', true);
                    }
                    
                    if($('#quantity').val() == "")
                    {
                        $('#msgQuantity').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgQuantity').prop('hidden', true);
                    }                                    
                    
                    if($('#price').val() == "")
                    {
                        $('#msgPrice').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgCate').prop('hidden', true);
                    }
                    
                     if($('#des').val() == "")
                    {
                        $('#msgDes').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgDes').prop('hidden', true);
                    }
                    return false;
                }
                 else if($('#quantity').val() == "")
                {
                    $('#msgQuantity').prop('hidden', false);
                    
                    if($('#proname').val() == "")
                    {
                        $('#msgProductName').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgProductName').prop('hidden', true);
                    }
                    
                    if($('#categoryid').val() == "")
                    {
                        $('#msgCate').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgCate').prop('hidden', true);
                    }                               
                    
                    if($('#price').val() == "")
                    {
                        $('#msgPrice').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgCate').prop('hidden', true);
                    }
                    
                     if($('#des').val() == "")
                    {
                        $('#msgDes').prop('hidden', false);
                    }
                    else
                    {
                        $('#msgDes').prop('hidden', true);
                    }
                    return false;
                }
               
                
                return true;
            }
        </script>
        
    </body>
</html>
