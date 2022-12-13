<%@page import="com.ecommerce.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	User user=(User) session.getAttribute("user");
    
    	if(user!=null){
    		if(user.getRole().equals("user")){
    			response.sendRedirect("index.jsp");
    		}else{
    			response.sendRedirect("admin.jsp");
    		}
    	}
    
    	String error=(String)request.getAttribute("error");
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<%@include file="Head.jsp" %>
<body>
<%@include file="Navbar.jsp" %>

<div class="container mt-5">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<h3 class="display-4 register-title text-center">Register User</h3>
			<%if(error!=null){ %>
				<div class="my-2 alert alert-danger"><%=error %></div>
			<%}%>
			<form action="RegisterServlet" method="post" class="card p-4 my-4 register-card">
				<div class="my-2">
					<label for="name">Name : </label>
					<input type="text" class="form-control" name="name" required/>
				</div>
				<div class="my-2">
					<label for="email">Email : </label>
					<input type="email" class="form-control" name="email" required/>
				</div>
				<div class="my-2">
					<label for="password">Password : </label>
					<input type="password" class="form-control" name="password" required/>
				</div>
				<div class="my-2">
					<label for="phone">Phone : </label>
					<input type="text" class="form-control" name="phone" required/>
				</div>
				<div class="my-2">
					<label for="address">Address : </label>
					<textarea rows="5" class="form-control" name="address" required></textarea>
				</div>
				<div class="my-2">
					<button class="btn btn-primary form-control">Register</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>