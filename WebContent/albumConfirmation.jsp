<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<%	
	String message = "";
	JdbcAlbumDao db = new JdbcAlbumDao();
	List<Album> albumList= db.list();
	int newID = (albumList.size()+1);
	try{		
		int artistIdIn = Integer.parseInt(request.getParameter("artistid"));
		String titleIn = request.getParameter("title");
		double priceIn = Double.parseDouble(request.getParameter("price"));
		String genreIn = request.getParameter("genre");
		String urlIn = request.getParameter("url");		
		Album albumIn = new Album(newID,titleIn,priceIn,genreIn,urlIn,artistIdIn);
		db.add(albumIn);
		message = "Album Added!";
		
	}catch(Exception e){
		message = "Add failed!";
	}
%>
<meta charset="ISO-8859-1">
<title>New Album Confirmation</title>
</head>
<body>
<h1><%out.print(message); %></h1><br />
<a href="albumsList.jsp">View All Albums</a>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>