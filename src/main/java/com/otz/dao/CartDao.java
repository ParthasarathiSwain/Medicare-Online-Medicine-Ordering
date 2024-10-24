package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Cart;
import com.otz.bean.Product;

public class CartDao {

	
	public int addToCart(Cart cart) {
		int sts=0;
		try {
			Connection con=DbConnection.getConnection();
			String query="insert into cart(productId,cartPrice, cartQty,cartAmount,cusId) values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setInt(1,cart.getProductId());
			ps.setDouble(2,cart.getCartPrice());
			ps.setInt(3,cart.getCartQty());
			ps.setDouble(4,cart.getCartAmount());
			ps.setInt(5,cart.getCusId());
			sts=ps.executeUpdate();
			
				
		}  catch (SQLException e) {
			
			e.printStackTrace();
		}
		return sts;
	}
	public List<Cart> getCartByCustomerId(int cusId) {
		 ArrayList<Cart> cartlist=new ArrayList<Cart>(); 
    	 try {
    		Connection con = DbConnection.getConnection();
  		    String sql="select A.cartid,A.productid,sum(A.cartPrice) AS cartPrice,sum(A.cartQty) as cartQty,sum(A.cartAmount) as cartAmount,A.cusid,B.productName from medlife.cart A INNER JOIN medlife.Product B on A.productId=B.productId and A.cusid =?  group by A.productid;";
  		    
  		    PreparedStatement ps=con.prepareStatement(sql);
  		    ps.setInt(1,cusId);
  		    ResultSet rs=ps.executeQuery();  
  		    while(rs.next())
  		    {
  		    	Cart cart=new Cart();
  		    	cart.setCartId(rs.getInt(1));
  		    	cart.setProductId(rs.getInt(2));
  		    	cart.setCartPrice(rs.getDouble(3));
  		    	cart.setCartQty(rs.getInt(4));
  		    	cart.setCartAmount(rs.getDouble(5));
  		    	cart.setCusId(rs.getInt(6));
  		    	cart.setProductName(rs.getString(7));
  		    	cartlist.add(cart);
  		    }
    	 }catch(Exception ex){}finally{}
		return cartlist ;
	}
	
	//delete Cart
	public  void deleteCartByCustomerId(int cusId,String productids){  
		
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from Cart where cusId=? and productid in('"+productids+"')";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,cusId); 
		      
		        ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		    
		}
	//update cart
	public  void updateCart(Cart cart){  
		
	    try{  
	    	Connection con=DbConnection.getConnection(); 
	    	String sql="Update Cart set cartQty=? cartAmount=? where cusId=? and cartId=?";
	        PreparedStatement ps=con.prepareStatement(sql);
	        ps.setInt(1,cart.getCartQty());  
	        ps.setDouble(2,cart.getCartAmount());  
	        ps.setInt(3,cart.getCusId());
	        ps.setInt(4, cart.getCartId());
	        ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    
	}
	
	//get product Name
public  void getProductName(){  
		
	    try{  
	    	Connection con=DbConnection.getConnection(); 
	    	String sql="select P.productName FROM PRODUCT P INNER JOIN cart C on P.productId=C.productId where cusId=?";
	        PreparedStatement ps=con.prepareStatement(sql);
	       
	        ps.executeQuery();  
	    }catch(Exception e){System.out.println(e);}  
	    
	}
}
	
	

