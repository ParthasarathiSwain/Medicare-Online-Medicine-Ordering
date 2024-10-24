package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Category;
import com.otz.dao.CategoryDao;



@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CategoryServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		
		if(event.equals("getCategory")) {
			CategoryDao category=new CategoryDao();
			List<Category> products = category.getAllCategory();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(products);
		    System.out.print(JSONObject);		
			out.print(JSONObject);
	    }else if(event.equals("saveCategory")) {
				String categoryName=request.getParameter("categoryname");
				Category cat=new Category();
				cat.setCatName(categoryName);
				CategoryDao categoryDao=new CategoryDao();
				categoryDao.addCategory(cat);
				out.println("done");
				response.sendRedirect("admin/viewCategory.jsp");
		}else if(event.equals("delete_category")){
			int categoryId=Integer.parseInt(request.getParameter("category_Id"));
			String status=CategoryDao.deleteCategory(categoryId)==1?"done":"";
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(status);
		    System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("fatchCategoryByCatId")) {
			int categoryId=Integer.parseInt(request.getParameter("categoryId"));
			CategoryDao categoryDao=new CategoryDao();
			List<Category> category = categoryDao.srotCategoryByCatId(categoryId);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(category);
		    System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("updateCategory")) {
			int categoryId=Integer.parseInt(request.getParameter("categoryId"));
			String categoryName=request.getParameter("catName");
			Category category=new Category();
			category.setCatName(categoryName);
			category.setCategoryId(categoryId);
			CategoryDao categoryDao=new CategoryDao();
			categoryDao.updateCategory(category);
			response.sendRedirect("admin/viewCategory.jsp");
		}
		

	}
}
