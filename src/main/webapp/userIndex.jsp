<%@page import="com.ecommerce.dao.category.CategoryService"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.category.CategoryServiceImp"%>
<%@page import="com.ecommerce.helper.PathProvider"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.product.ProductServiceImp"%>
<%@page import="com.ecommerce.entities.User"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
User user = (User) session.getAttribute("user");

if (user == null ) {
	response.sendRedirect("login.jsp");
}else if(user != null && user.getRole().equals("admin")){
	response.sendRedirect("admin.jsp");
}

//Products
ProductServiceImp productService = new ProductServiceImp();
List<Product> products = productService.allProducts();

//Categories
CategoryService cateService = new CategoryServiceImp();
List<Category> categories = cateService.allCategories();

%>

<html lang="en">
<%@include file="Head.jsp"%>
<body>

	
	<%@include file="UserNavbar.jsp"%>
	

	<div class="container my-4">
		<div class="row">
			<%
			for (Product product : products) {
			%>
			<div class="col-md-3 my-2 ">
				<div class="card">
					<div class="card-body">
						<img src="img/products/<%=product.getPic()%>"
							alt="<%=product.getTitle()%>" class="card-img-top" width="100%"
							height="200" />
						<h4 class="card-title"><%=product.getTitle()%></h4>
						<p><%=product.getDescription()%></p>
						<p class="m-0">
							Price : <span style="text-decoration: line-through;"><%=product.getPrice()%></span>
							- <span style="color: crimson;"><%=product.getDiscount()%>%</span>
						</p>
						<h6 class="m-0">
							Total Price:
							<%=product.getPriceAfterDiscount()%>
							TK
						</h6>
					</div>
					
					<div class="card-footer">
						<button data-bs-toggle="modal" data-bs-target="#addToCartModal" class="btn btn-primary" onclick="addToCart(<%=user.getId() %>,<%= product.getId()%>,'<%=product.getTitle()%>',<%= product.getPriceAfterDiscount()%>);">Add To Card</button> 
						<a href="product.jsp?id=<%=product.getId()%>"
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