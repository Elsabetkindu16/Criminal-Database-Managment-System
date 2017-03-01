<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    
<% String fir_id=request.getParameter("fir_id");
String detail=request.getParameter("detail");
String status=request.getParameter("status");
String law=request.getParameter("law");
String type=request.getParameter("type");
String id=request.getParameter("id");
if(type==null)
	type="new";
User user=(User)session.getAttribute("User");
if(Service.validate(user, "Auth")!=null&&detail!=null&&law!=null&&status!=null){
if(!type.equals("edit"))
{%>

<sql:transaction dataSource="${snapshot}">
		<sql:update>
			insert into case_fir values(null,'<%=StringEscapeUtils.escapeSql(status) %>','<%=StringEscapeUtils.escapeSql(detail) %>','<%=StringEscapeUtils.escapeSql(law) %>',<%=fir_id %>,'<%=user.getUname()%>');
		</sql:update>
		<sql:query var="result2">
			select last_insert_id() as last;
		</sql:query>	
			<c:set var="sno" value="${result2.rows[0].last}" scope="request"/>
	</sql:transaction>	
<% String sno=""+request.getAttribute("sno"); response.sendRedirect("viewCase.jsp?id="+sno);
}
else
{
	%>
	<sql:update dataSource="${snapshot}">
			update case_fir set status='<%=StringEscapeUtils.escapeSql(status) %>' where id=<%=id %>;
		</sql:update>
		<sql:update dataSource="${snapshot}">
			update case_fir set detail='<%=StringEscapeUtils.escapeSql(detail) %>' where id=<%=id %>;
		</sql:update>
		<sql:update dataSource="${snapshot}">
			update case_fir set lawofsection='<%=StringEscapeUtils.escapeSql(law) %>' where id=<%=id %>;
		</sql:update>	
		
	<%
	response.sendRedirect("viewCase.jsp?id="+id);
	
}
}
%>