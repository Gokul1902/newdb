<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CREATE</title>
<link href="create.css" rel="stylesheet">
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body id="createbody">
    <div id="createheader">
        <h1 class="apptitle">Z-----O-------   DBMANAGER   ------H-----O</h1>
    </div>
    <div id="parent">
        <div id="write">
            <form action="getquery">
            <input id="code" name="query"  type="text" placeholder="Enter Query!!!" autocomplete="off"/>
            <button id="tick"><span class="material-symbols-outlined">done_outline</span></button>
        </form>
            <div id="suggestion">
                <button onclick="add(this)" value="CREATE">CREATE</button>
                <button onclick="add(this)" value="DROP">DROP</button>
                <button onclick="add(this)" value="ALTER">ALTER</button>
                <button onclick="add(this)" value="TRUNCATE">TRUNCATE</button>
                <button onclick="add(this)" value="COMMENT">COMMENT</button>
                <button onclick="add(this)" value="INSERT">INSERT</button>
                <button onclick="add(this)" value="UPDATE">UPDATE</button>
                <button onclick="add(this)" value="DELETE">DELETE</button>
                <button onclick="add(this)" value="SELECT">SELECT</button>
                <button onclick="add(this)" value="GRANT">GRANT</button>
                <button onclick="add(this)" value="REVOKE">REVOKE</button>
                <button onclick="add(this)" value="COMMIT">COMMIT</button>
                <button onclick="add(this)" value="ROLLBACK">ROLLBACK</button>
                <button onclick="add(this)" value="SAVEPOINT">SAVEPOINT</button>   
                <button onclick="clearing()" value="CLEAR">CLEAR</button>     
            </div>
            
        </div>
        <div id="output">
            <div id="result">
           
				<% 
				String userqueryoriginal=(String)request.getAttribute("userquery");
			if(userqueryoriginal!=null){
				out.println(userqueryoriginal+"<br>");
		        Connection con;  
		        Statement st=null;
		        Scanner scan = new Scanner(System.in);
		        boolean bool=true;
		        HttpSession sess = request.getSession();
		        String database=(String)sess.getAttribute("databases");
		        String ipaddress=(String)sess.getAttribute("ip");
		        String name=(String)sess.getAttribute("username");
		        String password=(String)sess.getAttribute("password");
		                try {
		                    Class.forName("com.mysql.cj.jdbc.Driver");
		                    if(database==null) database="";
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database, name, password);
		                    st = con.createStatement();
		                        if (userqueryoriginal.equals("quit;")) {
		                            out.println("Bye" );
		                            bool = false;
		                        } else if (userqueryoriginal.substring(0, 3).equals("use") && userqueryoriginal.length() > 4) {
		                            database = userqueryoriginal.replaceAll(";", "");
		                            database = (database.replaceAll(" ", "")).substring(3);
		                            sess.setAttribute("database", database);
		                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database, name, password);
		                            st = con.createStatement();
		                            out.println("Database changed");
		                        } else {
		                            if (userqueryoriginal.substring(0, 4).equalsIgnoreCase("show") || userqueryoriginal.substring(0, 6).equalsIgnoreCase("select") || userqueryoriginal.substring(0, 4).equalsIgnoreCase("desc")) {
		                                long stime = System.currentTimeMillis();
		                                ResultSet rs = st.executeQuery(userqueryoriginal);
		                                long etime = System.currentTimeMillis();
		                                float timing = (etime - stime) / (float) 100;
		                                out.println("Query Ok, rows affected(" + timing + "sec)"+"<br>");
		                                

		                                int row = 0;
		                                ResultSet rs3 = st.executeQuery(userqueryoriginal);
		                                ResultSetMetaData rsmd3 = rs3.getMetaData();
		                                int columnsNumber3 = rsmd3.getColumnCount();
		                                while (rs3.next()) {
		                                        for (int i = 1; i <= columnsNumber3; i++) {
		                                                
		                                           }
		                                        row+=1;
		                             }
		                                ResultSet rs4 = st.executeQuery(userqueryoriginal);
		                                ResultSetMetaData rsmd4 = rs4.getMetaData();
		                                int columnsNumber4 = rsmd4.getColumnCount();
		                                String [][] arr=new String[row][columnsNumber4];
		                                int innerrow=0;
		                                while (rs4.next()) {
		                                	
		                                    for (int i = 0; i < columnsNumber4; i++) {
		                                    	String columnValue = rs4.getString(i+1);
		                                            arr[innerrow][i]=columnValue;
		                                       }
		                                    innerrow+=1;
		                         }
		                                if(arr != null){
		                        			out.println("<table style='border:1px solid black;padding:5px;font-size:20px;'>");
		                            		for(int i = 0;i < arr.length;i++){
		                            			out.println("<tr style='border:1px solid black;padding:5px;font-size:20px;'>");
		                            			for(int j = 0;j < arr[i].length;j++){
		                            				if(i == 0){
		                            					out.println("<td style='border:1px solid black;padding:5px;font-size:20px;background-color:#282A3A;color:white;'>" + arr[i][j] + "</td>");
		                            				}
		                            				else{
		                            					out.println("<td style='border:1px solid black;padding:5px;font-size:20px;background-color:#282A3A;color:white;'>" + arr[i][j] + "</td>");
		                            				}
		                            			}
		                            			out.println("</tr>");
		                            		}
		                            		out.println("</table>");
		                        		}
		                            
	
		                            }
		                        

		                            else {
		                                        long stime = System.currentTimeMillis();
		                                        st.executeUpdate(userqueryoriginal);
		                                        long etime = System.currentTimeMillis();
		                                        float timing = (etime - stime) / (float) 100;
		                                        out.println("Query Ok, rows affected(" + timing + "sec)");
	
		                            }
		                        }
		                   }
		                catch (SQLException e){
		                	out.println(e.getMessage());
		                }
		        }
				 
				 else{
					 out.println("Enter Something!!!");
				 }
				%>
            </div>
        </div>
    </div>    
    <form id="button" action="mainwork.jsp"><button id="button1">BACK</button></form>
</body>
<script>

    function _(value){
    return document.getElementById(value);
}

let inputvalue = _("code");

function add(ele){
   inputvalue.value=(inputvalue.value+ele.value)+" "; 
   inputvalue.focus();   
}
function clearing(){
    result.innerText="";
}

</script>
</html>