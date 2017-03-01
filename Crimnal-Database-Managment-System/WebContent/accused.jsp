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
  
  var imagetype;
  var x='default.png';
  var x2='default.png';
  var id=0;
	var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];    
	function Validate(oInput,type) {
	    if (oInput.type == "file") {
	        var sFileName = oInput.value;
	         if (sFileName.length > 0) {
	            var blnValid = false;
	            for (var j = 0; j < _validFileExtensions.length; j++) {
	                var sCurExtension = _validFileExtensions[j];
	                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
	                    blnValid = true;
	                    break;
	                }
	            }
	             
	            if (!blnValid) {
	                alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
	                return false;
	            }
	        }
	    }
	    document.getElementById("submit-"+type).click();
	    return true;
	}
	function isNumber(obj) { return !isNaN(parseFloat(obj)) }
  $( document ).ready(function( $ ) {
  $('.c').hide();
  $('#accused').hide();
  $('#phone_c').hide();
  $('#alias_c').hide();
  $('#address_c').hide();
  $(document).on( "click",'#add_address',function(){
	  var address=$('#address').val();
	  var id=$('#id').val();
	  if(address!=null&&address!='')
		  {
		  
		  jQuery.ajax({
		      url: "insert.jsp",
		      data:"type=address&type_val="+encodeURIComponent(address)+"&id="+id,
		      type: "POST",
		      success:function(data){
	  $('#addresses tr:last').after('<tr class="address_row"><td class="address_val">'+address+'</td><td><button class="delete">Delete</button><div class="id" style="display:none">'+id+'</div><div class="type" style="display:none">address</div></td></tr>');
	  $('#address_c').show();
	  $('#address').val('');
		      }});
		  }

	  else
		  window.alert("Please enter Address");
		  
  
  });
  $(document).on( "click",'#add_phone',function(){
	  var phone=$('#phone').val();
	  var id=$('#id').val();
	  if(isNumber(phone))
		  {
		  
		  jQuery.ajax({
		      url: "insert.jsp",
		      data:"type=phone&type_val="+phone+"&id="+id,
		      type: "POST",
		      success:function(data){
	  $('#phones tr:last').after('<tr class="phone_row"><td class="phone_val">'+phone+'</td><td><button class="delete">Delete</button><div class="id" style="display:none">'+id+'</div><div class="type" style="display:none">phone</div></td></tr>');
	  $('#phone_c').show();
	  $('#phone').val('');
		  }
		  });
		  }
	  else
		  window.alert("Please enter phone No");
  });
	  $(document).on( "click",'#add_alias',function(){
		  var alias=$('#alias').val();
		  var id=$('#id').val();
		  if(alias!=null&&alias!='')
			  {
			  jQuery.ajax({
    		      url: "insert.jsp",
    		      data:"type=alias&type_val="+encodeURIComponent(alias)+"&id="+id,
    		      type: "POST",
    		      success:function(data){
		  $('#aliass tr:last').after('<tr class="alias_row"><td class="alias_val">'+alias+'</td><td><button class="delete">Delete</button><div class="id" style="display:none">'+id+'</div><div class="type" style="display:none">alias</div></td></tr>');
		  $('#alias_c').show();
		  $('#alias').val('');
			  
    		      }}
			  );
    		      }
		  else
			  window.alert("Please enter alias");
  
  });
	  
	  $(document).on( "click",'.delete',function(){
		  
		  
		  var id=$(this).siblings('.id').text();
		  
		  var type=$(this).siblings('.type').text();
		  var type_val=$(this).parent().siblings('.'+type+'_val').text();
		  var oForm=this;
		  jQuery.ajax({
		      url: "delete.jsp",
		      data:"type="+type+"&id="+id+"&type_val="+encodeURIComponent(type_val),
		      type: "POST",
		      success:function(data){
		  $(oForm).parent().parent().remove();
		  if(document.getElementsByClassName(type+"_row").length==0)
			  $('#'+type+'_c').hide();
		  }});
			  
  
  });
	  $(document).on( "click",'.delete_accused',function(){
		  
		  var id=$(this).siblings('.id').text();
		  var oForm=this;
		  jQuery.ajax({
		      url: "deleteMain.jsp",
		      data:"type=accused&id="+id+"&fir_id="+$('#fir_id').val(),
		      type: "POST",
		      success:function(data){
		  $(oForm).parent().parent().remove();
		  if(document.getElementsByClassName("accused_row").length==0)
			  $('#accused').hide();
		      }
		  });
			  
  
  });
	  $(document).on( "click",'#add_accused',function(){
		  
		  var name=$('#name').val();
		  var f_name=$('#f_name').val();
		  var age=$('#age').val();
		  var gender=$('#gender').val();
		  var nic=$('#nic').val();
		  var email=$('#email').val();
		  var id=$('#id').val();
		  if(name!=null&&name!=''&&f_name!=null&&f_name!=''&&isNumber(age)&&gender!=null&&gender!=''&&nic!=null&&nic!=''&&email!=null&&email!=''&&age<150)

			  {
			  
			  jQuery.ajax({
    		      url: "insertAccused.jsp",
    		      data:"name="+encodeURIComponent(name)+"&f_name="+encodeURIComponent(f_name)+"&age="+ age+"&gender="+gender+"&nic="+nic+"&email="+encodeURIComponent(email)+"&id="+id+"&photo="+x+"&finger="+x2+"&fir_id="+$('#fir_id').val(),
    		      type: "POST",
    		      success:function(data){
    		    	var new_id=$(data).filter('#id').text();
    		    	$('#id').val(new_id);
    		    
			  $('#accused').show();
		 
		  var addresses = document.getElementsByClassName("address_val");
		  var address_value="<table>";
		  for (i = 0; i < addresses.length; i++) {
				address_value+="<tr><td>"+addresses[i].innerText+"</td></tr>";  
				}
		  address_value+="</table>";
		  
		  var phones = document.getElementsByClassName("phone_val");
		  var phone_value="<table>";
		  for (i = 0; i < phones.length; i++) {
				phone_value+="<tr><td>"+phones[i].innerText+"</td></tr>";  
				}
		  phone_value+="</table>";
		  var aliass = document.getElementsByClassName("alias_val");
		  var alias_value="<table>";
		  for (i = 0; i < aliass.length; i++) {
				alias_value+="<tr><td>"+aliass[i].innerText+"</td></tr>";  
				}
		  alias_value+="</table>";
		  
		 
		  $('#accused').append('<tr class="accused_row"><td>'+name+'</td><td>'+f_name+'</td><td>'+age+'</td><td>'+gender+'</td><td>'+nic+'</td><td>'+email+'</td><td>'+address_value+'</td><td>'+phone_value+'</td><td>'+alias_value+'</td><td><img src="images/photo/'+x+'" height="40px" width="40px"/>"</td><td><img src="images/finger/'+x2+'" height="40px" width="40px"/></td><td><div class="id" style="display:none">'+id+'</div><button class="delete_accused">Delete</button></td></tr>');
		 
		x='default.png';
		x2='default.png';
		 $('#name').val('');
		 $('#f_name').val('');
		 $('#age').val('');
		 $('#gender').val('');
		  $('#nic').val('');
		  $('#email').val('');
		  $('.address_row').remove();
		  $('.phone_row').remove();
		  $('.alias_row').remove();
		  $('#finger_stat').text('');
		  $('#photo_stat').text('');
		  $('#phone_c').hide();
		  $('#alias_c').hide();
		  $('#address_c').hide();
		  $('#photo_stat').text('');
		  $('#finger_stat').text('');
		  
    		  	  }
  		    });
			  }
		  else
			  window.alert("Please fill all the fields and age should be in numbers");
  
  });
	  $(document).on( "click",'#photo',function(){
		  document.getElementById("file-Photo").click();
		  
	
  
  });
	  $(document).on( "click",'#finger',function(){
		  document.getElementById("file-Finger").click();
	
  
  });
	  $(document).on( "click",'#final_submit',function(){
		  document.getElementById("submit_final").click();
	
  
  });
	  
	  $("#uploadphoto").on('submit',(function(e) {
		
		$('#photo_stat').text('Uploading');
		e.preventDefault();
		$.ajax({
		url: "uploadFile.jsp?category=photo", // Url to which the request is send
		type: "POST",             // Type of request to be send, called as method
		data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
		contentType: false,       // The content type used when sending data to the server.
		cache: false,             // To unable request pages to be cached
		processData:false,        // To send DOMDocument or non processed data file it is set to false
		success: function(data)   // A function to be called if request succeeds
		{
			name1=$(data).filter('#image');
			x=$(name1).text();
			
		$('#photo_stat').text('Uploaded');
	
		 
		}	
		});
		}));
	  
	  $("#uploadfinger").on('submit',(function(e) {
			
			$('#finger_stat').text('Uploading');
			e.preventDefault();
			$.ajax({
			url: "uploadFile.jsp?category=finger", // Url to which the request is send
			type: "POST",             // Type of request to be send, called as method
			data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
			contentType: false,       // The content type used when sending data to the server.
			cache: false,             // To unable request pages to be cached
			processData:false,        // To send DOMDocument or non processed data file it is set to false
			success: function(data)   // A function to be called if request succeeds
			{
				name1=$(data).filter('#image');
				x2=$(name1).text();
				
			$('#finger_stat').text('Uploaded');
		
			 
			}	
			});
			}));
  }
  
  
  
  );
  </script>
<body>

<%User user=(User)session.getAttribute("User");

String fir_id=request.getParameter("fir_id");
String sno=request.getParameter("sno");
String ps=request.getParameter("ps");
String date=request.getParameter("date");
String place=request.getParameter("place");
String time=request.getParameter("time");
String desc=request.getParameter("desc");
String type=request.getParameter("type");
String case_id=request.getParameter("case_id");
System.out.println(date);
System.out.println(time);
DateTime today=new DateTime();

if(type==null)
	type="local";
if(Service.validate(user, "Auth")!=null&&fir_id!=null&&((sno!=null&&ps!=null&&date!=null&&time!=null&&desc!=null&&place!=null)||type.equals("upd"))){
	
	%>
	
	<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
	<%if(!type.equals("upd"))
		{%>								    
	<sql:update dataSource="${snapshot}">
		update fir set dateTime='<%=today.toString("yyyy-MM-dd HH:mm:ss")  %>' where fir_id=<%=fir_id%>;
	</sql:update>
	<sql:update dataSource="${snapshot}">
		update fir set i_dateTime='<%=date%> <%=time %>:00' where fir_id=<%=fir_id%>;
	</sql:update>
	<sql:update dataSource="${snapshot}">
		update fir set i_place='<%=StringEscapeUtils.escapeSql(place)  %>' where fir_id=<%=fir_id%>;
	</sql:update>
	<sql:update dataSource="${snapshot}">
		update fir set description='<%=StringEscapeUtils.escapeSql(desc) %>' where fir_id=<%=fir_id%>;
	</sql:update>
	<sql:update dataSource="${snapshot}">
		update fir set ps_id=<%=ps%> where fir_id=<%=fir_id%>;
	</sql:update> 
	<%}
		%>
	
	<sql:transaction dataSource="${snapshot}">
	<sql:update>
			insert into accused values(null,null,null,null,null,null,null,null,null,null,<%=fir_id %>);
		</sql:update>
		<sql:query var="result">
			select last_insert_id() as last;
		</sql:query>
</sql:transaction>
<c:set var="id" value="${result.rows[0].last}" scope="request"/>
		<%String id=""+request.getAttribute("id");%>
		
	
<div class="container group" style="width:80%;" >
<table cellpading="10px" cellspacing="10px"  style="width:300%;"; border="1" id="accused" >
  <tr>
    <th>NAME</th>
    <th>FATHER NAME</th>
    <th>AGE</th>
    <th>GENDER</th>
    <th>NIC</th>
    <th>EMAIL</th>
    <th>ADDRESS</th>
    <th>PHONE NO</th>
    <th>ALIAS</th>
    <th>Photo</th>
    <th>Finger Print</th>
    <th>Delete</th>

  </tr>
</table>
</div>
<div class="container">
  <h1 class="register-title">ACCUSED</h1>
  <br />
  <form>
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
      <input id="age" type="text" >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">AGE</label>
    </div>

    <div class="group "> 
     <select id="gender" name="gender" style="width:85%;height: 40px">
       <option value="male">male</option>
       <option value="female">female</option>
      </select>
      <label class="lbb">GENDER</label>
    </div>

    <div class="group">      
      <input id="nic" type="text" >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">NIC</label>
    </div>

    <div class="group">      
      <input id="email" type="email" >
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lb">EMAIL</label>
    </div>
     </form>
    <div class="group">      
    <button id="photo">Upload Photo</button><div id="photo_stat"></div>
      <span class="bar"></span>
      <label class="lbb">PHOTO</label>
    </div>
    <div class="group">      
    <button id="finger">Upload Finger Print</button><div id="finger_stat"></div>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lbb">FINGER PRINTS</label>
    </div>
   
    <div id="address_c" class="container group" style="display: none">
    <table cellpading="10px" cellspacing="10px"  style="width:300%;" border="1" id="addresses">
  <tr class="head">
    <th>Address</th>
    <th>Delete</th>
	</tr>
</table>
   </div>
    <div class="group" for="yes">
      <input id="address" type="text" name=""> 
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lbb">ADD ADDRESS</label>
      <button id="add_address">ADD</button>
    </div>
    <div id="phone_c" class="container group" style="display: none">
 <table cellpading="10px" cellspacing="10px"  style="width:300%;" border="1" id="phones">
  <tr>
    <th>Phone No</th>
    <th>Delete</th>
	</tr>
</table>
   </div>
    <div class="group">
      <input id="phone" type="text" name=""> 
      <span class="highlight"></span>
      <span class="bar"></span>
      <label class="lbb">ADD PHONE NO</label>
      <button id="add_phone">ADD</button>
    </div>
    <div id="alias_c" class="container group" style="display: none">
   <table cellpading="10px" cellspacing="10px"  style="width:300%;" border="1" id="aliass">
  <tr>
    <th>Alias</th>
    <th>Delete</th>
	</tr>
</table>
   </div>
    <div class="group">
      <input id="alias" type="text" name=""> 
      <span class="highlight"></span>
      <label class="lbb">ADD ALIAS</label>
      <button id="add_alias">ADD</button>
    </div>
    <div class="row">
      <div class="col-sm-6"> <button id="add_accused" class="register-buttonn">Add Accused</button></div>
    <%if(!type.equals("upd"))
		{%>	
    
      <div class="col-sm-6"> <button id="final_submit" class="register-buttonn">Next</button></div>
      <%}else
    	  {%>
    	     <div class="col-sm-3"></div>
        <form action="final-update-case.jsp" method="post">
  	<input type="hidden"  value="<%=case_id%>" name="case_id"/>
  	<input type="hidden" id="id" value="<%=id%>" name="id"/>
  	<input id="fir_id" name="fir_id" type="text" style="display: none" value="<%=fir_id%>"/>
  	<div class="col-sm-4">
  	  <input type="submit"  class="register-buttonn" value="BACK">
    </div>  
    <div class="col-sm-2">
      <input type="submit" class="register-buttonn" value="DONE">
      </div>
  </form>
  <%} %>
  

    </div>
   </div>
    
   															  <form id="uploadphoto" action="" method="post" enctype="multipart/form-data" style="display: none;">
																	 <div class="image-upload">
																	<input id="file-Photo" type="file" name="file-Main" style="display: none;" onchange="Validate(this,'Photo');" />
																	<input type="submit" id="submit-Photo" style="display: none;" >
																	</div>
																	
																</form>
																
															 <form id="uploadfinger" action="" method="post" enctype="multipart/form-data" style="display: none;">
																	 <div class="image-upload">
																	<input id="file-Finger" type="file" name="file-Main" style="display: none;" onchange="Validate(this,'Finger');" />
																	<input type="submit" id="submit-Finger" style="display: none;" >
																	</div>
															</form>
	<%if(!type.equals("upd"))		
	{%>											
  <form action="victims.jsp" method="post">
  	<input type="hidden" id="id" value="<%=id%>" name="id"/>
  	<input id="fir_id" name="fir_id" type="text" style="display: none" value="<%=fir_id%>"/>
    <input name="sno" type="text" style="display: none" value="<%=sno%>"/>
    <input type="submit" id="submit_final" style="display: none;" >
  </form>
  <%} %>
  
  
<%} %>
</body>
</html>