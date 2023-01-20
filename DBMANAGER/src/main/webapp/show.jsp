 <%@page import="com.mysql.cj.xdevapi.DbDoc"%>
<%@page import="DATABASE.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>show</title>
    <link href="show.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Anton&family=Noto+Serif:ital,wght@1,400;1,700&family=Oswald:wght@700&family=Rubik+Bubbles&family=Rubik+Marker+Hatch&family=Stylish&display=swap" rel="stylesheet">
    
      <link href="style.css" rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link
        href="https://fonts.googleapis.com/css2?family=Combo&family=Island+Moments&family=Lora&family=PT+Sans:ital@1&family=Roboto:ital,wght@1,700&display=swap"
        rel="stylesheet"> 
   
    </head>
    <body id="showbody">
        <div id="showheader">
            <h1 class="apptitle">Z-----O-------   DBMANAGER   ------H-----O</h1>
        </div>
        <div id="parent">
        
        <form action="tableget" id="databaseshow">
        <h1>DATABASE</h1>
            <%
        ArrayList std = (ArrayList)request.getAttribute("data");
        for(Object c:std){
        	out.println("<button name='UserClickedDB' value='" + c + "'  class='content-buttons'>" + c + "</button>");
        }
        
        %>

        </form>
        <form action="tabledata" id="tableshow">
        <h1>TABLE</h1>
        <%
        ArrayList std2 = (ArrayList)request.getAttribute("tabledata");
        if(std2!=null){
        for(Object c:std2){
        	out.println("<button name='tableName' value='" + c + "'  class='content-buttons'>" + c + "</button>");
        }
        }

        
        %>
        </form>
        <div id="resultshow">
        <%
        String[][] tableData = (String[][]) request.getAttribute("tabdata");
		if(tableData != null){
			out.println("<table style='border:1px solid black;padding:5px;font-size:20px;'>");
    		for(int i = 0;i < tableData.length;i++){
    			out.println("<tr style='border:1px solid black;padding:5px;font-size:20px;'>");
    			for(int j = 0;j < tableData[i].length;j++){
    				if(i == 0){
    					out.println("<td style='border:1px solid black;padding:5px;font-size:20px;background-color:#282A3A;color:white;'>" + tableData[i][j] + "</td>");
    				}
    				else{
    					out.println("<td style='border:1px solid black;padding:5px;font-size:20px;background-color:#282A3A;color:white;'>" + tableData[i][j] + "</td>");
    				}
    			}
    			out.println("</tr>");
    		}
    		out.println("</table>");
		}
        %>
        
        </div>
        </div>
        <form id="button" action="mainwork.jsp"><button>GO BACK</button></form>
  
    </body>
    </html>