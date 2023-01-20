<%@page import="java.awt.Checkbox"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGSUCCESS</title>
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
<style>
    *{
    padding: 0%;
    margin: 0%;
    box-sizing: border-box;
}
#connectorsuccessheader{
    border: 1px solid black;
    padding: 1%;
    text-align: center;
    position: fixed;
    top: 0%;
    right: 0%;
    left: 0%;
    font-family: 'Abril Fatface', cursive; 
    color: white;
    border-radius: 10px;
    background-color: rgb(68, 148, 246);    
   /* background-color: black; */
    box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;
}
#connectorsuccessbody{
    background-image: url("https://img.freepik.com/free-vector/white-abstract-background-design_23-2148825582.jpg?w=2000");
    background-repeat: no-repeat;
    background-size: 100% 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
button{
    font-size: 20px;
    padding: 10px;
    color: rgb(68, 148, 246);
    background-color: white;
    margin: 30px;
    border-radius: 10px;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}
#result{
	font-size: 20px;
    padding: 10px;
    color: rgb(68, 148, 246);
    background-color: white;
    margin: 30px;
    border-radius: 10px;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
}
</style>
</head>
<body id="connectorsuccessbody">
    <div id="connectorsuccessheader">
        <h1 class="apptitle">Z-----O-------   DBMANAGER   ------H-----O</h1>
    </div>
    <form id="result" action="Useradd">
        <button type="submit">Connect</button>
        
    </form>
    <div id="result">
    <% 
    HttpSession sess = request.getSession();
    String entry = (String)sess.getAttribute("entry");
    String check = (String)sess.getAttribute("check");
    if(check=="true"){
    	
    if(entry!=null){
    if(entry=="true"){
    	out.println("You already connected");
    }
    else{
    	out.println("You connected");
    }
    }
    }
    %>
    </div>
    <form id="result" action="UserRemove">
        <button type="submit">Disconnect</button>
        
    </form>
    <div id="result">
    <% 
    String entryRemove = (String)sess.getAttribute("entryRemove");
    if(check=="false"){
    	
    if(entryRemove!=null){
    if(entryRemove=="false"){
    	out.println("You Already not connected");
    }
    else{
    	out.println("You Disconnected");
    }
    }
    }
    %>
    </div>
    <div></div>
</body>
</html>