<%@page import="com.ecommerce.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.Sha256Encryptor"%>
<%@page import="com.ecommerce.dao.user.UserServiceImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	request.getRequestDispatcher("login.jsp").forward(request, response);
} else if (user.getRole().equals("user")) {
	response.sendRedirect("index.jsp");
}

//Users
UserServiceImp userService = new UserServiceImp(new Sha256Encryptor());
List<User> users = userService.allUsers();
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
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Role</th>
							<th scope="col">Date</th>
							<th scope="col">#</th>
						</tr>
					</thead>
					<tbody>
						<%for(User u:users){ %>
							<tr>
								<td><%=u.getId() %></td>
								<td><%=u.getName() %></td>
								<td><%=u.getEmail() %></td>
								<td><%=u.getPhone() %></td>
								<td><%=u.getAddress() %></td>
								<td><%=u.getRole() %></td>
								<td><%=u.getDate() %></td>
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