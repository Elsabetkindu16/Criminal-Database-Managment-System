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
String fir_id=request.getParameter("fir_id");
String name=request.getParameter("name");
String f_name=request.getParameter("f_name");
String address=request.getParameter("address");
String contact=request.getParameter("contact");
System.out.println("victory");


//if(Service.validate(user, "Auth")!=null&&id!=null&&name!=null&&f_name!=null&&contact!=null&&contact!=null&&address!=null&&address!=''){
	if(true){
	%>
	<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    
	<sql:update dataSource="${snapshot}">
		insert into victims values('<%=StringEscapeUtils.escapeSql(name) %>','<%=StringEscapeUtils.escapeSql(f_name)%>','<%=StringEscapeUtils.escapeSql(address)%>',<%=contact%>,<%=fir_id%>)
	</sql:update>					    
						    
									    

	<%} %>

</body>
</html>