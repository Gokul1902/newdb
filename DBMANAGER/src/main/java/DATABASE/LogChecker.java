package DATABASE;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.mysql.cj.xdevapi.Statement;

@WebServlet ("/checker")
public class LogChecker extends HttpServlet {

	Connection con=null;
	java.sql.Statement st =null;
	String database="";
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		String userIp = req.getRemoteAddr();
		HttpSession sess = req.getSession();
		sess.setAttribute("MasterIp", "10.191.254.206");
		sess.setAttribute("MasterUser", "test");
		sess.setAttribute("MasterPass", "Amma@143");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		sess.setAttribute("ip", userIp);
		sess.setAttribute("username", username);
		sess.setAttribute("password", password);
		String ip = userIp;
		System.out.println("ip"+userIp);
		System.out.println(ip);
		System.out.println(password);
		System.out.println(username);
		
		 try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			System.out.println("error");
		}
		if(ip==" " || username==" " || password=="") {
			RequestDispatcher Rd = req.getRequestDispatcher("/logfail.html");
			Rd.forward(req, res);
		}
		else {
			try {
				con = DriverManager.getConnection("jdbc:mysql://"+ip+":3306/" + database, username, password);
                st = con.createStatement();
                RequestDispatcher Rd = req.getRequestDispatcher("/logsuccess.html");
    			Rd.forward(req, res);
			}
			catch (Exception e) {
				e.printStackTrace();
				String error = e.getMessage();
		            System.out.println(" error   "+error);
				RequestDispatcher Rd = req.getRequestDispatcher("/logfail.html?error="+error);
				Rd.forward(req, res);
			}
			
			
		}
		
	}

}
