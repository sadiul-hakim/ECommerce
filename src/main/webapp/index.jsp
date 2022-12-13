<%@page import="com.ecommerce.entities.User"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	User user=(User)session.getAttribute("user");
	if(user != null && user.getRole().equals("admin"))
	{
    	response.sendRedirect("admin.jsp");
    }
%>

<html>
<%@include file="Head.jsp" %>
<body>

<%if(user==null){ %>
<%@include file="Navbar.jsp" %>
<%}else{ %>
<%@include file="UserNavbar.jsp" %>
<%} %>
	
</body>
</html>