<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service" import="org.joda.time.DateTime" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/style55.css" type="text/css">
  <title></title>
   <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript">
  
  var imagetype;
  var x="";
  var x2="";
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
	  
	  
	  $("#uploadphoto").on('submit',(function(e) {

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
				search();

		
			 $('#imgC').show();
			}	
			});
			}));
		  
		  $("#uploadfinger").on('submit',(function(e) {
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
					search();

				}	
				});
				}));
		  $(document).on("click","#photo",function(){
			  document.getElementById("file-Photo").click();
			  


		});
		  $(document).on("click","#imgC",function(){
			  x="";
			  x2="";
			  $('#imgC').hide();


		});
		  $(document).on("click","#finger",function(){
			  document.getElementById("file-Finger").click();


		});
		
	  
  });
 
  
  function search()
  {
	  var s_p=false;
	  var s_a=false;
	  var s_v=false;
	  var s_i=false;
	  var s_c=false;
	  var s_f=false;
	  var p_nic=$('#p_nic').val();
	  var p_name=$('#p_name').val();
	  var p_f_name=$('#p_f_name').val();
	  var p_address=$('#p_address').val();
	  var p_contact=$('#p_contact').val();
	  var v_name=$('#v_name').val();
	  var v_f_name=$('#v_f_name').val();
	  var v_address=$('#v_address').val();
	  var v_contact=$('#v_contact').val();
	  var a_id=$('#a_id').val();
	  var a_name=$('#a_name').val();
	  var a_f_name=$('#a_f_name').val();
	  var a_age=$('#a_age').val();
	  var a_status=$('#a_status').val();
	  var a_gender=$('#a_gender').val();
	  var a_nic=$('#a_nic').val();
	  var a_email=$('#a_email').val();
	  var a_address=$('#a_address').val();
	  var a_phone=$('#a_phone').val();
	  var a_alias=$('#a_alias').val();
	  var i_id=$('#i_id').val();
	  var i_name=$('#i_name').val();
	  var i_rank=$('#i_rank').val();
	  var f_id=$('#f_id').val();
	  var f_place=$('#f_place').val();
	  var f_time=$('#f_time').val();
	  var f_date=$('#f_date').val();
	  var f_time_l=$('#f_time_l').val();
	  var f_date_l=$('#f_date_l').val();
	  var f_desc=$('#f_desc').val();
	  var f_ps=$('#f_ps').val();
	  var c_id=$('#c_id').val();
	  var c_status=$('#c_status').val();
	  var c_law=$('#c_law').val();
	  var c_detail=$('#c_detail').val();
	  var text="&";
	  if(p_nic!=null&&p_nic!='')
		  {
		  text+="p_nic="+p_nic+"&";
		  s_p=true;
		  }
	  if(p_name!=null&&p_name!='')
	  {
	  text+="p_name="+p_name+"&";
	  s_p=true;
	  }
	  if(p_f_name!=null&&p_f_name!='')
	  {
	  text+="p_f_name="+p_f_name+"&";
	  s_p=true;
	  }
	  if(p_address!=null&&p_address!='')
	  {
	  text+="p_address="+p_address+"&";
	  s_p=true;
	  }
	  if(p_contact!=null&&p_contact!='')
	  {
	  text+="p_contact="+p_contact+"&";
	  s_p=true;
	  }
	  if(v_name!=null&&v_name!='')
	  {
	  text+="v_name="+v_name+"&";
	  s_v=true;
	  }
	  if(v_f_name!=null&&v_f_name!='')
	  {
	  text+="v_f_name="+v_f_name+"&";
	  s_v=true;
	  }
	  if(v_address!=null&&v_address!='')
	  {
	  text+="v_address="+v_address+"&";
	  s_v=true;
	  }
	  if(v_contact!=null&&v_contact!='')
	  {
	  text+="v_contact="+v_contact+"&";
	  s_v=true;
	  }
	  if(a_id!=null&&a_id!='')
	  {
	  text+="a_id="+a_id+"&";
	  s_a=true;
	  }
	  if(a_name!=null&&a_name!='')
	  {
	  text+="a_name="+a_name+"&";
	  s_a=true;
	  }
	  if(a_f_name!=null&&a_f_name!='')
	  {
	  text+="a_f_name="+a_f_name+"&";
	  s_a=true;
	  }
	  if(a_address!=null&&a_address!='')
	  {
	  text+="a_address="+a_address+"&";
	  s_a=true;
	  }
	  if(a_age!=null&&a_age!='')
	  {
	  text+="a_age="+a_age+"&";
	  s_a=true;
	  }
	  if(a_status!=null&&a_status!='')
	  {
	  text+="a_status="+a_status+"&";
	  s_a=true;
	  }
	  if(a_gender!=null&&a_gender!='')
	  {
	  text+="a_gender="+a_gender+"&";
	  s_a=true;
	  }
	  if(a_nic!=null&&a_nic!='')
	  {
	  text+="a_nic="+a_nic+"&";
	  s_a=true;
	  }
	  if(a_email!=null&&a_email!='')
	  {
	  text+="a_email="+a_email+"&";
	  s_a=true;
	  }
	  if(a_phone!=null&&a_phone!='')
	  {
	  text+="a_phone="+a_phone+"&";
	  s_a=true;
	  }
	  if(a_alias!=null&&a_alias!='')
	  {
	  text+="a_alias="+a_alias+"&";
	  s_a=true;
	  }
	  if(i_id!=null&&i_id!='')
	  {
	  text+="i_id="+i_id+"&";
	  s_i=true;
	  }
	  if(i_rank!=null&&i_rank!='')
	  {
	  text+="i_rank="+i_rank+"&";
	  s_i=true;
	  }
	  if(i_name!=null&&i_name!='')
	  {
	  text+="i_name="+i_name+"&";
	  s_i=true;
	  }
	  if(f_id!=null&&f_id!='')
	  {
	  text+="f_id="+f_id+"&";
	  s_f=true;
	  }
	  if(f_place!=null&&f_place!='')
	  {
	  text+="f_place="+f_place+"&";
	  s_f=true;
	  }
	  if(f_time!=null&&f_time!='')
	  {
	  text+="f_time="+f_time+"&";
	  s_f=true;
	  }
	  if(f_date!=null&&f_date!='')
	  {
	  text+="f_date="+f_date+"&";
	  s_f=true;
	  }
	  if(f_time_l!=null&&f_time_l!='')
	  {
	  text+="f_time_l="+f_time_l+"&";
	  s_f=true;
	  }
	  if(f_date_l!=null&&f_date_l!='')
	  {
	  text+="f_date_l="+f_date_l+"&";
	  s_f=true;
	  }
	  if(f_desc!=null&&f_desc!='')
	  {
	  text+="f_desc="+f_desc+"&";
	  s_f=true;
	  }
	  if(f_ps!=null&&f_ps!='')
	  {
	  text+="f_ps="+f_ps+"&";
	  s_f=true;
	  }	  
	  if(c_id!=null&&c_id!='')
	  {
	  text+="c_id="+c_id+"&";
	  s_c=true;
	  }
	  if(c_law!=null&&c_law!='')
	  {
	  text+="c_law="+c_law+"&";
	  s_c=true;
	  }
	  if(c_status!=null&&c_status!='')
	  {
	  text+="c_status="+c_status+"&";
	  s_c=true;
	  }
	  if(c_detail!=null&&c_detail!='')
	  {
	  text+="c_detail="+c_detail+"&";
	  s_c=true;
	  }
	  if(x!='')
		  {
		  text+="photo="+x+"&"
		  }
	  if(x2!='')
	  {
	  text+="finger="+x2+"&"
	 
	  }
		
	  $('#output2').html(text);
		  jQuery.ajax({
		      url: "searchResult.jsp",
		      data:"s_p="+s_p+"&s_a="+s_a+"&s_v="+s_v+"&s_f="+s_f+"&s_i="+s_i+"&s_c="+s_c+text,
		      type: "POST",
		      success:function(data){
		    	  
		    	  $('#output').html(data);
		    	  
		    	  
		    	  
		      }});
		      

	  
	  
	  
  }
  </script>
  
</head>
<body>
<div class="container">
    <h1 style="font-family: Algerian">WELCOME TO SEARCH<img src="images/Zerode-Plump-Search.ico" style="width: 40px; height: 40px"></h1>
<table>
  <tr>
    <th>
    <div class="row">
    <div class="col-sm-6">
    <label class="styled" for="b_1">Search for petitioneor</label>
    </div>
    <div class="col-sm-6"><input type="checkbox" style="width: 25px;height: 30px;background-color:red; position: absolute;top:-10px;" class="c"></div></div>
  </th>
  </tr>
  <tr>
    <td> <div class="container">
    <div class="row"  >
            <div class="col-sm-2">
        <input type="text" id="p_nic" name="p_nic"  placeholder="Nic" onkeyup="search()">
        <input type="checkbox" style="color: red" id="p_nic_c" name="p_nic_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3">
        <input type="text"  id="p_name" placeholder="Name" onkeyup="search()">
        <input type="checkbox" id="p_name_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3">
        <input type="text"  id="p_f_name" placeholder="Father name" onkeyup="search()">
        <input type="checkbox" id="p_f_name_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"   id="p_address" placeholder="Address" onkeyup="search()">
        <input type="checkbox" id="p_address_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"   id="p_contact" placeholder="Contact" onkeyup="search()">
        <input type="checkbox" id="p_contact_c" class="c" title="compalsary">
        </div>
    </div>
    </div></td>
  </tr>
  <tr>
    <td> 
     <div class="row">
    <div class="col-sm-6">
    <label class="styled" for="b_1">Search for victim</label>
    </div>
    <div class="col-sm-6"><input type="checkbox" style="width: 25px;height: 30px;position: absolute;top:-10px;" class="c"></div></div> 
    </td>
    
  </tr>
  <tr>
    <td>      <div class="container">
    <div class="row" >
            <div class="col-sm-3 ">
        <input type="text" id="v_name" placeholder="Name" onkeyup="search()"/>
        <input type="checkbox" id="v_name_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3 ">
        <input type="text"   id="v_address" placeholder="Address" onkeyup="search()"/>
        <input type="checkbox" id="v_address_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3 ">
        <input type="text" id="v_f_name"  placeholder="Father name" onkeyup="search()"/>
        <input type="checkbox" id="v_f_name_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3 ">
        <input type="text"   id="v_contact" placeholder="Contact" onkeyup="search()"/>
        <input type="checkbox" id="v_contact_c" class="c" title="compalsary">
        </div>
            </div>
            </div></td>
  </tr>
  <tr>
    <td>
      <div class="row">
    <div class="col-sm-6">
    <label class="styled" for="b_1">Search for Accused</label>
    </div>
    <div class="col-sm-6"><input type="checkbox" style="width: 25px;height: 30px;position: absolute;top:-10px;" class="c"></div></div> 
    </td>
  </tr>
  <tr>
    <td><div class="container">
    <div class="row"  >
        <div class="row">
         <div class="col-sm-2">
        <input type="text"   id="a_id" placeholder="Accused_id" onkeyup="search()"/>
        <input type="checkbox" id="a_id_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"  id="a_name" placeholder="Name" onkeyup="search()"/>
        <input type="checkbox" id="a_name_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3">
        <input type="text"  id="a_f_name" placeholder="Father name" onkeyup="search()"/>
        <input type="checkbox" id="a_f_name_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-1">
        <input type="text" id="a_age"  placeholder="Age" onkeyup="search()"/>
        <input type="checkbox" id="a_age_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"  id="a_status" placeholder="Status" onkeyup="search()"/>
        <input type="checkbox" id="a_status_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"   id="a_gender" placeholder="Gender" onkeyup="search()"/>
        <input type="checkbox" id="a_gender_c" class="c" title="compalsary">
        </div>
       </div>
       <div class="row">
        <div class="col-sm-2">
        <input type="text" id="a_nic" placeholder="Nic" onkeyup="search()"/>
        <input type="checkbox" id="a_nic_c" class="c" title="compalsary">
        </div>
         <div class="col-sm-2">
        <input type="text" id="a_email"  placeholder="Email" onkeyup="search()"/>
        <input type="checkbox" id="a_email_c" class="c" title="compalsary">
        </div>
        
         <div class="col-sm-2">
        <button id="photo">Upload Photo</button>
        <input type="checkbox" id="a_photo_c" class="c" title="compalsary">
        </div>

         <div class="col-sm-4">
         <button id="finger">Upload Finger Print</button>
        <input type="checkbox" id="a_finger_c" class="c" title="compalsary">
        </div>
         <div class="col-sm-4">
        <button id="imgC" style="display: none">Clear Uploaded Images</button>
        </div>
         </div>
        </div>
   
    </div></td>
  </tr>
  <tr>
    <td>  
     <div class="row">
    <div class="col-sm-6">
    <label class="styled" for="b_1">Search for Investigation Officer</label>
    </div>
    <div class="col-sm-6"><input type="checkbox" style="width: 25px;height: 30px;position: absolute;top:-10px;" class="c"></div></div> 
    </td>
  </tr>
   <tr>
    <td> <div class="row"  >
            <div class="col-sm-3">
        <input type="text"  id="i_id" placeholder="Officer_id" onkeyup="search()"/>
        <input type="checkbox" id="i_id_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3">
        <input type="text"  id="i_name" placeholder="Name" onkeyup="search()"/>
        <input type="checkbox" id="i_name_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3  ">
        <input type="text"  id="i_rank" placeholder="Rank" onkeyup="search()"/>
        <input type="checkbox" id="i_rank_c" class="c" title="compalsary">
        </div>
    </div></td>
  </tr>
   <tr>
    <td> 
      <div class="row">
    <div class="col-sm-6">
    <label class="styled" for="b_1">Search for FIR</label>
    </div>
    <div class="col-sm-6"><input type="checkbox" style="width: 25px;height: 30px;position: absolute;top:-10px;" class="c"></div></div> 
     </td>
  </tr>
   <tr>
    <td><div class="row"  >
            <div class="col-sm-1 ">
        <input type="text"  id="f_id" placeholder="Fir_id" onkeyup="search()" />
        <input type="checkbox" id="f_id_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"  id="f_date" placeholder="Incident date" onkeyup="search()"/>
        <input type="checkbox" id="f_date_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"  id="f_time" placeholder="Incident time" onkeyup="search()"/>
        <input type="checkbox" id="f_time_c" class="c" title="compalsary">
        </div>
          <div class="col-sm-2">
        <input type="text"  id="f_date_l" placeholder="Date loged" onkeyup="search()"/>
        <input type="checkbox" id="f_time_c" class="c" title="compalsary">
        </div>
          <div class="col-sm-2">
        <input type="text"  id="f_time_l" placeholder="Time loged" onkeyup="search()"/>
        <input type="checkbox" id="f_time_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-2">
        <input type="text"  id="f_place" placeholder="incident place" onkeyup="search()" />
        <input type="checkbox" id="f_place_c" class="c" title="compalsary">
        </div>
         <div class="col-sm-2">
        <input type="text"  id="f_desc" placeholder="Description" onkeyup="search()"/>
        <input type="checkbox" id="f_desc_c" class="c" title="compalsary">
        </div>
         <div class="col-sm-3">
        <input type="text"  id="f_ps" placeholder="police station" onkeyup="search()"/>
        <input type="checkbox" name="manish" class="c" title="compalsary">
        </div>
    </div></td>
  </tr>
  <tr>
    <td>
     <div class="row">
    <div class="col-sm-6">
    <label class="styled" for="b_1">Search by Case</label>
    </div>
    <div class="col-sm-6"><input type="checkbox" style="width: 25px;height: 30px;position: absolute;top:-10px;" class="c"></div></div> </td>
  </tr>
  <tr>
    <td> 
    <div class="row"  >
            <div class="col-sm-3  ">
        <input type="text"  id="c_id" placeholder="Case_id" onkeyup="search()"/>
        <input type="checkbox" id="c_id_c" class="c" title="compalsary" >
        </div>
        <div class="col-sm-3  ">
        <input type="text"  id="c_status" placeholder="Case ststus" onkeyup="search()"/>
        <input type="checkbox" id="c_status_c" class="c" title="compalsary" >
        </div>
        <div class="col-sm-3  ">
        <input type="text"  id="c_detail" placeholder="Case details" onkeyup="search()"/>
        <input type="checkbox" id="c_detail_c" class="c" title="compalsary">
        </div>
        <div class="col-sm-3 ">
        <input type="text"  id="c_law" placeholder="Section of law" onkeyup="search()"/>
        <input type="checkbox" id="c_law_c" class="c" title="compalsary">
        </div>
    </div></td>
  </tr>
</table>
    
    <hr width="100%" style="background-color:red">
    <center><div  >
    <button type="submit" id="change" class="d" style="display: none">Advanced Search</button>
    </div>
    </center>
    </div>
    <h3 style="text-align: center;">Result</h3>
    
    <div id="output" style="text-align: center;">no result found</div>
    
    
    														 <form id="uploadphoto" action="" method="post" enctype="multipart/form-data" style="display: none;">
																	 <div class="image-upload">
																	<input id="file-Photo" type="file" name="file-Main" style="display: none;" onchange="Validate(this,'Photo');" />
																	<input type="submit" id="submit-Photo" style="display: none;" >
																	</div>
																	
																</form>
																
															 <form id="uploadfinger" action="" method="post" enctype="multipart/form-data" ">
																	 <div class="image-upload">
																	<input id="file-Finger" type="file" name="file-Main" style="display: none;" onchange="Validate(this,'Finger');" />
																	<input type="submit" id="submit-Finger" style="display: none;" >
																	</div>
																	
																</form>
																</body>
</html>