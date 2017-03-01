package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.mindrot.jbcrypt.BCrypt;

import dto.User;

public class Create {
	public static User create(String uname,String pwd,String type,String name,String rank)
	{
		User user=new User();
		try
		{
			Connection conn=null;
		Context env = (Context)new InitialContext().lookup("java:comp/env");
		String Driver = (String)env.lookup("Driver");
		String Url = (String)env.lookup("Url");
		String User = (String)env.lookup("User");
		 String  Password= (String)env.lookup("Password");
		String  hashed = BCrypt.hashpw(pwd, BCrypt.gensalt());
		Class.forName(Driver);
		conn=DriverManager.getConnection(Url,User,Password);
		 String  sql = "insert into users values(?,?,?)";
		   PreparedStatement stmt =  conn.prepareStatement(sql);
		   stmt.setString(1, uname);
		   stmt.setString(2, hashed);
		   stmt.setString(3, type);
		   stmt.executeUpdate();
		   if(type.equals("officer"))
		   {
			   
			   String  sql2 = "insert investigation_officer values(?,?,?)";
			   PreparedStatement stmt2 =  conn.prepareStatement(sql2);
			   stmt2.setString(1, uname);
			   stmt2.setString(2, name);
			   stmt2.setString(3, rank);
			   stmt2.executeUpdate();
		   }
		   
		
		return user;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
