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
<title>EazyPC Welcome Page</title>
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
			<h1>Welcome to EazyPC</h1>
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
		<c:if test="${user_id == null}">
			<div class="signin-pop">
				<p>
					Get started now by <span><a href="/signin">Creating an
							Account</a></span>!!! If you already have an account login <span><a
						href="/signin">here</a></span>.
				</p>
			</div>
		</c:if>

		<div class="review-page">

			<div class="message">
				<h3>A message from our President / Lead Developer </h3>
				<h2>Garrett Becker</h2>
				<p> This project was made as display of the skills I either learned from
				my time at <span><a href="https://www.codingdojo.com/">Coding Dojo</a></span> or taught myself. 
				I do not seek to receive any monetary gain from EazyPC as it is a display of my abilities in 
				Java built applications. I built EazyPc to not only show my skills, but to create a fun PC enthusiast 
				site that allows users to enjoy the love of computers, share their builds, and maybe find some new people
				that would like to join such a group. I attempted to make a site that users of all levels of experience 
				could enjoy, and maybe learn something too. If you have found yourself here, I hope you enjoy!!! (And if 
				find any bugs please utilize the Contact Us page found in the footer.) 
				
				<h3>A message from our Vice President / Creative Director</h3>
				<h2>Maxwell Jacobs</h2>
				<p>
					The first step in custom computers comes from asking yourself one
					question, what do you seek to accomplish? There is a large
					diversity for computer devices that assist each person’s needs. Ask
					yourself if you need to complete a professional business website
					with large databases, video editing and 3D animation, or if you
					just wanted a hobbyist gaming computer to relax and distract
					yourself from normal responsibilities. <br><br> Depending on your
					end goal can determine how much you will need to spend, save, and
					budget for replacement parts. Your equipment should best fit your
					basic and technical needs. Never settle for anything amateurly
					overpriced that's prebuilt, if you could just <span><a
						class="hidden"
						href="https://www.youtube.com/watch?v=XlgqZeeoOtI&ab_channel=Kazumanyaa">see</a></span>
					how easy and budget-friendly custom builds can be. Join us today
					and find out what our community shares and suggests. You may find
					your build today!
				</p>
			</div>
			<div class="review">
				<h2>User Reviews</h2>
				<div class="user-review">
					<p>Jensen Huang:</p>
					<img src="/resources/imgs/Stars-max-edit.png" class="review-img"
						id="problem" />
				</div>
				<p>This is the best PC I have ever seen. I have been looking for
					a PC that fits my needs and I struggled to find anything. Every
					site I went to made the process difficult, when all I needed was a
					good office PC. When I found EazyPC my problems were solved 5/5
					would recommend.</p>
			</div>
			<div class="review">
				<div class="user-review">
					<p>Rick Ellis:</p>
					<img src="/resources/imgs/Stars-max-edit.png" class="review-img" />
				</div>
				<p>I found my new gaming PC here, and I couldn't be happier.
					Thank you EazyPC I will be back in the future if I need a new PC.</p>
			</div>
			<div class="review">
				<div class="user-review">
					<p>Andy Paul:</p>
					<img src="/resources/imgs/Stars-max-edit.png" class="review-img" />
				</div>
				<p>EazyPC's name says it all. The process for all skill levels
					is easy and informative. Whether you are a professional or new to
					the PC community, finding the right PC is straight forward and
					simple.</p>
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