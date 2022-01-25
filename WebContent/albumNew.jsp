<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Album</title>
<%
	JdbcArtistDao db = new JdbcArtistDao();
	List<Artist> artistList = db.list();	
%>	
</head>
<body>
	<main>
	<h5>Dropdown test</h5>	
	<select name ="artist">
	<option value="null">--Select--</option>
		<%
		for(Artist a: artistList){
			out.print("option value='"+a.getArtistid()+"'>"+a.getFirstName()+" "+a.getLastName()+"</option>");
		}
	%>	

	</select>
	</main>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>