package DATABASE;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet ("/tableget")
public class Table extends HttpServlet {
	  public void service(HttpServletRequest req,HttpServletResponse res) {
			
		HttpSession sess = req.getSession();
     String database =req.getParameter("UserClickedDB");
     sess.setAttribute("setdatabase", database);
     String ip = (String)sess.getAttribute("ip");
     String name = (String)sess.getAttribute("username");
     String password = (String)sess.getAttribute("password");
		 
     try {
  	   
  	   Class.forName("com.mysql.cj.jdbc.Driver");
       	Connection con = DriverManager.getConnection("jdbc:mysql://"+ip+":3306/" + database, name, password);
       	Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("show tables;");
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        
        ArrayList tablelist = new ArrayList();
        while (rs.next()) {
                for (int i = 1; i <= columnsNumber; i++) {

                        String columnValue = rs.getString(i);
                        tablelist.add(columnValue);
                        
                   }
        
 
     }
        ResultSet rs2 = st.executeQuery("show databases;");
        ResultSetMetaData rsmd2 = rs2.getMetaData();
        int columnsNumber2 = rsmd2.getColumnCount();
        
        ArrayList databaselist = new ArrayList();
        while (rs2.next()) {
                for (int i = 1; i <= columnsNumber2; i++) {

                        String columnValue2 = rs2.getString(i);
                        databaselist.add(columnValue2);
                        
                   }
        
 
     }
req.setAttribute("data", databaselist);
        
req.setAttribute("tabledata", tablelist);
        
        RequestDispatcher rd = 
                req.getRequestDispatcher("/show.jsp");
        rd.forward(req,res);
        
        
     }
       
        
		
	 catch (Exception e) {
		// TODO: handle exception
		System.out.println("error2");
	}
	  }

}
