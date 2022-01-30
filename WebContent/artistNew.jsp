<!--
	Joseph Spielman|YouTunes|1/30/22
	New Artist form 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="TopNav.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Artist</title>
</head>
<body>
<main>
<form method ="post" action="artistConfirmation.jsp">
<!-- Form for creating a new artist entry. -->
	<label>First Name: </label><input type='text' name='fName' size='35' maxlength='35' /><br />
	<label>Last Name: </label><input type='text' name='lName' size='35' maxlength='35' /><br />
	<input type='submit' />
</form>
</main>

</body>
<footer>
	<%@ include file="Footer.jsp" %>
	</footer>
</html>