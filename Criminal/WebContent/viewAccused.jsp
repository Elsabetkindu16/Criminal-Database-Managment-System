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
<%String id=request.getParameter("id");
if(id!=null){ %>
<sql:query var="result" dataSource="${snapshot}">
	select * from accused where id=<%=id %>;
</sql:query>
<c:if test="${result.rowCount!=0}">
<br><br><br><br><br>
<div class="container" style="background-color: #1F2E2B;width:400px;height:200px;border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;">
<h1>VIEW Accused </h1>
<div class="row">
 <div class="row">
<div class="col-sm-4">FIR </div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><a href="viewFir.jsp?fir_id=<c:out value="${row.fir_id}"/>"><c:out value="${result.rows[0].fir_id}"/></a></p>
 </div></div>
<div class="col-sm-4">Accused Id</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].id}"/></p>
 </div></div>

<div class="row">
<div class="col-sm-4">NAME</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].name}"/></p>
 </div></div>
  <div class="row">
 <div class="col-sm-4">FATHER NAME</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].f_name}"/> </p>
 </div></div>
 <div class="row">
<div class="col-sm-4">STATUS</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].status}"/></p>
 </div></div>
  <div class="row">
 <div class="col-sm-4">AGE</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].age}"/> </p>
 </div></div>
 <div class="row">
<div class="col-sm-4">GENDER</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].gender}"/></p>
 </div></div>
  <div class="row">
 <div class="col-sm-4">NIC</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].nic}"/> </p>
 </div></div>
 <div class="row">
<div class="col-sm-4">EMAIL</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].email}"/></p>
 </div></div>
 
 <sql:query var="result2" dataSource="${snapshot}">
	select * from accused_address where id=<%=id %>;
</sql:query>
<c:if test="${result2.rowCount!=0}">
  <div class="row">
 <div class="col-sm-4">ADDRESS</div>
 <div class="col-sm-4" style="">
 <c:forEach var="row" items="${result2.rows}">
 <p style="color: red;text-align: left"><c:out value="${row.address}"/> </p><br>
  </c:forEach>
 </div></div>
</c:if>
<sql:query var="result3" dataSource="${snapshot}">
	select * from accused_contact where id=<%=id %>;
</sql:query>
<c:if test="${result3.rowCount!=0}">
  <div class="row">
 <div class="col-sm-4">CONTACT</div>
 <div class="col-sm-4" style="">
 <c:forEach var="row" items="${result3.rows}">
 <p style="color: red;text-align: left"><c:out value="${row.phone_no}"/> </p><br>
  </c:forEach>
 </div></div>
</c:if>
<sql:query var="result4" dataSource="${snapshot}">
	select * from accused_alias where id=<%=id %>;
</sql:query>
<c:if test="${result4.rowCount!=0}">
  <div class="row">
 <div class="col-sm-4">ALIAS</div>
 <div class="col-sm-4" style="">
 <c:forEach var="row" items="${result4.rows}">
 <p style="color: red;text-align: left"><c:out value="${row.alias}"/> </p><br>
  </c:forEach>
 </div></div>
</c:if>
</div>
</c:if>

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
<%}
else
response.sendRedirect("home.jsp");%>



    </body></html>