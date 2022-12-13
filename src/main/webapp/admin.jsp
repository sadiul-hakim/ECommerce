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
    	User user=(User)session.getAttribute("user");
    	
    	if(user==null){
    		request.getRequestDispatcher("login.jsp").forward(request, response);
    	}else if(user.getRole().equals("user")){
    		response.sendRedirect("index.jsp");
    	}
    	
    	//Categories
    	CategoryServiceImp cateServ=new CategoryServiceImp();
    	List<Category> categories=cateServ.allCategories();
    	
    	//Users
    	UserServiceImp userService=new UserServiceImp(new Sha256Encryptor());
    	List<User> users=userService.allUsers();
    	
    	//Products
    	ProductServiceImp productService=new ProductServiceImp();
    	List<Product> products=productService.allProducts();
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<%@include file="Head.jsp" %>
<body>
<%@include file="AdminNavbar.jsp" %>

<div class="container">
	<div class="alert alert-info mt-3">
		<h3 class="display-4 text-center">Welcome Admin : <%=user.getName() %>.</h3>
	</div>
	<div class="row my-2">
		<div class="col-md-3 card d-flex justify-content-center align-items-center">
			<img src="img/man.png" width="150" height="150"  alt="users pic"/>
			<h3 class="text-info">
				<%=users.size() %>
			</h3>
			<a href="" class="text-info">Users</a>
		</div>
		<div class="col-md-3 offset-md-1 card d-flex justify-content-center align-items-center">
			<img src="img/delivery-box.png" width="150" height="150"  alt="product pic"/>
			<h3 class="text-info">
				<%=products.size() %>
			</h3>
			<a href="" class="text-info">Products</a>
		</div>
		<div class="col-md-3 offset-md-1 card d-flex justify-content-center align-items-center">
			<img src="img/menu.png" width="150" height="150"  alt="category pic"/>
			<h3 class="text-info">
				<%=categories.size() %>
			</h3>
			<a href="" class="text-info">Categories</a>
		</div>
	</div>
	<div class="row my-2">
		<div class="col-md-5 card d-flex justify-content-center align-items-center" data-bs-toggle="modal" data-bs-target="#productModal">
			<img src="img/plus.png" width="150" height="150" alt="plus button" />
			<span class="badge bg-success">
				New
			</span>
			<p class="text-info">New Product</p>
		</div>
		<div class="col-md-5 offset-md-1 d-flex justify-content-center align-items-center card" data-bs-toggle="modal" data-bs-target="#categoryModal">
			<img src="img/plus.png" width="150" height="150" alt="plus button" />
			<span class="badge bg-success">
				New
			</span>
			<p class="text-info">New Category</p>
		</div>
	</div>
</div>

<!-- Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


<!-- Category Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="" method="post">
        	<div class="my-2">
        		<input type="text" class="form-control" placeholder="Enter title" name="title"/>
        	</div>
        	<div class="my-2">
        		<textarea rows="5" class="form-control" placeholder="Enter description" name="description"></textarea>
        	</div>
        	<div class="my-2">
				<button type="submit" class="btn btn-info form-control">Save</button>
        	</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>