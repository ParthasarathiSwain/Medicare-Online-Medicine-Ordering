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
import com.otz.bean.Slider;
import com.otz.dao.DbConnection;
import com.otz.dao.SliderDao;



@WebServlet("/slider")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class SliderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public SliderServlet() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		PrintWriter out=response.getWriter();
		String event=request.getParameter("event");
		  System.out.println(event); 
		  
	if(event.equals("saveSlider")) {
		 	String slidename=request.getParameter("slidename");
		  	Part p1=request.getPart("slideimg");
			System.out.println(p1);	
			String Path=DbConnection.Path();
	        String appPath =Path+"/slideshow";
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
	        String finalImgPath1=imagePath + "/"+ imgname1;
	
			        if(validateImage1(imageName1)){
			            try{
			                p1.write(imagePath + "/" + imgname1);
			            }catch (Exception ex) { }
			        }else{ out.print("<script> alert('Invalid Image Format')</script>");  }
	        Slider slider=new Slider(); 
	        slider.setsName(slidename);
			slider.setsImage(imgname1);
			int i=SliderDao.saveSlider(slider);
			response.sendRedirect("admin/addSlide.jsp");  
			
		}else if(event.equals("getSlider")) {
			SliderDao sliderDao=new SliderDao();
			List<Slider> sliders = sliderDao.getAllSlider();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(sliders);
		    //System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("delete_slider")){
			int sliderId=Integer.parseInt(request.getParameter("slider_Id"));
			String status=SliderDao.deleteSlider(sliderId)==1?"done":"";
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(status);
		    System.out.print(JSONObject);
			out.print(JSONObject);
			
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
}
