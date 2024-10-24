package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.otz.bean.Contact;
import com.otz.dao.ContactDao;
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ContactServlet() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		if(event.equals("saveContactUs")) {
			try {
				String deptName=request.getParameter("deptName");
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String subject=request.getParameter("subject");
				String message=request.getParameter("message");
				
				Contact contact=new Contact();
				contact.setDept(deptName);
				contact.setName(name);
				contact.setEmail(email);
				contact.setSubject(subject);
				contact.setMessage(message);
				
			ContactDao contactDao=new ContactDao();
			contactDao.saveContact(contact);
				
				out.println("Successfully Sent");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
