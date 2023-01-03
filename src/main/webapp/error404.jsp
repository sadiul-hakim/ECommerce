<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<%@include file="Head.jsp" %>
<body>
	<div class="container my-4">
		<div class="row">
			<div class="col-md-5 offset-md-3 d-flex justify-content-center align-items-center flex-column card p-4">
				<img src="img/error404.png" alt="404" width="90%" height="300"/>
				<h3 class="display-4 text-danger my-2">404 Not Found</h3>
				<p>Sorry, This page is not fount.</p>
				<a href="index.jsp">Back To Home</a>
			</div>
		</div>
	</div>
</body>
</html>