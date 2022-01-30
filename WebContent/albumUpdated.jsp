<!--
	Joseph Spielman|YouTunes|1/30/22
	Album Update confirmation 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<%	
	String message = "";
	JdbcAlbumDao db = new JdbcAlbumDao();
	try{
		//create new album from passed values and update based on passed album ID.
		int albumIdIn = Integer.parseInt(request.getParameter("albumid"));
		int artistIdIn = Integer.parseInt(request.getParameter("artistid"));
		String titleIn = request.getParameter("title");
		double priceIn = Double.parseDouble(request.getParameter("price"));
		String genreIn = request.getParameter("genre");
		String urlIn = request.getParameter("url");
		Long idRemove = Long.parseLong(request.getParameter("albumid"));
		Album albumIn = new Album(albumIdIn,titleIn,priceIn,genreIn,urlIn,artistIdIn);
		db.update(albumIn);
		message = "Album Updated!";
		
	}catch(Exception e){
		message = "Update failed!";
	}
%>
<meta charset="ISO-8859-1">
<title>Album Update confirmation</title>
</head>
<body>
<h1><%out.print(message); %></h1><br />
<a href="albumsList.jsp">View All Albums</a>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>