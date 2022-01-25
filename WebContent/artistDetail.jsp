<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artist Detail</title>
		<% /*
			if(request.getMethod().equals("Post")){
				try{
					JdbcArtistDao db = new JdbcArtistDao();
					String id = request.getParameter("artistid");					
					Artist toUpdate = db.find(Long.parseLong(id));
					String fName = request.getParameter("formFName");
					String lName = request.getParameter("formLName");
					
					toUpdate.setFirstName(fName);
					toUpdate.setLastName(lName);
					
					db.update(toUpdate);		
					Artist selected = db.find(Long.parseLong("artistid"));
				}catch(Exception e_){
					System.out.print("Update Failed");
				}
			}
		*/
		%>
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
</main>
</body>
<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</html>