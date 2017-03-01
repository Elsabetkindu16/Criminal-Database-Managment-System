<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/JQuery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
$(function () {
        $("input[name='a']").click(function () {
            if ($("#yes").is(":checked")) {
                $("#accused").show();
            } else {
                $("#accused").hide();
            }
        });
    });
$(function () {
         {
             $("#accused").hide();
        };
    });
 </script>
 <script type="text/javascript">
 $(function () {
        $("input[name='b']").click(function () {
            if ($("#no").is(":checked")) {
                $("#VICTIMS").show();
            } else {
                $("#VICTIMS").hide();
            }
        });
    });
 $(function () {
         {
             $("#VICTIMS").hide();
        };
    });
 </script>
</head>
<body style="background-color: #A7642D">
<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
<%String fir_id=request.getParameter("fir_id");
if(fir_id!=null){ %>
<sql:query var="result" dataSource="${snapshot}">
	select * from fir where fir_id=<%=fir_id %>;
</sql:query>
<c:if test="${result.rowCount!=0}">
<c:set var="date" value="${result.rows[0].i_dateTime}" scope="request"/>
<c:set var="date_l" value="${result.rows[0].dateTime}" scope="request"/>
<%String date=""+request.getAttribute("date");
	String date_l=""+request.getAttribute("date_l");%>
<br /><br /><br /><br />
<div class="container" style="background-color: #1F2E2B;width:600px;border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;">
<h1 style="font-family: arial;font-size: 40px;">VIEW FIR</h1>
<div class="row">
<div class="col-sm-4">FIR ID</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><%=fir_id %></p>
 </div></div>
 <div class="row">
<div class="col-sm-4">INCIDENT DATE</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><%=date.substring(0,8) %> </p>
 </div></div>
 <div class="row">
<div class="col-sm-4">INCIDENT TIME</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><%=date.substring(8,date.length()) %> </p>
 </div></div>
 <div class="row">
<div class="col-sm-4">INCIDENT PLACE</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result.rows[0].i_place}"/></p>
 </div></div>
  <div class="row">
<div class="col-sm-4">LOGGED DATE</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><%=date_l.substring(0,8) %>  </p>
 </div></div>
 <div class="row">
<div class="col-sm-4">LOGGED TIME</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><%=date_l.substring(8,date.length()) %>  </p>
 </div></div>
  <div class="row">
<div class="col-sm-4">PETITIONER</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><a href="viewPetitioner.jsp?nic=<c:out value="${result.rows[0].p_id}"/>&name=<c:out value="${result.rows[0].p_name}"/>"><c:out value="${result.rows[0].p_name}"/></a> </p>
 </div></div>
 <div class="row">
<div class="col-sm-1"><input id="yes" name="a" type="checkbox"></div>
 <div class="col-sm-2" style=""><p style="color: red;text-align: left">ACCUSED </p>
 </div></div>
 <div class="row">
<div class="col-sm-1"><input id="no" name="b" type="checkbox"></div>
<div class="col-sm-2" style=""><p style="color: red;text-align: left">VICTIMS </p>
 </div></div>
 </div>
 <br />
 <div class="container"  style="background-image: url('images/z.jpg');border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;" >
  <sql:query var="result2" dataSource="${snapshot}">
	select * from accused where fir_id=<%=fir_id %>;
</sql:query>
<c:if test="${result2.rowCount!=0}">
  
  <div id="accused">
  <h1>ACCUSED INFORMATION</h1>
 <table cellpading="10px"; cellspacing="10px";  style="width:300%; height: 100px " ;  >
 <tr>
<th>ACCUSED ID</th>
 <th>NAME</th>
 <th>STATUS</th>
    <th>AGE</th>
    <th>GENDER</th>
    <th>NIC</th>
    <th>EMAIL</th>
 

 </tr>
  <c:forEach var="row" items="${result2.rows}">
  <tr>
  
    <td style="height: 50px"><a href="viewAccused.jsp?id=<c:out value="${row.id}"/>"><c:out value="${row.id}"/></a></td>
  <td style="height: 50px"><c:out value="${row.name}"/></td>
 <td style="height: 50px"><c:out value="${row.status}"/></td>
    <td style="height: 50px"><c:out value="${row.age}"/></td>
    <td style="height: 50px"><c:out value="${row.gender}"/></td>
    <td style="height: 50px"><c:out value="${row.nic}"/></td>
    <td style="height:50px"><c:out value="${row.email}"/></td>
   
  </tr>
  </c:forEach>
</table>
</div>
</c:if>
  <sql:query var="result3" dataSource="${snapshot}">
	select * from victims where fir_id=<%=fir_id %>;
</sql:query>
<c:if test="${result3.rowCount!=0}">
 <div id="VICTIMS"  >
 <h1>VICTIMS INFORMATION</h1>
 <br />
  <table cellpading="10px" cellspacing="10px"  style="width:100%; height: 100px " ;  >
 <tr>
  <th>NAME</th>
    <th>ADDRESS</th>
    <th>FATHER NAME</th>
    <th>CONTACT</th>

 </tr>
  <c:forEach var="row" items="${result3.rows}">
  <tr>
    <td style="height: 50px"><c:out value="${row.name}"/></td>
 <td style="height: 50px"><c:out value="${row.address}"/></td>
  <td style="height: 50px"><c:out value="${row.f_name}"/></td>
    <td style="height: 50px"><c:out value="${row.contact}"/></td>
  </tr>
  </c:forEach>
</table>
</div>
</c:if>
  </div>
  </c:if>
    <sql:query var="result4" dataSource="${snapshot}">
	select * from case_fir where fir_id=<%=fir_id %>;
</sql:query>
<c:if test="${result4.rowCount!=0}">
<div id="CASES"  >
<div class="container" style="background-color: #1F2E2B;width:600px;border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;">
 <h1>Existing Cases</h1>
	 <c:forEach var="row" items="${result4.rows}">
	 <a href="viewCase.jsp?id=<c:out value="${row.id}"/>"><c:out value="${row.id}"/></a><br>
	 </c:forEach>
	 </div>
	 </div>

</c:if>

	   <p style="text-align: center ">
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
  <%
  User user=(User)session.getAttribute("User");
  if(user!=null)
	 if(user.getType().equals("officer"))
	 {{%>
  <a href="openCase.jsp?fir_id=<%=fir_id%>"><button >Open Case</button></a>
	<%} }%>
	</p>
  <%} %>

</body>
</html>
    