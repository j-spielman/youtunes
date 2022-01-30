<!--
	Joseph Spielman|YouTunes|1/30/22
	Index page displaying existing albums with details button
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>
<!DOCTYPE html>
<html>
<head>
		<%
			JdbcAlbumDao db= new JdbcAlbumDao();
			List<Album> display = db.list();
		%>

<meta charset="ISO-8859-1">
<title>YouTunes</title>
</head>
<body>
	<main>	
		<div class="container">
			<%
				for(Album a: display){					
					out.print("<form method='post' action= 'albumDetail.jsp'>");
					out.print("<div class='divider'></div>");
					out.print("<img src ="+a.getImgUrl()+" height=500px width=500px />");
					out.print("<input type='hidden' name='albumid' value='"+a.getAlbumid()+"'>");
					out.print("<div class='Section'><h5>Title: "+a.getTitle()+" Genre: "+a.getGenre()+" $"+a.getPrice()+"</h5></div>");
					out.print("<input type='submit' value='Select' />");
					out.print("</form>");				
					out.print("<div class='section'>");
					out.print("<div class='divider'></div>");
					out.print("<form method ='post' action='albumRemoved.jsp'>"); 
					out.print("<input type='hidden' name='albumid' value="+a.getAlbumid()+">");
					out.print("<input type='submit' value='Remove' />");
					out.print("</form></div>");
				}
			%>
			
		</div>
	</main>
	<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</body>    
</html>