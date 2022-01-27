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
		String fNameIn = request.getParameter("fName");
		String lNameIn = request.getParameter("lName");
		int idIn = Integer.parseInt(request.getParameter("artistid"));
		Artist input = new Artist(idIn,fNameIn,lNameIn);
		db.update(input);
		message = "Artist Updated!";
		
	}catch(Exception e){
		message = "Update failed!";
	}
%>
<meta charset="ISO-8859-1">
<title>Artist Updated</title>
</head>
<body>
<h1><%out.print(message); %></h1><br />
<a href="artistList.jsp">View All Artists</a>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>