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
String type=request.getParameter("type");
String type_val=request.getParameter("type_val");
if(type.equals("phone"))
	type="contact";
else
	type_val="'"+StringEscapeUtils.escapeSql(type_val)+"'";



//if(Service.validate(user, "Auth")!=null&&id!=null&&name!=null&&f_name!=null&&age!=null&&gender!=null&&nic!=null&&email!=null&&photo!=null&&finger!=null&&age<150){
	if(true){
	%>
	<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
 
	<sql:update dataSource="${snapshot}">
		insert into accused_<%=type%> values(<%=id %>,<%=type_val %>)
	</sql:update>

	<%} %>

</body>
</html>