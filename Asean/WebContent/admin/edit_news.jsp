<%-- 
    Document   : update_product
    Created on : May 15, 2017, 23:36:31 AM
    Author     : ThuyenBu 
--%>
 
<%@page import="dao.NewsDAO"%>
<%@page import="model.News"%>
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
        <title>Update News</title>
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
                            NewsDAO productDAO = new NewsDAO();
                            News product = new News();
                            String productID = "";
                            if (request.getParameter("productID") != null) {
                                productID = request.getParameter("productID");
                                product = productDAO.getProduct(Long.parseLong(productID));
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
                            Update News
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="index.jsp"><i class="fa fa-dashboard"></i>Home</a></li>
                            <li><a href="manager_news">News</a></li>
                            <li class="active">Update</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <!-- Horizontal Form -->
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <h3 class="box-title">News Information</h3>
                            </div><!-- /.box-header -->
                            <!-- form start -->
                            <form action="/Asean/UpdateNewsServlet" method="post" class="form-horizontal" enctype="multipart/form-data">
                                <div class="box-body">
                                    <input type="text" hidden name="product_id" value="<%=productID%>">
		                    <div class="form-group">
                                        <label class="col-sm-2 control-label">News</label>
                                        <div class="col-sm-8">
                                            <input id="proname" type="text" class="form-control" name="productname" value="<%=product.getNewsTitle()%>" placeholder="Tên sản phẩm">		                      	
                                            <span id="msgProductName" style="color:red" hidden>Please enter title!</span>
                                        </div>		                      
		                    </div>  
		                    
		                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Category</label>
                                        <div class="col-sm-8">                             
                                            <select name="categoryid" id="categoryid" class="form-control">
                                            <% 
                        			//out.print("<option value="+0+">--- Chọn thể loại ---</option>");
                        			CategoryDAO categoryDAO = new CategoryDAO();
		                    		ArrayList<Category>  listCategory = categoryDAO.getListCategory();
                        			if(listCategory != null){
                                                    
                                                    for(Category category : listCategory){   
                                                        if(category.getCategoryID() == product.getCategoryID())
                                                        {
                                                            out.print("<option value="+category.getCategoryID()+">"+ category.getCategoryName() +"</option>");
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                    for(Category cate : listCategory){
                                                        if(cate.getCategoryID() != product.getCategoryID())
                                                        {
                                                            out.print("<option value="+cate.getCategoryID()+">"+ cate.getCategoryName() +"</option>");
                                                        }
                                                        
                            			}
                           			}
                                            %> 
                                            </select>	
                                            <span id="msgCate" style="color:red" hidden>Please choose category!</span>
                                        </div>		                      
		                    </div> 
		                    
		                    
                                            
                                      
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Image</label>
                                        <div class="col-sm-8">
                                            <input onchange="readURL(this);" value="<%=product.getNewsImage() %>" type="file" id="file" name="files[]"  class="btn btn-white btn-warning btn-bold">	                                            
                                            <img width="160" height="230" alt="Hình ảnh" hidden style="border:1px solid black;" id="showAvatar" > 
                                        </div>		                      
		                    </div>       
                                            
		                    	                   
		                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Content</label>
                                        <div class="col-sm-8">
                                              <input id="des" type="text" class="form-control" value="<%=product.getNewsContent()%>" name="description" placeholder="Diễn giải">	                      	
                                             <span id="msgDes" style="color:red" hidden>Please enter content!</span>
                                        </div>		                      
		                    </div>       
                                </div>
		                 
		                 <div class="box-footer">
                                    <a href='manager_product.jsp' class="btn btn-default">Delete</a> 
                                    <input type="hidden" name="command" value="update"> 
                                    <input onclick="return SaveProduct();" id="btnUpdate" type="submit" class="btn btn-success pull-right" value='Update'/>
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
            
            function SaveProduct(){
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
