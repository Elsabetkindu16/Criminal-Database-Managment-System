<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Petitioner Information</title>
<link rel="stylesheet" href="css/style5.css"/>

</head>

<%User user=(User)session.getAttribute("User");

if(Service.validate(user, "Auth")!=null){

		
		DateTime today=new DateTime();
	
	%>


<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>

<sql:transaction dataSource="${snapshot}">
		<sql:update>
			insert into fir values(null,null,null,null,null,null,null,null);
		</sql:update>
		<sql:query var="result">
			select last_insert_id() as last;
		</sql:query>	
</sql:transaction>
		<c:set var="fir_id" value="${result.rows[0].last}" scope="request"/>
		
<%String fir_id=""+request.getAttribute("fir_id"); %>

<sql:transaction dataSource="${snapshot}">
		<sql:update>
			insert into fir_status values(null,<%=fir_id%>,'0','<%=today.toString("yyyy-MM-dd HH:mm:ss") %>');
		</sql:update>
		<sql:query var="result2">
			select last_insert_id() as last;
		</sql:query>	
</sql:transaction>
		<c:set var="sno" value="${result2.rows[0].last}" scope="request"/>
		
<%String sno=""+request.getAttribute("sno"); %>

<body>
<div class="container">
  <h1 class="register-title">PETITIONER INFORMATION</h1>
  <br />
  <form method="post" action="fir.jsp">
    <div class="group">      
      <input name="nic" type="text" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>NIC</label>
    </div>
      
    <div class="group">      
      <input name="name" type="text" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>NAME</label>
    </div>

    <div class="group">      
      <input name="f_name" type="text" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>FATHER NAME</label>
    </div>

    <div class="group">      
      <input name="address" type="text" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>ADDRESS</label>
    </div>
    
    <div class="group">      
      <input name="contact" type="text" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>CONTACT</label>
    </div>
    <input type="submit" value="NEXT>" class="register-button">
    <input name="fir_id" type="text" style="display: none" value="<%=fir_id%>"/>
    <input name="sno" type="text" style="display: none" value="<%=sno%>"/>
  </form>
      

  
</div>
</body>
<%}
else
response.sendRedirect("home.jsp");%>
</html>