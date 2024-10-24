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
import com.otz.bean.OrderDetails;
import com.otz.bean.Orders;
import com.otz.dao.OrderDao;
import com.otz.dao.OrderDetailsDao;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OrderServlet() {
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		
		if(event.equals("getallOrders")) {
			OrderDao orderDao=new OrderDao();
			List<Orders> order = orderDao.getAllOrders();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(order);
		    System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("order_details")) {
			//System.out.println(event);
			//System.out.println(request.getParameter("order_id"));
			OrderDetailsDao orderDetailsDao=new OrderDetailsDao();
			List<OrderDetails> orderDetails = orderDetailsDao.getOrderDetails(request.getParameter("order_id"));
		
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(orderDetails);
		    System.out.print(JSONObject);
			out.print(JSONObject);
		}
		
		
	}

}
