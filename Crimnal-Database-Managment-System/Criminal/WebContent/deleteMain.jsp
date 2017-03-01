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
String type=request.getParameter("type");
String fir_id=request.getParameter("fir_id");
String content="";

if(type.equals("accused"))
	content="id="+request.getParameter("id");
else
	content="name='"+StringEscapeUtils.escapeSql(request.getParameter("name"))+"' and address='"+StringEscapeUtils.escapeSql(request.getParameter("address"))+"'";
//if(Service.validate(user, "Auth")!=null){
System.out.println("reverse victory "+type+" "+content);	
	if(true){
	%>


<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>

<sql:update dataSource="${snapshot}">
	delete from <%=type %> where <%=content%> and fir_id=<%=fir_id %>;
</sql:update>

<%} %>

</body>
</html>