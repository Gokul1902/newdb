package DATABASE;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet ("/tabledata")
public class TableData extends HttpServlet {
	  public void service(HttpServletRequest req,HttpServletResponse res) {
			
		HttpSession sess = req.getSession();
     String database =(String)sess.getAttribute("setdatabase");
     String tablename =req.getParameter("tableName");
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
        int row = 0;
        ResultSet rs3 = st.executeQuery("select * from "+tablename+";");
        ResultSetMetaData rsmd3 = rs3.getMetaData();
        int columnsNumber3 = rsmd3.getColumnCount();
        while (rs3.next()) {
                for (int i = 1; i <= columnsNumber3; i++) {
                        
                   }
                row+=1;
     }
        ResultSet rs4 = st.executeQuery("select * from "+tablename+";");
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
        

req.setAttribute("data", databaselist);
        
req.setAttribute("tabledata", tablelist);
req.setAttribute("tabdata", arr);
        
        RequestDispatcher rd = 
                req.getRequestDispatcher("/show.jsp");
        rd.forward(req,res);
        
        
     }
       
        
		
	 catch (Exception e) {
		// TODO: handle exception
		 e.printStackTrace();
	}
	  }

}
