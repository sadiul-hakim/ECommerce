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
			<h3 class="display-4 login-title text-center">Login User</h3>
			<%if(error!=null){ %>
				<div class="my-2 alert alert-danger"><%=error %></div>
			<%}%>
			
			<form action="LoginServlet" method="post" class="card p-4 my-4 login-card">
				<div class="my-2">
					<label for="email">Email : </label>
					<input type="email" class="form-control" name="email" required/>
				</div>
				<div class="my-2">
					<label for="password">Password : </label>
					<input type="password" class="form-control" name="password" required/>
				</div>
				<div class="my-2">
					<button class="btn btn-primary form-control" type="submit">Login</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>