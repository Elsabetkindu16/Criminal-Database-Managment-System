<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service"%>
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
String id=request.getParameter("id");
String fir_id=request.getParameter("fir_id");
String name=request.getParameter("name");
String f_name=request.getParameter("f_name");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String nic=request.getParameter("nic");
String email=request.getParameter("email");
String photo=request.getParameter("photo");
String finger=request.getParameter("finger");
if(gender.equals("male"))
	gender="m";
else gender="f";


//if(Service.validate(user, "Auth")!=null&&id!=null&&name!=null&&f_name!=null&&age!=null&&gender!=null&&nic!=null&&email!=null&&photo!=null&&finger!=null&&age<150){
	if(true){
	%>
	<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    
	<sql:update dataSource="${snapshot}">
		update accused set name='<%=StringEscapeUtils.escapeSql(name)%>' where id=<%=id %>;
	</sql:update>
		<sql:update dataSource="${snapshot}">
		update  accused set f_name='<%=StringEscapeUtils.escapeSql(f_name)%>' where id=<%=id %>;
	</sql:update>					    
		<sql:update dataSource="${snapshot}">
		update accused set age=<%=age%> where id=<%=id %>;
	</sql:update>					    
		<sql:update dataSource="${snapshot}">
		update accused set gender='<%=gender%>' where id=<%=id %>;
	</sql:update>					    
		<sql:update dataSource="${snapshot}">
		update accused set nic='<%=StringEscapeUtils.escapeSql(nic)%>' where id=<%=id %>;
	</sql:update>					    
		<sql:update dataSource="${snapshot}">
		update accused set email='<%=StringEscapeUtils.escapeSql(email)%>' where id=<%=id %>;
	</sql:update>					    
		<sql:update dataSource="${snapshot}">
		update accused set photo='<%=photo%>' where id=<%=id %>;
	</sql:update>					    
		<sql:update dataSource="${snapshot}">
		update accused set finger_print='<%=finger%>' where id=<%=id %>;
	</sql:update>					    
						    
									    
<sql:transaction dataSource="${snapshot}">
	<sql:update>
			insert into accused values(null,null,null,null,null,null,null,null,null,null,<%=fir_id%>);
		</sql:update>
		<sql:query var="result">
			select last_insert_id() as last;
		</sql:query>
</sql:transaction>
<c:set var="id" value="${result.rows[0].last}" scope="request"/>
		<div id="id"><%=request.getAttribute("id")%></div>
	<%} %>

</body>
</html>