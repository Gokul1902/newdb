package DATABASE;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Authentication
 */
@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		String MasterIp = (String)sess.getAttribute("MasterIp");
		String MasterUser =(String)sess.getAttribute("MasterUser");
		String MasterPass = (String)sess.getAttribute("MasterPass");
		String ip = (String)sess.getAttribute("ip");
	    String name = (String)sess.getAttribute("username");
	    String password = (String)sess.getAttribute("password");
	    System.out.println(MasterIp);
	    System.out.println(MasterUser);
	    System.out.println(MasterPass);
	    System.out.println(ip);
	    System.out.println(name);
	    System.out.println(password);
		
		if(ip.equals(MasterIp) &&  name.equals(MasterUser) && password.equals(MasterPass) ) {
			System.out.println("true");
			sess.setAttribute("bool", "True");
		}
		else {
			System.out.println("false");
			sess.setAttribute("bool", "False");
		}
		RequestDispatcher Rd = request.getRequestDispatcher("/mainwork.jsp");
		Rd.forward(request,response);
	}

}
