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
<title>EazyPC Login / Register User</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/CSS/Login.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<a href="/home"><img src="/resources/imgs/TestLogoOne.png" /></a>
			<h1>Contact Us</h1>
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
		<div class="forms">
			<div class="reg-form">
				<h3>Register:</h3>
				<form:form action="register" method="post" modelAttribute="newUser">
					<div class="form-group">
						<label>Name:</label>
						<form:input path="name" class="form-control" />
						<form:errors path="name" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Email:</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password:</label>
						<form:input path="password" class="form-control" />
						<form:errors pathd="password" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Confirm Password:</label>
						<form:input path="confirm" class="form-control" />
						<form:errors path="confirm" class="text-danger" />
					</div>
					<form:input type="hidden" path="admin" value="0"/>
					<input type="submit" value="Register User" class="btn" />
				</form:form>
			</div>
			<div class="login-form">
				<h3>Login:</h3>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="form-group">
						<label>Email:</label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password:</label>
						<form:input path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<input type="submit" value="Login" class="btn" />
				</form:form>
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