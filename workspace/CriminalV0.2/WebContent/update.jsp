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
String status=request.getParameter("status");




if(Service.validate(user, "Auth")!=null){
	
	%>
	<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
 
	<sql:update dataSource="${snapshot}">
		update accused set status='<%=status %>' where id=<%=id %>;
	</sql:update>

	<%} %>

</body>
</html>