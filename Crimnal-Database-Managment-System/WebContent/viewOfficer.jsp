<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html><head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

</head>
<body style="background-color: #A7642D">
<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
<%
String id=request.getParameter("id");%>
<%if(id!=null){ %>
<sql:query var="result" dataSource="${snapshot}">
	select * from investigation_officer where id='<%=id%>';
</sql:query>
<c:if test="${result.rowCount!=0}">
<br><br><br><br><br>
<div class="container" style="background-color: #1F2E2B;width:400px;border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;">
<h1>VIEW OFFICER </h1>


<div class="row">
<div class="col-sm-4">ID</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].id}"/></p>
 </div></div>
  <div class="row">
 <div class="col-sm-4"> NAME</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].name}"/> </p>
 </div></div>
  <div class="row">
 <div class="col-sm-4">RANK</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].rank}"/></p>
 </div></div>

</div>
</c:if>
  <p style="text-align: center;"> 
    <a href="home.jsp"><button >Home</button></a>
   </p>
<%}
else
response.sendRedirect("home.jsp");%>



    </body></html>