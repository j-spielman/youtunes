<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<%	
	String message = "";
	JdbcArtistDao db = new JdbcArtistDao();
	try{
		Long idRemove = Long.parseLong(request.getParameter("artistid"));		
		db.remove(idRemove);
		message = "Artist Removed!";
		
	}catch(Exception e){
		message = "Removal failed!";
	}
%>
<meta charset="ISO-8859-1">
<title>Artist Removal confirmation</title>
</head>
<body>
<h1><%out.print(message); %></h1><br />
<a href="artistList.jsp">View All Artists</a>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>