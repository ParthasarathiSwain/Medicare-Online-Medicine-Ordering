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
import com.otz.bean.Coupon;
import com.otz.dao.CouponDao;


@WebServlet("/coupon")
public class CouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CouponServlet() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		if(event.equals("saveCoupon")) {
			try {
				String couponTitle=request.getParameter("couponTitle");
				String couponPrice=request.getParameter("couponPrice");
				String couponCode=request.getParameter("couponCode");
				String couponProduct=request.getParameter("couponProduct");
				String couponAmount=request.getParameter("couponAmount");
				Coupon coupon=new Coupon();
				coupon.setCouponTitle(couponTitle);
				coupon.setCouponPrice(couponPrice);
				coupon.setCouponCode(couponCode);
				coupon.setLimite(couponProduct);
				coupon.setUses(couponAmount);
				CouponDao couponDao=new CouponDao();
				couponDao.saveCoupon(coupon);
				response.sendRedirect("admin/viewCoupons.jsp");
			}catch(Exception e) {e.printStackTrace();}
		}else if(event.equals("getCoupon")) {
			try {
				CouponDao pd=new CouponDao();
				List<Coupon> coupon = pd.getAllCoupon();
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(coupon);
			    out.print(JSONObject);
			}catch(Exception e) {e.printStackTrace();}
		}else if(event.equals("coupon_delete")){
			try {
				int couponId=Integer.parseInt(request.getParameter("coupon_Id"));
				String status=CouponDao.deleteCoupon(couponId)==1?"done":"";
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(status);
				out.print(JSONObject);	
			}catch(Exception e) {e.printStackTrace();}
		}
		else if(event.equals("fatchCouponByCouId")) {
			try {
				int couponId=Integer.parseInt(request.getParameter("couponId"));
				CouponDao pd=new CouponDao();
				List<Coupon> coupon = pd.sortCouponByCoupId(couponId);
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(coupon);		    
				out.print(JSONObject);
			}catch(Exception e) {e.printStackTrace();}
		}
		else if(event.equals("updateCoupon")) {
			try {
				int couponId=Integer.parseInt(request.getParameter("coupId"));
				String couponTitle=request.getParameter("couponName");
				String couponPrice=request.getParameter("couponPrice");
				String couponCode=request.getParameter("couponCode");
				
				Coupon coupon=new Coupon();
				coupon.setCouponTitle(couponTitle);
				coupon.setCouponPrice(couponPrice);
				coupon.setCouponCode(couponCode);
				coupon.setCouponId(couponId);
				CouponDao pd=new CouponDao();
				pd.updateCoupon(coupon);
				response.sendRedirect("admin/viewCoupons.jsp");
			}catch(Exception e) {e.printStackTrace();}
		}
		
	}

}
