<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Assessment Portal</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <c:url var="home" value="/" scope="request" />
</head>
<style>
#box {
	border: 1px solid rgb(200, 200, 200);
	box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 5px 2px;
	background: rgba(200, 200, 200, 0.1);
	border-radius: 4px;
	top: 80px;
}

.col-md-10{
	width:68%;
}

.col-md-2{
	width:32%;
}

h2 {
	text-align: center;
}

.error {
	color: red;
	font-style: italic;
	font-weight: unset;
	font-size: smaller;
}

p {
    margin: 0 0 0px;
}

.btn {
    display: inline-block;
    padding: 6px 19px;
    }
</style>
<body>
<div class="container-fluid text-center" style="background-color: rgba(51, 122, 183, 1);">
	<div class="container text-center">
		<h3 style="color: rgba(245, 245, 245, 1);">Assessment Portal</h3>    
	</div>
</div>
		
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4 col-md-offset-4" id="box">
			<h2 style="align:center;">Register Yourself!</h2> 
			<hr>
			<form:form class="form-horizontal" method="Post" commandName="userForm" Action="register">
				<fieldset>
					<div class="form-group">
						<label class="control-label col-md-2"  for="name">User Name:</label>
						<div class="col-md-10" style="padding: 0px 16px 0px 0px;">
							<form:input path="user_name" id="username" class="form-control" name="name" placeholder="Enter User Name" onchange="javascript:checkAvailability()"></form:input>
							<input type ="hidden" id="uname"/>
							<form:errors path="user_name" cssClass="error" />	
						</div>							
					</div>

					<div class="form-group">
						 <label class="control-label col-md-2" for="pass">Password :</label>	
						<div class="col-md-10" style="padding: 0px 16px 0px 0px;">						 
						 	<form:input path="password" id="pass" type="password" class="form-control" name="pass" placeholder="Enter Password"/>
							<form:errors path="password" cssClass="error" /> 	
						</div> 						
					</div>

					<div class="form-group">
						 <label class="control-label col-md-2" for="re-pass">Confirm Password :</label>	
						<div class="col-md-10" style="padding: 0px 16px 0px 0px;">						 
						 	<form:input path="confirmPassword" id="re-pass" type="password" class="form-control" name="re-pass" placeholder="Re-type Password" onchange="matchPassword()"/>
						 	<form:errors path="confirmPassword" cssClass="error" />  	
						</div> 						
					</div>
							
					<div class="form-group">
						 <label class="control-label col-md-2" for="email">E-mail :</label>
						<div class="col-md-10" style="padding: 0px 16px 0px 0px;">						  							
					     	<form:input path="email" id="email" class="form-control" name="email" placeholder="Enter E-mail Id"/>
					     	<form:errors path="email" cssClass="error" />
					    </div>					    
					</div>			
					
					<div class="form-group">
						<label class="control-label col-md-2" for="securityquestion">Security Question :</label> 
						<div class="col-md-10" style="padding: 0px 16px 0px 0px;">						
							<form:select path="userSecurtiyQuest" class="form-control" name="securityquestion" >
								<form:option value="" label="Choose your security question"></form:option>
								<c:forEach items="${registrationBean}" var="securityQuest">
									<form:option label="${securityQuest.securityQuestions}" value="${securityQuest.securityQuestNumber}"/>
								</c:forEach>
							</form:select>
							<form:errors path="userSecurtiyQuest" cssClass="error" />
						</div>	
					</div>

					<div class="form-group">
						<label class="control-label col-md-2" for="securityAns">Security Answer :</label>
						<div class="col-md-10" style="padding: 0px 16px 0px 0px;">						  
				  			<form:input type="text" id="securityAns" path="securityAns" class="form-control" name="securityAns" placeholder="Your Security Answer" />
				  			<form:errors path="securityAns" cssClass="error" />
				  		</div>					  			
					</div>
 	 	
					<div class="row" style="padding: 0px 0px 18px 0px;">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="col-sm-offset-7 col-xs-6 col-sm-6 col-md-6" style="align:right;">
	    	    				<button id="resetvalue" type="reset" class="btn btn-primary btn-md" onclick="myReset()">Reset-Fields</button>
    	    					<button id="register" type="submit" class="btn btn-primary" onclick="javascript:checkAvailability()">Register Me</button>
      						</div>		
    					</div>
    				</div>	
    						
				</fieldset>
			</form:form>
		</div>
	</div>
</div>

<script>
 function myReset(){
	 document.getElementById("user_name").value="";
	 document.getElementById("pass").value="";
	 document.getElementById("email").value="";
	 document.getElementById("securityAns").value="";
 }
 function matchPassword(){
	if (document.getElementById("pass").value.trim() != document.getElementById("re-pass").value.trim())
	 {
		alert("Passwords doesn't match.");
		document.getElementById("pass").value = "";
		document.getElementById("re-pass").value = "";
		document.getElementById("pass").focus();
		return false;
	 }
	else
	{
		return true;
	}
 }
 	function checkAvailability()
 	{
	 	jQuery.ajax({
	 		type: "POST",
	 		data: {
	 			username: document.getElementById("username").value
	 		},
	 		url: "${home}checkNameAvailability",
	 		success: function(response) {
	 			if (response != "")
	 			{	
	 				alert(response);
	 				document.getElementById("username").value = "";
		 		}	 			
	 		}
	 	});
 	}
</script>
</body>
</html>