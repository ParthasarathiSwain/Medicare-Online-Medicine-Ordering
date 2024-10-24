package com.otz.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Cart;
import com.otz.bean.Coupon;
import com.otz.bean.Customer;
import com.otz.dao.CartDao;
import com.otz.dao.CouponDao;
import com.otz.dao.CustomerDao;
import com.otz.dao.DbConnection;


@WebServlet("/customer")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest session;
   
    public CustomerServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		if(event.equals("viewCustomer")) {
			try {
				CustomerDao customerDao=new CustomerDao();
				List<Customer> customer = customerDao.viewCustomers();
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(customer);
			//  System.out.print(JSONObject);
			    out.print(JSONObject);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(event.equals("delete_customer")){
			int cusId=Integer.parseInt(request.getParameter("cus_Id"));
			String status=CustomerDao.deleteCustomer(cusId)==1?"done":"";
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(status);
		//  System.out.print(JSONObject);
			out.print(JSONObject);
			
		}else if(event.equals("loginCustomer")){
			String cus_email = request.getParameter("cus_email");
			String cus_pass = request.getParameter("cus_pass");
			int status = 0;
			Customer customer = new Customer();
			customer.setCusEmail(cus_email);
			customer.setCusPassword(cus_pass);
			CustomerDao cd=new CustomerDao();
			CartDao ob=new CartDao();
			int cid=0;
			if(cd.loginValidate(customer))
			{
				 HttpSession session = request.getSession(true);
				 session.setAttribute("username", cus_email);
				 cid=cd.getCustomerId(cus_email,cus_pass);
				 session.setAttribute("cusId", cid);
				 List<Cart> cartlist=ob.getCartByCustomerId(cid);
				 status=1;
				 session.setAttribute("cartCount", cartlist.size());
			}
			out.print(status);
		}else if(event.equals("change_password")){
			HttpSession session = request.getSession(true);
			String userName=(String)(session.getAttribute("username"));
			int cusId=Integer.parseInt((session.getAttribute("cusId")).toString());
			String oldPsw=request.getParameter("old_pass");
			String newPsw=request.getParameter("new_pass");
			
				CustomerDao cusDao=new CustomerDao();
				String old=cusDao.getOldPassword(cusId);
				if(old.equals(newPsw)){
					out.print("status");
				}
				else {
				Customer customer = new Customer();
				customer.setCusPassword(oldPsw);
				customer.setNewPsw(newPsw);
				customer.setCusEmail(userName);
				customer.setCusId(cusId);
				cusDao.changePassword(customer);
				}
			
		}else if(event.equals("fatchCustomerById")) {
			System.out.println(event);
			HttpSession session = request.getSession(true);
			int cusId=Integer.parseInt((session.getAttribute("cusId")).toString());
			CustomerDao cusDao=new CustomerDao();
			List<Customer> customer = cusDao.sortCustomerById(cusId);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(customer);
		    System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("UpdateProfile")) {
			HttpSession session = request.getSession(true);
			int cusId=Integer.parseInt((session.getAttribute("cusId")).toString());
			String cus_name=request.getParameter("cus_name");
			String cus_email=request.getParameter("cus_email");
			String cus_pno=request.getParameter("cus_pno");
			String cus_address=request.getParameter("cus_address");
			String cus_city=request.getParameter("cus_city");
			//img
			Part p1=request.getPart("cus_dp");
			System.out.println(p1);	
			String Path=DbConnection.Path3();
	        String appPath =Path+"/customerImg";
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	        // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) 
	                 fileDir.mkdirs();
	      //Get Image Name
	        String imageName1 = p1.getSubmittedFileName();
	        String fileExt1 = imageName1.substring(imageName1.length()-3);
	        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
	        
	        String finalImgPath1="adminImg" + "/"+ imgname1;
	
			        if(validateImage1(imageName1)){
			            try{
			                p1.write(imagePath + "/" + imgname1);
			            }catch (Exception ex) { }
			        }else{ out.print("<script> alert('Invalid Image Format')</script>");  }
	        
			//img end
			    	Customer customer=new Customer();
			    	customer.setCusId(cusId);
					customer.setCusName(cus_name);
					customer.setCusEmail(cus_email);
					customer.setCusPNum(cus_pno);
					customer.setCusAddress(cus_address);
					customer.setCusCity(cus_city);
					customer.setCusImage(imgname1);
					CustomerDao cusDao=new CustomerDao();
					cusDao.UpdateCustomer(customer);
					response.sendRedirect("editProfile.jsp");
		}
	}

	private boolean validateImage1(String imageName1){
	      String fileExt1 = imageName1.substring(imageName1.length()-3);
	      if("jpg".equals(fileExt1) || "png".equals(fileExt1) || "gif".equals(fileExt1))
	      { 
	    	  return true;
	      }
	      return false;
	    }

	
	
}
