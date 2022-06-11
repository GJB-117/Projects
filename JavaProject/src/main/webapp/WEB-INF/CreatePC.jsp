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
<title>Create PC</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/CSS/static.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<a href="/home"><img src="/resources/imgs/TestLogoOne.png" /></a>
			<h1>Create a PC</h1>
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
		<div class="form">
			<form:form action="/create/pc" method="post" modelAttribute="newPc">
				<div class="form-group">
					<label>Name:</label>
					<form:input type="text" path="name" />
					<form:errors path="name" />
					<label>Link:</label>
					<form:input type="text" path="link" />
				</div>
				<div class="form-group">
					<label>Price Range:</label>
					<form:input type="number" path="price" />
					<form:errors path="price" />
					<label>Usage Type:</label>
					<form:select path="need" class="selector">
						<form:option value="Gaming" />
						<form:option value="Video/3D Rendering" />
						<form:option value="Professional Office" />
						<form:option value="All in one" />
					</form:select>
					<form:errors path="need" />
					<label>Image URL:</label>
					<form:input type="string" path="image" />
				</div>
				<div class="check">
					<label id="optional">Resolution Target:</label>
					<div class="help-icon">
						<p>
							Resolution Target is what monitor resolution you would like to
							achieve with your PC!! If you need more information visit our
							help page <span><a href="/help" id="help">here</a></span>
						</p>
					</div>
				</div>
				<div class="form-res">
					<form:radiobuttons path="resolution" items="${resolutions}" />
					<form:errors path="resolution" />
				</div>
				<div class="form-res">
					<label id="optional">Optional Upgrades:</label>
					<div class="check">
						<label>Full Water Cooling</label>
						<form:checkbox path="water" />
					</div>
					<div class="check">
						<label>AIO CPU Cooling</label>
						<form:checkbox path="aio" />
					</div>
					<div class="check">
						<label>RGB Sync</label>
						<form:checkbox path="rgb" />
					</div>
					<div class="check">
						<label>Custom Cable Management</label>
						<form:checkbox path="cable" />
					</div>
					<form:input type="hidden" path="user" value="${user_id}" />
					<input id="btn-main" type="submit" value="Create" id="create-btn" />

				</div>
			</form:form>
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