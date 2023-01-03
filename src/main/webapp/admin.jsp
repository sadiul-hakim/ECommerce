<%@page import="com.ecommerce.entities.Product"%>
<%@page import="com.ecommerce.dao.product.ProductServiceImp"%>
<%@page import="com.ecommerce.helper.Sha256Encryptor"%>
<%@page import="com.ecommerce.dao.user.UserServiceImp"%>
<%@page import="com.ecommerce.dao.category.CategoryServiceImp"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
} else if (user.getRole().equals("user")) {
	response.sendRedirect("index.jsp");
}

//Categories
CategoryServiceImp cateServ = new CategoryServiceImp();
List<Category> categories = cateServ.allCategories();

//Users
UserServiceImp userService = new UserServiceImp(new Sha256Encryptor());
List<User> users = userService.allUsers();

//Products
ProductServiceImp productService = new ProductServiceImp();
List<Product> products = productService.allProducts();
%>

<!DOCTYPE html>
<html>
<%@include file="Head.jsp"%>
<body>
	<%@include file="AdminNavbar.jsp"%>

	<div class="container">
		<div class="alert alert-info mt-3">
			<h3 class="display-4 text-center">
				Welcome Admin :
				<%=user.getName()%>.
			</h3>
		</div>
		<div class="row my-2 d-flex justify-content-between">
			<div class="col-md-4">
				<div class="card d-flex justify-content-center align-items-center">
					<img src="img/man.png" width="150" height="150" alt="users pic" />
					<h3 class="text-info">
						<%=users.size()%>
					</h3>
					<a href="users.jsp" class="text-info">Users</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card d-flex justify-content-center align-items-center">
					<img src="img/delivery-box.png" width="150" height="150"
						alt="product pic" />
					<h3 class="text-info">
						<%=products.size()%>
					</h3>
					<a href="products.jsp" class="text-info">Products</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card d-flex justify-content-center align-items-center">
					<img src="img/menu.png" width="150" height="150" alt="category pic" />
					<h3 class="text-info">
						<%=categories.size()%>
					</h3>
					<a href="categories.jsp" class="text-info">Categories</a>
				</div>
			</div>
		</div>
		<div class="row my-2 d-flex justify-content-between">
			<div class="col-md-6" data-bs-toggle="modal"
				data-bs-target="#productModal">
				<div class="card d-flex justify-content-center align-items-center">
					<img src="img/plus.png" width="150" height="150" alt="plus button" />
					<p class="text-muted">Click here to add new Product.</p>
					<h2 class="text-info">NEW PRODUCT</h2>
				</div>
			</div>
			<div class="col-md-6" data-bs-toggle="modal"
				data-bs-target="#categoryModal">
				<div class="card d-flex justify-content-center align-items-center">
					<img src="img/plus.png" width="150" height="150" alt="plus button" />
					<p class="text-muted">Click here to add new Category.</p>
					<h2 class="text-info">NEW CATEGORY</h2>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Category Modal -->
	<div class="modal fade" id="categoryModal" tabindex="-1"
		aria-labelledby="categoryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="AddCategoryServlet" method="post">
						<div class="my-2">
							<input type="text" class="form-control" placeholder="Enter title"
								name="title" />
						</div>
						<div class="my-2">
							<textarea rows="5" class="form-control"
								placeholder="Enter description" name="description"></textarea>
						</div>
						<div class="my-2">
							<button type="submit" class="btn btn-info form-control">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Add Product Modal -->
	<div class="modal fade" id="productModal" tabindex="-1"
		aria-labelledby="productModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="AddProductServlet" method="post"
						enctype="multipart/form-data">
						<div class="my-2">
							<input type="text" class="form-control" placeholder="Enter title"
								name="title" />
						</div>
						<div class="my-2">
							<textarea rows="5" class="form-control"
								placeholder="Enter description" name="description"></textarea>
						</div>
						<div class="my-2">
							<input type="number" class="form-control"
								placeholder="Enter Price" name="price" />
						</div>
						<div class="my-2">
							<input type="number" class="form-control"
								placeholder="Enter discount" name="discount" />
						</div>
						<div class="my-2">
							<input type="number" class="form-control"
								placeholder="Enter quantity" name="quantity" />
						</div>
						<div class="my-2">
							<select name="category" class="form-control">
								<option value="">--select category--</option>
								<%
								for (Category category : categories) {
								%>
								<option value="<%=category.getId()%>"><%=category.getTitle()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="my-2">
							<label>Select picture of product :</label> <input type="file"
								class="form-control" name="pic" />
						</div>
						<div class="my-2">
							<button type="submit" class="btn btn-info form-control">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>