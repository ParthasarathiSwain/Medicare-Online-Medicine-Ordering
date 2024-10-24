package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.otz.bean.Category;



public class CategoryDao {
	//add all Category
    public void addCategory(Category cat) {
    	try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO category(catName,catImage)VALUES(?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,cat.getCatName());
			ps.setString(2,"");
			ps.executeUpdate();
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
		}	
    }
	
	//get all product
	public List<Category> getAllCategory(){
		 ArrayList<Category> categoryList=new ArrayList<Category>();//Creating Arraylist 
    	 try {
    		Connection con = DbConnection.getConnection();
  		    String sql="select * from category";
  		    PreparedStatement ps=con.prepareStatement(sql);  
  		    ResultSet rs=ps.executeQuery();  
  		    while(rs.next())
  		    {
  		    	Category category = new Category();
  		    	category.setCategoryId(rs.getInt(1));
  		    	category.setCatName(rs.getString(2));
  		    	category.setCatImage(rs.getString(3));
  		    	categoryList.add(category);
  		    }
  	        con.close();  
  		}catch(Exception ex) {
  			ex.printStackTrace();
  		}
    	
		return categoryList ;
		
	}
	
	//delete product
	 public static int deleteCategory(int categoryId){  
		 int status=0;
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from category where categoryId=?";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,categoryId);  
		        status =ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
	 
	 // sort category by Id
		public  List<Category> srotCategoryByCatId(int categoryId){
		 ArrayList<Category> catlist=new ArrayList<Category>();
		 try {
			 Connection con = DbConnection.getConnection();
		     String sql="Select * from Category where categoryId=?";
		     PreparedStatement ps=con.prepareStatement(sql);
		     ps.setInt(1, categoryId);
		     ResultSet rs=ps.executeQuery();  
		    while(rs.next())
		    {
		    	Category category= new Category();
		    	category.setCategoryId(rs.getInt(1));
		    	category.setCatName(rs.getString(2));
		    	catlist.add(category);
		    }
	       con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return catlist ;
		
	}
		//update Category
				public void updateCategory(Category category) {
					try {
						Connection con=DbConnection.getConnection();
						String sql="update Category set catName=? where categoryId=?";
						PreparedStatement ps=con.prepareStatement(sql);
						ps.setString(1,category.getCatName());
						ps.setInt(2, category.getCategoryId());
						ps.executeUpdate();
					}catch (SQLException e) {e.printStackTrace();}
				}	
}
