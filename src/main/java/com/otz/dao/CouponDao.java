package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Category;
import com.otz.bean.Coupon;

public class CouponDao {
	//save all Coupons
    public void saveCoupon(Coupon coupon) {
    	try {
			Connection con=DbConnection.getConnection();
			String query="INSERT INTO coupons(couponTitle,couponPrice,couponCode,limite,uses,productId)VALUES(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,coupon.getCouponTitle());
			ps.setString(2,coupon.getCouponPrice());
			ps.setString(3,coupon.getCouponCode());
			ps.setString(4, coupon.getLimite());
			ps.setString(5, coupon.getUses());
			int id=1;
			ps.setInt(6,id );
			ps.executeUpdate();
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
		}	
    }
    
    // GET ALL COUPONS
  
  	public List<Coupon> getAllCoupon(){
  		 ArrayList<Coupon> couponList=new ArrayList<Coupon>();//Creating Arraylist 
      	 try {
      		Connection con = DbConnection.getConnection();
    		    String sql="SELECT * FROM COUPONS";
    		    PreparedStatement ps=con.prepareStatement(sql);  
    		    ResultSet rs=ps.executeQuery();  
    		    while(rs.next())
    		    {
    		    	Coupon coupon = new Coupon();
    		    	coupon.setCouponId(rs.getInt(1));
    		    	coupon.setProductId(rs.getInt(2));
    		    	coupon.setCouponTitle(rs.getString(3));
    		    	coupon.setCouponPrice(rs.getString(4));
    		    	coupon.setCouponCode(rs.getString(5));
    		    	coupon.setLimite(rs.getString(6));
    		    	coupon.setUses(rs.getString(7));
    		    	couponList.add(coupon);
    		    }
    	        con.close();  
    		}catch(Exception ex) {
    			ex.printStackTrace();
    		}
  		return couponList ;	
  	}
    
  	
  	//delete coupon
  	 public static int deleteCoupon(int couponId){  
		 int status=0;
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from coupons where couponId=?";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,couponId);  
		        status =ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
  // sort coupon by Id
  		public  List<Coupon> sortCouponByCoupId(int couponId){
  		 ArrayList<Coupon> couponList=new ArrayList<Coupon>();
  		 try {
  			 Connection con = DbConnection.getConnection();
  		     String sql="Select * from coupons where couponId=?";
  		     PreparedStatement ps=con.prepareStatement(sql);
  		     ps.setInt(1, couponId);
  		     ResultSet rs=ps.executeQuery();  
  		    while(rs.next())
  		    {
  		    	Coupon coupon = new Coupon();
		    	coupon.setCouponId(rs.getInt(1));
		    	coupon.setProductId(rs.getInt(2));
		    	coupon.setCouponTitle(rs.getString(3));
		    	coupon.setCouponPrice(rs.getString(4));
		    	coupon.setCouponCode(rs.getString(5));
		    	coupon.setLimite(rs.getString(6));
		    	coupon.setUses(rs.getString(7));
		    	couponList.add(coupon);
  		    }
  	       con.close();  
  		}catch(Exception ex) {ex.printStackTrace();}
  		return couponList ;
  	}
  		
  	//update Category
		public void updateCoupon(Coupon coupon) {
			try {
				Connection con=DbConnection.getConnection();
				PreparedStatement ps=con.prepareStatement("update coupons set couponTitle=?,couponPrice=?,couponCode=? where couponId=?");
				ps.setString(1,coupon.getCouponTitle());
				ps.setString(2, coupon.getCouponPrice());
				ps.setString(3,coupon.getCouponCode());
				ps.setInt(4, coupon.getCouponId());
				ps.executeUpdate();
			}catch (SQLException e) {e.printStackTrace();}
		}	
}

