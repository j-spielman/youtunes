<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Album</title>
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
</head>
<body>
<div class="container">
<h3>Add New Album</h3>
	<div class="section">
	<form method="post" action="albumConfirmation.jsp">	
	<label>Artist: </label>			
	<select name="artistid" class="browser-default">
		<option value='null'>--Select--</option>
	<%		
		for(Artist a: artistDisplay){
			out.print("<option value='"+a.getArtistid()+"'>"+a.getFirstName()+" "+a.getLastName()+"</option>");
		}
	%>
	</select>
	<label>Title: </label><input type='text' name='title' size='55' maxlength='55' value='title'><br />
	<select name="genre" class='browser-default'>
		<option value='null'>--Select--</option>
		<%		
		for(String g: uniqueGenres){
			out.print("<option value='"+g+"'>"+g+"</option>");
		}
	%>
	</select>
	<label>Price: </label><input type='text' name='price' size='55' maxlength='55' value=9.99><br />	
	<label>Image Url: </label><input type='text' name='url' size='55' maxlength='55' value='img/placeholder.jpg'><br />
	<input type='submit' value='Update' />
	</form>
	</div>
</div>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>