package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Admin;
import com.otz.bean.Coupon;
import com.otz.bean.Customer;

public class CustomerDao {
	//view Customers
	public List<Customer> viewCustomers(){
 		 ArrayList<Customer> customerList=new ArrayList<Customer>();//Creating Arraylist 
     	 try {
     		Connection con = DbConnection.getConnection();
   		    String sql="SELECT cusId,cusName,cusEmail,cusAddress,cusCity,cusPNum  FROM customer";
   		    PreparedStatement ps=con.prepareStatement(sql);  
   		    ResultSet rs=ps.executeQuery();  
   		    while(rs.next())
   		    {
   		    	Customer customer = new Customer();
   		    	customer.setCusId(rs.getInt(1));
   		    	customer.setCusName(rs.getString(2));
   		    	customer.setCusEmail(rs.getString(3));
   		    	customer.setCusAddress(rs.getString(4));
   		    	customer.setCusCity(rs.getString(5));
   		    	customer.setCusPNum(rs.getString(6));
   		    	customerList.add(customer);
   		    }
   	        con.close();  
   		}catch(Exception ex) {ex.printStackTrace();}
 		return customerList ;	
 	}

	public int getCustomerId(String uname,String password){
		int cusId=0;
    	 try {
    		Connection con = DbConnection.getConnection();
  		    String sql="SELECT cusId FROM CUSTOMER WHERE cusEmail=? AND cusPassword=?";
  		    PreparedStatement ps=con.prepareStatement(sql);  
  		    ps.setString(1, uname);
  		    ps.setString(2, password);
  		    ResultSet rs=ps.executeQuery(); 
  			 while(rs.next())
  		    {
  		    	cusId=rs.getInt(1);
  		    }
  		    con.close();  
  		}catch(Exception ex) {ex.printStackTrace();}
		return cusId ;	
	}
	//delete customer
	
	 public static int deleteCustomer(int cusId){  
		 int status=0;
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from customer where cusId=?";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,cusId);  
		        status =ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
	 
	 //customer login 
		boolean status;
		public boolean loginValidate(Customer customer) {
			try {
			Connection con=DbConnection.getConnection();
			String sql="SELECT count(*) FROM CUSTOMER WHERE cusEmail=? AND cusPassword=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,customer.getCusEmail());
			ps.setString(2,customer.getCusPassword());
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
	// change password	
		 public void changePassword(Customer cus){  
			 
			    try{  
			    	Connection con=DbConnection.getConnection(); 
			    	String sql="update customer set cusPassword=? where cusEmail=? AND cusId=?";
			        PreparedStatement ps=con.prepareStatement(sql);  
			        ps.setString(1,cus.getNewPsw());  
			        ps.setString(2, cus.getCusEmail());
			        ps.setInt(3, cus.getCusId());
			       ps.executeUpdate();  
			    }catch(Exception e){System.out.println(e);}  
			  
			  
			}
		 
	//get old password by cusid
		 public String getOldPassword(int cusid) {
			 String oldPsw="";
			 try{  
			    	Connection con=DbConnection.getConnection(); 
			    	String sql="select cusPassword from  customer where cusId=?;";
			        PreparedStatement ps=con.prepareStatement(sql);  
			        ps.setInt(1, cusid);
			        ResultSet rs=ps.executeQuery(); 
			      
		  		    while(rs.next())
		  		    {
		  		    	oldPsw=rs.getString("cusPassword");
		  		    }
			       
			    }catch(Exception e){System.out.println(e);}  
			  return oldPsw;
		 }
		 // sort customer by Id
	  		public  List<Customer> sortCustomerById(int cusId){
	  		 ArrayList<Customer> customerList=new ArrayList<Customer>();
	  		 try {
	  			 Connection con = DbConnection.getConnection();
	  		     String sql="Select cusName,cusEmail,cusPNum,cusAddress,cusCity,cusImage from customer where cusId=?";
	  		     PreparedStatement ps=con.prepareStatement(sql);
	  		     ps.setInt(1, cusId);
	  		     ResultSet rs=ps.executeQuery();  
	  		    while(rs.next())
	  		    {
	  		    	Customer customer = new Customer();
	  		    	customer.setCusName(rs.getString(1));
	   		    	customer.setCusEmail(rs.getString(2));
	   		    	customer.setCusPNum(rs.getString(3));
	   		    	customer.setCusAddress(rs.getString(4));
	   		    	customer.setCusCity(rs.getString(5));
	   		    	customer.setCusImage(rs.getString(6));
			    	customerList.add(customer);
	  		    }
	  	       con.close();  
	  		}catch(Exception ex) {ex.printStackTrace();}
	  		return customerList ;
	  	}
	  	//update Customer by id
			public void UpdateCustomer(Customer cus) {
				try {
					Connection con=DbConnection.getConnection();
					PreparedStatement ps=con.prepareStatement("update customer set cusName=?,cusEmail=?,cusPNum=?,cusAddress=?,cusCity=?,cusImage=? where cusId=?");
					ps.setString(1, cus.getCusName());
					ps.setString(2, cus.getCusEmail());
					ps.setString(3, cus.getCusPNum());
					ps.setString(4, cus.getCusAddress());
					ps.setString(5,cus.getCusCity());
					ps.setString(6, cus.getCusImage());
					ps.setInt(7, cus.getCusId());
					ps.executeUpdate();
				}catch (SQLException e) {e.printStackTrace();}
			}	
}
