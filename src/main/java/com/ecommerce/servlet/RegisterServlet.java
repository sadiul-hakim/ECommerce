package com.ecommerce.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.user.UserService;
import com.ecommerce.dao.user.UserServiceImp;
import com.ecommerce.entities.User;
import com.ecommerce.helper.Sha256Encryptor;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserService servic=new UserServiceImp(
			new Sha256Encryptor()
			);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		Date date=new Date();
		String role="user";
		
		User user=new User(name, email, password, phone, null, address, role, date);
		
		int saved=servic.save(user);
		
		if(saved==-1) {
			request.setAttribute("error", "Could not register User./User already exists!");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}else {
			response.sendRedirect("login.jsp");
		}
		
	}

}
