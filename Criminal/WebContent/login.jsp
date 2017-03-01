<%@page import="com.sun.scenario.effect.impl.prism.PrImage"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Login form</title>
    <link rel="stylesheet" href="css1/style.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script type="text/javascript" src="js/JQuery.js"></script>
     <script type="text/javascript" src="js/bootstrap.js"></script>
     <script src="js/umd/index.js"></script>
</head>
 <body>
<%User user=(User)session.getAttribute("User");
if(user==null)
{
%>

 <img src="images/Criminal.jpg" style="position: absolute; width: 100%;height: 700px">
 <br/>
 <br /><br /><br /><br /><br /><br />
<div class="container">
  <section id="content">
    <form action="LoginServlet" method="post">
      <h1 style="color: red">Login Form</h1>
      <div>
        <input type="text" placeholder="Username" required="" name="uname" />
      </div>
      <div>
        <input type="password" placeholder="Password" required="" name="pwd" />
      </div>
      <div>
        <input type="submit" value="Log in" />
        
      </div>
    </form>
    <div class="button">
    </div>
  </section>
</div>
</div>

    
    <%}else
    	response.sendRedirect("home.jsp");%>
    
  </body>
</html>
