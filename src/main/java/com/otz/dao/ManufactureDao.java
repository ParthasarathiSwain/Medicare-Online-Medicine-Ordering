package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.otz.bean.Manufacturer;


public class ManufactureDao {
	//add all Manufacture
    public void saveManufacturer(Manufacturer man) {
    	try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO manufacture(manName,manImage)VALUES(?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,man.getManName());
			ps.setString(2,"");
			ps.executeUpdate();
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
		}	
    }
	
	//get all Manufacture
	public List<Manufacturer> getAllManufacturers(){
		 ArrayList<Manufacturer> manufacturerList=new ArrayList<Manufacturer>();//Creating Arraylist 
    	 try {
    		Connection con = DbConnection.getConnection();
  		    String sql="select * from manufacture";
  		    PreparedStatement ps=con.prepareStatement(sql);  
  		    ResultSet rs=ps.executeQuery();  
  		    while(rs.next())
  		    {
  		    	Manufacturer manufacturer = new Manufacturer();
  		    	manufacturer.setManufactureId(rs.getInt(1));
  		    	manufacturer.setManName(rs.getString(2));
  		    	manufacturer.setManImage(rs.getString(3));
  		    	manufacturerList.add(manufacturer);
  		    }
  	        con.close();  
  		}catch(Exception ex) {
  			ex.printStackTrace();
  		}
    	
		return manufacturerList ;
		
	}
	

	
	//delete product
	 public static int deleteManufacture(int manufactureId){  
		 int status=0;
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from manufacture where manufactureId=?";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,manufactureId);  
		        status =ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
	 // sort manufacture 
	 public  List<Manufacturer> sortManufacturerByManId(int manufactureId){
		 ArrayList<Manufacturer> manlist=new ArrayList<Manufacturer>();
		 try {
			 Connection con = DbConnection.getConnection();
		     String sql="Select * from Manufacture where manufactureId=?";
		     PreparedStatement ps=con.prepareStatement(sql);
		     ps.setInt(1, manufactureId);
		     ResultSet rs=ps.executeQuery();  
		    while(rs.next())
		    {
		    	Manufacturer manufacturer = new Manufacturer();
  		    	manufacturer.setManufactureId(rs.getInt(1));
  		    	manufacturer.setManName(rs.getString(2));
  		    	manlist.add(manufacturer);
		    }
	       con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return manlist ;
	}
	 
	 //update manufacturer
		public void updateManufacturer(Manufacturer man) {
			try {
				Connection con=DbConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("update Manufacture set manName=? where manufactureId=?");
				ps.setString(1,man.getManName());
				ps.setInt(2, man.getManufactureId());
				ps.executeUpdate();
			}catch (SQLException e) {e.printStackTrace();}
		}	
}
