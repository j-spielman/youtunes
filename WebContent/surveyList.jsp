<!--
	Joseph Spielman|YouTunes|1/30/22
	Survey Results page 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<%
	JdbcAlbumDao albumDB = new JdbcAlbumDao();
	List<Album> albumDisplay = albumDB.list(); 
	List<Album> uniqueList = new ArrayList<Album>();
	List<Album> topList = new ArrayList<Album>();
	String message = "";
	int favArtistId = 0;
	String favGenre = "";
	//attempt record retrieval based on passed favorite artist and genres
	try
	{
		favArtistId = Integer.parseInt(request.getParameter("favArtistid"));
		favGenre = request.getParameter("favGenre");		
		int noArtistId = Integer.parseInt(request.getParameter("noArtistid"));
		String noGenre = request.getParameter("noGenre");
		message = "Your List";				
		
		}catch(Exception e){
			message = "search failed";
		}
%>
<meta charset="ISO-8859-1">
<title>Top Picks</title>
</head>
<body>
	<main>
		<div class="container">
		<h2>Your Top Picks</h2>
			<%
				//Get all albums that match the favorite artist id or favorite genre from survey page
				for(Album a: albumDisplay){
					if(a.getArtistid() == favArtistId || a.getGenre().equals(favGenre)){
						out.print("<form method='post' action= 'albumDetail.jsp'>");
						out.print("<div class='divider'></div>");
						out.print("<img src ="+a.getImgUrl()+" height=500px width=500px />");
						out.print("<input type='hidden' name='albumid' value='"+a.getAlbumid()+"'>");
						out.print("<div class='Section'><h5>Title: "+a.getTitle()+" Genre: "+a.getGenre()+" $"+a.getPrice()+"</h5></div>");
						out.print("<input type='submit' value='Select' />");
						out.print("</form>");				
						out.print("<div class='section'>");
						out.print("<div class='divider'></div>");
						out.print("<form method ='post' action='albumRemoved.jsp'>"); 
						out.print("<input type='hidden' name='albumid' value="+a.getAlbumid()+">");						
						out.print("</form></div>");
					}
				}
			%>	
		</div>		
	</main>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
</footer>
</html>