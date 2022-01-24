<%@page import="dbBeans.JdbcAlbumDao"%>
<%@page import="dbBeans.Album"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<h1>Album List</h1>
<body>
<%
	
	JdbcAlbumDao db = new JdbcAlbumDao();
	
	Album input = new Album(99,"test",9.99,"metal","test.url",1);
	
	db.add(input);

	List<Album> display= db.list();
	for(Album a: display){
		out.print(a.toString()+"</br>");		
	}
	
	input.setGenre("ZZZZZZ");
	input.setPrice(99999.99);
	db.update(input);
	out.println("<h1>After Update</h1></br>");
	List<Album> display3= db.list();
	for(Album a: display3){
		out.print(a.toString()+"</br>");		
	}
	
	out.println("<h1>After Removal</h1></br>");
	db.remove((long)99);
	List<Album> display2= db.list();
	for(Album a: display2){
		out.print(a.toString()+"</br>");		
	}
	out.println("<h1>Single Record</h1></br>");
	Album search=db.find((long)1);
	out.println(search.toString());
	
	
		
%>
</body>
</html>