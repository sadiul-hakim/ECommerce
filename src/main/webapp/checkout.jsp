<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.category.CategoryServiceImp"%>
<%@page import="com.ecommerce.dao.category.CategoryService"%>
<%@page import="com.ecommerce.entities.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%
User user = (User) session.getAttribute("user");

if (user == null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
	//response.sendRedirect("login.jsp");
} else if (user != null && user.getRole().equals("admin")) {
	response.sendRedirect("admin.jsp");
}

//Categories
CategoryService cateService = new CategoryServiceImp();
List<Category> categories = cateService.allCategories();
%>
<!DOCTYPE html>
<html>
<%@include file="Head.jsp" %>
<body>
<%@include file="UserNavbar.jsp" %>

<div class="row">
	<div class="col-md-8 mx-auto mt-5 d-flex flex-column justify-content-center align-items-center card">
		<h1 class="display-4 mt-2 text-info">
			Checkout Successfully 🎉! 
		</h1>
		<a href="userIndex.jsp">Back To Home</a>
	</div>
</div>

</body>
</html>