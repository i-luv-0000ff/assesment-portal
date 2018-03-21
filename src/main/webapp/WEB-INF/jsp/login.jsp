<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title>Assessment Portal - Login</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
    function disableBack() { 
    	window.history.forward() 
    	}
    window.onload = disableBack();
    window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
});
</script>
</head>
<style>
body {
	background: #488;
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
	width: 300px;
	height: 230px;
	border: 1px solid rgb(200, 200, 200);
	box-shadow: 5px 5px 5px 2px rgba(0,0,0,0.5);
	background: rgba(200, 200, 200, 0.1);
	border-radius: 10px;
	top: 100px;
}

form {
	align-content: center;
	text-align: center;
	margin-left: 100px;
}
</style>
<body>
	<div style="height: 100%; background-color: rgba(245, 245, 245, 1);">
		<div class="container-fluid text-center" style="background-color: rgba(51, 122, 183, 1);">
		  <div class="container text-center">
		    <h3 style="color: rgba(245, 245, 245, 1);">Assessment Portal</h3>    
		  </div>
		</div>

		<div style="margin: 200px;">
			<h2>Login</h2>

			<form:form action="assessment" method="post" id="box" commandName="userForm">
				<br> Username : <input type="text" name="name" required /> <br>
				<br> Password : <input type="password" name="password" required />
				<br> <br> <input type="submit" value="Login" class="btn btn-primary"/> <br>
				<font color="red">${errorMessage}</font>
			<!-- 
          <input type="button" value="Sign up" class="btn btn-primary"/>  <br>
           <br> <br> <input type="button" value="Forgot password" class="btn btn-primary"/>
            -->
            <div class="panel-header">
            <br>
					<ul class="list-inline" align="right">
				<!--<div class="text-right">  -->
						<li><a href="registrationForm">Sign Up</a></li>
						<li><a href="forgetPassword">Forgot Password?</a></li>
					</ul>
				</div>
            </form:form>
		</div>
		
        		
	</div>
</body>
</html>