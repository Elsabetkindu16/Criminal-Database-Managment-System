<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    <%int i=1; %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body style="background-image: url(images/h.jpg); ">
<div class="container" style="color:#F7BB4B">
<div class="col-sm-12">
<h3 style="color: red">NO OF THE LIST</h3>
<table cellpading="5px" style="width:100%; height: 100px;text-align: left; " ;  >
<tr>
<th>NO OF CRIME COMMITED</th>
<th>NO OF CASES CLOSED</th>
<th>NO OF OPEN CASE</th>
    <th>NO OF ACCUSED PUNISHED</th>
    <th>NO OF VICTIMS</th>

</tr>
  <tr>
    <td style="height: 50px"><sql:query var="result1" dataSource="${snapshot}">select count(*) as cnt from case_fir;</sql:query> <c:out value="${result1.rows[0].cnt}" /></td>
<td style="height: 50px"><sql:query var="result2" dataSource="${snapshot}">select count(*) as cnt from case_fir where status='close';</sql:query> <c:out value="${result2.rows[0].cnt}" /></td>
<td style="height: 50px"><sql:query var="result3" dataSource="${snapshot}">select count(*) as cnt from case_fir where status!='close'</sql:query> <c:out value="${result3.rows[0].cnt}" /></td>
    <td style="height: 50px"><sql:query var="result4" dataSource="${snapshot}">select count(*) as cnt from accused where status='punished';</sql:query> <c:out value="${result4.rows[0].cnt}" /></td>
    <td style="height: 50px"><sql:query var="result5" dataSource="${snapshot}">select count(*) as cnt from victims;</sql:query> <c:out value="${result5.rows[0].cnt}" /></td>
  </tr>
</table>
</div>
<div class="row">
<div class="col-sm-7">
  <h1 style="color: red">TOP 10 CRIMINALS</h1>
  <table cellpading="5px" style="width:60%; height: 100px;text-align: left";>
  <sql:query var="result6" dataSource="${snapshot}">select name,count(fir_id) as cnt from accused group by name order by cnt desc LIMIT 10;</sql:query>
   <tr><th>SNO</th><th>Criminal name</th></tr>
   <% i=1; %>
   <c:if test="${result6.rowCount!=0}">
   <c:forEach var="row" items="${result6.rows}">
   <tr><td><%= i++ %></th><td><c:out value="${row.name}" /></td></tr>
   </c:forEach>
   </c:if>
  </table>
</div>
<div class="col-sm-5"><h1 style="color: red">LOCATION WITH MAXIMUM CRIME RATE</h1>
<table cellpading="5px" style="width:60%; height: 100px;text-align: left";>
    <sql:query var="result7" dataSource="${snapshot}">select count(fir_id) as cnt,police_station.address from fir,police_station where fir.ps_id=police_station.ps_id group by fir.ps_id order by cnt LIMIT 10;</sql:query>
   <tr><th>SNO</th><th>Locations</th></tr>
   <% i=1; %>
   <c:if test="${result7.rowCount!=0}">
   <c:forEach var="row" items="${result7.rows}">
   <c:set var="address" value="${row.address}" scope="request"/>
   <%String address=""+request.getAttribute("address"); %>
   <tr><td><%= i++ %></th><td><%=address.substring(address.indexOf(',')+1) %></td></tr>
   </c:forEach>
   </c:if>
  </table>
</div>
</div>
<div class="row">
<div class="col-sm-7">
<h1 style="color: red">TOP 10 INVESTIGATION OFFICER</h1>
<table cellpading="5px" style="width:60%; height: 100px;text-align: left";>
   <sql:query var="result8" dataSource="${snapshot}">select io.name as name,count(cf.id) as cnt from investigation_officer io,case_fir cf where io.id=cf.officer_id and cf.status='closed' group by cf.officer_id order by cnt desc LIMIT 10;</sql:query>
   <tr><th>SNO</th><th>Investing Officer</th></tr>
   <% i=1; %>
   <c:if test="${result8.rowCount!=0}">
   <c:forEach var="row" items="${result8.rows}">
   <tr><td><%= i++ %></th><td><c:out value="${row.name}" /></td></tr>
   </c:forEach>
   </c:if>
  </table>

</div>
<div class="col-sm-5">
<h1 style="color: red">TOP 10 WANTED CRIMINALS</h1>
<table cellpading="5px" style="width:60%; height: 100px;text-align: left";>
  <sql:query var="result9" dataSource="${snapshot}">select name,count(fir_id) as cnt from accused where status<>'arrested' group by name order by cnt desc LIMIT 10;</sql:query>
   <tr><th>SNO</th><th>Criminal Name</th></tr>
   <% i=1; %>
   <c:if test="${result9.rowCount!=0}">
   <c:forEach var="row" items="${result9.rows}">
   <tr><td><%= i++ %></th><td><c:out value="${row.name}" /></td></tr>
   </c:forEach>
   </c:if>
  </table>
</div>
</div>

</body>
</html>