<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.category.CategoryServiceImp"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.product.ProductServiceImp"%>
<%@page import="com.ecommerce.dao.product.ProductService"%>
<%@page import="com.ecommerce.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("login.jsp");
}

int cid = Integer.parseInt(request.getParameter("cid"));

//Categories
CategoryServiceImp cateService = new CategoryServiceImp();
List<Category> categories = cateService.allCategories();

ProductService service = new ProductServiceImp();
List<Product> products = service.getAllProductsByCategory(cid);

%>
<!DOCTYPE html>
<html>
<%@include file="Head.jsp"%>
<body>
	<%@include file="UserNavbar.jsp"%>


	<div class="container my-4">
		<div class="row">
			<%
			for (Product product : products) {
			%>
			<div class="col-md-3 my-2">
				<div class="card">
					<div class="card-body">
						<img src="img/products/<%=product.getPic()%>"
							alt="<%=product.getTitle()%>" class="card-img-top" width="100%"
							height="200" />
						<h4 class="card-title"><%=product.getTitle()%></h4>
						<p><%=product.getDescription()%></p>
						<p class="m-0">
							Price : <span style="text-decoration: line-through;"><%=product.getPrice()%></span>-<span
								style="color: crimson;"><%=product.getDiscount()%>%</span>
						</p>
						<h6 class="m-0">
							Total Price:
							<%=product.getPriceAfterDiscount()%>
							TK
						</h6>
					</div>
					<div class="card-footer">
						<button class="btn btn-primary" onclick="addToCart(<%=user.getId() %>,<%= product.getId()%>,'<%=product.getTitle()%>',<%= product.getPriceAfterDiscount()%>);">Add To Card</button> 
						<a href=""
							class="btn btn-primary">See More</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>