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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
        $("input[name='a']").click(function () {
            if ($("#a").is(":checked")) {
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
            if ($("#b").is(":checked")) {
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
 <script type="text/javascript">
 $(function () {
        $("input[name='c']").click(function () {
            if ($("#c").is(":checked")) {
                $("#FIR").show();
            } else {
                $("#FIR").hide();
            }
        });
    });
 $(function () {
         {
             $("#FIR").hide();
        };
    });
 $( document ).ready(function( $ ) {
	 $(document).on( "click",'#updsta',function(){
	  	if($('#st').val()!='')
			  jQuery.ajax({
			      url: "update.jsp",
			      data:"id="+$('#acc').val()+"&status="+$('#st').val(),
			      type: "POST",
			      success:function(data){
			    	  $('#output').show();
			  }
			  });

		  else
			  window.alert("Please enter Status");
	 });

 });
 </script>
</head>
<%String id=request.getParameter("id"); %>
<body style="background-color: #A7642D">
<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    
<sql:query var="result4" dataSource="${snapshot}">
	select * from case_fir where id=<%=id%>;
</sql:query>
<c:if test="${result4.rowCount!=0}">
<br /><br /><br /><br />
 <div class="container" style="background-color: #1F2E2B;width:600px;border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;" >
<h1>VIEW CASE </h1>
<div class="row">
<div class="col-sm-4">CASE ID</div>
 <div class="col-sm-4"style=""><p style="color: red;text-align: left"><%=id %> </p>
 </div></div>
 <form action="final-case.jsp?type=edit&id=<%=id%>" method="post">
  <div class="row">
 <div class="col-sm-4">STATUS</div>
 <div class="col-sm-4" style=""><input type="text" value="<c:out value="${result4.rows[0].status}"/>" name="status"/>
 </div></div>
  <div class="row">
 <div class="col-sm-4">DETAIL</div>
 <div class="col-sm-4" style=""><input type="text" value="<c:out value="${result4.rows[0].detail}"/>" name="detail"/>
 </div></div>
  <div class="row">
 <div class="col-sm-4">LAW OF Section</div>
 <div class="col-sm-4" style=""><input type="text" value="<c:out value="${result4.rows[0].lawofsection}"/>" name="law"/>
 </div></div>
 </form>
 <sql:query var="result5" dataSource="${snapshot}">
 	select name from investigation_officer where id='<c:out value="${result4.rows[0].officer_id}"/>';
 </sql:query>
   <div class="row">
 <div class="col-sm-4">OFFICER</div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left"><c:out value="${result5.rows[0].name}"/></p>
 </div></div>
 <div class="row">
<div class="col-sm-4"><input id="a" name="a" type="checkbox"></div>
 <div class="col-sm-4" style=""><p style="color: red;text-align: left">ACCUSED </p>
 </div></div>
 </div>
  <c:set value="${result4.rows[0].fir_id}" var="fir_id" scope="request"/>
<%String fir_id=""+request.getAttribute("fir_id"); %>
<br>
<div class="container"  style="background-image: url('images/z.jpg');border-width:100px;color: white;border-color: #34433E;box-shadow: #34433E 0 5px 6px;" >
  <sql:query var="result2" dataSource="${snapshot}">
	select * from accused where fir_id=<%=fir_id %>;
</sql:query>
<c:if test="${result2.rowCount!=0}">
  
  <div id="accused"   >
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
Select Accused:<select  id="acc">
       <option value="-1">Select One</option>
        
       <c:forEach var="row" items="${result2.rows}">
       <option value="<c:out value="${row.id}"/>"><c:out value="${row.id}"/></option>
       </c:forEach>
      </select>
      Status:<input type="text" value="status" id="st"/>
      <button id="updsta">Update Status of accused</button>
      <div id="output" style="display: none">Success</div>
</c:if>
</div>

   </c:if>
   <a href="home.jsp"><button >Home</button></a>
</body>
</html>
    