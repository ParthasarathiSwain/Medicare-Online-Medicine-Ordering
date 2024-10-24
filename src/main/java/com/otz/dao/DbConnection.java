package com.otz.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection getConnection() {
		
		   Connection con=null;
	        try
	        {
	        	Class.forName("com.mysql.cj.jdbc.Driver");  
				con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/medlife","TURGUT","TURGUT"); 
	            
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }
	        return con;
	
	}
	public static String Path() {
		String Path="C:/Users/PARTHA/eclipse-workspace/Medicare_Online_Shoping_app/src/main/webapp/admin/resources/img";
		return Path;
	}
	public static String Path2() {
		String Path="C:/Users/PARTHA/eclipse-workspace/Medicare_Online_Shoping_app/src/main/webapp/admin";
		return Path;
	}
	public static String Path3() {
		String Path="C:/Users/PARTHA/eclipse-workspace/Medicare_Online_Shoping_app/src/main/webapp/";
		return Path;
	}
}
