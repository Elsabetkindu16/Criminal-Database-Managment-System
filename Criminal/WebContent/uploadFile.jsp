<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%String img=new String(); 
String category=request.getParameter("category");
%>
<sql:setDataSource var="snapshot" driver="${initParam['Driver']}" url="${initParam['Url']}" user="${initParam['User']}" password="${initParam['Password']}"/>
<sql:transaction dataSource="${snapshot }">
			<sql:query var="result" >
			select * from images;
			</sql:query>
			<c:forEach var="row" items="${result.rows}">
					<c:set var="NO" value="${row.imageno}" scope="request"/>
			</c:forEach>
			<sql:update>
				update images set imageno=imageno+1 where sno=1;
			</sql:update>
</sql:transaction>
<%
	int No =(int)request.getAttribute("NO")+1;
   File file,file2 ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();

   String relativeWebPath = "/images/";
   String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
  
  String filePath = absoluteDiskPath+category;
 

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
           // if( fileName.lastIndexOf("\\") >= 0 ){
         //   file = new File( filePath + 
           // fileName.substring( fileName.lastIndexOf("\\"))) ;
        //    }else{
           file = new File( filePath +"//image~"+No+
          fileName.substring(fileName.lastIndexOf("."))) ;
       //    file2 = new File( filePath2 +"//"+name.replace(' ', '_')+        fileName.substring(fileName.lastIndexOf("."))) ;
        	           
        //    }
            fi.write( file ) ;
       
            img="image~"+No+fileName.substring( fileName.lastIndexOf("."));
            System.out.println(category+img);
%>
<div id="image" ><%=img%></div>
<% 
            }
         }
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }
  
%>