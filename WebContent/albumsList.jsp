<!--
	Joseph Spielman|YouTunes|1/30/22
	List of all available albums.
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Albums</title>
</head>
<body>
	<main>
		<h1>All Albums</h1>
		<%
			JdbcAlbumDao db= new JdbcAlbumDao();
			List<Album> display = db.list();
		%>
		<div class="container">
			<%
			//display all albums with album covers.
				for(Album a: display){
					out.print("<form method='post' action= 'albumDetail.jsp'>");
					out.print("<div class='divider'></div>");
					out.print("<img src ="+a.getImgUrl()+" height=500px width=500px />");
					out.print("<input type='hidden' name='albumid' value='"+a.getAlbumid()+"'>");
					out.print("<div class='Section'><h5>Title: "+a.getTitle()+" Genre: "+a.getGenre()+" $"+a.getPrice()+"</h5></div>");
					out.print("<input type='submit' value='Select' />");
					out.print("</form>");										
				}
			%>
		<h5><a href='albumNew.jsp'>Add an Album</a></h5>
		</div>
	</main>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</html>
