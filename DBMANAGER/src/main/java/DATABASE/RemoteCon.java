package DATABASE;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/remotechecker")
public class RemoteCon extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connection con=null;
		java.sql.Statement st =null;
		String database="";
			String ip = req.getParameter("ip");
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			HttpSession sess = req.getSession();
			sess.setAttribute("username", username);
			sess.setAttribute("password", password);
			sess.setAttribute("ip", ip);

			
			
			 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				System.out.println("error");
			}
			if(username==" " || password=="") {
				RequestDispatcher Rd = req.getRequestDispatcher("/logfail.html");
				Rd.forward(req, res);
			}
			else {
				try {
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + database, username, password);
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
	}}


