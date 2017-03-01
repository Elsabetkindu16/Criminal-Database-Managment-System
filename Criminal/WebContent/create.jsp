<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en"> 
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Registration Form</title>
  <link rel="stylesheet" href="css/style3.css">
 <script type="text/javascript" src="js/jquery.min.js"></script>
     <script type="text/javascript" src="js/bootstrap.js"></script>
     
     <script type="text/javascript">
    $(function () {
        $("input[name='a']").click(function () {
            if ($("#yes").is(":checked")) {
                $("#officerdetails").show();
            } else {
                $("#officerdetails").hide();
            }
        });
    });
     $(function () {
         {
             $("#officerdetails").hide();
        };
    });
     $( document ).ready(function( $ ) {
    	 
     $(document).on( "click",'#sub',function(){
    	 if ($("#yes").is(":checked"))
    		 $('#type').val('officer');
    	 else if($("#no").is(":checked"))
    		 $('#type').val('localAuth');
    	 else if($("#no1").is(":checked"))
    		 $('#type').val('admin');
 
    	 var uname=$('#uname').val();
    	 var pass=$('#pass').val();
    	 var cpass=$('#cpass').val();
    	 
    	 if(uname!=''&&uname!=null&&pass!=''&&pass!=null&&pass==cpass )
    	{
    		 if($('#type').val()=='officer')
    			 {
    			 var name=$('#name').val();
    	    	 var rank=$('#rank').val();
    			 
    			 if(name==''||name==null||rank==''||rank==null)
    				 {window.alert("Please enter valid information");
    				 return false;
    				 }
    				 else
    				 {
    					 $('#nameN').val(name);
    					 $('#rankN').val(rank);
    				  document.getElementById("final-sub").click();
    				 }		 
    			 }
    		 else
    			  document.getElementById("final-sub").click();
    	    	
    		 
    		 
		 
    		 
		 }
	 else
	 { window.alert("Please enter valid information");
		 
		  return false;
	 }
     });
	
 
 });
</script>
</head>
<body>

<%
User user=(User)session.getAttribute("User");
if(Service.validate(user, "Auth")!=null&&user.getType().equals("admin")){ %>
  <h1 class="register-title">Welcome</h1>
  <form class="register" action="SignUp" method="post">
  Gender
    <div class="register-switch">
      <input type="radio" name="sex" value="F" id="sex_f" class="register-switch-input" checked>
      <label for="sex_f" class="register-switch-label">Female</label>
      <input type="radio" name="sex" value="M" id="sex_m" class="register-switch-input">
      <label for="sex_m" class="register-switch-label">Male</label>
    </div>
    Username/Id <input type="text" class="register-input" placeholder="username" name="uname" id="uname">
    Password<input type="password" class="register-input" placeholder="Password" id="pass" name="pass">
    Confirm Password<input type="password" class="register-input" placeholder="Confirm Password" id="cpass">
    Choose 
    <div class="register-switch">
    <input type="radio" value="localauth" id="no" name="a" class="register-switch-in" required checked/>
    <label for="no" class="register-switch-lab">local user</label>
     <input type="radio" value="officer" id="yes" class="register-switch-in" name="a"  required/>
    <label for="yes"  class="register-switch-lab">officer</label>
    <input type="radio"  value="admin" id="no1" name="a" class="register-switch-in" required/>
    <label for="no1" class="register-switch-lab">admin</label>
     </div>
      <button id="sub" class="register-button">Create Account</button>
      <input type="submit" value="Create Account" id="final-sub" class="register-button" style="display: none">
	  <input type="hidden" value="localAuth" id="type" name="type" class="register-button">
	  <input type="text" class="register-in" name="name" id="nameN">
	  <input type="text" class="register-in" name="rank" id="rankN">
	  </form>
<hr width="600px">
<div id="officerdetails" class="regis" >
    <h1 class="register-tit">OFFICER DETAILS</h1>
Name:<input type="text" class="register-in" id="name">
RANK:<input type="text" class="register-in" id="rank">
</div>
<%}else
response.sendRedirect("home.jsp");%>
</body>
</html>
