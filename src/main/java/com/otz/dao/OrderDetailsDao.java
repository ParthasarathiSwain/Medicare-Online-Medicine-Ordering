package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.OrderDetails;
import com.otz.bean.Orders;

public class OrderDetailsDao {
	
	
	public List<OrderDetails> getOrderDetails(String order_id) {
		
		ArrayList<OrderDetails> orderList = new ArrayList<OrderDetails>();
		 try {
			   
	    		Connection con = DbConnection.getConnection();
	  		    String sql="select A.id,A.fk_order_id,A.product_id,B.productName,A.unit_price,A.qty,A.total_price from tbl_order_details A inner join product B on A.product_id=B.productId and fk_order_id=?";
	  		    PreparedStatement ps=con.prepareStatement(sql);  
	  		    ps.setInt(1,Integer.parseInt(order_id));
	  		  //System.out.println(sql);
	  		  //System.out.println("order"+order_id);
	  		    ResultSet rs=ps.executeQuery();  
	  		    while(rs.next())
	  		    {
	  		    	OrderDetails orderdetails = new OrderDetails();
	  		    	orderdetails.setId(rs.getInt("id"));
	  		    	orderdetails.setFk_order_id(rs.getInt("fk_order_id"));
	  		    	orderdetails.setProduct_id(rs.getInt("product_id"));
	  		    	orderdetails.setProductName(rs.getString("productName"));  		    	
	  		    	orderdetails.setUnit_price(rs.getDouble("unit_price"));
	  		    	orderdetails.setQty(rs.getInt("qty"));
	  		    	orderdetails.setTotal_price(rs.getDouble("total_price"));
	  		    	orderList.add(orderdetails);
	  		    }
	  	        con.close();  
	  		}catch(Exception ex) {
	  			ex.printStackTrace();
	  		}
		return orderList;
	}
}
