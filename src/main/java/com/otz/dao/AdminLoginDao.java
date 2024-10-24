package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.otz.bean.Admin;



public class AdminLoginDao {
	boolean status;
	public boolean validate(Admin bean) {
		try {
		Connection con=DbConnection.getConnection();
		String sql="SELECT count(*) FROM admin WHERE adminEmail=? AND adminPassword=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,bean.getAdminEmail());
		ps.setString(2,bean.getAdminPassword());
		ResultSet rs=ps.executeQuery();
		while(rs.next()) 
		{
			int r=rs.getInt(1);
			if(r>0) {
				status=true;
			}else {
				status = false;
			}
		}
		} catch (SQLException e) {e.printStackTrace();}
		return status;
	}
	
	
}
