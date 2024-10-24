package com.otz.controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Product;
import com.otz.dao.DbConnection;
import com.otz.dao.ProductDao;



@WebServlet("/king")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ProductServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		
		System.out.println(event);
		if(event.equals("gp")) {
			ProductDao pd=new ProductDao();
			List<Product> products = pd.getAllProduct();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(products);
		 //   System.out.print(JSONObject);		
			out.print(JSONObject);
		}else if(event.equals("sortManufacture"))
		{
			int mid = Integer.parseInt(request.getParameter("mid"));
			ProductDao pd=new ProductDao();
			List<Product> products = pd.getProductsByManufacturers(mid);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(products);
		//    System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("sortByCategory"))
		{
			int cid = Integer.parseInt(request.getParameter("cid"));
			ProductDao pd=new ProductDao();
			List<Product> products = pd.getProductsByCategory(cid);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(products);
		 //   System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("viewProducts"))
		{
			ProductDao pd=new ProductDao();
			List<Product> products = pd.viewProducts();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(products);
		  //  System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("addProducts")) {
			String productName=request.getParameter("productName");
			String productUrl=request.getParameter("productUrl");
			
			//image start
			Part p1=request.getPart("productimg1");
			Part p2=request.getPart("productimg2");
			Part p3=request.getPart("productimg3");
			Part p4=request.getPart("productimg4");
				
			String Path=DbConnection.Path2();
	        String appPath =Path+"/product_images";
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	        // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) 
	                 fileDir.mkdirs();
	      //Get Image Name
	        String imageName1 = p1.getSubmittedFileName();
	        System.out.println(imageName1);
	        String fileExt1 = imageName1.substring(imageName1.length()-3);
	        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
	        
	        String imageName2 = p2.getSubmittedFileName();
	        System.out.println(imageName2);
	        String fileExt2 = imageName2.substring(imageName2.length()-3);
	        String imgname2=new Date().getTime() +"2"+"."+fileExt2;
	        
	        String imageName3 = p3.getSubmittedFileName();
	        System.out.println(imageName3);
	        String fileExt3 = imageName3.substring(imageName3.length()-3);
	        String imgname3=new Date().getTime() +"3"+"."+fileExt3;
	        
	        String imageName4 = p4.getSubmittedFileName();
	        System.out.println(imageName4);
	        String fileExt4 = imageName4.substring(imageName4.length()-3);
	        String imgname4=new Date().getTime() +"4"+"."+fileExt4;
	     
	        String finalImgPath1=imagePath + "/"+ imgname1;
	        String finalImgPath2=imagePath + "/"+ imgname2;
	        String finalImgPath3=imagePath + "/"+ imgname3;
	        String finalImgPath4=imagePath + "/"+ imgname4;
	        
			        if(validateImage1(imageName1)&& validateImage2(imageName2) && validateImage3(imageName3) && validateImage4(imageName4)){
			            try{
			                p1.write(imagePath + "/" + imgname1);
			                p2.write(imagePath + "/" + imgname2);
			                p3.write(imagePath + "/" + imgname3);
			                p4.write(imagePath + "/" + imgname4);
			            }catch (Exception ex) { }
			        }else{ out.print("<script> alert('Invalid Image Format')</script>");  }
			 //image end
			  String productPrice=request.getParameter("productPrice");
			  int productDiscount=Integer.parseInt(request.getParameter("productDiscount"));
			  String productDes=request.getParameter("productDes");
			  int manufactureId=Integer.parseInt(request.getParameter("productManuf"));
			  int categoryId=Integer.parseInt(request.getParameter("productCateg"));
			  String productKeyword=request.getParameter("productKeyword");
			  String features=request.getParameter("productFea");
			  String productAvailability=request.getParameter("productAva");
			  String productExpDate=request.getParameter("productExpDate");
			  int productstock=Integer.parseInt(request.getParameter("productstock"));
			  
			  Product product=new Product();
			  product.setProductName(productName);
			  product.setCustomUrl(productUrl);
			  product.setImage1(imgname1);
			  product.setImage2(imgname2);
			  product.setImage3(imgname3);
			  product.setImage4(imgname4);
			  product.setProductPrice(productPrice);
			  product.setDiscount(productDiscount);
			  product.setProductDetails(productDes);
			  product.setManufactureId(manufactureId);
			  product.setCategoryId(categoryId);
			  product.setProductKeywords(productKeyword);
			  product.setFeatures(features);
			  product.setAvailability(productAvailability);
			  product.setProduct_expire_date(productExpDate);
			  product.setProduct_stock(productstock);
			  
			  ProductDao productDao=new ProductDao();
			  productDao.addProduct(product);
			  response.sendRedirect("admin/addProduct.jsp");  
			  
		}else if(event.equals("delete_product")){
			int productId=Integer.parseInt(request.getParameter("product_Id"));
			String status=ProductDao.deleteProduct(productId)==1?"done":"";
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(status);
		   // System.out.print(JSONObject);
			out.print(JSONObject);
			
		}else if(event.equals("getProductById")) {
			int productId=Integer.parseInt(request.getParameter("productId"));
			ProductDao pd=new ProductDao();
			Product product=pd.getProductsById(productId);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(product);
		    //System.out.print(JSONObject);
		    out.print(JSONObject);
		}else if(event.equals("getSuggestedProduct")){
			//System.out.println(event);
			ProductDao pd1=new ProductDao();
			List<Product> product1 = pd1.getSuggestedProduct();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(product1);
		   // System.out.print("ssss"+JSONObject);		
			out.print(JSONObject);
		}else if(event.equals("fetchProductByProdId")) {
			int productId=Integer.parseInt(request.getParameter("productId"));
			ProductDao pd=new ProductDao();
			List<Product> product = pd.srotProductByProdId(productId);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(product);
		    System.out.print(JSONObject);
			out.print(JSONObject);
		}
		else if(event.equals("updateProducts")) {
				int productId=Integer.parseInt(request.getParameter("productId"));
				String productName=request.getParameter("productName");
				String productUrl=request.getParameter("productUrl");
			    String productPrice=request.getParameter("productPrice");
				int productDiscount=Integer.parseInt(request.getParameter("productDiscount"));
				String productDes=request.getParameter("productDes");
				int manufactureId=Integer.parseInt(request.getParameter("productManuf"));
				int categoryId=Integer.parseInt(request.getParameter("productCateg"));
				String productKeyword=request.getParameter("productKeyword");
			    String productAvailability=request.getParameter("productAva");
			    String productExpDate=request.getParameter("prodExDate");
			    int productstock=Integer.parseInt(request.getParameter("productStock"));
			    
				  Product product=new Product();
				  product.setProductId(productId);
				  product.setProductName(productName);
				  product.setCustomUrl(productUrl);
				  product.setProductPrice(productPrice);
				  product.setDiscount(productDiscount);
				  product.setProductDetails(productDes);
				  product.setManufactureId(manufactureId);
				  product.setCategoryId(categoryId);
				  product.setProductKeywords(productKeyword);
				  product.setAvailability(productAvailability);
				  product.setProduct_expire_date(productExpDate);
				  product.setProduct_stock(productstock);
				  ProductDao pd=new ProductDao();
				  pd.updateProduct(product);
			response.sendRedirect("admin/viewProducts.jsp");
		}
	}
	private boolean validateImage1(String imageName1){
	      String fileExt1 = imageName1.substring(imageName1.length()-3);
	      if("jpg".equals(fileExt1) || "png".equals(fileExt1) || "gif".equals(fileExt1))
	      { 
	    	  return true;
	      }
	      return false;
	    }
	private boolean validateImage2(String imageName2){
	      String fileExt2 = imageName2.substring(imageName2.length()-3);
	      if("jpg".equals(fileExt2) || "png".equals(fileExt2) || "gif".equals(fileExt2))
	      { 
	    	  return true;
	      }
	      return false;
	    }
	private boolean validateImage3(String imageName3){
	      String fileExt3 = imageName3.substring(imageName3.length()-3);
	      if("jpg".equals(fileExt3) || "png".equals(fileExt3) || "gif".equals(fileExt3))
	      { 
	    	  return true;
	      }
	      return false;
	    }
	private boolean validateImage4(String imageName4){
	      String fileExt4 = imageName4.substring(imageName4.length()-3);
	      if("jpg".equals(fileExt4) || "png".equals(fileExt4) || "gif".equals(fileExt4))
	      { 
	    	  return true;
	      }
	      return false;
	    }
}
