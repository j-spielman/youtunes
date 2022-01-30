<!--
	Joseph Spielman|YouTunes|1/30/22
	Confirm new artist has been added to database. 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<%	
	String message = "";
	JdbcArtistDao db = new JdbcArtistDao();
	List<Artist> aList = db.list();
	//count existing artists and add 1 for new unique id value.
	int newId = (aList.size()+1);
	try{
		//attempt to create new artist based on passed parameters and generated artist id.
		String fNameIn = request.getParameter("fName");
		String lNameIn = request.getParameter("lName");
		Artist input = new Artist(newId,fNameIn,lNameIn);
		db.add(input);
		message = "Artist added!";
		
	}catch(Exception e){
		message = "Addition failed!";
	}
%>
<meta charset="ISO-8859-1">
<title>New Artist confirmation</title>
</head>
<body>
<h1><%out.print(message); %></h1><br />
<a href="artistNew.jsp">Add Another Artist</a><br />
<a href="artistList.jsp">View All Artists</a>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>