<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.Statement" %>
    <%@page import="java.sql.ResultSet" %>
    <%@page import="java.sql.SQLException" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Order Online</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Cormorant%20Garamond.css">
    <link rel="stylesheet" href="assets/css/Herr%20Von%20Muellerhoff.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="assets/css/Account-setting-or-edit-profile.css">
    <link rel="stylesheet" href="assets/css/Articles-Cards-images.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
    <link rel="stylesheet" href="assets/css/Navbar-Centered-Brand-icons.css">
    <link rel="stylesheet" href="assets/css/Profile-Edit-Form-styles.css">
    <link rel="stylesheet" href="assets/css/Profile-Edit-Form.css">
    <link rel="stylesheet" href="assets/css/register.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Team-with-rotating-cards.css">
</head>

<body style="background: #191a1a;">
	<%
	try {
		Connection conn = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/minor_proj", "root", "Deathspree20#");
		Statement stm = conn.createStatement();
		String query = "select name from user_reg where ";
		Cookie ck[] = request.getCookies();
		if (ck != null) {
			String username = ck[0].getValue();
			if (!username.equals("") || username != null) {
				query = query.concat("email = '"+username+"'");
				ResultSet rs = stm.executeQuery(query);
				if (rs.next()) {
					String user = rs.getString(1);
					%>
					<div>
			        <nav class="navbar navbar-dark navbar-expand-md py-3" style="background: #121212;height: 95px;">
			            <div class="container-fluid"><a class="navbar-brand d-flex justify-content-center align-items-center" href="#" style="position: static;margin-right: 183px;"><img src="assets/img/ChinaTownIcon2.svg" width="192" height="84" style="display: flex;position: relative;width: 192px;"></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-4"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
			                <div class="collapse navbar-collapse flex-grow-0 order-md-first" id="navcol-4">
			                    <ul class="navbar-nav me-auto">
			                        <li class="nav-item"><a class="nav-link active" href="afterLogin.jsp">Home</a></li>
			                        <li class="nav-item"><a class="nav-link" href="mainMenuPage.jsp">Menu</a></li>
			                        <li class="nav-item"><a class="nav-link" href="AboutUs.jsp">About Us</a></li>
			                        <li class="nav-item"><a class="nav-link orderButton" href="orderOnline.jsp" style="background: #f4efef;color: rgb(6,6,6);border-radius: 4px;">Order Online</a></li>
			                    </ul>
			                </div>
			                <div class="d-inline d-md-block">
				            	<p class="d-inline" style="color: var(--bs-navbar-brand-color);">Hi,</p><a class="text-uppercase name-link-profile" href="profile.jsp" style="color: rgb(244,245,247);"><%= user %></a><i class="fas fa-user" style="color: var(--bs-navbar-brand-color);font-size: 40px;margin-right: 9px;padding-left: 11px;"></i>
				            </div>
			            </div>
			        </nav>
			    </div>
			    <div class="d-inline-flex" style="padding-bottom: 22px;height: 194.222px;">
			        <div class="container-fluid">
			            <div class="row">
			                <div class="col head-img"><img class="img-fluid d-block" src="assets/img/MEUpAGEiMAGE1.png"></div>
			            </div>
			        </div>
			    </div>
			    <div>
			        <div class="container py-4 py-xl-5" style="color: rgb(237,240,242);font-family: 'Cormorant Garamond', serif;">
			            <div class="row mb-5">
			                <div class="col-md-8 col-xl-6 text-center mx-auto">
			                    <h2>Order Online</h2>
			                    <p class="w-lg-50">Order online to get food at your doorstep within 30 minutes</p>
			                </div>
			            </div>
			            <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3">
			                <div class="col"><a class="order-link-menu" href="mainMenuPage.jsp">
			                        <div class="card" style="background: rgba(0,0,0,0);"><img class="card-img-top w-100 d-block fit-cover" data-bss-hover-animate="pulse" style="height: 200px;border-radius: 5px 5px 5px 5px;" src="assets/img/main1.png">
			                            <div class="card-body p-4">
			                                <h4 class="text-bg-dark card-title" style="text-align: center;margin-top: -11px;border-radius: 28px;">Main menu</h4>
			                            </div>
			                        </div>
			                    </a></div>
			                <div class="col"><a class="order-link-menu" href="beveragePage.jsp">
			                        <div class="card" style="background: transparent;"><img class="card-img-top w-100 d-block fit-cover" data-bss-hover-animate="pulse" style="height: 200px;border-radius: 5px 5px 5px 5px;" src="assets/img/bevereage1.png">
			                            <div class="card-body p-4">
			                                <h4 class="text-bg-dark card-title" style="text-align: center;margin-top: -11px;border-radius: 28px;">Beverages</h4>
			                            </div>
			                        </div>
			                    </a></div>
			                <div class="col"><a class="order-link-menu" href="desertPage.jsp">
			                        <div class="card" style="background: transparent;"><img class="card-img-top w-100 d-block fit-cover" data-bss-hover-animate="pulse" style="height: 200px;border-radius: 5px 5px 5px 5px;" src="assets/img/desert1.png">
			                            <div class="card-body p-4">
			                                <h4 class="text-bg-dark card-title" style="text-align: center;margin-top: -11px;border-radius: 28px;">Desert</h4>
			                            </div>
			                        </div>
			                    </a></div>
			            </div>
			        </div>
			    </div>
			    <div>
			        <footer class="text-center bg-dark">
			            <div class="container text-white py-4 py-lg-5">
			                <ul class="list-inline">
			                    <li class="list-inline-item me-4"><a class="link-light" href="#">Licence</a></li>
			                    <li class="list-inline-item me-4"><a class="link-light" href="#">Locate us</a></li>
			                    <li class="list-inline-item"><a class="link-light" href="#">Call us</a></li>
			                </ul>
			                <ul class="list-inline">
			                    <li class="list-inline-item me-4"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-facebook text-light">
			                                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
			                            </svg></a></li>
			                    <li class="list-inline-item me-4"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-twitter text-light">
			                                <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
			                            </svg></a></li>
			                    <li class="list-inline-item"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-instagram text-light">
			                                <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"></path>
			                            </svg></a></li>
			                </ul>
			                <p class="text-muted mb-0">Copyright © 2022 Brand</p>
			            </div>
			        </footer>
			    </div>
			    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
			    <script src="assets/js/bs-init.js"></script>
			    <script src="assets/js/Background-Image-Slider-1.js"></script>
			    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.js"></script>
			    <script src="assets/js/Background-Image-Slider.js"></script>
			    <script src="assets/js/Lightbox-Gallery.js"></script>
			    <script src="assets/js/Profile-Edit-Form.js"></script>
			    <%
				}
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>

</html>