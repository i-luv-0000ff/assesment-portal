<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Assessment Portal - Login</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		function disableBack() {
			window.history.forward()
		}
		window.onload = disableBack();
		window.onpageshow = function(evt) {
			if (evt.persisted)
				disableBack()
		}
	});
</script>
</head>
<style>
body {
	background: #488;
}

label {
	display: inline-block;
	max-width: 100%;
	margin-bottom: 5px;
	font-weight: 700;
	font-size: larger;
}

input {
	line-height: normal;
	width: 250px;
	height: 25;
}
a {
    color: #337ab7;
    text-decoration: none;
    font-size: medium;
    }
.btn {
	padding: 8px 16px;
	font-size: 16px;
	width: 200;
	height: 35;
}

div.a {
	position: relative;
	text-align: center;
	color: black;
	font-family: "Book Antiqua", Times, Serif;
	font-style: bold;
	font-size: 48px;
}

.content {
	max-width: 800px;
	margin: auto;
	background: white;
	padding: 10px;
}

h2 {
	text-align: center;
}

#box {
	margin: 0px auto;
	width: 500px;
	height: 350px;
	border: 1px solid rgb(23, 53, 97);
	box-shadow: 5px 5px 5px 2px rgba(0, 0, 0, 0.5);
	background: rgba(200, 200, 200, 0.1);
	border-radius: 10px;
	top: 100px;
}

form {
	align-content: center;
	text-align: center;
	margin-left: 100px;
}
input::placeholder{
	color:#999;
}
</style>
<body>
	<div style="height: 100%; background-color: rgba(245, 245, 245, 1);">
		<div class="container-fluid text-center"
			style="background-color: rgba(51, 122, 183, 1);">
			<div class="container" style="margin-left:-28%">
				<h3 style="color: rgba(245, 245, 245, 1);">Assessment Portal</h3>
			</div>
		</div>

		<div style="margin: 150px;">
			<h2>Login</h2>
			<form:form action="assessment" method="post" id="box"
				commandName="userForm">
				<br>
				<br>
				<br>
				<label class="control-label" for="name" align="right" >User Name&nbsp;&nbsp;</label>
				<input id="name" type="text" name="name" required
					data-toggle="popover" data-content="Category Name required" placeholder="Enter User Name" />
				<br>
				<br>
				<label class="control-label" for="password" align="right">Password&nbsp;&nbsp;&nbsp;</label>
				<input id="password" type="password" name="password" required
					data-toggle="popover" data-content="Category Name required" placeholder="Enter Password" />
				<br>
				<br>
				<input type="submit" value="Login" class="btn btn-primary" />
				<br>


				<div class="panel-header">
					<br>
					<ul class="list-inline" align="right">
						<li><a href="registrationForm">Register</a></li>
						<li><a href="forgetPassword">Forgot Password?</a></li>
					</ul>
				</div>

				<div align="center">
					<font color="red">${errorMessage}</font>
					<c:if test="${not empty successMsg}">
						<p style="color: green; font-style: italic; font-weight: bold;">${successMsg}
							Please login to continue.</p>
					</c:if>
					<c:if test="${not empty pwdchanged}">
						<p style="color: green; font-style: italic; font-weight: bold;">${pwdchanged}
							Please login.</p>
					</c:if>
				</div>
			</form:form>

		</div>


	</div>
</body>


<script type="text/javascript">
	$('[data-toggle="popover"]').click(function() {
		$("#name").popover('destroy');
		$("#password").popover('destroy');
	});
</script>
</html>
