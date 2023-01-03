package com.ecommerce.servlet;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileUpload;

import com.ecommerce.dao.category.CategoryService;
import com.ecommerce.dao.category.CategoryServiceImp;
import com.ecommerce.dao.product.ProductService;
import com.ecommerce.dao.product.ProductServiceImp;
import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
import com.ecommerce.helper.FileUploader;
import com.ecommerce.helper.PathProvider;

/**
 * Servlet implementation class AddProductServlet
 */
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final ProductService productService=new ProductServiceImp();
    private final CategoryService categoryService=new CategoryServiceImp();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
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
		int price=Integer.parseInt(request.getParameter("price"));
		int discount=Integer.parseInt(request.getParameter("discount"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		Part picPart=request.getPart("pic");		
		int categoryId=Integer.parseInt(request.getParameter("category"));
		
		Category category=categoryService.getCategory(categoryId);
		
		Product product=new Product(title, description, picPart.getSubmittedFileName(), price, discount, quantity, category, new Date());
		
		String picPath=PathProvider.getPath(request, picPart.getSubmittedFileName());
		System.out.println(picPath);
		
		boolean isUploaded=FileUploader.upload(picPart, picPath);
		
		if(isUploaded) {
			productService.save(product);
			response.sendRedirect("admin.jsp");
		}
		
		
	}

}
