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
import com.otz.bean.Manufacturer;
import com.otz.dao.ManufactureDao;


@WebServlet("/manufacturer")
public class ManufactureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ManufactureServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		if(event.equals("getManufacturers")) {
			ManufactureDao manufacturers=new ManufactureDao();
			List<Manufacturer> products = manufacturers.getAllManufacturers();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(products);
		  //System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("saveManufacture")) {
			try {
				String manufacturerName=request.getParameter("producManufacture");
				Manufacturer man=new Manufacturer();
				man.setManName(manufacturerName);
				ManufactureDao manufactureDao=new ManufactureDao();
				manufactureDao.saveManufacturer(man);
				response.sendRedirect("admin/viewManufacture.jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(event.equals("manufacturer_delete")) {
			int manufactureId=Integer.parseInt(request.getParameter("manufacturer_Id"));
			String status=ManufactureDao.deleteManufacture(manufactureId)==1?"done":"";
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(status);
		    //System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("fatchManuByManId")) {
			int manufactureId=Integer.parseInt(request.getParameter("manufactureId"));
			ManufactureDao manufactureDao=new ManufactureDao();
			List<Manufacturer> manufacturer=manufactureDao.sortManufacturerByManId(manufactureId);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(manufacturer);
		   // System.out.print(JSONObject);
			out.print(JSONObject);
		}
		else if(event.equals("updateManufacturer")) {
			int manufactureId=Integer.parseInt(request.getParameter("manId"));
			String manName=request.getParameter("manName");
			
			Manufacturer man=new Manufacturer();
			man.setManufactureId(manufactureId);
			man.setManName(manName);
			ManufactureDao manufactureDao=new ManufactureDao();
			manufactureDao.updateManufacturer(man);
			response.sendRedirect("admin/viewManufacture.jsp");
		}
		
	}

}
