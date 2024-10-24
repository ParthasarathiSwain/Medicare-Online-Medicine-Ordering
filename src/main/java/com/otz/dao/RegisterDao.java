package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.otz.bean.Customer;


public class RegisterDao {
	public void registerUser(Customer cus) {
		try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO customer( cusId,cusName,cusEmail,cusPassword,cusAddress,cusCity,cusImage,cusPNum, cConfirmCode)VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setInt(1,    cus.getCusId());
			ps.setString(2, cus.getCusName());
			ps.setString(3, cus.getCusEmail());
			ps.setString(4, cus.getCusPassword());
			ps.setString(5, cus.getCusAddress());
			ps.setString(6, cus.getCusCity());
			ps.setString(7, cus.getCusImage());
			ps.setString(8, cus.getCusPNum());
			ps.setString(9, cus.getcConfirmCode());
			ps.executeUpdate();
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
}
