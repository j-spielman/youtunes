<%@page import="dbBeans.JdbcArtistDao"%>
<%@page import="dbBeans.JdbcAlbumDao"%>
<%@page import="dbBeans.Artist"%>
<%@page import="dbBeans.Album"%>
<%@page import="java.util.List"%>
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
<h1>Artists List</h1>
<body>
<%
	
	JdbcArtistDao db = new JdbcArtistDao();
	
	Artist input = new Artist(99,"Huey","Lewis");
	
	db.add(input);

	List<Artist> display= db.list();
	for(Artist a: display){
		out.print(a.toString()+"</br>");
	}
		
	input.setFirstName("Jeremy");
	input.setLastName("Jeremy");
	db.update(input);
	
	List<Artist> display2= db.list();
	out.print("<h1>Second List</h1>");
	for(Artist a: display2){
		out.print(a.toString()+"</br>");
	}
	db.remove((long)99);
	List<Artist> display3= db.list();
	out.print("<h1>List after remove</h1>");
	for(Artist a: display3){
		out.print(a.toString()+"</br>");
	}
	out.print("<h1>Single Record</h1>");
	Artist serachable=db.find((long)1);
	out.print(serachable.toString());
	
	out.print("<h5>Dropdown test</h5>");	
	out.print("<select name ='artist'>");
	out.print("<option value='null'>--Select--</option>");		
		for(Artist a: display){
			out.print("<option value='"+a.getArtistid()+"'>"+a.getFirstName()+" "+a.getLastName()+"</option>");
		}
		out.print("</select>");	
%>
</body>
</html>