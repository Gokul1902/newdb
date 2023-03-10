<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAINWORK</title>
<link href="mainwork.css" rel="stylesheet">
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
<body id="mainworkbody">
    <div id="mainworkheader">
        <h1 class="apptitle">Z-----O-------   DBMANAGER   ------H-----O</h1>
    </div>
    <div id="parent">
        <form id="work" action="create.jsp">
            <h1>CREATE NEW</h1>
            <h2>Write and Do</h2>
            <button type="submit">START CREATE</button>
        </form>
        <form id="work" action="DB">
            <h1>SEE ANYTHING</h1>
            <h2>Click and See</h2>
            <button type="submit">START VIEW</button>
        </form>
        
        <form id="work" action="connector.jsp">
        <% 
        HttpSession sess = request.getSession();
        String bool = (String)sess.getAttribute("bool");
        System.out.println(bool);
        if(bool=="True"){
        	out.println("<h1>Master</h1><button type='submit'>GO LEARN</button>");
        }
        else{
        	out.println("<h1>Customer</h1><button type='submit'>GO LEARN</button>");
        }
            
          %>
        </form>
       
    </div>
    <form id="button" action="login.html"><button>LOG OUT</button></form>
</body>
</html>
