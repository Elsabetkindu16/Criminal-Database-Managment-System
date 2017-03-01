<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<title></title>
  <script type="text/javascript">
    
</script>
</head>
<link rel="stylesheet" href="css/style5.css"/>
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript">
  var id=0;
	
	function isNumber(obj) { return !isNaN(parseFloat(obj)) }
  $( document ).ready(function( $ ) {
  $('.c').hide();
  $('#victims').hide();


	 
	  $(document).on( "click",'.delete_victims',function(){
		  
		  var name=$(this).siblings('.name').text();
		  var address=$(this).siblings('.address').text();
		  var oForm=this;
		  jQuery.ajax({
		      url: "deleteMain.jsp",
		      data:"type=victims&name="+name+"&address="+address+"&fir_id="+$('#fir_id').val(),
		      type: "POST",
		      success:function(data){
		  $(oForm).parent().parent().remove();
		  if(document.getElementsByClassName("victims_row").length==0)
			  $('#victims').hide();
		      }
		  });
			  
  
  });
	  $(document).on( "click",'#add_victims',function(){
		  $('#output').text('124124');
		  
		  var name=$('#name').val();
		  var f_name=$('#f_name').val();
		  var address=$('#address').val();
		  var contact=$('#contact').val();
		  if(name!=null&&name!=''&&f_name!=null&&f_name!=''&&isNumber(contact)&&address!=null&&address!='')

			  {
			  
			  jQuery.ajax({
			      url: "insertVictims.jsp",
			      data:"name="+encodeURIComponent(name)+"&f_name="+encodeURIComponent(f_name)+"&address="+encodeURIComponent(address)+"&contact="+contact+"&fir_id="+$('#fir_id').val(),
			      type: "POST",
			      success:function(data){
			    	   	    	  $('#output').text('asd');
			  $('#victims').show();
		 
		 
		  
		 
		  $('#victims').append('<tr class="victims_row"><td>'+name+'</td><td>'+f_name+'</td><td>'+address+'</td><td>'+contact+'</td><td><div class="name" style="display:none">'+name+'</div><div class="name" style="display:none">'+address+'</div><button class="delete_victims">Delete</button></td></tr>');
		 $('#name').val('');
		 $('#f_name').val('');
		 $('#address').val('');
		 $('#contact').val(''); 
		  
			}
			});
			  }
		  else
			  window.alert("Please fill all the fields and contact should be in numbers");
		  return false;  
  });
	  $(document).on( "click",'#final_submit',function(){
		  document.getElementById("submit_final").click();
	
  
  });
});
  </script>
<body>

<%User user=(User)session.getAttribute("User");

String fir_id=request.getParameter("fir_id");
String sno=request.getParameter("sno");
String a_id=request.getParameter("id");
String type=request.getParameter("type");
String case_id=request.getParameter("case_id");

if(type==null)
	type="local";


if(Service.validate(user, "Auth")!=null&&fir_id!=null&&((sno!=null&&a_id!=null)||type.equals("upd"))){
	%>
	
	<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
		
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
		<%if(!type.equals("upd")) 
		{%>							    
 <sql:update dataSource="${snapshot}">
	delete from accused where id=<%=a_id%>;
</sql:update>
<%} %> 
	

		
	
<div class="container group" style="width:80%;" >
<table cellpading="10px" cellspacing="10px"  style="width:300%;"; border="1" id="victims" >
  <tr>
    <th>NAME</th>
    <th>FATHER NAME</th>
    <th>ADDRESS</th>
    <th>CONTACT</th>
    <th>Delete</th>

  </tr>
</table>
</div>
<div class="container">
  <h1 class="register-title">VICTIMS</h1>
  <br />
  
    <div class="group">      
      <input id="name" type="text" >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">NAME</label>
    </div>

    <div class="group">      
      <input id="f_name" type="text" >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">FATHER NAME</label>
    </div>
    <div class="group">      
      <input id="address" type="text" >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">ADDRESS</label>
    </div>
        <div class="group">      
      <input id="contact" type="text" >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">CONTACT</label>
    </div>
    


  
    <div class="row">
      <div class="col-sm-6"> <button id="add_victims" class="register-buttonn">Add Victims</button></div>
      <%if(!type.equals("upd")) 
		{%>		
    		
      <div class="col-sm-6"> <button id="final_submit" class="register-buttonn">Next</button></div>
       <%}else
 	 {
	  %>
	    <form action="updateCase.jsp?id=<%=case_id%>" method="post">
	    <input id="fir_id" name="fir_id" type="text" style="display: none" value="<%=fir_id%>"/>
   <input type="submit"  class="register-buttonn" value="BACK">
     <input type="submit"  class="register-buttonn" value="NEXT">
  </form> 
	  <%} %>

    </div>
   </div>
   	<%if(!type.equals("upd")) 
		{%>		
    								
  <form action="submit-fir.jsp" method="post">
  	<input id="fir_id" name="fir_id" type="text" style="display: none" value="<%=fir_id%>"/>
 
 <div class="col-sm-4">   <input name="sno" type="text" style="display: none" value="<%=sno%>"/></div>
 <div class="col-sm-2">
   <input type="submit" id="submit_final" style="display: none;">
 </div> 
  </form>   
  <%}%>
  
<%} %>
</body>
</html>