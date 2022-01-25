<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Album Details</title>
<%		
			Album selected = null;
			try{
				String albumId = request.getParameter("albumid");
				JdbcAlbumDao db = new JdbcAlbumDao();
				selected= db.find(Long.parseLong(albumId));				
			}
			catch(Exception e){
				out.print("Variable not passed");
			}%>


</head>
<body>
<main>
<div class="container">
	<div class="section">
	 	<img src = "<%out.print(selected.getImgUrl()); %>" height=500px width=500px />	
	 	<div class='divider'></div>
		<h5>Album ID: <%out.print(selected.getAlbumid());%> Title: <%out.print(selected.getTitle());%> Genre: <%out.print(selected.getGenre());%> Price:$<%out.print(selected.getPrice());%></h5>
	</div>
</div>
</main>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</html>