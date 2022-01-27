<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dbBeans.JdbcArtistDao"%>
<%@page import="dbBeans.JdbcAlbumDao"%>
<%@page import="dbBeans.Artist"%>
<%@page import="dbBeans.Album"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.stream.Collectors"%>


<!DOCTYPE html>
<html>
<head>
 <!--Import Google Icon Font-->
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <!--Import materialize.css-->
 <link type="text/css" rel="stylesheet" href="materialize.min.css"  media="screen,projection"/>

 <!--Let browser know website is optimized for mobile-->
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta charset="ISO-8859-1">
</head>
<body>
<nav class="nav-extended">
    <div class="nav-wrapper">
      <a href="index.jsp" class="brand-logo center">YouTunes Logo</a>      
      <ul id="nav-mobile" class="right hide-on-med-and-down">
      </ul>
    </div>
    <div class="nav-content">
      <ul class="tabs tabs-transparent">
        <li class="tab"><a href="artistList.jsp">Artists</a></li>
        <li class="tab"><a href="About.jsp">About Us</a></li>        
        <li class="tab"><a href="Contact.jsp">Contact Us</a></li>
      </ul>
    </div>
  </nav>
</body>
</html>