<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Asean</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Expanded:400,600,700" rel="stylesheet">	
	<!-- Stylesheets -->
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="fonts/ionicons.css" rel="stylesheet">	
	<link href="css/style2.css" rel="stylesheet">
	
	
</head>	
</head>
<body>
		<%
                            if (session.getAttribute("rep") != null) {
	                        out.println(session.getAttribute("rep"));
                            }
		%>
<jsp:include page="header.jsp"></jsp:include>
	
	
	<section>
		<div class="container">
			<div class="row">
			
				<div class="col-sm-12 col-md-8">
					<h6><b>SEND US A MESSAGE</b></h6>
					<br/>
					<form action="ManagerContactServlet"  method="post"  class="form-block form-bold form-mb-20 form-h-35 form-brdr-b-grey pr-50 pr-sm-0">
						<div class="row">
						
							<div class="col-sm-12">
								<p class="color-ash">Full Name*</p>
								<div class="pos-relative">
									<input class="pr-20" type="text" name ="name" value="Leonard">
									<i class="abs-tbr lh-35 font-13 color-green ion-android-done"></i>
								</div><!-- pos-relative -->
							</div><!-- col-sm-6 -->
							
							<div class="col-sm-12">							
								<p class="color-ash">Email*</p>
								<div class="pos-relative">
									<input class="pr-20" type="email" name="email">
									<i class="dplay-none abs-tbr lh-35 font-13 color-green ion-android-done"></i>
								</div><!-- pos-relative -->
							</div><!-- col-sm-6 -->
						
							<div class="col-sm-12">	
								<p class="color-ash">Your Phone*</p>
								<div class="pos-relative">
									<input class="pr-20" type="text" name = "phone">
									<i class="dplay-none abs-tbr lh-35 font-13 color-green ion-android-done"></i>
								</div><!-- pos-relative -->
							</div><!-- col-sm-6 -->
							
							
							<div class="col-sm-12">
								<div class="pos-relative pr-80">
									<p class="color-ash">Message*</p>
									
									<textarea class="mb-0" name="question"></textarea>
									<input type="hidden" value="insert" name="command">
									<button class="abs-br font-20 plr-15 btn-fill-primary" type="submit"><i class="ion-ios-paperplane"></i></button>
								</div><!-- pos-relative -->
							</div><!-- col-sm-6 -->
							
						</div><!-- row -->
					</form>
				</div><!-- col-md-6 -->
				
				<div class="col-sm-12 col-md-4">
					<h6 class="mb-20 mt-sm-50"><b>INFORMATION</b></h6>
					
					<ul class="font-11 list-relative list-li-pl-30 list-block list-li-mb-15">
						<li><i class="abs-tl ion-ios-location"></i>HaNoi<br/>University Science and Technology</li>
						<li><i class="abs-tl ion-android-mail"></i>Infor.Pathana@gmail.com</li>
						<li><i class="abs-tl ion-android-call"></i>(+12)-345-678-910</li>
					</ul>
					
				
				</div><!-- col-md-6 -->
			</div><!-- row -->
		</div><!-- container -->
	</section>
	
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>