<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>File Fir</title>

<link rel="stylesheet" href="css/style5.css"/>
</head>
<body>

<%User user=(User)session.getAttribute("User");
String nic= request.getParameter("nic");
String name=request.getParameter("name");
String f_name=request.getParameter("f_name");
String address=request.getParameter("address");
String contact=request.getParameter("contact");
String fir_id=request.getParameter("fir_id");
String sno=request.getParameter("sno");
if(Service.validate(user, "Auth")!=null&&nic!=null&&name!=null&&f_name!=null&&address!=null&&contact!=null&&fir_id!=null&&sno!=null){

	%>

<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>

<sql:query var="result2" dataSource="${snapshot}">
	select nic from petitioner where nic='<%=StringEscapeUtils.escapeSql(nic)%>' and name='<%=StringEscapeUtils.escapeSql(name)%>';
</sql:query>
<c:if test="${result2.rowCount==0 }">
<sql:update dataSource="${snapshot}">
	insert into petitioner values('<%=StringEscapeUtils.escapeSql(nic)%>','<%=StringEscapeUtils.escapeSql(name)%>','<%=StringEscapeUtils.escapeSql(f_name)%>','<%=StringEscapeUtils.escapeSql(address)%>',<%=contact %>);		
</sql:update>

</c:if>

<sql:update dataSource="${snapshot}">
	update fir set p_id='<%=StringEscapeUtils.escapeSql(nic)%>' where fir_id=<%=fir_id %>;
</sql:update>
<sql:update dataSource="${snapshot}">
	update fir set p_name='<%=StringEscapeUtils.escapeSql(name)%>' where fir_id=<%=fir_id %>;
</sql:update>



<div class="container">
  <h1 class="register-title">RESISTER OF FIR</h1>
  <br />
  <form method="post" action="accused.jsp">
      
    <div class="group">      
      <input type="date" name="date" class="input" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">INCIDENT DATE</label>
    </div>

    <div class="group">      
      <input type="time" name="time" class="input" required >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">INCIDENT TIME</label>
    </div>

    <div class="group">      
      <input name="place" type="text" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">INCIDENT PLACE</label>
    </div>
      <div class="group">      
       <input name="desc" type="text" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">DESCRIPTION</label>
    </div>
     <div class="group">  
     
     <sql:query var="result" dataSource="${snapshot}">
     	select * from police_station;
     </sql:query>    
     
       <select name="ps" style="width:85%">
       <option value="-1">Select One</option>
        
       <c:forEach var="row" items="${result.rows}">
       <option value="<c:out value="${row.ps_id}"/>"><c:out value="${row.address}"/></option>
       </c:forEach>
      </select>
      <br />
      <label class="lbb">SELECT POLICE STATION</label>
    </div>
    
    <input type="submit" value="NEXT" class="register-button">
     <input name="fir_id" type="text" style="display: none" value="<%=fir_id%>"/>
    <input name="sno" type="text" style="display: none" value="<%=sno%>"/>
  </form> 
</div>

<%}
else
response.sendRedirect("home.jsp");%>
</body>
</html>