<!--
	Joseph Spielman|YouTunes|1/30/22
	Artist Details page 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artist Detail</title>
		<%		
			Artist selected = null;
			try{
				String artistId = request.getParameter("artistid");
				JdbcArtistDao db = new JdbcArtistDao();
				selected= db.find(Long.parseLong(artistId));								
			}
			catch(Exception e){
				out.print("Variable not passed");
			}%>
</head>
<body>
	<main>
	<div class= "container">		
		<div class = "section">
		<h5>ID: <%out.print(selected.getArtistid());%> Artist: <%out.print(selected.getFirstName()+" "+selected.getLastName());%></h5>
		</div>				
	</div>	
	<div class='section'>
	<form method ="post" action="artistUpdated.jsp">
	<!-- Provide form for updating artist info or removal as necessary. Filled with existing values -->
	<input type='hidden' name='artistid' value='<%out.print(selected.getArtistid());%>'>
	<label>First Name: </label><input type='text' name='fName' size='35' maxlength='35'value='<%out.print(selected.getFirstName());%>' /><br />
	<label>Last Name: </label><input type='text' name='lName' size='35' maxlength='35' value='<%out.print(selected.getLastName());%>' /><br />
	<input type='submit' value='Update' />
	</form>
	</div>
	<div class="section">
	<div class="divider"></div>
	<form method ="post" action="artistRemoved.jsp"> 
	<input type='hidden' name='artistid' value='<%out.print(selected.getArtistid());%>'>
	<input type='submit' value='Remove' />
	</form>
	</div>
</main>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</html>