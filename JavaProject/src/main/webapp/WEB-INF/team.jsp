<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Team</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/CSS/Team.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<a href="/home"><img src="/resources/imgs/TestLogoOne.png" /></a>
			<h1>Meet the Team!!!</h1>
			<div class="admin-links">
				<c:if test="${admin == 1}">
					<p style="color: red">Admin Privileges In Use</p>
					<a style="color: red" href="/adminpage">Admin Page</a>
				</c:if>
			</div>
			<div class="header-links">
				<c:if test="${user_id != null}">
					<a class="links" href="/logout">Logout</a>
				</c:if>
				<c:if test="${user_id == null}">
					<a class="links" href="/signin">Sign In / Login</a>
				</c:if>
				<a class="links" href="/home">Home</a> <a class="links" href="/show">PC's</a>
				<a class="links" href="/new/pc">Build a PC</a> <a class="links"
					href="/help">Need Help?</a>
			</div>
		</div>
		<div class="teampage">
			<div class="garrett">
				<h1>Garrett Becker</h1>
				<h2>President / Lead Developer</h2>
				<img id="propic" src="/resources/imgs/GarrettPic.png" />
				<h3>Social Contacts:</h3>
				<div class="social">
						<a href="https://www.linkedin.com/in/gb117"><img
							src="/resources/imgs/LI-Logo.png" id="linked" /></a><a
							class="s-link" href="https://github.com/GJB-117/Projects"> <img
							src="/resources/imgs/GitHub_Logo_White.png" id="github" /></a>
				</div>
			</div>
			<div class="max">
				<h1>Maxwell Jacobs</h1>
				<h2>Vice-President / Creative Director</h2>
				<img id="propic2" src="/resources/imgs/EditedMax.png" />
				<h3>Social Contacts:</h3>
				<div class="social">
						<a class="s-link" href="https://www.linkedin.com/in/maxwell-jacobs-714535240/"><img
							src="/resources/imgs/LI-Logo.png" id="linked" /></a><a
							class="s-link" href="https://github.com/SilverMaxwellJ"><img
							src="/resources/imgs/GitHub_Logo_White.png" id="github" /></a>
				</div>

			</div>

		</div>



		<div class="footer">
			<div class="footer-team">
				<h4>OUR TEAM</h4>
				<a class="foot-links" href="/team">About Us</a> <a
					class="foot-links" href="/contact">Contact Us</a>
			</div>
			<div class="footer-links">
				<h4>NAVIGATING LINKS</h4>
				<a class="foot-links" href="/show">PC's</a> <a class="foot-links"
					href="/new/pc">Build a PC</a> <a class="foot-links" href="/help">Need
					Help?</a>
			</div>
			<div class="profile">
				<h4>USER CONTROL</h4>
				<a class="foot-links" href="/signin">Sign In</a> <a
					class="foot-links" href="/logout">Log Out</a>
			</div>
			<div class="copy">
				<p>
					© 2022 EazyPC, Inc. <br>All rights reserved.
				</p>
			</div>
		</div>
	</div>

</body>
</html>