<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
									    
<% 
String p_text="";
String i_text="";
String a_text="";
String v_text="";
String f_text="";
String c_text="";
String s_p=request.getParameter("s_p");

String s_c=request.getParameter("s_c");
String s_i=request.getParameter("s_i");
String s_f=request.getParameter("s_f");
String s_a=request.getParameter("s_a");
String s_v=request.getParameter("s_v");
String p_nic=request.getParameter("p_nic");
if(p_nic!=null)
	p_text+="nic like '"+StringEscapeUtils.escapeSql(p_nic)+"%' ";
String p_name=request.getParameter("p_name");
if(p_name!=null)
{
	if(p_text!="")
		p_text+="and ";
	p_text+="name like '"+StringEscapeUtils.escapeSql(p_name)+"%' ";

}

String p_f_name=request.getParameter("p_f_name");
if(p_f_name!=null)
{
	if(p_text!="")
		p_text+="and ";
	p_text+="f_name like '"+StringEscapeUtils.escapeSql(p_f_name)+"%' ";

}
String p_address=request.getParameter("p_address");
if(p_address!=null)
{
	if(p_text!="")
		p_text+="and ";
	p_text+="address like '"+StringEscapeUtils.escapeSql(p_address)+"%' ";

}
String p_contact=request.getParameter("p_contact");
if(p_contact!=null)
{
	if(p_text!="")
		p_text+="and ";
	p_text+="contact like '"+StringEscapeUtils.escapeSql(p_contact)+"%' ";

}
String v_name=request.getParameter("v_name");
if(v_name!=null)
	v_text="name like '"+StringEscapeUtils.escapeSql(v_name)+"%' ";
String v_f_name=request.getParameter("v_f_name");
if(v_f_name!=null)
{
	if(v_text!="")
		v_text+="and ";
	v_text+="f_name like '"+StringEscapeUtils.escapeSql(v_f_name)+"%' ";

}
String v_address=request.getParameter("v_address");
if(v_address!=null)
{
	if(v_text!="")
		v_text+="and ";
	v_text+="address like '"+StringEscapeUtils.escapeSql(v_address)+"%' ";

}
String v_contact=request.getParameter("v_contact");
if(v_contact!=null)
{
	if(v_text!="")
		v_text+="and ";
	v_text+="contact like '"+StringEscapeUtils.escapeSql(v_contact)+"%' ";

}
String a_id=request.getParameter("a_id");
if(a_id!=null)
a_text="id like '"+StringEscapeUtils.escapeSql(a_id)+"%' ";
String a_name=request.getParameter("a_name");
if(a_name!=null)
{
	if(a_text!="")
		a_text+="and ";
	a_text+="name like '"+StringEscapeUtils.escapeSql(a_name)+"%' ";

}
String a_f_name=request.getParameter("a_f_name");
if(a_f_name!=null)
{
	if(a_text!="")
		a_text+="and ";
	a_text+="f_name like '"+StringEscapeUtils.escapeSql(a_f_name)+"%' ";

}
String a_age=request.getParameter("a_age");
if(a_age!=null)
{
	if(a_text!="")
		a_text+="and ";
	a_text+="age like '"+StringEscapeUtils.escapeSql(a_age)+"%' ";

}
String a_status=request.getParameter("a_status");
if(a_status!=null)
{
	if(a_text!="")
		a_text+="and ";
	a_text+="status like '"+StringEscapeUtils.escapeSql(a_status)+"%' ";

}
String a_gender=request.getParameter("a_gender");
if(a_gender!=null)
{
	if(a_text!="")
		a_text+="and ";
	a_text+="gender ='"+StringEscapeUtils.escapeSql(a_gender).charAt(0)+"'";
}
String a_nic=request.getParameter("a_nic");
if(a_nic!=null)
{
	if(a_text!="")
		a_text+="and ";
	a_text+="nic like '"+StringEscapeUtils.escapeSql(a_nic)+"%' ";

}
String a_email=request.getParameter("a_email");
if(a_email!=null)
{
	if(a_text!="")
		a_text+="and ";
	a_text+="email like '"+StringEscapeUtils.escapeSql(a_email)+"%' ";

}
String photo=request.getParameter("photo");
String finger=request.getParameter("finger");

String i_id=request.getParameter("i_id");
if(i_id!=null)
i_text="id like '"+StringEscapeUtils.escapeSql(i_id)+"%' ";
String i_name=request.getParameter("i_name");
if(i_name!=null)
{
	if(i_text!="")
		i_text+="and ";
	i_text+="name like '"+StringEscapeUtils.escapeSql(i_name)+"%' ";

}
String i_rank=request.getParameter("i_rank");
if(i_rank!=null)
{
	if(i_text!="")
		i_text+="and ";
	i_text+="rank like '"+StringEscapeUtils.escapeSql(i_rank)+"%' ";

}
String f_id=request.getParameter("f_id");
if(f_id!=null)
f_text="fir_id like '"+StringEscapeUtils.escapeSql(f_id)+"%' ";
String f_place=request.getParameter("f_place");
if(f_place!=null)
{
	if(f_text!="")
		f_text+="and ";
	f_text+="i_place like '"+StringEscapeUtils.escapeSql(f_place)+"%' ";

}
String f_time=request.getParameter("f_time");
if(f_time!=null)
{
	if(f_text!="")
		f_text+="and ";
	f_text+="i_dateTime like '"+StringEscapeUtils.escapeSql(f_time)+"%' ";

}
String f_date=request.getParameter("f_date");
if(f_date!=null)
{
	if(f_text!="")
		f_text+="and ";
	f_text+="i_dateTime like '"+StringEscapeUtils.escapeSql(f_date)+"%' ";

}
String f_time_l=request.getParameter("f_time_l");
if(f_time_l!=null)
{
	if(f_text!="")
		f_text+="and ";
	f_text+="dateTime like '"+StringEscapeUtils.escapeSql(f_time_l)+"%' ";

}
String f_date_l=request.getParameter("f_date_l");
if(f_date_l!=null)
{
	if(f_text!="")
		f_text+="and ";
	f_text+="dateTime like '"+StringEscapeUtils.escapeSql(f_date_l)+"%' ";

}
String f_desc=request.getParameter("f_desc");
if(f_desc!=null)
{
	if(f_text!="")
		f_text+="and ";
	f_text+="i_description like '"+StringEscapeUtils.escapeSql(f_desc)+"%' ";

}
String f_ps=request.getParameter("f_ps");
String c_id=request.getParameter("c_id");
if(i_id!=null)
i_text="id like '"+StringEscapeUtils.escapeSql(i_id)+"%' ";
String c_status=request.getParameter("c_status");
if(c_status!=null)
{
	if(c_text!="")
		c_text+="and ";
	c_text+="status like '"+StringEscapeUtils.escapeSql(c_status)+"%' ";

}
String c_law=request.getParameter("c_law");
if(c_law!=null)
{
	if(c_text!="")
		c_text+="and ";
	c_text+="lawofsection like '"+StringEscapeUtils.escapeSql(c_law)+"%' ";

}
String c_detail=request.getParameter("c_detail");
if(c_detail!=null)
{
	if(c_text!="")
		c_text+="and ";
	c_text+="detail like '"+StringEscapeUtils.escapeSql(c_detail)+"%' ";

}
if(s_p.equals("true"))
{
	System.out.println(p_text);
	%>
<sql:query var="result" dataSource="${snapshot}">
	select * from petitioner where <%=p_text%>
</sql:query>
<c:forEach var="row" items="${result.rows}">
<a href="viewPetitioner.jsp?nic=<c:out value="${row.nic}"/>&name=<c:out value="${row.name}"/>">Petitioner&nbsp<c:out value="${row.nic}"/>&nbsp<c:out value="${row.name}"/></a><br>
</c:forEach>
	<%
}
if(s_p.equals("true"))
{
	
	%>
<sql:query var="result" dataSource="${snapshot}">
	select * from petitioner where <%=p_text%>
</sql:query>
<c:forEach var="row" items="${result.rows}">
<a href="viewPetitioner.jsp?nic=<c:out value="${row.nic}"/>&name=<c:out value="${row.name}"/>">Petitioner&nbspNIC:<c:out value="${row.nic}"/>&nbspName:<c:out value="${row.name}"/></a><br>
</c:forEach>
	<%
}
if(s_a.equals("true"))
{
	
	%>
<sql:query var="result2" dataSource="${snapshot}">
	select * from accused natural join fir_status where stat='1' and <%=a_text%>
</sql:query>
<c:forEach var="row" items="${result2.rows}">
<a href="viewAccused.jsp?id=<c:out value="${row.id}"/>">Accused&nbspId:<c:out value="${row.id}"/>&nbspName:<c:out value="${row.name}"/></a><br>
</c:forEach>
	<%
}
if(s_v.equals("true"))
{
	
	%>
<sql:query var="result3" dataSource="${snapshot}">
	select * from victims natural join fir_status where stat='1' and <%=v_text%>
</sql:query>
<c:forEach var="row" items="${result3.rows}">
<a href="viewVictims.jsp?address=<c:out value="${row.address}"/>&name=<c:out value="${row.name}"/>">Victim&nbspName<c:out value="${row.name}"/>&nbspAddress<c:out value="${row.address}"/></a><br>
</c:forEach>
	<%
}
if(s_f.equals("true"))
{

	%>
<sql:query var="result4" dataSource="${snapshot}">
	select * from fir natural join fir_status where stat='1' and <%=f_text%>
</sql:query>
<c:forEach var="row" items="${result4.rows}">
<a href="viewFir.jsp?fir_id=<c:out value="${row.fir_id}"/>">Fir&nbspId:<c:out value="${row.fir_id}"/>&nbspPlace:<c:out value="${row.i_place}"/></a><br>
</c:forEach>
	<%
}
if(s_c.equals("true"))
{

	%>
<sql:query var="result5" dataSource="${snapshot}">
	select * from case_fir <%=c_text%>
</sql:query>
<c:forEach var="row" items="${result5.rows}">
<a href="viewCase.jsp?id=<c:out value="${row.id}"/>">Case&nbspId:<c:out value="${row.id}"/>&nbspStatus:<c:out value="${row.status}"/></a><br>
</c:forEach>
	<%
}
if(s_i.equals("true"))
{

	%>
<sql:query var="result6" dataSource="${snapshot}">
	select * from investigation_officer where <%=i_text%>
</sql:query>
<c:forEach var="row" items="${result6.rows}">
<a href="viewOfficer.jsp?id=<c:out value="${row.id}"/>">Investigation Officer&nbspId:<c:out value="${row.id}"/>&nbspName:<c:out value="${row.name}"/></a><br>
</c:forEach>
	<%
}
String context=getServletContext().getRealPath("/");

if(photo!=null)
{System.out.println(context);
	%>
	<sql:query var="result7" dataSource="${snapshot}">
		select id,name,photo from accused natural join fir_status where stat='1';
	</sql:query>
	<c:forEach var="row" items="${result7.rows}">
	<c:set var="photo" value="${row.photo}" scope="request"/>
	<%String photos=""+request.getAttribute("photo");
		if(Service.compareImage(context+"images/photo/"+photo,context+"images/photo/"+photos)){ %>
	<a href="viewAccused.jsp?id=<c:out value="${row.id}"/>">Accused&nbspId:<c:out value="${row.id}"/>&nbspName:<c:out value="${row.name}"/></a><br>
	<%} %>
	</c:forEach>
	
	<% 
}
if(finger!=null)
{
	%>
	<sql:query var="result8" dataSource="${snapshot}">
		select id,name,finger_print from accused natural join fir_status where stat='1';
	</sql:query>
	<c:forEach var="row" items="${result8.rows}">
	<c:set var="finger" value="${row.photo}" scope="request"/>
	<%String fingers=""+request.getAttribute("finger");
		if(Service.compareImage(context+"images/finger/"+finger, context+"images/finger/"+fingers)){ %>
	<a href="viewAccused.jsp?id=<c:out value="${row.id}"/>">Accused&nbspId:<c:out value="${row.id}"/>&nbspName:<c:out value="${row.name}"/></a><br>
	<%} %>
	</c:forEach>
	
	<% 
}

%>

