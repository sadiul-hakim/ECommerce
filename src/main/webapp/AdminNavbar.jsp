<nav class="navbar navbar-expand-lg nav navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="admin.jsp"><i
			class="fa fa-shopping-bag me-1"></i>HakimShop</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admin.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="">Orders</a></li>
			</ul>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item nav-link active" aria-current="page"
					data-bs-toggle="modal" data-bs-target="#exampleModal"><i
					class="fa fa-user-circle-o me-1"></i> Admin</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Settings </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">

						<li><a class="dropdown-item" href="#">Change Password</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Edit Profile</a></li>
						
					</ul></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="LogoutServlet"><i class="fa fa-sign-out me-1"></i>logout</a>
				</li>
			</ul>
		</div>
	</div>
</nav>




<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h3><%=user.getName()%></h3>
				<hr />
				<p>
					Email :
					<%=user.getEmail()%></p>
				<hr />
				<p>
					Phone :
					<%=user.getPhone()%></p>
				<hr />
				<p>
					Address:
					<%=user.getAddress()%>
				</p>
			</div>
		</div>
	</div>
</div>