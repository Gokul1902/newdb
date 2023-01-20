package DATABASE;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet ("/getquery")
public class UserQuery extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		
		String query = req.getParameter("query");
		if(query!="") {
		HttpSession sess = req.getSession();
		String database = (String)sess.getAttribute("database");
		sess.setAttribute("databases", database);
req.setAttribute("userquery", query);
		}else {
			req.setAttribute("userquery", null);
		}
        
        RequestDispatcher rd = 
                req.getRequestDispatcher("/create.jsp");
        rd.forward(req,res);
		
	}

}
