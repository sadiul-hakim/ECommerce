<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.category.CategoryServiceImp"%>
<%@page import="com.ecommerce.dao.category.CategoryService"%>
<%@page import="com.ecommerce.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
User user = (User) session.getAttribute("user");

if (user == null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
} else if (user != null && user.getRole().equals("admin")) {
	response.sendRedirect("admin.jsp");
}

//Categories
CategoryService cateService = new CategoryServiceImp();
List<Category> categories = cateService.allCategories();
%>
<!DOCTYPE html>
<html>
<%@include file="Head.jsp"%>
<body>
	<%@include file="UserNavbar.jsp"%>
	<div class="container">
		<div class="row">

			<div class="col-md-10 mx-auto card mt-5">
				<h3 class="display-4 my-3 text-primary">Shopping Cart : </h3>	
				<div id="cart-list"></div>
				<h4 id="total-price" class="my-2 text-primary"></h4>
				<button class="btn btn-primary my-3" id="checkout" onclick="checkoutFunction()">Checkout</button>		
			</div>
		</div>
	</div>	
</body>
</html>



