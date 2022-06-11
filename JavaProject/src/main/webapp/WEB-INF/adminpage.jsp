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
<title>Admin Page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/CSS/admin.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="admin-container">
		<div class="header">
			<a href="/home"><img src="/resources/imgs/TestLogoOne.png" /></a>
			<h1 style="color: red">ADMIN BACKDOOR</h1>
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
		<div class="warning">
			<h2 style="color: red">This Page is for Admin Purposes</h2>
			<p style="color: white">If you have found yourself on this page
				by mistake, your ID has been logged, and we recommend to send us a
				subject "URGENT" contact message with details. If no contact is
				established, your profile will be suspended. Here at EazyPC we
				follow a simple honor policy, thank you.</p>
		</div>
		<div class="adminpage">


			<div class="contacts">
				<h2>User Contact Messages</h2>
				<table class="contact-table">
					<thead>
						<tr class="table-head">
							<th>Subject</th>
							<th>Email</th>
							<th>Full Name</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="contact" items="${contacts}">
							<tr>
								<td>${contact.subject}</td>
								<td>${contact.email}</td>
								<td>${contact.firstName} ${contact.lastName}</td>
								<td><a href="/contact/${contact.id}">View</a>
									<form action="/remove/message/${contact.id}" method="post">
										<input type="hidden" name="_method" value="delete"> <input
											type="submit" value="Delete" id="delete-btn">
									</form></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<h2>All User PCs</h2>
			<div class="PCS">
				<c:forEach var="pc" items="${pcs}">
					<div class="results">
						<img src="${pc.image}" class="pcimg" /> <label>Name:</label>
						<p>${pc.name}</p>
						<label>Price:</label>
						<p>$${pc.price}</p>
						<div class="actions">
							<h4>Actions:</h4>
							<div class="actions">
								<a href="/edit/${pc.id}" id="edit-btn">Edit</a>
								<form action="/remove/pc/${pc.id}" method="post">
									<input type="hidden" name="_method" value="delete"> <input
										type="submit" value="Delete" id="delete-btn">
								</form>
							</div>
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
	</div>



</body>
</html>