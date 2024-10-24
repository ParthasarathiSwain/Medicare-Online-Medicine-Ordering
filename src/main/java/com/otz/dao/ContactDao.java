package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.otz.bean.Contact;

public class ContactDao {
	 public void saveContact(Contact contact) {
	    	try {
				Connection con=DbConnection.getConnection();
				String query="INSERT INTO contact(name,email,subject,message,dept)VALUES(?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1,contact.getName());
				ps.setString(2,contact.getEmail());
				ps.setString(3,contact.getSubject());
				ps.setString(4, contact.getMessage());
				ps.setString(5, contact.getDept());
				ps.executeUpdate();
				
			}  catch (SQLException e) {
				
				e.printStackTrace();
			}	
	    }
	    
}
