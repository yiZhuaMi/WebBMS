package operator;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delete extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public delete() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");

		String DeleteId = request.getParameter("DeleteId");
		System.out.println("(delete.java)DeleteId:"+DeleteId);
		
		@SuppressWarnings("rawtypes")
		Operator Delete = new Operator();
		String isSucsess = Delete.delete(Integer.valueOf(DeleteId));
		
		System.out.println("(delete.java)isSucsess:"+isSucsess);
		
		RequestDispatcher dispatcher = null;
		
		request.setAttribute("isSucsess", isSucsess);
		
		dispatcher = request.getRequestDispatcher("deleteUI.jsp");	

		dispatcher.forward(request, response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
