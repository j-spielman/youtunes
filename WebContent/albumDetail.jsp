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
			JdbcArtistDao artistDB = new JdbcArtistDao();
			List<Artist> artistDisplay = artistDB.list();
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
	<div class="divider"></div>
	
	<div class="section">
	<form method="post" action="albumUpdated.jsp">
	<input type='hidden' name='albumid' value='<%out.print(selected.getAlbumid());%>'>
	<label>Artist: </label>			
	<select name="artistid" class="browser-default">
		<option value='null'>--Select--</option>
	<%		
		for(Artist a: artistDisplay){
			out.print("<option value='"+a.getArtistid()+"'>"+a.getFirstName()+" "+a.getLastName()+"</option>");
		}
	%>
	</select>
	<label>Title: </label><input type='text' name='title' size='55' maxlength='55' value='<%out.print(selected.getTitle()); %>'><br />
	<label>Price: </label><input type='text' name='price' size='55' maxlength='55' value='<%out.print(selected.getPrice()); %>'><br />
	<label>Genre: </label><input type='text' name='genre' size='55' maxlength='55' value='<%out.print(selected.getGenre()); %>'><br />
	<label>Image Url: </label><input type='text' name='url' size='55' maxlength='55' value='<%out.print(selected.getImgUrl()); %>'><br />
	<input type='submit' value='Update' />
	</form>
	</div>
	<div class="section">
		<div class="divider"></div>
		<form method ="post" action="albumRemoved.jsp"> 
		<input type='hidden' name='albumid' value='<%out.print(selected.getAlbumid());%>'>
		<input type='submit' value='Remove' />
		
		</form>
	</div>
</div>
</main>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</html>