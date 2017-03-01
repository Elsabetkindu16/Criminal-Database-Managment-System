package service;

import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.naming.Context;
import javax.naming.InitialContext;

import org.mindrot.jbcrypt.BCrypt;
import dto.User;

public class Service {

	public static User validate(User user,String mode)
	{
		if(user==null)
			return null;
		
		
		
		   Connection conn = null;

		   try{
			 
			   Context env = (Context)new InitialContext().lookup("java:comp/env");
			   String Driver = (String)env.lookup("Driver");
			   String Url = (String)env.lookup("Url");
			   String User = (String)env.lookup("User");
			   String  Password= (String)env.lookup("Password");
			   Class.forName(Driver);
			   conn = DriverManager.getConnection(Url,User,Password);
			   String sql;
			   sql = "SELECT * FROM users where uname=?";
			   PreparedStatement stmt =  conn.prepareStatement(sql);
			   
			   stmt.setString(1, user.getUname());
			   ResultSet rs = stmt.executeQuery();
			   if(rs.next()){
			   			if (BCrypt.checkpw(user.getPwd(), rs.getString("pass"))==false)
					    	 return null;
			   			else
			   			{
			   			 String Type=rs.getString("type");
			   		   if(mode.equals("Auth"))
			   		   {
			   			  
			   			   if(!user.getType().equals(Type))
			   						   return null;
			   			   	
			   				   
			   		   }else 
			   		   {
			   			   user.setType(Type);
			   		   }
			   		
			   			}
			   }
			   else
			   {
			   return null;
			   }
		    
		      rs.close();
		      stmt.close();
		      conn.close();
		   }catch(SQLException se){
			   se.printStackTrace();
		      return null;
		   }catch(Exception e){
			   e.printStackTrace();
		      return null;
		   }finally{
		    
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		        return null;
		      }
		   }
		   return user;
		

		
	}
	public static boolean compareImage(String a,String b ) {        
	    try {
	    	File fileA=new File(a);
	    	File fileB=new File(b);
	        // take buffer data from botm image files //
	        BufferedImage biA = ImageIO.read(fileA);
	        DataBuffer dbA = biA.getData().getDataBuffer();
	        int sizeA = dbA.getSize();                      
	        BufferedImage biB = ImageIO.read(fileB);
	        DataBuffer dbB = biB.getData().getDataBuffer();
	        int sizeB = dbB.getSize();
	        // compare data-buffer objects //
	        if(sizeA == sizeB) {
	            for(int i=0; i<sizeA; i++) { 
	                if(dbA.getElem(i) != dbB.getElem(i)) {
	                    return false;
	                }
	            }
	            return true;
	        }
	        else {
	            return false;
	        }
	    } 
	    catch (Exception e) { 
	        System.out.println("Failed to compare image files ...");
	        e.printStackTrace();
	        return  false;
	    }
	}


}
