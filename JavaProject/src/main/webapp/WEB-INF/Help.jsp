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
<title>EazyPC Help Page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/CSS/static.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div id="TO" class="header">
			<a href="/home"><img src="/resources/imgs/TestLogoOne.png" /></a>
			<h1>EazyPC Assistance Page</h1>
			<div class="admin-links">
				<c:if test="${admin == 1}">
					<p style="color: red">Admin Privileges In Use</p>
					<a style="color: red" href="/adminpage">Admin Page</a>
				</c:if>
			</div>
			<div class="header-links">
				<a class="links" href="/home">Home</a>
				<c:if test="${user_id != null}">
					<a class="links" href="/logout">Logout</a>
				</c:if>
				<c:if test="${user_id == null}">
					<a class="links" href="/signin">Sign In / Login</a>
				</c:if>

				<a class="links" href="/show">PC's</a> <a class="links"
					href="/new/pc">Build a PC</a> <a class="links" href="/help">Need
					Help?</a>
			</div>
		</div>
		<div class="help-page">
			<div class="title">
				<h2>Here at EazyPC we make the process Eazy!!!</h2>
				<h3>Find your help category below.</h3>
			</div>
			<div id="TOC">
				<ol>
					<li><a href="#ImageURL">Image Upload</a></li>
					<li><a href="#UsageType">Usage Type</a></li>
					<li><a href="#ResolutionTarget">Resolution Target</a></li>
					<li><a href="#FullWater">Full Water Cooling</a></li>
					<li><a href="#AIOCPU">AIO CPU Liquid Cooling</a></li>
					<li><a href="#RGBSYNC">RGB Sync Compatible</a></li>
					<li><a href="#CCM">Custom Cable Management</a></li>
				</ol>
			</div>
			<div id="ImageURL">
				<div class="help-block">
					<h3>Image URL Upload:</h3>
					<p>
						Our Image upload capability allows users to show off their
						submission to EazyPC allowing other users to see their PC. This is
						quite an easy process, however we understand that some of our
						users might need some assistance. For such users, please follow
						our guide below, or use this <span><a
							href="https://www.canto.com/blog/how-to-make-a-url-for-a-picture-on-your-computer/">link</a></span>
						to find a walk through. 99% of images should work correctly if
						provided with a functional URL to the Image.
					</p>
				</div>
				<div class="help-block">
					<h4>If uploading from the Web:</h4>
					<p>
						<br> Step 1: Find your picture that you wish to upload. <br>
						Step 2: Right click your selected picture and click "Copy Image
						Address". <br> Step 3: While submitting your PC paste your
						copied address into the URL field using "CTRL + V" or right
						clicking.
					</p>
				</div>
				<div class="help-block">
					<h4>If uploading from your files:</h4>
					<p>
						<br> Due to database constraints we are only accept URLs at
						the moment, however you can still upload your pictures. <br>
						Step 1: Create an <span><a class="img-links"
							href="https://imgur.com/">imgur</a></span>, <span><a
							class="img-links" href="https://www.flickr.com/">Flickr</a></span> or <span><a
							class="img-links" href="https://postimages.org/">PostImage</a></span>
						account. <br> Step 2: Upload your Image to one of the listed
						sites. <br> Step 3: Follow the guide for web uploading.
					</p>
					<a href="#TO">Go to Top</a>
				</div>
			</div>
			<div id="UsageType">
				<div class="help-block">
					<h3>Usage Type:</h3>
					<p>Computers are now used by a vast majority of people all over
						the planet, however most computers have some sort of specialized
						field that gives them the necessary resources to fill a specific
						need. This can be high refresh rate gaming, or seamless work flow
						for an office PC. But what works best for you? Use this guide to
						find the right system for you!</p>
				</div>
				<div id="game" class="help-block">
					<h4>Gaming:</h4>
					<p>
						A gaming type PC will be the most versatile for all users. Due to
						modern gaming requirements, gaming PCs usually hold the top
						quality performance oriented components. This is for computing
						large data values and large quantities of visual data at a high
						average frames per second(FPS).<br> <br> They are also
						usually housed in a visually appealing case with component display
						windows, large diameter fans for optimal cooling, and depending on
						the model are likely to include some form of RGB lighting and
						Cable management. They can do a bit of everything, but are mainly
						focused on gaming. Gaming PCs are offered at a variety of prices,
						from the inexpensive bare bones to the multi-thousand dollar
						monster rigs.
					</p>
				</div>
				<div id="3d" class="help-block">
					<h4>Video / 3D Rendering:</h4>
					<p>
						Video / 3D Rendering PCs are a highly specific niche of usage.
						They are usually found in the upper level cost category housing
						the top of line components for processing massive quantities of
						visual data. These PCs are more than capable of running top of the
						line modern games at great performance numbers, but lack certain
						qualities of gaming PCs.<br> <br>Video / 3D Rendering
						builds are usually used in a professional setting, and are made to
						focus on pure performance and speed for lengthly rendering
						sessions. Some top of the line gaming PCs are more than capable of
						running such programs but, Video / 3D Rendering PCs are designed
						for a more professional look rather than something customizable.
						If you are looking for something that can do some Video or 3D
						Rendering, but are not ready to spend $2000+, a mid tier gaming PC
						is probably what you are looking for.
					</p>
				</div>
				<div id="off" class="help-block">
					<h4>Professional Office:</h4>

					<p>The Professional Office category usually holds the widest
						variety of cost out of the three. Ranging from relatively
						inexpensive to very costly. Office PCs will most likely have
						little to none when it comes to customize ability. They are built
						for one purpose, get the job done. These are made to run basic
						programs such as Word, Excel, Microsoft Office, ProSeries, etc...
						They come in all shapes and sizes as well. There are mini PCs that
						can fit in the palm of a hand, typical tower desktop, and
						All-in-one desktop computers which we will go into further detail
						below. If you're looking for a basic, niche-less everyday computer
						that gets the job done. This is the option for you.</p>
				</div>
				<div id="all" class="help-block">
					<h4>All In One:</h4>

					<p>The All in One desktop is a compact self contained
						monitor/computer that allows those to have a full desktop
						experience without a full tower. These usually provide a more user
						friendly experience ditching the need of cables and connections
						from the tower to the monitor. Most Apple iMac's are built in this
						format, allowing for an elegant, clean design. However, the market
						for these models have began to spill over, away from normal
						office/home computers. You can now find, high performance all in
						one computers for everything from Gaming to Video Editing.
						Although that comes at the cost of a pretty penny. Most All in One
						computers will price significantly higher for the smaller package.
						On top of that, upgrade ability is very restricted. This includes
						repair ability as well, but the rising market for these machines
						shows their popularity. So if you're looking for a clean,
						plug-and-play experience. The All in One design might be for you.
					</p>
					<a href="#TO">Go to Top</a>
				</div>
			</div>
			<div id="ResolutionTarget">
				<h3>Resolution Target:</h3>
				<div class="help-block">
					<p>
						Resolution Target is a great way for users to understand the
						performance capabilities of their system. At EazyPC we break this
						down into two values for a more streamlined experience. Firstly is
						the resolution itself. <br> <br> Our resolutions are
						broken down to four levels that should cover the majority of the
						current market capabilities. These are, FHD, 2K, 4K, and 6K
						resolutions. These are displayed with a number ex.(FHD:1920x1080),
						these numbers represent the number of pixels that make up your
						monitor. The more the pixels, the better the resolution and
						clarity of the image being displayed. However, the more pixels,
						the more of a strain it puts on your system. Basically (Better
						Resolution = Higher Computing Loads). <br> <br>
						Secondly, is frame rate at a selected resolution. One aspect of
						monitors for all devices, TVs, Computers, phones, etc... is that
						they are only "ON" for ~50% of the time you are viewing the
						content. Monitors are constantly turning on and off updating the
						new information in view. However, we perceive this as a still /
						moving image due to the speed at which they perform this task.
						This On-Off cycle speed is what represents frame rate. For
						example, if a monitor has a frame rate of 120hz that means that
						your monitor is cycling at 120 individual frames per second. Each
						frame added per second adds further load to your computers system,
						but make the image smoother, and for gaming decreases reaction
						times for the player.<br> <br> With higher resolutions,
						frames per second(FPS) becomes more and more difficult for your
						system to handle. This causes significant drops in FPS when you
						reach the 4K+ range of resolution. Even with current Graphics
						Processing Units (GPUs) 4k at 120hz is quite an achievement,
						requiring extreme builds in the $3000+ price category. At the end
						of the day, (Lower Resolution = Higher FPS)/(Higher Resolution =
						Lower FPS). Finding a balance for your needs is key.
					</p>
					<a href="#TO">Go to Top</a>
				</div>
			</div>
			<div id="FullWater">
				<h3>Full Water Cooling:</h3>
				<div class="help-block">
					<p>
						Full Water Cooling provides an alternate form of cooling and
						allows for a wide variety build options. For example, water cooled
						PCs can be built in a air tight platform where the only air
						exchange is between the ambient air and the radiators. Water
						cooling uses pumps and tubes to move cooling fluid to areas of the
						computer that produce heat, and then transfer that heat through
						the radiator to pass off to the ambient air. Liquid has a better
						thermal up take capability vs air, and protects the components
						from dust.<br> <br> Water cooling does require upkeep to
						ensure the fluid level doesn't fall too low, and this requires
						pouring liquids into you PC, which can be quite dangerous if done
						wrong. This is further burdened by the need to replace the fluid
						every year or so, to remove the particle build up. Overall, Water
						cooling set ups, tend to be more expensive, and require some up
						keep, but do allow for better cooling and cleaner looking set ups.
					</p>
					<a href="#TO">Go to Top</a>
				</div>
			</div>
			<div id="AIOCPU">
				<h3>AIO CPU Liquid Cooling:</h3>
				<p>All in one or AIO liquid cooling combines the look and
					quality of water cooling, minus all the up keep that is required
					for a full water cool setup. AIO coolers are usually only for the
					CPU, and add a clean open look for the inside of your PC. If that
					is something that interests you, AIO cooling might be the way to
					go. Compared to air cooling heat sinks, they will run for a higher
					price, but cooling numbers tend to be very good on a AIO liquid
					cooler.</p>
					<a href="#TO">Go to Top</a>
			</div>
			<div id="RGBSYNC">
				<h3>RGB Sync Compatible:</h3>
				<p>RGB is one of the largest markets for PC customization. Some
					would even say, it is a must in the PC world. RGB allows you to
					design and create your own style for your set up, for a relatively
					low cost. But the ease of running multiple rgb systems paved the
					way for RGB sync. RGB sync is offered by multiple companies and
					allows the owner to alter their RGB through some software that
					manages all the RGB components. If you want ease in customizing RGB
					sync is the way to go.</p>
					<a href="#TO">Go to Top</a>
			</div>
			<div id="CCM">
				<h3>Custom Cable Management:</h3>
				<p>Custom cable management or CCM is a process that either done
					by a professional, or a experienced hobbyist. This involves the
					organization and management of your PC inner cables, and can even
					involve custom made cables that are more durable and/or contain
					color. This gives a very clean look for your PC and can increase
					the price depending on the work done. Not all CCM is created equal,
					some will just push all the cables to the back side of the case,
					where others will turn your cabling into a true work of art. But
					good cable management can make a world of difference, for the look
					and the life time of your PC.</p>
					<a href="#TO">Go to Top</a>
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