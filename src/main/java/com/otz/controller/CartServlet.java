package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Cart;
import com.otz.dao.CartDao;


@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CartServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		HttpSession session = request.getSession();
		if(event.equals("addToCart")) {
			int productId=Integer.parseInt(request.getParameter("productId"));
			int qty=Integer.parseInt(request.getParameter("qty"));
			float unitprice=Float.parseFloat(request.getParameter("unitprice"));
			float  totalPrice = qty*unitprice;
		//	System.out.println(totalPrice);
			
			if(session.getAttribute("cusId")==null || (session.getAttribute("cusId")).equals("")) {
				out.print("nocart");
			}else {
				int cusId=(int)session.getAttribute("cusId");
				Cart cart=new Cart();
				cart.setProductId(productId);
				cart.setCartQty(qty);
				cart.setCartPrice(unitprice);
				cart.setCartAmount(totalPrice);
				cart.setCusId(cusId);
				CartDao ob=new CartDao();
				if((ob.addToCart(cart)) ==1) {
				    List<Cart> cartlist=ob.getCartByCustomerId(cusId);
					GsonBuilder gsonBuilder = new GsonBuilder();
				    Gson  gson = gsonBuilder.create();
				    String JSONObject = gson.toJson(cartlist);
					out.print(JSONObject);
					}		
			}//inner else
				
		}else if(event.equals("viewCartIteam")) {
			int cusId=(int)session.getAttribute("cusId");
			CartDao ob=new CartDao();
			List<Cart> carts = ob.getCartByCustomerId(cusId);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(carts);
		    out.print(JSONObject);
		    System.out.println(carts);
			
		}else if(event.equals("cart_delete")) {
			int cusId=(int)session.getAttribute("cusId");
			String productids=request.getParameter("productids");
			CartDao ob=new CartDao();
			ob.deleteCartByCustomerId(cusId,productids);
			
			
			List<Cart> carts = ob.getCartByCustomerId(cusId);
			session.setAttribute("cartCount", carts.size());
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(carts);
		    out.print(JSONObject);
			
		}
		
	}//doPost

}//class
