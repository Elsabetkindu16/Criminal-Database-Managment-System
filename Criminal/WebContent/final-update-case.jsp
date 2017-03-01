<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    
<% String fir_id=request.getParameter("fir_id");
String a_id=request.getParameter("id");
User user=(User)session.getAttribute("User");
String case_id=request.getParameter("case_id");
if(Service.validate(user, "Auth")!=null&&fir_id!=null&&case_id!=null){
%>
 <sql:update dataSource="${snapshot}">
	delete from accused where id=<%=a_id%>;
</sql:update> 
<%response.sendRedirect("updateCase.jsp?id="+case_id);
}%>