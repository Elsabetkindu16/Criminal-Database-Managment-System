<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    
<% String fir_id=request.getParameter("fir_id");
User user=(User)session.getAttribute("User");
String sno=request.getParameter("sno");
if(Service.validate(user, "Auth")!=null&&fir_id!=null&&sno!=null){
%>
<sql:update dataSource="${snapshot}">
	update fir_status set stat='1' where sno=<%=sno %> and fir_id=<%=fir_id%>;
</sql:update>
<%response.sendRedirect("viewFir.jsp?fir_id="+fir_id);
}%>