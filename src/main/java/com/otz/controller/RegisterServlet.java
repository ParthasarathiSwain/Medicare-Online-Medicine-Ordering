package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.otz.bean.Customer;
import com.otz.dao.RegisterDao;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		try(PrintWriter out=response.getWriter()){
			
			String cus_name=request.getParameter("cus_name");
			String cus_email=request.getParameter("cus_email");
			String cus_pass=request.getParameter("cus_pass");
			String cus_cpass=request.getParameter("cus_cpass");
			String cus_pno=request.getParameter("cus_pno");
			String cus_address=request.getParameter("cus_address");
			String cus_city=request.getParameter("cus_city");
			String cus_dp=request.getParameter("cus_dp");
			
			Customer customer=new Customer();
			customer.setCusName(cus_name);
			customer.setCusEmail(cus_email);
			customer.setCusPassword(cus_pass);
			customer.setCusPNum(cus_pno);
			customer.setCusAddress(cus_address);
			customer.setCusCity(cus_city);
			customer.setcConfirmCode("11");
			String img="";
			customer.setCusImage(img);
			
			RegisterDao rd=new RegisterDao();
			rd.registerUser(customer);
			out.println("done");
	}catch(Exception e) {
		e.printStackTrace();
	}
	}


	
}
