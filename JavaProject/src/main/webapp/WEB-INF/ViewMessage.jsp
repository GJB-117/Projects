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
<title>Admin Message Viewer</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/CSS/admin.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="userinfo">
		<label>Go back:</label><a href="/adminpage" style="color:red">Admin Page</a>
			<div class="info-block">
				<label>First Name:</label>
				<p>${contact.firstName}</p>
			</div>
			<div class="info-block">
				<label>Last Name:</label>
				<p>${contact.lastName}</p>
			</div>
			<div class="info-block">
				<label>Email:</label>
				<p>${contact.email}</p>
			</div>
			<div class="info-block">
				<label>Subject:</label>
				<p>${contact.subject}</p>
			</div>
			<div class="info-block">
				<label>Message:</label>
				<p>${contact.message}</p>
			</div>
		</div>

	</div>

</body>
</html>