<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Assessment Portal</title>
<script>
$(document).ready(function() {
    function disableBack() { 
    	window.history.forward() 
    	}
    window.onload = disableBack();
    window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
});
</script>
<style>
div.a {
	position: relative;
	text-align: center;
	color: black;
	font-family: "Book Antiqua", Times, Serif;
	font-style: bold;
	font-size: 48px;
}
.line1{
	width:40%;
	height: 2px;
	background-color: DodgerBlue;
	margin: 0 auto;
}
</style>
</head>
<body style='background-color: rgba(245, 245, 245, 1);'>
	<div class="relative">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid" style="background-color: rgba(51, 122, 183, 1);">
		  <div class="navbar-header">
		      <a class="navbar-brand" href="/chooseAssessment" style="color: rgba(245, 245, 245, 1);">Assessment Portal</a>
		  </div>
		    <ul class="nav navbar-nav navbar-right">
		      <li><a href="/logout" style="color: rgba(245, 245, 245, 1);"><span class="glyphicon glyphicon-user"></span> Log Out</a></li>
		    </ul>  
		</div>
		</nav>
		<div style="margin: 0px auto; padding: 10px; display: table;">
		<form:form method="POST" action="assessementQs"  modelAttribute="assessment">
		<form:hidden path = "categoryId"  id="categoryId"/>
		<form:hidden path = "categoryCutOff"  id="categoryCutOff"/>
			<div>
			<table>
				<tr>
					<td><h3 style="margin: 0px;">Select your Assessment:</h3></td>						
					<td><form:select id="mySelect" path="category" class="form-control" onchange="javascript:displayDecsription(this,${inValidCategoryIds},${emptyQuestCategories} )">
							 <form:option value="0">Select Assessment</form:option> 
							 <c:forEach items="${categoryObjs}" var="lstCategories">
								 <form:option label = "${lstCategories.categoryName}" value="${lstCategories.categoryId},${lstCategories.categoryDesc},${lstCategories.cutOff}"/>.
							 </c:forEach>
							<%-- <form:options items="${categoryObjs}"  id="catObj" itemValue="categoryId" itemLabel="categoryName" /> --%>							
						</form:select></td>
				</tr>
			</table>				
			</div>
			</div>
			<div id="hidden_div" style="text-align:center; visibility: visible;">	
				<p id="desc"></p></br>
				<p id="cutoff"></p>
				
			</div>
			<div id="checkValidAssessmentId" style="text-align:center; visibility: visible;" >
				<p id="invalidAssessment"></p>
			</div>
			<div style="margin: 0px auto; padding: 10px; display: table;">	
				<table>			
					<tr>
						<td style='align: center;'><input type="submit" id="submit_id" value="Launch Assessment" style="height:40px;" disabled="true" class="btn btn-primary"></td>
					</tr>
				</table>	
		 	</div> 
		</form:form>
	</div>
<script>
function displayDecsription(elem,inValidCategories, emptyQuestCategories)
{
	var selectBox = document.getElementById("mySelect");
	var selectedValue = selectBox.options[selectBox.selectedIndex].value;	
	var checkValidCategory = true;
	var len= inValidCategories.length;
	var tmp = emptyQuestCategories.length;
	for(var k=0;k<tmp;k++) {
		if(emptyQuestCategories[k]==selectedValue.split(',')[0]) {
			document.getElementById("submit_id").disabled = true;
			document.getElementById("hidden_div").style.display = "none";
			document.getElementById("checkValidAssessmentId").style.display = "none";
			return;
		}
	}
	for(var j=0;j<len;j++) {
		if(inValidCategories[j]==selectedValue.split(',')[0]) {
			document.getElementById("submit_id").disabled = true;
			document.getElementById("hidden_div").style.display = "none";
			document.getElementById("checkValidAssessmentId").style.display = "block";
			document.getElementById("invalidAssessment").innerHTML = "<span style=\"color:red;font-size:18px\">Sorry!!! You Cannot Launch This Assessment As You Have Reached Maximum Number Of Attempts.</br> Please Contact Admin For Further Updates.</span>"
			checkValidCategory = false;
		}
	}
	if (selectedValue.split(',')[0] !== "0" && checkValidCategory) 
	{	document.getElementById("submit_id").disabled = false;
		document.getElementById("checkValidAssessmentId").style.display = "none";
		document.getElementById("hidden_div").style.display = "block";
		document.getElementById("desc").innerHTML = "<span style=\"font-size:18px\">"+selectedValue.split(',')[1]+"</span>";
		document.getElementById("cutoff").innerHTML = "<span style=\"font-size:18px\">You Should score minimum " + selectedValue.split(',')[2] +" percentage to pass in this Exam.</span>";
	} 
	else if(checkValidCategory) {
		document.getElementById("submit_id").disabled = true;
		document.getElementById("checkValidAssessmentId").style.display = "none";
		document.getElementById("hidden_div").style.display = "none";
	}
	document.getElementById("categoryId").value = selectedValue.split(',')[0];
	document.getElementById("categoryCutOff").value = selectedValue.split(',')[2];
}
</script>	
</body>
</html>