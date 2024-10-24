package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Orders;

public class OrderDao {
		
	
	//get all order Details
		public List<Orders> getAllOrders(){
			 ArrayList<Orders> orderList=new ArrayList<Orders>();//Creating Arraylist 
	    	 try {
	    		Connection con = DbConnection.getConnection();
	  		    String sql="select O.orderId,C.cusName,O.invoiceNumber,O.date,O.orderAmount,O.status from orders O inner join Customer C on O.cusId=C.cusId;";
	  		    PreparedStatement ps=con.prepareStatement(sql);  
	  		    ResultSet rs=ps.executeQuery();  
	  		    while(rs.next())
	  		    {
	  		    	Orders order = new Orders();
	  		    	order.setOrderId(rs.getInt(1));
	  		    	order.setCusName(rs.getString(2));
	  		    	order.setInvoiceNumber(rs.getString(3));
	  		    	order.setDate(rs.getString(4));
	  		    	order.setOrderAmount(rs.getString(5));
	  		    	order.setStatus(rs.getString(6));
	  		    	orderList.add(order);
	  		    }
	  	        con.close();  
	  		}catch(Exception ex) {
	  			ex.printStackTrace();
	  		}
	    	
			return orderList ;
			
		}
		
		
}
