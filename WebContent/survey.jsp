<!--
	Joseph Spielman|YouTunes|1/30/22
	Music survey page. Based on favorite artists and genres supplied via dropdowns, provide recommendations on next page. 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<%					
			JdbcArtistDao artistDB = new JdbcArtistDao();
			JdbcAlbumDao albumDB = new JdbcAlbumDao();
			List<Artist> artistDisplay = artistDB.list();
			List<Album> albumDisplay = albumDB.list(); 
			List<String> allGenres= new ArrayList<String>();
			
			for(Album a: albumDisplay){				
				allGenres.add(a.getGenre());				
			}
			
			List<String> uniqueGenres = allGenres.stream().distinct().collect(Collectors.toList());
%>

<meta charset="ISO-8859-1">
<title>Find New Music</title>
</head>
<body>
<main>
<div class="container">
<form method="post" action="surveyList.jsp">
<label>Favorite Artist</label>
<select name="favArtistid" class="browser-default">
		<option value='null'>--Select--</option>
	<%		
		for(Artist a: artistDisplay){
			out.print("<option value='"+a.getArtistid()+"'>"+a.getFirstName()+" "+a.getLastName()+"</option>");
		}
	%>
	</select>
<label>Favorite Genre:</label>
 	<select name="favGenre" class='browser-default'>
	<option value='null'>--Select--</option>
	<%		
	for(String g: uniqueGenres){
		out.print("<option value='"+g+"'>"+g+"</option>");
	}
%>

</select>
<input type="submit" value="search"/>
</form>
<h5><a href="albumsList.jsp">View All Albums</a></h5>
</div>
</main>

</body>

<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>