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
<title>Show All PC's</title>
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
			<h1>All User Submitted PCs</h1>
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

		<div class="show-page">
			<div class="filter-form">
				<form:form action="/filter/500">



				</form:form>

			</div>
			<c:forEach var="pc" items="${pcs}">
				<div class="results">
					<a href="/show/${pc.id}"><img src="${pc.image}" /></a>
					<div class="pc-info">
						<label>Name:</label>
						<p>${pc.name}</p>
						<label>Price:</label>
						<p>$${pc.price}</p>
						<label>PC Type:</label>
						<p>${pc.need}</p>
					</div>
					<div class="actions">
						<c:if test="${pc.user.id==user_id}">
							<h4>Creator Options:</h4>
							<a href="/edit/${pc.id}" id="edit-btn">Edit</a>
							<form action="/remove/pc/${pc.id}" method="post">
								<input type="hidden" name="_method" value="delete"> <input
									type="submit" value="Delete" id="delete-btn">
							</form>
						</c:if>
					</div>
				</div>
			</c:forEach>
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