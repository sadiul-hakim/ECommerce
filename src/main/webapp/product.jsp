<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.dao.product.ProductServiceImp"%>
<%@page import="com.ecommerce.dao.product.ProductService"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.category.CategoryServiceImp"%>
<%@page import="com.ecommerce.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("login.jsp");
}

int id = Integer.parseInt(request.getParameter("id"));

//Categories
CategoryServiceImp cateService = new CategoryServiceImp();
List<Category> categories = cateService.allCategories();

//product
ProductService service = new ProductServiceImp();
Product product = service.getProduct(id);

%>

<!DOCTYPE html>
<html>
<%@include file="Head.jsp"%>
<body>
	<%@include file="UserNavbar.jsp"%>

	<div class="container-fluid my-2">
		<div class="row">
			<div class="col-md-2">
				<a type="button" class="btn btn-primary btn-lg" href="index.jsp">
					<i class="fa fa-mail-reply"></i> Go Back
				</a>
			</div>
			<div class="col-md-10 card">
				<div class="row">
					<div class="col-md-3">
						<img src="img/products/<%= product.getPic()%>" alt="<%= product.getTitle()%>" width="100%" height="200"/>
					</div>
					<div class="col-md-9 p-2">
						<h3><%=product.getTitle() %></h3>
						<p class="text-muted"><%=product.getDate() %></p>
						<br/>
						<p class="lead"><%=product.getDescription() %></p>
						<h5>Price       : <span style="text-decoration: line-through;"><%=product.getPrice() %></span>-<span style="color: crimson;"><%=product.getDiscount()%>%</span></h5>
						<h6>Total Price : <%=product.getPriceAfterDiscount() %> TK</h6>
						<br/>
						<button class="btn btn-primary" onclick="addToCart(<%=user.getId() %>,<%= product.getId()%>,'<%=product.getTitle()%>',<%= product.getPriceAfterDiscount()%>);">Add To Card</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>