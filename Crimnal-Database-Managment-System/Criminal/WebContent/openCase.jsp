<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Open Case</title>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/index.js"></script>
    <link rel="stylesheet" href="css/style5.css"/>
    <link rel="stylesheet" href="css/style6.css"/>
  </head>
<body style="background-color: #FFA500" >

	<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>

<%User user=(User)session.getAttribute("User");

if(Service.validate(user, "Auth")!=null&&user.getType().equals("officer")){ %>
<div class="login">
  <header class="login-header"><span class="text">OPEN CASE</span><span class="loader"></span></header>
   <form class="login-form" action="final-case.jsp" method="post">
    <div class="group">  
     
     <sql:query var="result" dataSource="${snapshot}">
     	select f.fir_id as fir_id from fir as f,fir_status as fs where f.fir_id=fs.fir_id and fs.stat='1';
     </sql:query>    
     
       <select name="fir_id" style="width:85%">
       <option value="-1">Select One</option>
        
       <c:forEach var="row" items="${result.rows}">
       <option value="<c:out value="${row.fir_id}"/>"><c:out value="${row.fir_id}"/></option>
       </c:forEach>
      </select>
      <br />
      <label class="lbb">SELECT FIR</label>
    </div>
     <div class="group">      
      <input type="text" required name="status" value="OPEN">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">CASE STATUS</label>
    </div>
      <div class="group">      
      <input type="text" required name="detail">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">CASE DETAILS</label>
    </div>
    <div class="group">      
      <input type="text" required name="law">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">SECTION OF LAW</label>
    </div>
  
    <br /> 
    <input type="submit" class="login-btn" value="next"/>
    <div class="group">
    <div class="row">
    <div class="col-sm-6">
    <label class="lbb">OFFICER ID</label></div><div class="col-sm-6">  <%=user.getUname()%></div>
    </div>

 </div>  
  </form>
</div>
</div>
  <p style="text-align: center;"> 
    <a href="home.jsp"><button >Home</button></a>
   </p>
<%} %>

</body>
</html>