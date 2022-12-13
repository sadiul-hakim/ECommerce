package com.ecommerce.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.ecommerce.dao.user.LoginDTO;
import com.ecommerce.dao.user.UserService;
import com.ecommerce.dao.user.UserServiceImp;
import com.ecommerce.entities.User;
import com.ecommerce.helper.Sha256Encryptor;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserService service=new UserServiceImp(new Sha256Encryptor());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		LoginDTO dto=new LoginDTO(email,password);
		User user=service.login(dto);
		
		if(user==null) {
			request.setAttribute("error", "Invalid Credentials!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			HttpSession session= request.getSession();
			session.setAttribute("user", user);
			
			if(user.getRole().equals("user")) {
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("admin.jsp");
			}
		}
		
	}

}
