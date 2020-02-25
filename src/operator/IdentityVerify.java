
package operator;

import java.io.IOException;
import operator.Operator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IdentityVerify extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	public IdentityVerify()
	{
		super();
	}
	
	public void init()
	{}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		
		RequestDispatcher dispatcher =null;
		
		Operator check = new Operator();
		String isSucsess = check.LoginCheck(username, password);
		if(isSucsess.equals("Sucsess"))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			
			dispatcher = request.getRequestDispatcher("welcome.jsp");
		}
		else
		{
			
			dispatcher = request.getRequestDispatcher("login.jsp");
			
		}
		request.setAttribute("isSucsess",isSucsess);
		
		
		dispatcher.forward(request, response);
	}
	
	public void destroy()
	{
		super.destroy();
	}
}

