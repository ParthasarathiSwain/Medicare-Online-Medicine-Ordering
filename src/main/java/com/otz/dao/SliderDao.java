package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.otz.bean.Slider;



public class SliderDao {
	// save all slider
	  public static int saveSlider(Slider slider) {
		  int status=0;
	    	try {
				Connection con=DbConnection.getConnection();
				String query="INSERT INTO slider(sliderId,sName,sImage,sliderURL)VALUES(?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setInt(1,slider.getSliderId());
				ps.setString(2,slider.getsName());
				ps.setString(3,slider.getsImage());
				String url="";
				ps.setString(4,url);
			ps.executeUpdate();
				
			}  catch (SQLException e) {
				
				e.printStackTrace();
			}	
	    	
	    	return status;
	    }
	  // get all  slider
	  public List<Slider> getAllSlider(){
			 ArrayList<Slider> sliderList=new ArrayList<Slider>();//Creating Arraylist 
	    	 try {
	    		Connection con = DbConnection.getConnection();
	  		    String sql="select * from slider";
	  		    PreparedStatement ps=con.prepareStatement(sql);  
	  		    ResultSet rs=ps.executeQuery();  
	  		    while(rs.next())
	  		    {
	  		    	Slider slider = new Slider();
	  		    	slider.setSliderId(rs.getInt(1));
	  		    	slider.setsName(rs.getString(2));
	  		    	slider.setsImage(rs.getString(3));
	  		    	slider.setSliderURL(rs.getString(4));
	  		    	sliderList.add(slider);
	  		    }
	  	        con.close();  
	  		}catch(Exception ex) {
	  			ex.printStackTrace();
	  		}
	    	
			return sliderList ;
			
		}
	  public static int deleteSlider(int sliderId){  
		 int status=0;
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from slider where sliderId=?";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,sliderId);  
		        status =ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
}
