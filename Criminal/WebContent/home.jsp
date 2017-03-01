<%@page import="com.sun.scenario.effect.impl.prism.PrImage"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.User" import="service.Service"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>criminal</title>
	<link rel="stylesheet" href="css8/style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script class="cssdeck" src="js/jquery.min.js"></script>
</head>
<body>
<%

User user=(User)session.getAttribute("User");
String usr="local";
if(user!=null)
	usr=user.getType();
%>
	<div id="header">
		<div class="wrapper clearfix">
			<sql:setDataSource var="snapshot" driver="${initParam['Driver']}"
									     url="${initParam['Url']}"
									    user="${initParam['User']}"  password="${initParam['Password']}"/>
			<div id="logo">
				<a href="home.jsp"><img src="images/im.ico"  style="position: absolute;top:0px;left: 0px;width: 70px;height: 70px" alt="LOGO"></a>
			</div>
			<ul id="navigation">
				<li class="selected">
					<a href="home.jsp">Home</a>
				</li>
				<li>
					<a href="stat.jsp">Crime Statistics</a>
				</li>
				<li>
					<a href="blog.html">Blog</a>
				</li>
				<li>
					<a href="gallery.html">Gallery</a>
				</li>
				<%if(usr.equals("local")) {%>
				<li>
					<a href="login.jsp" style="color:red">login</a>
				</li>
				<%}else
					{%>
					<li  style="color:red">
					Welcome <%=user.getUname() %>&nbsp&nbsp&nbsp&nbsp<a href="logout.jsp" style="color:red">logout</a>
					<li>
					<%} %>
			</ul>
		</div>
	</div>
	<div id="contents">
		<div id="adbox">
			<div class="wrapper clearfix">
				<div class="info">
					<h1>Criminal of database.</h1>
					<p>
						Criminal is a 2016 American science fiction action crime thriller film directed by Ariel Vromen[4] and written by Douglas Cook and David Weisberg. The film is about a convict who is implanted with a dead CIA agent's memories to finish an assignment. The film stars Kevin Costner, Gary Oldman and Tommy Lee Jones, in the second collaboration between all three following the 1991 film JFK.
					</p>
				</div>
				<div class="container" >
				<ul id="navigation">
				<%if(usr.equals("admin"))
					{%>
				<li class="selected">
					<a href="create.jsp"><button type="submit" style="background-color: red;font-family: arial;"> Create User</button></a>
				</li>
				<%} %>
				<%if(!usr.equals("local"))
					{%>
				<li>
					<a href="petitioner.jsp"><button type="submit"  style="background-color: green;font-family: arial;">File fir</button></a>
				</li>
				<%} 
				if(!usr.startsWith("local"))
				{%>
					<sql:query var="r" dataSource="${snapshot}">
						select * from investigation_officer where id='<%=user.getUname() %>'; 
					</sql:query>
				<li>
					<a href="openCase.jsp"><button type="submit"  style="background-color: yellow;font-family: arial;">opencase</button></a>
				</li>
				<%} %>
				<li>
					<a href="listPetitioner.jsp"><button type="submit"  style="background-color:yellow;font-family: arial;">List Petitioner</button></a>
				</li>
				<li>
					<a href="listAccused.jsp"><button type="submit"  style="background-color: green;font-family: arial;">List Accused</button></a>
				</li>
				<li>
					<a href="listVictims.jsp"><button type="submit"  style="background-color: green;font-family: arial;">List Victims</button></a>
				</li>
				<li>
					<a href="listCases.jsp"><button type="submit"  style="background-color: green;font-family: arial;">List Case</button></a>
				</li>
				<li>
					<a href="listFir.jsp"><button type="submit"  style="background-color: green;font-family: arial;">List Fir</button></a>
				</li>
				<li>
					<a href="listOfficer.jsp"><button type="submit"  style="background-color: green;font-family: arial;">List Officer</button></a>
				</li>
		        <li>
					<a href="listOfficer.jsp"><button type="submit"   style="background-color: blue;font-family: arial; position:absolute;top:460px;left:1544px">help</button></a>
				</li>
		      
			</ul>
			</div>
			</div>
			<div class="highlight">
			<table style="text-align:left">
				<tr><th><h2>Criminal Verification - <i>checking criminal history.</i></h2></th><th> 
				<div class="field" id="searchform">
               
             <a href="search.jsp"><button type="button"  id="search">Search</button></a>   
                </div></th></tr>
			</table>
			</div>
		</div>
		<div class="body clearfix">
			<p style="font-size:12px;">
				The police records are available at different levels – national (National Crime Records Bureau), state, city/town/district, and local police station. While the records are computerized at NCRB and most of the state levels, they may not be available in electronic form at most of the district and local police station levels. The Home Ministry has embarked on Crime and Criminal Tracking Network and Systems (CCTNS) project to link all the police stations and offices across the country and the full-integrated system is expected to be available in 2012. It is not known to what extent the information will be made available for public access.
			</p>
		</div>
	</div>
	<div id="footer">
		<ul id="featured" class="wrapper clearfix">
			<li>
				<img src="images/d.jpg" alt="Img" height="204" width="220">
				<h3><a href="blog.html">Justice</a></h3>
				<p style="text-align: left">
					justice is the legal or philosophical theory by which fairness is administered. The concept of justice differs in every culture. An early theory of justice was set out by the Ancient Greek philosopher Plato in his work The Republic. Advocates of divine command theory argue that justice issues from God. In the 17th century, theorists like John Locke argued for the theory of natural law.
				</p>
			</li>
			<li>
				<img src="images/f.jpg" alt="Img" height="204" width="220">
				<h3><a href="blog.html">criminal mind</a></h3>
				<p style="text-align: left">
					Criminal Minds is set primarily at the FBI's Behavioral Analysis Unit (BAU) based in Quantico, Virginia. ... The series follows a group of FBI profilers who set about catching various criminals through behavioral profiling.
				</p>
			</li>
			<li>
				<img src="images/g.jpg" alt="Img" height="204" width="220">
				<h3><a href="blog.html">crime</a></h3>
				<p style="text-align: left">
					In ordinary language, a crime is an unlawful act punishable by a state or other authority. The term "crime" does not, in modern criminal law, have any simple and universally accepted definition,though statutory definitions have been provided for certain purposes. 
				</p>
			</li>
			<li>
				<img src="images/a.jpg" alt="Img" height="204" width="220">
				<h3><a href="blog.html">murder</a></h3>
				<p style="text-align: left">
					Murder is the unlawful killing of another human being without justification or valid excuse, especially the unlawful killing of another human being with malice aforethought
				</p>
			</li>
		</ul>
		<div class="body">
			<div class="wrapper clearfix">
				<div id="links">
					<div>
						<h4>Social</h4>
						<ul>
							<li>
								<a href="http://freewebsitetemplates.com/go/googleplus/" target="_blank">Google +</a>
							</li>
							<li>
								<a href="http://freewebsitetemplates.com/go/facebook/" target="_blank">Facebook</a>
							</li>
							<li>
								<a href="http://freewebsitetemplates.com/go/youtube/" target="_blank">Youtube</a>
							</li>
						</ul>
					</div>
					<div>
						<h4>Help</h4>
						<ul>
							<li>
								<a href="about.html">HELP</a>
							</li>
							<li>
								<a href="contact.html">CONTACTS</a>
							</li>
							<li>
								<a href="faq.html">FAQ</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>