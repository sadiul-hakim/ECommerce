<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.category.CategoryService"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.category.CategoryServiceImp"%>
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
CategoryService cateService = new CategoryServiceImp();
List<Category> categories = cateService.allCategories();

%>
<!DOCTYPE html>
<html>
<%@include file="Head.jsp"%>
<body>
	<%@include file="AdminNavbar.jsp"%>
	
	<div class="container-fluid my-2">
		<div class="row">
			<div class="col-md-2">
				<a type="button" class="btn btn-primary btn-lg" href="admin.jsp">
					<i class="fa fa-mail-reply"></i> Go Back
				</a>
			</div>
			<div class="col-md-10 card">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Title</th>
							<th scope="col">Description</th>
							<th scope="col">Date</th>
							<th scope="col">#</th>
						</tr>
					</thead>
					<tbody>
						<%for(Category c:categories){ %>
							<tr>
								<td><%=c.getId() %></td>
								<td><%=c.getTitle() %></td>
								<td><%=c.getDescription() %></td>
								<td><%=c.getDate() %></td>
								<td><a href="" class="btn btn-primary">Edit</a>
								<a href="" class="btn btn-danger">Delete</a></td>
							</tr>
						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>