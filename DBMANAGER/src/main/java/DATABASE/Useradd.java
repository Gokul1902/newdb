package DATABASE;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Useradd")
public class Useradd extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		String MasterIp = (String)sess.getAttribute("MasterIp");
		String MasterUser =(String)sess.getAttribute("MasterUser");
		String MasterPass = (String)sess.getAttribute("MasterPass");
		String ip = (String)sess.getAttribute("ip");
	    String name = (String)sess.getAttribute("username");
	    String password = (String)sess.getAttribute("password");
		Connection con=null;
	    String query = "insert into userdetail values("+"'"+ip+"'"+","+"'"+name+"'"+","+"'"+password+"'"+")";
	    String entry = "false";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://"+MasterIp+":3306/user", MasterUser, MasterPass);
			Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from userdetail;");
	        while (rs.next()) {
	        	
	        	if(rs.getObject(1).equals(ip) && rs.getObject(2).equals(name) && rs.getObject(3).equals(password)) {
	        		entry ="true";
	        		
	        	}
	        	
	        }
	        
	        if(entry=="false") {
	        	con = DriverManager.getConnection("jdbc:mysql://"+MasterIp+":3306/user", MasterUser, MasterPass);
		       	Statement st1 = con.createStatement();
		       	st1.executeUpdate(query);
	        }
	        
	        sess.setAttribute("entry", entry);
	        sess.setAttribute("check", "true");
	        RequestDispatcher Rd = request.getRequestDispatcher("/connector.jsp");
			Rd.forward(request,response);


		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
