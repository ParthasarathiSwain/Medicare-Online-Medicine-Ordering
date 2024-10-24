package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Admin;
import com.otz.bean.Category;


public class AdminDao {
	// save  Admin
		  public static int addAdmin(Admin admin) {
			  int status=0;
		    	try {
					Connection con=DbConnection.getConnection();
					String query="INSERT INTO admin(adminName,adminEmail,adminPassword,adminPhoto,adminPNum)VALUES(?,?,?,?,?)";
					PreparedStatement ps=con.prepareStatement(query);
					ps.setString(1,admin.getAdminName());
					ps.setString(2,admin.getAdminEmail());
					ps.setString(3,admin.getAdminPassword());
					ps.setString(4,admin.getAdminPhoto());
					ps.setString(5,admin.getAdminPNum());
					
					status=ps.executeUpdate();
					
				}  catch (SQLException e) {
					
					e.printStackTrace();
				}	
		    	
		    	return status;
		    } 
		
	//get all admin
	
	 public List<Admin> getAllAdmin(){
		 ArrayList<Admin> adminList=new ArrayList<Admin>();//Creating Arraylist 
    	 try {
    		Connection con = DbConnection.getConnection();
  		    String sql="select * from Admin";
  		    PreparedStatement ps=con.prepareStatement(sql);  
  		    ResultSet rs=ps.executeQuery();  
  		    while(rs.next())
  		    {
  		    	Admin admin = new Admin();
  		    	admin.setAdminId(rs.getInt(1));
  		    	admin.setAdminName(rs.getString(2));
  		    	admin.setAdminEmail(rs.getString(3));
  		    	admin.setAdminPassword(rs.getString(4));
  		    	admin.setAdminPhoto(rs.getString(5));
  		    	admin.setAdminPNum(rs.getString(6));
  		    	adminList.add(admin);
  		    }
  	        con.close();  
  		}catch(Exception ex) {
  			ex.printStackTrace();
  		}
		return adminList ;	
	}
	
	 
	 //edit admin 
	 
	 
	//delete admin
	 public static int deleteAdmin(int adminId){  
		 int status=0;
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from admin where adminId=?";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,adminId);  
		        status =ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
	// sort Admin by Id
			public  List<Admin> sortAdminByAdminId(int admin_Id){
			 ArrayList<Admin> adminlist=new ArrayList<Admin>();
			 try {
				 Connection con = DbConnection.getConnection();
			     String sql="Select * from Admin where adminId=?";
			     PreparedStatement ps=con.prepareStatement(sql);
			     ps.setInt(1, admin_Id);
			     ResultSet rs=ps.executeQuery();  
			    while(rs.next())
			    {
			    	Admin admin = new Admin();
	  		    	admin.setAdminId(rs.getInt(1));
	  		    	admin.setAdminName(rs.getString(2));
	  		    	admin.setAdminEmail(rs.getString(3));
	  		    	admin.setAdminPassword(rs.getString(4));
	  		    	admin.setAdminPhoto(rs.getString(5));
	  		    	admin.setAdminPNum(rs.getString(6));
	  		    	adminlist.add(admin);
			    }
		       con.close();  
			}catch(Exception ex) {ex.printStackTrace();}
			return adminlist ;
			
		}
			//update Admin
			public void updateAdmin(Admin admin) {
				try {
					Connection con=DbConnection.getConnection();
					PreparedStatement ps=con.prepareStatement("update admin set adminName=?,adminEmail=?,adminPassword=?,adminPNum=? where adminId=?");
					ps.setString(1,admin.getAdminName());
					ps.setString(2,admin.getAdminEmail());
					ps.setString(3,admin.getAdminPassword());
					ps.setString(4,admin.getAdminPNum());
					ps.setInt(5,admin.getAdminId());
					ps.executeUpdate();
				}catch (SQLException e) {e.printStackTrace();}
			}	
			
}
