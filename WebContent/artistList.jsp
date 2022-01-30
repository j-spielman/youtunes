<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artists</title>
	<%
		JdbcArtistDao db = new JdbcArtistDao();
		List<Artist> display = db.list();	
	%>
</head>
<body>
	<main>
	<h1>All Artists</h1>	
	<div class="container">
		<%
			for(Artist a: display){				
				out.print("<form method='post' action= 'artistDetail.jsp'>");
				out.print("<div class='divider'></div>");
				out.print("<input type='hidden' name='artistid' value='"+a.getArtistid()+"'>");				
				out.print("<div class='Section'><h5>"+a.getFirstName()+" "+a.getLastName()+"</h5></div>");
				out.print("<input type='submit' value='Select' />");
				out.print("</form>");
			}
		%>		
	</div>	
	<h5><a href="albumsList.jsp">View All Albums</a>|<a href="artistNew.jsp">Add a New artist</a></h5>
	</main>
</body>
	<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</html>