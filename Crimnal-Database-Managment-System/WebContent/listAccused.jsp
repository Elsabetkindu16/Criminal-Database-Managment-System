<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>List Accused</title>
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
<h1 style="color: red">ALL Accused</h1>
<table cellpading="5px" style="width:60%; height: 100px;text-align: left";>
  <sql:query var="result93" dataSource="${snapshot}">select * from accused natural join fir_status where stat='1';</sql:query>
   <tr><th>SNO</th><th>Accused</th></tr>
   <% i=1; %>
   <c:if test="${result93.rowCount!=0}">
   <c:forEach var="row" items="${result93.rows}">
   <tr><td><%= i++ %></th><td><a href="viewAccused.jsp?id=<c:out value="${row.id}"/>">Accused&nbspId:<c:out value="${row.id}"/>&nbspName:<c:out value="${row.name}"/></a>
<br>
<br></td></tr>
   </c:forEach>
   </c:if>
  </table>
</div> 

</body>
</html>