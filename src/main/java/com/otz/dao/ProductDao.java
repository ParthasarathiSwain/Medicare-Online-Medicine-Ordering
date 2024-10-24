package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.otz.bean.Product;


public class ProductDao {
	//add product
	public void addProduct(Product product) {
		try {
			Connection con=DbConnection.getConnection();
			String query="insert into product(productName,customUrl,image1,image2,image3,image4,productPrice,discount,productDetails,manufactureId,categoryId,productKeywords,features,availability,product_expire_date,product_stock,diseaseCategory)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setString(1,product.getProductName() );
			ps.setString(2,product.getCustomUrl());
			ps.setString(3,product.getImage1());
			ps.setString(4,product.getImage2());
			ps.setString(5,product.getImage3());
			ps.setString(6,product.getImage4());
			ps.setString(7,product.getProductPrice());
			ps.setInt(8,product.getDiscount());
			ps.setString(9,product.getProductDetails());
			ps.setInt(10,product.getManufactureId());
			ps.setInt(11,product.getCategoryId());
			ps.setString(12,product.getProductKeywords());
			ps.setString(13,product.getFeatures() );
			ps.setString(14,product.getAvailability());
			ps.setString(15,product.getProduct_expire_date());
			ps.setInt(16,product.getProduct_stock());
			String s="";
			ps.setString(17,s);
			ps.executeUpdate();
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}
		
	
	
	//get all product
	public List<Product> getAllProduct(){
		 ArrayList<Product> productlist=new ArrayList<Product>();//Creating Arraylist 
    	 try {
    		Connection con = DbConnection.getConnection();
  		    String sql="select * from product";
  		    PreparedStatement ps=con.prepareStatement(sql);  
  		    ResultSet rs=ps.executeQuery();  
  		    while(rs.next())
  		    {
  		    	Product product = new Product();
  		    	product.setProductId(rs.getInt(1));
  		    	product.setProductDate(rs.getString(2));
  		    	product.setProductName(rs.getString(3));
  		    	product.setCustomUrl(rs.getString(4));
  		    	product.setImage1(rs.getString(5)) ;
  		    	product.setImage2(rs.getString(6)) ;
  		    	product.setImage3(rs.getString(7)) ;
  		    	product.setImage4(rs.getString(8)) ;
  		    	product.setProductPrice(rs.getString(9));
  		    	product.setProductDetails(rs.getString(10));
  		    	product.setManufactureId(rs.getInt(11));
  		    	product.setCategoryId(rs.getInt(12));
  		    	product.setProductKeywords(rs.getString(13));
  		    	product.setFeatures(rs.getString(14));
  		    	product.setAvailability(rs.getString(15));
  		    	product.setDiscount(rs.getInt(16));
  		    	product.setProduct_stock(rs.getInt(17));
  		    	product.setProduct_expire_date(rs.getString(18));
  		    	product.setDiseaseCategory(rs.getString(19));
  		    
  		    	productlist.add(product);
  		    }
  	        con.close();  
  		}catch(Exception ex) {ex.printStackTrace();}
		return productlist ;
	}
	
	public List<Product> getProductsByManufacturers(int mid){
		 ArrayList<Product> productlist=new ArrayList<Product>();//Creating Arraylist 
   	 try {
   		Connection con = DbConnection.getConnection();
 		    String sql="SELECT * FROM product WHERE manufactureId=?";
 		    PreparedStatement ps=con.prepareStatement(sql);  
 		    ps.setInt(1, mid);
 		    ResultSet rs=ps.executeQuery();  
 		    while(rs.next())
 		    {
 		    	Product product = new Product();
 		    	product.setProductId(rs.getInt(1));
 		    	product.setProductDate(rs.getString(2));
 		    	product.setProductName(rs.getString(3));
 		    	product.setCustomUrl(rs.getString(4));
 		    	product.setImage1(rs.getString(5)) ;
 		    	product.setImage2(rs.getString(6)) ;
 		    	product.setImage3(rs.getString(7)) ;
 		    	product.setImage4(rs.getString(8)) ;
 		    	product.setProductPrice(rs.getString(9));
 		    	product.setProductDetails(rs.getString(10));
 		    	product.setManufactureId(rs.getInt(11));
 		    	product.setCategoryId(rs.getInt(12));
 		    	product.setProductKeywords(rs.getString(13));
 		    	product.setFeatures(rs.getString(14));
 		    	product.setAvailability(rs.getString(15));
 		    	product.setDiscount(rs.getInt(16));
 		    //	product.setDescription(rs.getString(17));
  		    	product.setProduct_stock(rs.getInt(17));
  		    	product.setProduct_expire_date(rs.getString(18));
  		    	product.setDiseaseCategory(rs.getString(19));
 		    
 		    	productlist.add(product);
 		    }
 	        con.close();  
 		}catch(Exception ex) {ex.printStackTrace();}
   	 return productlist ;		
	}

	public List<Product> getProductsByCategory(int cid){
		 ArrayList<Product> productlist=new ArrayList<Product>();//Creating Arraylist 
  	 try {
  		Connection con = DbConnection.getConnection();
		    String sql="SELECT * FROM product WHERE categoryId=?";
		    PreparedStatement ps=con.prepareStatement(sql);  
		    ps.setInt(1,cid);
		    ResultSet rs=ps.executeQuery();  
		    while(rs.next())
		    {
		    	Product product = new Product();
		    	product.setProductId(rs.getInt(1));
		    	product.setProductDate(rs.getString(2));
		    	product.setProductName(rs.getString(3));
		    	product.setCustomUrl(rs.getString(4));
		    	product.setImage1(rs.getString(5)) ;
		    	product.setImage2(rs.getString(6)) ;
		    	product.setImage3(rs.getString(7)) ;
		    	product.setImage4(rs.getString(8)) ;
		    	product.setProductPrice(rs.getString(9));
		    	product.setProductDetails(rs.getString(10));
		    	product.setManufactureId(rs.getInt(11));
		    	product.setCategoryId(rs.getInt(12));
		    	product.setProductKeywords(rs.getString(13));
		    	product.setFeatures(rs.getString(14));
		    	product.setAvailability(rs.getString(15));
		    	product.setDiscount(rs.getInt(16));
		    	
  		    	product.setProduct_stock(rs.getInt(17));
  		    	product.setProduct_expire_date(rs.getString(18));
  		    	product.setDiseaseCategory(rs.getString(19));
		    
		    	productlist.add(product);
		    }
	        con.close();  
		}catch(Exception ex) {
			ex.printStackTrace();
		}
  	
		return productlist ;
		
	}
	
	//view products
	public List<Product> viewProducts(){
		 ArrayList<Product> productlist=new ArrayList<Product>();//Creating Arraylist 
  	 try {
  		Connection con = DbConnection.getConnection();
		    String sql="SELECT P.productId ,P.productDate ,P.productName ,P.customUrl ,P.image1 ,P.image2 ,P.image3 ,P.image4 ,P.productPrice ,P.discount ,M.manName ,C.catName,P.productKeywords ,P.availability ,P.product_expire_date ,P.product_stock FROM PRODUCT P INNER JOIN manufacture M ON P.manufactureId  = M.manufactureId INNER JOIN  category C ON P.categoryId = C.categoryId;";
		    PreparedStatement ps=con.prepareStatement(sql);  
		     ResultSet rs=ps.executeQuery();  
		    while(rs.next())
		    {
		    	Product product = new Product();
		    	product.setProductId(rs.getInt(1));
		    	product.setProductDate(rs.getString(2));
		    	product.setProductName(rs.getString(3));
		    	product.setCustomUrl(rs.getString(4));
		    	product.setImage1(rs.getString(5)) ;
		    	product.setImage2(rs.getString(6)) ;
		    	product.setImage3(rs.getString(7)) ;
		    	product.setImage4(rs.getString(8)) ;
		    	product.setProductPrice(rs.getString(9));
		    	product.setDiscount(rs.getInt(10));
		    	product.setManName(rs.getString(11));
		    	product.setCatName(rs.getString(12));
		    	product.setProductKeywords(rs.getString(13));
		    	product.setAvailability(rs.getString(14));
		    	product.setProduct_expire_date(rs.getString(15));
		    	product.setProduct_stock(rs.getInt(16));
		    	productlist.add(product);
		    }
	        con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
  	 	return productlist ;
		
	}
	//get all product by Product id 
	public Product getProductsById(int pid){
		Product product = new Product();
 	 try {
 		Connection con = DbConnection.getConnection();
		    String sql="SELECT * FROM product WHERE productId=?";
		    PreparedStatement ps=con.prepareStatement(sql);  
		    ps.setInt(1,pid);
		    ResultSet rs=ps.executeQuery();  
		    while(rs.next())
		    {
		    	
		    	product.setProductId(rs.getInt(1));
		    	product.setProductDate(rs.getString(2));
		    	product.setProductName(rs.getString(3));
		    	product.setCustomUrl(rs.getString(4));
		    	product.setImage1(rs.getString(5)) ;
		    	product.setImage2(rs.getString(6)) ;
		    	product.setImage3(rs.getString(7)) ;
		    	product.setImage4(rs.getString(8)) ;
		    	product.setProductPrice(rs.getString(9));
		    	product.setProductDetails(rs.getString(10));
		    	product.setManufactureId(rs.getInt(11));
		    	product.setCategoryId(rs.getInt(12));
		    	product.setProductKeywords(rs.getString(13));
		    	product.setFeatures(rs.getString(14));
		    	product.setAvailability(rs.getString(15));
		    	product.setDiscount(rs.getInt(16));
		    	
 		    	product.setProduct_stock(rs.getInt(17));
 		    	product.setProduct_expire_date(rs.getString(18));
 		    	product.setDiseaseCategory(rs.getString(19));
		    
		    }
	        con.close();  
		}catch(Exception ex) {
			ex.printStackTrace();
		}
 	
		return product ;
		
	}
	
	
	//update product
	
	 public void updateProduct(Product product) {
		try {
			Connection con=DbConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update product set productName=?,customUrl=?,productPrice=?,discount=?,productDetails=?,manufactureId=?,categoryId=?,availability=?,product_expire_date=?,productKeywords=?,product_stock=? where productId=?");
			ps.setString(1,product.getProductName() );
			ps.setString(2,product.getCustomUrl());
			ps.setString(3,product.getProductPrice());
			ps.setInt(4,product.getDiscount());
			ps.setString(5,product.getProductDetails());
			ps.setInt(6,product.getManufactureId());
			ps.setInt(7,product.getCategoryId());
			ps.setString(8,product.getAvailability());
			ps.setString(9,product.getProduct_expire_date());
			ps.setString(10,product.getProductKeywords());
			ps.setInt(11,product.getProduct_stock());
			ps.setInt(12,product.getProductId());
			ps.executeUpdate();
		    
		}catch (SQLException e) {e.printStackTrace();}
	}	
	
	//delete product
	 public static int deleteProduct(int productId){  
		 int status=0;
		    try{  
		    	Connection con=DbConnection.getConnection(); 
		    	String sql="delete from product where productId=?";
		        PreparedStatement ps=con.prepareStatement(sql);  
		        ps.setInt(1,productId);  
		        status =ps.executeUpdate();  
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
	 // suggested Products
	 public List<Product> getSuggestedProduct(){
		 ArrayList<Product> productlist=new ArrayList<Product>();
	 	 try {
	 		Connection con = DbConnection.getConnection();
			    String sql="SELECT * FROM product ORDER BY RAND() LIMIT 0,3";
			    PreparedStatement ps=con.prepareStatement(sql);  
			    ResultSet rs=ps.executeQuery();  
			    while(rs.next())
			    {	
			    	Product product1=new Product();
			    	product1.setProductId(rs.getInt("productId"));
			    	product1.setProductName(rs.getString("productName"));
			    	product1.setProductPrice(rs.getString("productPrice"));
			    	product1.setImage1(rs.getString("image1")) ;
			    	productlist.add(product1);
			     }
		        con.close();  
			}catch(Exception ex) {
				ex.printStackTrace();
			}
	 	return productlist ;
		}
	 

		public  List<Product> srotProductByProdId(int productId){
		 ArrayList<Product> productlist=new ArrayList<Product>();
		 try {
			 Connection con = DbConnection.getConnection();
		     String sql="Select * from Product where productId=?";
		     PreparedStatement ps=con.prepareStatement(sql);
		     ps.setInt(1, productId);
		     ResultSet rs=ps.executeQuery();  
		    while(rs.next())
		    {
		    	Product product= new Product();
		    	product.setProductId(rs.getInt(1));
		    	product.setProductDate(rs.getString(2));
		    	product.setProductName(rs.getString(3));
		    	product.setCustomUrl(rs.getString(4));
		    	product.setImage1(rs.getString(5)) ;
		    	product.setImage2(rs.getString(6)) ;
		    	product.setImage3(rs.getString(7)) ;
		    	product.setImage4(rs.getString(8)) ;
		    	product.setProductPrice(rs.getString(9));
		    	product.setProductDetails(rs.getString(10));
		    	product.setManufactureId(rs.getInt(11));
		    	product.setCategoryId(rs.getInt(12));
		    	product.setProductKeywords(rs.getString(13));
		    	product.setFeatures(rs.getString(14));
		    	product.setAvailability(rs.getString(15));
		    	product.setDiscount(rs.getInt(16));
		    	
 		    	product.setProduct_stock(rs.getInt(17));
 		    	product.setProduct_expire_date(rs.getString(18));
 		    	product.setDiseaseCategory(rs.getString(19));
		    
 		    	productlist.add(product);
		    }
	       con.close();  
		}catch(Exception ex) {ex.printStackTrace();}
		return productlist ;
		
	}
	
}
