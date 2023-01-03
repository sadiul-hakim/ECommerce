
<nav class="navbar navbar-expand-lg nav navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
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
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Category </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
						for (Category category : categories) {
						%>

						<li><a class="dropdown-item"
							href="productsByCategory.jsp?cid=<%=category.getId()%>"><%=category.getTitle()%></a></li>
						<li><hr class="dropdown-divider"></li>

						<%
						}
						%>
					</ul></li>

			</ul>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a class="nav-link" aria-current="page" href="cart.jsp?uid=<%= user.getId()%>"> <i
						class="fa fa-shopping-cart"></i>(<span id="cartCount">0</span>)
				</a></li>
				<li class="nav-item nav-link active" aria-current="page"
					data-bs-toggle="modal" data-bs-target="#exampleModal"><i
					class="fa fa-user-circle-o me-1"></i> <%=user.getName()%></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="LogoutServlet"><i class="fa fa-sign-out me-1"></i>logout</a>
				</li>
			</ul>
		</div>
	</div>
</nav>


<!-- Add To Cart Modal -->


<div class="modal fade" id="addToCartModal" tabindex="-1"
	aria-labelledby="addToCartModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h3 class="text-primary">Product added to the cart.</h3>
				<a href="cart.jsp">Go To Cart</a>
			</div>
			
		</div>
	</div>
</div>

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
			<div class="modal-footer">
				<a type="button" class="btn btn-primary">Edit Profile</a> <a
					type="button" class="btn btn-primary">Change Password</a>
			</div>
		</div>
	</div>
</div>