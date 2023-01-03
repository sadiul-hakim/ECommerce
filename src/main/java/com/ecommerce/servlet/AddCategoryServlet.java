package com.ecommerce.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.category.CategoryService;
import com.ecommerce.dao.category.CategoryServiceImp;
import com.ecommerce.entities.Category;

/**
 * Servlet implementation class AddCategoryServlet
 */
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final CategoryService categoryService=new CategoryServiceImp();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
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
		
		String title=request.getParameter("title");
		String description=request.getParameter("description");
		
		Category category=new Category();
		category.setTitle(title);
		category.setDescription(description);
		category.setDate(new Date());
		
		categoryService.add(category);
		
		response.sendRedirect("admin.jsp");
		
		
	}

}
