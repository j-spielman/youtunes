<!--
	Joseph Spielman|YouTunes|1/30/22
	Album Details Page 
 -->
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
			Artist artistSelected = null;
			JdbcArtistDao artistDB = new JdbcArtistDao();
			JdbcAlbumDao albumDB = new JdbcAlbumDao();
			List<Artist> artistDisplay = artistDB.list();
			List<Album> albumDisplay = albumDB.list(); 
			List<String> allGenres = new ArrayList<String>();
			//get the selected albums information from the album database and get the artist name from the artist database
			try{
				String albumId = request.getParameter("albumid");
				JdbcAlbumDao db = new JdbcAlbumDao();
				selected= db.find(Long.parseLong(albumId));			
				artistSelected = artistDB.find(Long.parseLong(albumId));
			}
			catch(Exception e){
				out.print("Variable not passed");
			}
			//add genres to ArrayList for dropdown.
			for(Album a: albumDisplay){				
				allGenres.add(a.getGenre());				
			}
			//Create list of unique genre values for dropdown
			List<String> uniqueGenres = allGenres.stream().distinct().collect(Collectors.toList());
			%>
</head>
<body>
<main>
<div class="container">
	<div class="section">
	<!-- Display Album info -->
	 	<img src = "<%out.print(selected.getImgUrl()); %>" height=500px width=500px />	
	 	<div class='divider'></div>
		<h5>Artist: <%out.print(artistSelected.getFirstName() +" "+artistSelected.getLastName());%> |Album ID: <%out.print(selected.getAlbumid());%> |Title: <%out.print(selected.getTitle());%> |Genre: <%out.print(selected.getGenre());%> |Price:$<%out.print(selected.getPrice());%></h5>
	</div>
	<div class="divider"></div>
	<div class="section">
	<form method="post" action="albumUpdated.jsp">
	<input type='hidden' name='albumid' value='<%out.print(selected.getAlbumid());%>'>
	<label>Artist: </label>			
	<select name="artistid" class="browser-default">
		<option value='null'>--Select--</option>
	<%		
	//display artist info
		for(Artist a: artistDisplay){
			out.print("<option value='"+a.getArtistid()+"'>"+a.getFirstName()+" "+a.getLastName()+"</option>");
		}
	%>
	</select>
	<!-- Form for updating the artist. Fields are filled with default values from album info and arrays for the dropdown lists -->
	<label>Title: </label><input type='text' name='title' size='55' maxlength='55' value='<%out.print(selected.getTitle()); %>'><br />
	<label>Price: </label><input type='text' name='price' size='55' maxlength='55' value='<%out.print(selected.getPrice()); %>'><br />
	 <!-- <label>Genre: </label><input type='text' name='genre' size='55' maxlength='55' value='<%out.print(selected.getGenre()); %>'><br />  -->
	 <label>Genre:</label>
	 	<select name="genre" class='browser-default'>
		<option value='null'>--Select--</option>
		<%		
		for(String g: uniqueGenres){
			out.print("<option value='"+g+"'>"+g+"</option>");
		}
	%>
	</select>
	<label>Image Url: </label><input type='text' name='url' size='55' maxlength='55' value='<%out.print(selected.getImgUrl()); %>'><br />
	<input type='submit' value='Update' />
	</form>
	</div>
	<!-- Button for removing artist -->
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