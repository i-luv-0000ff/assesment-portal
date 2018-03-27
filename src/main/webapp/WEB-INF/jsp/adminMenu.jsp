<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assessment Portal</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <c:url var="home" value="/" scope="request" />
  
<link rel="stylesheet" href="../css/jquery-ui.css">
<script src="../js/applicationScripts.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css">
	<style type="text/css">
	.dropbtn {
    background-color: rgba(51, 122, 183, 1);
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: rgba(51, 122, 183, 1);
}

#dialog-confirm {
	height: auto !important;

	</style>
</head>
<body>
	<form:form action="admin/allCategory" method="POST"
		modelAttribute="adminForm" name="categoryFormSub">
		<input type="hidden" name="checkPage" id="checkPage" />
		<nav class="navbar navbar-inverse">
			<div class="container-fluid"
				style="background-color: rgba(51, 122, 183, 1);">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"
						style="color: rgba(245, 245, 245, 1);">Assessment Portal</a>
				</div>

				<div class="dropdown">
					<button class="dropbtn" disabled="disabled">
						Service<span class="caret"></span>
					</button>
					<div class="dropdown-content">
						<a href="/admin">Category/Questions</a>
						<a href="#"
							onclick="javascript:getCntForQuestPerAttempts()">Configure
								Questions/Attempts</a>
					</div>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/logout" style="color: rgba(245, 245, 245, 1);"><span
							class="glyphicon glyphicon-user"></span> Log Out</a></li>
				</ul>
			</div>
		</nav>
	</form:form>

</body>

<script type="text/javascript">
function getCntForQuestPerAttempts() {
	document.categoryFormSub.action ="admin/allCategory";
	document.forms["categoryFormSub"].submit();
}

</script>


</html>