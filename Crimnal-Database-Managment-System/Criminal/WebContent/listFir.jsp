<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>List Petitioners</title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body style="background-color: #A7642D">
<%
User user=(User)session.getAttribute("User");
int i=0;
%>
<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>


<div class="container" style="background-color: #1F2E2B; border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;">
<h1 style="color: red">ALL FIRS</h1>
<table cellpading="5px" style="width:60%; height: 100px;text-align: left";>
  <sql:query var="result92" dataSource="${snapshot}">select * from fir natural join fir_status where stat='1';</sql:query>
   <tr><th>SNO</th><th>Firs</th></tr>
   <% i=1; %>
   <c:if test="${result92.rowCount!=0}">
   <c:forEach var="row" items="${result92.rows}">
   <tr><td><%= i++ %></th><td><a href="viewFir.jsp?fir_id=<c:out value="${row.fir_id}"/>">Fir&nbspId:<c:out value="${row.fir_id}"/>&nbspPlace:<c:out value="${row.i_place}"/></a><br></td></tr>
   </c:forEach>
   </c:if>
  </table>
</div> 
  <p style="text-align: center;"> 
    <br>
  <br>
  <br>
  <br>
  <br>
  <br>
   <br>
  <br>
  <br>
  <br>
  <br>
  <br>
    <a href="home.jsp"><button >Home</button></a>
   </p>

</body>
</html>